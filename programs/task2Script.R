#Coding Practice for Task 2

#A couple of things I learned about R that I did not know previously was
#that their was a glimpse function and that it would display more detailed
#information that just a generic View().

#Ch. 4 R for Data Scientists
#4.1 Coding Basics

1 / 200 * 30

(59 + 72 + 2) / 3

sin(pi / 2)

(x <- 3 * 4)

(object_name <- x)

#4.2 What's in a name?

x

(this_is_a_really_long_name <- 2.5)

(this_is_a_really_long_name <- 3.5)

(r_rocks <- 2 ^ 3)

r_rocks

#4.3 Calling functions

(seq(1,20))

x <- "hello world"

y <- seq(1,10,length.out = 5)

y

(y <- seq(1,10, length.out = 5))

#4.4 Practice

#1
my_variable <-10

my_variable

#2
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)

#Ch. 1 Explore your first datasets

library(nycflights13)
library(dplyr)
library(knitr)

flights

View(flights)

glimpse(flights)

airlines

kable(airlines)

airlines$name

glimpse(airports)

?flights