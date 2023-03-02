library(ggplot2)
library(dplyr)
library(statsr)

load("movies.Rdata")

m1 <- lm(imdb_rating ~ audience_score, data = movies)
summary(m1)

ggplot(data = movies, aes(x = audience_score, y = imdb_rating)) +
        geom_point()  +
        stat_smooth(method = "lm", se = FALSE)

The correlation coefficient is 2.2e-16
There is a positive correlation relationship.

M2 = lm(imdb_rating ~ audience_score + best_pic_nom + best_pic_win + best_actor_win + best_actress_win + best_dir_win, data = movies)
summary(M2)

M3 = lm(imdb_rating ~ audience_score + best_pic_win + best_actor_win + best_actress_win + best_dir_win, data = movies)
summary(M3)

M4 = lm(imdb_rating ~ audience_score + best_actor_win + best_actress_win + best_dir_win, data = movies)
summary(M4)

plot(M4$residuals ~ movies$audience_score)

hist(M4$residuals)
qqnorm(M4$residuals)
qqline(M4$residuals)

plot(M4$residuals ~ M4$fitted)
plot(abs(M4$residuals) ~ M4$fitted)

plot(M4$residuals)

