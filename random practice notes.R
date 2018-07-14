?diamonds
head(diamonds)
?facet_wrap
?geom_smooth
rect <- data.frame(x = 50, y = 50)
line <- data.frame(x = c(1, 200), y = c(100, 1))

base <- ggplot(mapping = aes(x, y)) +
  geom_tile(data = rect, aes(width = 50, height = 50)) +
  geom_line(data = line) +
  xlab(NULL) + ylab(NULL)
base
base + coord_polar("x")
base + coord_polar("y")
base + coord_flip()
base + coord_trans(y = "log10")
base + coord_fixed()


cnmap <-  ggplot(map_data("world.cities"), aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  xlab(NULL) + ylab(NULL)
cnmap

nzmap <- ggplot(map_data("nz"), aes(long, lat, group = group)) +
  geom_polygon(fill = "white", colour = "black") +
  xlab(NULL) + ylab(NULL)
nzmap
?map_data
?purrr
?map
help(package='maps')

#install.packages("ggthemes")
library(ggthemes)
df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()
base
base + theme(plot.background = element_rect(fill = "grey88", color = NA))
base + theme(plot.background = element_rect(color = "red", size =2))
base + theme(plot.background = element_rect(fill = "linen"))
base +theme(plot.background = element_rect(fill = "linen"), panel.background = element_rect(fill = "linen"),
            panel.grid.major = element_line(color = "black", size = 0.5, linetype = "dotted"),
            panel.grid.minor = element_line(color = "red", size = 0.1, linetype = "dotted"))
base + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
             panel.background = element_blank())
base + theme(axis.title.x = element_blank(), axis.title.y = element_blank(), panel.background = element_blank(),
             axis.line = element_line(color = "grey50"))

oldtheme <- theme_update(
  plot.background = element_rect(fill = "lightblue3", color = NA),
  panel.background = element_rect(fill = "linen", color = NA),
  axis.text = element_text(color = "linen"),
  axis.title = element_text(color = "linen")
)
base
theme_set(oldtheme)
base
?theme_update

p <- ggplot(mtcars, aes(mpg, wt)) +
  geom_point()
p
old <- theme_set(theme_bw())
p
theme_set(old)
p


df <- data.frame(x = 1:3, y = 1:3)
base <- ggplot(df, aes(x, y)) + geom_point()

base + theme(axis.line = element_line(color = "grey50", size = 1))
base + theme(axis.text = element_text(color = "blue", size= 10))
base + theme(axis.text.x = element_text(angle = -90, vjust = 0.5))


df <- data.frame(
  x = c("label", "a long label", "an even longer label"),
  y = 1:3
)
base <- ggplot(df, aes(x, y)) + geom_point()
base
base + theme(axis.text.x = element_text(angle = -30, vjust = 1, hjust = 0)) +
  xlab(NULL) + ylab(NULL)


df <- data.frame(x = 1:4, y = 1:4, z = rep(c("a", "b"), each = 2))
base <- ggplot(df, aes(x, y, colour = z)) + geom_point()
base
base + theme(legend.background = element_rect(fill = "lemonchiffon",
                                               color = "grey50",
                                               size = 1))
base + theme(legend.key = element_rect(color = "grey50"),
             legend.key.width = unit(0.9, "cm"),
             legend.key.height = unit(0.75, "cm"))
base + theme(legend.title = element_text(size = 15, face = "bold"),
             legend.text = element_text(size = 13))
base <- ggplot(df, aes(x, y)) + geom_point()
base + theme(panel.background = element_rect(fill = "lightblue"))
base + theme(panel.grid.major = element_line(color = "grey50", size = 0.8, linetype = "dotted"))
base + theme(panel.grid.major.x = element_line(color = "grey50", size = 0.8, linetype = "dotted"))
base2 <- base + theme(plot.background = element_rect(color = "grey50"))
base2 + theme(aspect.ratio = 2/1)

diamonds_ok <- diamonds %>% filter(x > 0, y > 0, y < 20)
ggplot(diamonds_ok, aes(x,y)) +
  geom_bin2d() +
  geom_abline(slope = 1, color = "white", size = 1, alpha = 0.5)
