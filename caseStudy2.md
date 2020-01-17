---
title: "Wealth and Life Expectancy"
author: "James Hough"
date: "January 16, 2020"
output:
  html_document:  
    keep_md: true
    toc: true
    toc_float: true
    code_folding: hide
    fig_height: 6
    fig_width: 12
    fig_align: 'center'
---





## Background

I learned a lot of different things in this case study. For one, my understanding of how to use ggplot was amplified. My ability to plot different kinds of graphs was increased as well. I learned how to use different data sets on the same graph to achieve my goals. Lastly, I learned how to change point size to reflect different aspects of the data. Also, how to save a graph as a .PNG was useful.

## Images

```r
#Generate graphic 1
dat %>% 
  ggplot(aes(x = lifeExp, y = gdpPercap, color = continent)) + 
  geom_point(aes(size = pop)) +
  facet_wrap(~ year, nrow = 1) +
  theme_bw() +
  labs(x = "Life Expectancy",
       y = "GDP per Capita") +
  ylim(0, 50000)
```

![](caseStudy2_files/figure-html/load_data-1.png)<!-- -->


```r
#Generate graphic 2
dat2 <- dat %>%
  group_by(year, continent) %>%
  summarise(avg = weighted.mean(x = gdpPercap, w = pop),
            sumPop = sum(pop))

dat %>%
  ggplot(aes(x = year, 
             y = gdpPercap,
             colour = continent,
             group = country)) +
  geom_line() +
  geom_point() + 
  facet_wrap(~ continent,
             nrow = 1) +
    theme_bw() +
  labs(x = "Year",
       y = "GDP per Capita") +
  ylim(0, 50000) +
  geom_line(data = dat2, mapping = aes(x = year, y = avg, group = NULL, color = NULL)) +
  geom_point(data = dat2, mapping = aes(x = year, y = avg, group = NULL, color = NULL, size = sumPop))
```

![](caseStudy2_files/figure-html/tidy_data-1.png)<!-- -->
