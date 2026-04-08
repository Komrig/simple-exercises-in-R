Triangle <- function(side) {
  triangle <- c(side = side)
  class(triangle) <- "Triangle"
  return(triangle)
}
CalcArea.Triangle <- function(x) {
  cat("Площадь S = a² * √3 * 1/4 = " , x['side']^2 * sqrt(3) / 4)
}

Hoop <- function(outR, inR) {
  hoop <- c(outR = outR, inR = inR)
  class(hoop) <- "Hoop"
  return (hoop)
}
CalcArea.Hoop <-  function(x) {
  cat("Площадь S = π * (R² - r²) = " , pi * ( x['outR']^2 - x['inR']^2))
}

Square <- function(side = 0) {
  square <- c(side = side)
  class(square) <- "Square"
  return(square)
}
CalcArea.Square <- function(x) {
  cat("Площадь S = a² = " , x['side']^2)
}

Romb <- function(side, angle) {
  romb <- c(side = side, angle = angle)
  class(romb) <- "Romb"
  return(romb)
}
CalcArea.Romb <- function(x) {
  cat("Площадь S = a² * sin(a) = " , x['side']^2 * sin(x['angle']))
}

CalcArea <- function(x, ...) {
  UseMethod("CalcArea", x)
}

CalcArea.default <- function(x, ...) {
  cat("Невозможно обработать данные.")
}

CalcArea(Romb(8, 15))
CalcArea(Hoop(7,4))
CalcArea(22)
