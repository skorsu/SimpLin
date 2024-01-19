#include "RcppArmadillo.h"

// [[Rcpp::depends(RcppArmadillo)]]

// [[Rcpp::export]]
Rcpp::List SimpLinCpp(arma::vec x, arma::vec y){
  
  // Create the design matrix
  unsigned int n = y.size();
  arma::mat X = arma::join_horiz(arma::ones(n), x);
  
  // Calculate the estimated regression coefficients
  arma::mat xTx = X.t() * X;
  arma::mat invDesign = arma::inv(xTx);
  arma::vec bhat = invDesign * X.t() * y;
  
  // Calculate the predicted value
  arma::vec pred = X * bhat;
  
  // Calculate the residual
  arma::vec r = pred - y;
  
  // Calculate the standard error for the estimates
  double mse = arma::accu(arma::pow(r, 2))/(n - 2);
  arma::mat SEMat = arma::sqrt(mse * invDesign);
  arma::vec coefSE = SEMat.diag();
  
  // Calculate 95% Confidence Interval for the estimates
  double tStat = R::qt(0.975, n - 2, 1, 0);
  arma::vec MoE = tStat * coefSE;
  arma::mat MoE_mat = arma::repmat(MoE, 2, 1);
  arma::mat bhat_mat = arma::repmat(bhat, 2, 1); 
  arma::mat sgnMat(2, 2, arma::fill::ones);
  sgnMat.col(0).fill(-1);
  arma::mat confint = bhat_mat.reshape(2, 2) + (MoE_mat.reshape(2, 2) % sgnMat);
  
  Rcpp::List result;
  result["estimates"] = bhat;
  result["SE"] = coefSE;
  result["conf_int"] = confint;
  result["residual"] = r;
  result["predicted_val"] = pred;
  return result;
  
}