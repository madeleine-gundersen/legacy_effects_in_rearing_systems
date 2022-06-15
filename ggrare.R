## Rarefaction curve, ggplot style
ggrare <- function(physeq, step = 10, label = NULL, color = NULL, plot = TRUE, parallel = FALSE, se = TRUE) {
  ## Args:
  ## - physeq: phyloseq class object, from which abundance data are extracted
  ## - step: Step size for sample size in rarefaction curves
  ## - label: Default `NULL`. Character string. The name of the variable
  ##          to map to text labels on the plot. Similar to color option
  ##          but for plotting text.
  ## - color: (Optional). Default ‘NULL’. Character string. The name of the
  ##          variable to map to colors in the plot. This can be a sample
  ##          variable (among the set returned by
  ##          ‘sample_variables(physeq)’ ) or taxonomic rank (among the set
  ##          returned by ‘rank_names(physeq)’).
  ##
  ##          Finally, The color scheme is chosen automatically by
  ##          ‘link{ggplot}’, but it can be modified afterward with an
  ##          additional layer using ‘scale_color_manual’.
  ## - color: Default `NULL`. Character string. The name of the variable
  ##          to map to text labels on the plot. Similar to color option
  ##          but for plotting text.
  ## - plot:  Logical, should the graphic be plotted.
  ## - parallel: should rarefaction be parallelized (using parallel framework)
  ## - se:    Default TRUE. Logical. Should standard errors be computed.
  ## require vegan
  x <- as(otu_table(physeq), "matrix")
  if (taxa_are_rows(physeq)) { x <- t(x) }
  
  ## This script is adapted from vegan `rarecurve` function
  tot <- rowSums(x)
  S <- rowSums(x > 0)
  nr <- nrow(x)
  
  rarefun <- function(i) {
    cat(paste("rarefying sample", rownames(x)[i]), sep = "\n")
    n <- seq(1, tot[i], by = step)
    if (n[length(n)] != tot[i]) {
      n <- c(n, tot[i])
    }
    y <- rarefy(x[i, ,drop = FALSE], n, se = se)
    if (nrow(y) != 1) {
      rownames(y) <- c(".S", ".se")
      return(data.frame(t(y), Size = n, Sample = rownames(x)[i]))
    } else {
      return(data.frame(.S = y[1, ], Size = n, Sample = rownames(x)[i]))
    }
  }
  if (parallel) {
    out <- mclapply(seq_len(nr), rarefun, mc.preschedule = FALSE)
  } else {
    out <- lapply(seq_len(nr), rarefun)
  }
  df <- do.call(rbind, out)
  
  ## Get sample data
  if (!is.null(sample_data(physeq, FALSE))) {
    sdf <- as(sample_data(physeq), "data.frame")
    sdf$Sample <- rownames(sdf)
    data <- merge(df, sdf, by = "Sample")
    labels <- data.frame(x = tot, y = S, Sample = rownames(x))
    labels <- merge(labels, sdf, by = "Sample")
  }
  
  ## Add, any custom-supplied plot-mapped variables
  if( length(color) > 1 ){
    data$color <- color
    names(data)[names(data)=="color"] <- deparse(substitute(color))
    color <- deparse(substitute(color))
  }
  if( length(label) > 1 ){
    labels$label <- label
    names(labels)[names(labels)=="label"] <- deparse(substitute(label))
    label <- deparse(substitute(label))
  }
  
  p <- ggplot(data = data, aes_string(x = "Size", y = ".S", group = "Sample", color = color))
  p <- p + labs(x = "Sample Size", y = "Species Richness")
  if (!is.null(label)) {
    p <- p + geom_text(data = labels, aes_string(x = "x", y = "y", label = label, color = color),
                       size = 4, hjust = 0)
  }
  p <- p + geom_line()
  if (se) { ## add standard error if available
    p <- p + geom_ribbon(aes_string(ymin = ".S - .se", ymax = ".S + .se", color = NULL, fill = color), alpha = 0.2)
  }
  if (plot) {
    plot(p)
  }
  invisible(p)
}

rarecurve2 <- function (x, step = 1, sample, xlab = "Sample Size", ylab = "Species", label = TRUE, col = "black", ...)
  ## See documentation for vegan rarecurve, col is now used to define
  ## custom colors for lines and panels
{
  tot <- rowSums(x)
  S <- specnumber(x)
  nr <- nrow(x)
  out <- lapply(seq_len(nr), function(i) {
    n <- seq(1, tot[i], by = step)
    if (n[length(n)] != tot[i])
      n <- c(n, tot[i])
    drop(rarefy(x[i, ], n))
  })
  Nmax <- sapply(out, function(x) max(attr(x, "Subsample")))
  Smax <- sapply(out, max)
  plot(c(1, max(Nmax)), c(1, max(Smax)), xlab = xlab, ylab = ylab,
       type = "n", ...)
  if (!missing(sample)) {
    abline(v = sample)
    rare <- sapply(out, function(z) approx(x = attr(z, "Subsample"),
                                           y = z, xout = sample, rule = 1)$y)
    abline(h = rare, lwd = 0.5)
  }
  for (ln in seq_len(length(out))) {
    color <- col[((ln-1) %% length(col)) + 1]
    N <- attr(out[[ln]], "Subsample")
    lines(N, out[[ln]], col = color, ...)
  }
  if (label) {
    ordilabel(cbind(tot, S), labels = rownames(x), col = col, ...)
  }
  invisible(out)
}


