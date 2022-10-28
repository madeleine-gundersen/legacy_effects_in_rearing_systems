my.theme = theme(panel.grid.major = element_line(size = 0.3,
                                                 linetype = 'solid',
                                                 colour = c("#e0e0e0")),
                 panel.background = element_rect(fill = "transparent",colour = NA), # or theme_blank()
                 panel.grid.minor = element_blank(), 
                 plot.background = element_rect(fill = "transparent",colour = NA),
                 axis.line = element_line(colour = "black", size = 0.3),
                 panel.border = element_rect(color = "black", fill = "transparent"),
                 axis.text = element_text(colour = "black"),
                 text=element_text(family = "Helvetica", size = 12), 
                 axis.ticks.length = unit(0.25, "cm"), 
                 legend.key = element_rect(fill = "transparent"), 
                 legend.background = element_rect(fill = "transparent"),
                 
                 strip.background = element_rect(color="black", fill="transparent", linetype="solid", size = 0.5 ) ,
                 panel.spacing.x = unit(0,"lines") 
)


#cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7") #colorblind palette
col = c((RColorBrewer::brewer.pal(n = 12, name = "Paired")),RColorBrewer::brewer.pal(n = 8, name = "Dark2"))

system_overall_fill = c("FTS-" = col[1], 
                        "FTS+" =col[2], 
                        "FTS- to MMS-" = col[3], 
                        "FTS+ to MMS+" = col[4], 
                        "MMS-" = col[5],
                             "MMS+" = col[6], 
                             "MMS- to FTS-" = col[9], 
                             "MMS+ to FTS+"= col[10])  

system_overall_shape_21 = c("MMS-" =  21, 
                              "MMS+" =21, 
                              "MMS- to FTS-" =21, 
                              "MMS+ to FTS+"= 21, 
                              "FTS-" =21,
                              "FTS+" = 21,
                              "FTS- to MMS-" =21,
                              "FTS+ to MMS+" = 21) 

system_shape_day = c("1" =  21, "12" = 24) 

system_overall_fill_low = c("FTS-" = col[1], 
                       
                        "FTS- to MMS-" = col[3], 
                      
                        "MMS-" = col[5],
                     
                        "MMS- to FTS-" = col[9]
                   )  

##################################### Flow 
system_overall_fill_flow = c("FTS-" = col[1], 
                             "FTS+" =col[2], 
                             "FTS- to MMS-" = col[3], 
                             "FTS+ to MMS+" = col[4], 
                             "MMS-" = col[5],
                              "MMS+" = col[6], 
                              "MMS- to FTS-" = col[9], 
                              "MMS+ to FTS+"= col[10],
                              "Incoming water" = "grey90")  



system_overall_shape_flow = c( "FTS-" =21,
                               "FTS+" = 21,
                               "FTS- to MMS-" =21,
                               "FTS+ to MMS+" = 21, 
                               "MMS-" =  21, 
                              "MMS+" =21, 
                              "MMS- to FTS-" =21, 
                              "MMS+ to FTS+"= 21, 
                              "Incoming water" = 24) 

