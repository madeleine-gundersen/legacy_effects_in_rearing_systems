min.mean.sd.max <- function(x) {
  r <- c(min(x), mean(x) - sd(x), mean(x), mean(x) + sd(x), max(x))
  names(r) <- c("ymin", "lower", "middle", "upper", "ymax")
  r
}

mean.sd <- function(x) {
  r <- c( mean(x)- sd(x), mean(x) - sd(x), mean(x), mean(x) + sd(x), mean(x)+ sd(x))
  names(r) <- c("ymin", "lower", "middle", "upper", "ymax")
  r
}
