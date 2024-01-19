library(Rcpp)

sourceCpp("/Users/kevin-imac/Desktop/Github - Repo/SimpLin/src/main.cpp")

x <- 1:10
y <- 3 + (2*x) + rnorm(10)

test <- SimpLinCpp(x, y)
mod <- summary(lm(y ~ x))

correctInt <- confint(lm(y ~ x))
correctInt
correctInt - mod$coefficients[, "Estimate"]
test$conf_int

test$SE
mod$coefficients
test$estimates
mod$sigma^2
test$estimates

cbind(y, test$predicted_val)

cbind(test$predicted_val - y, test$residual)
