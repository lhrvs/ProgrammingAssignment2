## week 3 Assignment: Caching the Inverse of a Matrix

## 1.makeCacheMatrix: This function creates a special "matrix" object 
# that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) i <<- inverse
    getInverse <- function() i
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## 2.cacheSolve: This function computes the inverse of the special "matrix" 
# returned by makeCacheMatrix. If the inverse has already been calculated 
# (and the matrix has not changed), then the cacheSolve should retrieve 
# the inverse from the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getInverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setInverse(i)
    i
}
