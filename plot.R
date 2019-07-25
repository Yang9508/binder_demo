library(ggplot2)
data = read.table("demo_matrix.csv", sep=",")
names(data)[1] = "mean"
data$year = c(1990,2000,2010)
ggplot(data, aes(x=year, y=mean))+ geom_line()
ggsave("demo_plotr.png",width = 4, height = 3)

