cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") #colorblind palette

ColorBlocksFacet <- c("#e0e0e0")
my.theme = theme(panel.grid.major = element_line(size = 0.3,
                                                linetype = 'solid',
                                                colour = ColorBlocksFacet),
                 panel.background = element_rect(fill = "transparent",colour = NA), # or theme_blank()
                 panel.grid.minor = element_blank(), 
                 plot.background = element_rect(fill = "transparent",colour = NA),
                 axis.line = element_line(colour = "black", size = 0.3),
                 panel.border = element_rect(color = "black", fill = "transparent"),
                 axis.text = element_text(colour = "black"),
                 text=element_text(family = "Arial"), 
                 axis.ticks.length = unit(0.25, "cm"), 
                 legend.key = element_rect(fill = "transparent"), 
                 legend.background = element_rect(fill = "transparent"),
                 strip.background = element_rect(color="black", fill="gray92", linetype="solid", size = 0.5, 
                                                 
                 ))

col = c("grey98", (RColorBrewer::brewer.pal(n = 12, name = "Paired")),RColorBrewer::brewer.pal(n = 8, name = "Dark2"))


system_overall_color = c("MMS-" =  cbPalette[2], 
                   "MMS+" = cbPalette[2], 
                   "MMS- to FTS-" = cbPalette[7], 
                   "MMS+ to FTS+"= cbPalette[7], 
                   "FTS-" = cbPalette[3],
                   "FTS+" = cbPalette[3],
                   "FTS- to MMS-" = cbPalette[4],
                   "FTS+ to MMS+" = cbPalette[4] ) 

system_overall_fill = c("MMS-" =  scales::alpha(cbPalette[2], 0.15), 
                         "MMS+" = cbPalette[2], 
                         "MMS- to FTS-" = scales::alpha(cbPalette[7], 0.15), 
                         "MMS+ to FTS+"= cbPalette[7], 
                         "FTS-" = scales::alpha(cbPalette[3], 0.15),
                         "FTS+" = cbPalette[3],
                         "FTS- to MMS-" = scales::alpha(cbPalette[4], 0.15),
                         "FTS+ to MMS+" = cbPalette[4] ) 

system_overall_shape21 = c("MMS-" =  21, 
                        "MMS+" =21, 
                        "MMS- to FTS-" =21, 
                        "MMS+ to FTS+"= 21, 
                        "FTS-" =21,
                        "FTS+" = 21,
                        "FTS- to MMS-" =21,
                        "FTS+ to MMS+" = 21) 

system_overall_shape_switched = c("MMS-" =  22, 
                           "MMS+" =22, 
                           "MMS- to FTS-" =23, 
                           "MMS+ to FTS+"= 23, 
                           "FTS-" =22,
                           "FTS+" = 22,
                           "FTS- to MMS-" =23,
                           "FTS+ to MMS+" = 23)

system_shape_day = c("1" =  21, "12" = 24) 

system_overall_fill_ord = c("MMS-" =  scales::alpha(cbPalette[2], 0.15), 
                        "MMS+" = cbPalette[2], 
                        "MMS- to FTS-" = scales::alpha(cbPalette[7], 0.15), 
                        "MMS+ to FTS+"= cbPalette[7], 
                        "FTS-" = scales::alpha(cbPalette[3], 0.15),
                        "FTS+" = cbPalette[3],
                        "FTS- to MMS-" = scales::alpha(cbPalette[4], 0.15),
                        "FTS+ to MMS+" = cbPalette[4] ) 
ord_system_shape_day = c("1" =  16, "12" = 17) 




#flow cytometry plot

system_overall_shape_flow = c("MMS-" =  21, 
                           "MMS+" =21, 
                           "MMS- to FTS-" =21, 
                           "MMS+ to FTS+"= 21, 
                           "FTS-" =21,
                           "FTS+" = 21,
                           "FTS- to MMS-" =21,
                           "FTS+ to MMS+" = 21, 
                           "x_InCm FTS-" = 24, 
                           "x_InCm FTS+" = 24, "x_InCm MMS-" = 24, "x_InCm MMS+" = 24) 

system_overall_fill_flow = c("MMS-" =  scales::alpha(cbPalette[2], 0.15), 
                        "MMS+" = cbPalette[2], 
                        "MMS- to FTS-" = scales::alpha(cbPalette[7], 0.15), 
                        "MMS+ to FTS+"= cbPalette[7], 
                        "FTS-" = scales::alpha(cbPalette[3], 0.15),
                        "FTS+" = cbPalette[3],
                        "FTS- to MMS-" = scales::alpha(cbPalette[4], 0.15),
                        "FTS+ to MMS+" = cbPalette[4], 
                        "x_InCm FTS-" = "grey90", 
                        "x_InCm FTS+" =  "grey90", "x_InCm MMS-" =  "grey90", "x_InCm MMS+" =  "grey90")  
  
system_overall_color_flow = c("MMS-" =  cbPalette[2], 
                           "MMS+" = cbPalette[2], 
                           "MMS- to FTS-" = cbPalette[7], 
                           "MMS+ to FTS+"= cbPalette[7], 
                           "FTS-" = cbPalette[3],
                           "FTS+" = cbPalette[3],
                           "FTS- to MMS-" = cbPalette[4],
                           "FTS+ to MMS+" = cbPalette[4], 
                           "x_InCm FTS-" = "grey90", 
                           "x_InCm FTS+" =  "grey90", 
                           "x_InCm MMS-" =  "grey90",
                           "x_InCm MMS+" =  "grey90")


system_overall_fill_flow_2 = c("MMS-" =  scales::alpha(cbPalette[2], 0.15), 
                             "MMS+" = cbPalette[2], 
                             "MMS- to FTS-" = scales::alpha(cbPalette[7], 0.15), 
                             "MMS+ to FTS+"= cbPalette[7], 
                             "FTS-" = scales::alpha(cbPalette[3], 0.15),
                             "FTS+" = cbPalette[3],
                             "FTS- to MMS-" = scales::alpha(cbPalette[4], 0.15),
                             "FTS+ to MMS+" = cbPalette[4], 
                             "x_InCm FTS-" = "grey40", 
                             "x_InCm FTS+" =  "grey60", "x_InCm MMS-" =  "grey80", "x_InCm MMS+" =  "grey90") 
