## R Programming - Programming Assignment 2

## Caching data  

# Create matrix
makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)

}


## Returns the cached reveresed matrix if it is avalibale, 
#  otherwise calcluate the matrix revese and return it

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    mat = x$get()
    # It's possible to use ginv() function in the MASS library to be able to deal with general matrices.
    #library(MASS)
    #m = ginv(mat)
    m = solve(mat)
    
    x$setInverse(m)
    m
    
}


