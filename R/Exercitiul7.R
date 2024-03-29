#Ex7

library(cubature)
library(pracma)


EX7 <- function(crv){
  
  if(length(crv) == 3){
    
    sgn_x <- as.numeric(readline(prompt="Probabilitate:\n1. <\n2. >\n"))
    number_x <- as.numeric(readline(prompt = "Numar x: "))
    
    func_x <- function(x){}
    body(func_x) <- parse(text = crv[1])
    
    val_x <- switch(
      sgn_x,
      cubintegrate(func_x, lower = as.integer(crv[2]),   upper = number_x,  method = "pcubature"),
      cubintegrate(func_x, lower = number_x, upper = as.integer(crv[3]),    method = "pcubature")
    )
    print(1/val_x$integral)
    
  }
  
  if(length(crv) > 3){
    
    sgn_x <- as.numeric(readline(prompt="Probabilitate:\n1. <\n2. >\n"))
    number_x <- as.numeric(readline(prompt = "Numar x: "))
    
    sgn_y <- as.numeric(readline(prompt="Probabilitate:\n1. <\n2. >\n"))
    number_y <- as.numeric(readline(prompt = "Numar y: "))
    
    func_xy <- function(x, y){}
    body(func_xy) <- parse(text = crv[1])
    
    val_x <- switch(
      sgn_x,
      #integral2(fun, xmin, xmax, ymin, ymax)
      val_y <- switch(
        sgn_y,
        integral2(func_xy, as.integer(crv[2]), number_x, as.integer(crv[4]), number_y   ), # x <, y <
        integral2(func_xy, as.integer(crv[2]), number_x, number_y, as.integer(crv[5])   )  # x <, y >
      ),
      val_y <- switch(
        sgn_y,
        integral2(func_xy, number_x, as.integer(crv[3]), as.integer(crv[4]), number_y   ), # x >, y <
        integral2(func_xy, number_x, as.integer(crv[3]), number_y, as.integer(crv[5])   ) # x >, y >
      ),
    )
    
    print(1/val_x$Q)
  }
}


crv_bi  <- c("exp(1)^(-((x^2)/2))", 0, 10, 2, 7)
crv_uni <- c("exp(1)^(-((x^2)/2))", 0, 10)

EX7(crv_bi)