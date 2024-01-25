SimpLinR <- function(x = x, y = y){
  
  ### Error Checking
  if(length(x) != length(y)){
    stop("The lenght of two vectors are not the same.")
  }
  
  if(!(typeof(x) %in% c("integer", "double")) | 
     !(typeof(y) %in% c("integer", "double"))){
    stop("Both input must be numeric vectors.")
  }
  
  output <- SimpLinCpp(x, y)
  
  ### Make it more readable
  rownames(output$estimates) <- c("b0", "b1")
  rownames(output$SE) <- c("b0", "b1")
  rownames(output$conf_int) <- c("b0", "b1")
  colnames(output$conf_int) <- c("lower", "upper")
  return(output)
  
}