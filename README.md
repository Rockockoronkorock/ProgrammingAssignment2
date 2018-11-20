## Programming Assignments

### Coursera 20.11.2018

#### Usage of R Script "cacheMatrix.R"

Create new vector:

``````R
mm <- makeCacheMatrix() # for a random matrix
``````

OR

``````R
mat <- matrix(...) # any matrix
mm <- makeCacheMatrix(mat)
``````

Save inverse:

``````R
cacheSolve(mm) # will return the (cached) inverse
``````

