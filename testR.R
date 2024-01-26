library(Rcpp)
library(devtools)

devtools::load_all()

uninstall()
compileAttributes()
build()
install(build_vignettes = TRUE)
library(SimpLin)
browseVignettes()

install_github("skorsu/SimpLin", build_vignettes = TRUE)


SimpLinR(x = 1:5, y = c(1, 2, 4, 7, "a"))

set.seed(1)
x <- 1:10
y <- x + rnorm(10)
testResult <- SimpLinCpp(x, y)
testResult$estimates
testResult$
rownames(testResult$estimates) <- c("b0", "b1")

SimpLinR(x, y)

summary(lm(y ~ x))

str(c(1, "a", 3))
typeof(1:5) == "double"

x <- c(1, "a")
typeof(x)

# sourceCpp("/Users/kevin-imac/Desktop/Github - Repo/SimpLin/src/main.cpp")

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
