#------------------------------------------------------------------------------#
# Working with scales, guides and themes
# Mango Solutions - LondonR Workshop
#------------------------------------------------------------------------------#
library(tidyverse)
library(forcats)

funded <- read_csv("./Desktop/FundedSports.csv")

basicPlot <- ggplot(data = funded) +
  geom_bar(aes(x = fct_reorder(Location, Year), 
               y = Funding, fill = fct_reorder(SportGroup, Funding)), 
           stat = "summary", fun.y = "sum")

basicPlot


#------------------------------------------------------------------------------#
# Setting Labels
#------------------------------------------------------------------------------#

labelPlot <- basicPlot +
  labs(title = "Changes in Funding For Olympic Sports",
       subtitle = "Funding Provided by UK Sport World Class Performance Programme",
       x = "", y = "", 
       caption = "Data taken from uksport.gov.uk",
       fill = "Event")

labelPlot


#------------------------------------------------------------------------------#
# Defining Scales
#------------------------------------------------------------------------------#

labels <- c("Sydney\n(2000)", "Athens\n(2004)", 
            "Beijing\n(2008)", "London\n(2012)", 
            "Rio de Janeiro\n(2016)")

axisPlot <- labelPlot +
  scale_y_continuous(breaks = seq(0, 25e7, by = 50e6),
                     minor_breaks = NULL, 
                     labels = scales::dollar_format("£")) +
  scale_x_discrete(labels = labels)

axisPlot


cols <- c( "grey", "darkRed", "orangeRed", 
           "steelBlue", "royalBlue", "navyBlue")

fillPlot <- axisPlot +
  scale_fill_manual(values = cols)

fillPlot

#------------------------------------------------------------------------------#
# Updating Legends
#------------------------------------------------------------------------------#


legendPlot <- fillPlot +
  theme(legend.position = "bottom", 
        legend.justification = "left")

legendPlot

guidePlot <- legendPlot +
  guides(fill = guide_legend(title.position = "top",
                             nrow = 1, label.position = "bottom"))

guidePlot


#------------------------------------------------------------------------------#
# Controlling the Theme 
#------------------------------------------------------------------------------#


theme_set(theme_classic())

guidePlot

theme_update(axis.text.y = element_text(angle = 45),
             panel.grid.major.y = element_line(colour = "lightgrey"))

guidePlot



