#------------------------------------
#Load libraries and create data

library(tidyverse)
library(gapminder)

dat <- gapminder

#------------------------------------
#Generate graphic 1
dat %>% 
  ggplot(aes(x = lifeExp, y = gdpPercap, color = continent)) + 
  geom_point(aes(size = pop)) +
  facet_wrap(~ year, nrow = 1) +
  theme_bw() +
  labs(x = "Life Expectancy",
       y = "GDP per Capita") +
  ylim(0, 50000) +
  guides(size = guide_legend("Population (100K)"), colour = guide_legend("Continent"))

#Save graphic
ggsave(filename = "plot1.png", 
       path = "C:\\MATH335\\outputfiles\\",
       scale = 1,
       width = 15)

#------------------------------------
#Generate graphic 2
dat2 <- dat %>%
  group_by(year, continent) %>%
  summarise(avg = weighted.mean(x = gdpPercap, w = pop),
            avgPop = weighted.mean(pop))
dat %>%
  ggplot(aes(x = year, 
             y = gdpPercap,
             colour = continent,
             group = country)) +
  geom_line() +
  geom_point() + 
  facet_wrap(~ continent, nrow = 1) +
  theme_bw() +
  labs(x = "Year",y = "GDP per Capita") +
  ylim(0, 50000) +
  geom_line(data = dat2, mapping = aes(x = year, y = avg, group = NULL, color = NULL)) +
  geom_point(data = dat2, mapping = aes(x = year, y = avg, group = NULL, color = NULL, size = avgPop)) +
  guides(colour = guide_legend("Continent"), size = guide_legend("Population (100K)"))


#Save graphic
ggsave(filename = "plot2.png",
       path = "C:\\MATH335\\outputfiles\\",
       scale = 1,
       width = 15)

