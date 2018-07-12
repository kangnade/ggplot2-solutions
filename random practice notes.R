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