?diamonds
dia <- filter(diamonds, z > 50)
dia
is.na(1 + 2i)
?is.na
is.na(c(NA, NA, 2, 4))
(xx <- c(0:4))
xx
is.na(xx) <- c(2, 4)
xx
!is.na(xx)

?!is.na
c <- c()
is.na(NULL)
?is.na
is.na(2*3)

?xor
x <- TRUE
!x
xor(x, !x)

# install.packages("ggplot2movies")
movies
View(movies)
x <- 5.0e+05
as.numeric(x)

options(scipen = 999)
typeof(movies$budget)
movies3 <- movies %>% 
  mutate(budget = as.integer(budget))
View(movies3)


diamonds_ok2 <- mutate(diamonds_ok,
                       sam = x - y,
                       size = sqrt(x ^ 2 + y ^ 2))
diamonds_ok2
ggplot(diamonds_ok2, aes(size, sam)) +
  stat_bin2d()

ggplot(diamonds_ok2, aes(abs(sam))) +
  geom_histogram(binwidth = 0.10)
diamonds_ok3 <- filter(diamonds_ok2, abs(sam) < 0.20)
ggplot(diamonds_ok3, aes(abs(sam))) +
  geom_histogram(binwidth = 0.01)

width <- diamonds$x * diamonds$y /2
width / diamonds$z * 100

diamonds$depth / 100 / diamonds$z * 2
?diamonds


by_clarity <- diamonds %>% 
  group_by(clarity) %>% 
  summarise(
    n = n(),
    mean = mean(price),
    lq = quantile(price, 0,25),
    uq = quantile(price, 0.75)
  )
by_clarity
ggplot(by_clarity, aes(clarity, mean)) +
  geom_linerange(aes(ymin = lq, ymax = uq)) +
  geom_line(aes(group = 1), color = "grey50") +
  geom_point(aes(size = n))
typeof(movies$length)
mean(movies$length)
?diamonds

runif(100)
?runif
?qqplot
?id.method
?gvlma

library(car)
states <- as.data.frame(state.x77[, c("Murder", "Population", "Illiteracy",
                                      "Income", "Frost")])
states
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data = states)
summary(fit)
qqPlot(fit, labels = row.names(states), id.method = "identify", simulate = TRUE, main = "Q-Q Plot")

x_values <- c(Murder, Population, Illiteracy, Income, Frost)

plot(Murder ~ Population + Illiteracy + Population + Income + Frost, data = states)

library(car)
states <- as.data.frame(state.x77[,c("Murder", "Population",
                                     "Illiteracy", "Income", "Frost")])
fit <- lm(Murder ~ Population + Illiteracy + Income + Frost, data=states)
qqPlot(fit, labels=row.names(states), id.method="identify",
       simulate=TRUE, main="Q-Q Plot")


diamonds2 <- diamonds %>% 
  filter(carat <= 2) %>% 
  mutate(lcarat = log2(carat),
         lprice = log2(price))
diamonds2

ggplot(diamonds2, aes(lcarat, lprice)) +
  geom_bin2d() +
  geom_smooth(method = "lm", color = "white", size = 2, se = FALSE)
mod <- lm(lprice ~ lcarat, data = diamonds2)
summary(mod)

diamonds2 <- diamonds2 %>% 
  mutate(rel_price = resid(mod))
ggplot(diamonds2, aes(carat, rel_price)) +
  geom_bin2d()
xgrid <- seq(-2, 1, by = 1/3)
xgrid
data.frame(logx = xgrid, x = round(2 ^ xgrid, 2))
color_cut <- diamonds2 %>%
  group_by(color, cut) %>%
  summarise(
    price = mean(price),
    rel_price = mean(rel_price)
  )
color_cut
ggplot(color_cut, aes(color, price))  +
  geom_line(aes(group = cut), colour = "grey80") +
  geom_point(aes(colour = cut))
ggplot(color_cut, aes(color, rel_price)) +
  geom_line(aes(group = cut), colour = "grey80") +
  geom_point(aes(colour = cut))
?diamonds

mtcars
new <- mtcars %>%
  gather(-mpg, -hp, -cyl, key = "var", value = "value")
View(mtcars)
View(new)
geom_histogram
install.packages("weanderson")
library(weanderson)
