## The following two functions: take a matrix, stores it into cache, and finds its inverse.

## makeCacheMatrix takes a matrix and returns a list containing functions that return:
## the cached matrix put in by the user
## the newly calculated inverse of the matrix given by cacheSolve saved into cache 
## the old cached inverse of the matrix 
## a new matrix if one is specified 
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() {x}
    setinverse <- function(inverse) {i <<- inverse}
    getinverse <- function() {i}
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}

## cacheSolve checks the list returned by makeCacheMatrix for a matrix inverse 
## If it exists, cacheSolve simply prints that inverse value. 
## If there is no inverse matrix, cacheSolve calculates the inverse from the matrix
cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    data <- x$get()
    i <- solve(data, ...)
    x$setinverse(i)
    ## Return a matrix that is the inverse of 'x'
    i  
}
