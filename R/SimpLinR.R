SimpLinR <- function(x = x, y = y){
  
  if(length(x) != length(y)){
    stop("The lenght of two vectors are not the same.")
  }
  
  if(!(typeof(x) %in% c("integer", "double")) | 
     !(typeof(y) %in% c("integer", "double"))){
    stop("Both input must be numeric vectors.")
  }
  
  output <- SimpLinCpp(x, y)
  return(output)
  
}