## I put the overall description into the Readme (see github repository)

# Create a cache matrix (with random matrix if non specified)
makeCacheMatrix <- function(x = replicate(3, rnorm(3))) { # Just a default random matrix for parameter
  i <- NULL
  set <- function(y) { 
    if(!matequal(x, y)){ # Only set NULL if it really has been changed, otherwise keep cache
      x <<- y
      i <<- NULL 
    }
  }
  get <- function() x
  setInverse <- function(matrix) i <<- solve(matrix)
  getInverse <- function() i
  list(set = set, 
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

# Solves things
cacheSolve <- function(mat, ...) {
  inv <- mat$getInverse()
  if(!is.null(inv)) {
    message("Getting cached Inverse")
    return(inv)
  }
  data <- mat$get()
  inv <- solve(data, ...)
  mat$setInverse(inv)
  inv
}

# Helper Function, source: https://stat.ethz.ch/pipermail/r-help/2012-June/315408.html
matequal <- function(x, y) {
  is.matrix(x) && is.matrix(y) && dim(x) == dim(y) && all(x == y)
}
