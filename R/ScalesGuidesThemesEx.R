#------------------------------------------------------------------------------#
# Working with scales, guides and themes
# Mango Solutions - LondonR Workshop
# Exercise Solutions
#------------------------------------------------------------------------------#
library(tidyverse)
library(lubridate)
library(stringr)

funded <- mutate(funded, Date = ymd(str_c(Year, Month, Day, sep = "-")))

exPlot <- ggplot(data = funded) + 
  geom_line(aes(x = Date, y = Funding, colour = Sport))

exPlot <- exPlot + 
  labs(title = "Funding Over Time For Summer Olympic Sports", 
       subtitle = "As Provided by UK Sport", 
       x = "", y = "")

exPlot <- exPlot + 
  scale_x_date(breaks = unique(funded$Date), 
                      date_labels = "%b %Y") +
  scale_y_continuous(labels = scales::dollar_format("£"))

exPlot <- exPlot +
  theme(legend.position = "bottom", legend.justification = "left") +
  guides(colour = guide_legend(
    override.aes = list(size = 4),
    title.position = "top",
    nrow = 4
  ))

exPlot +
  theme(panel.grid.major.y = element_line(linetype = 2), 
        plot.title = element_text(hjust = 0.5), 
        plot.subtitle = element_text(hjust = 0.5))
