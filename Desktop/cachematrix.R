
## A function that creates a matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) { ##set the default of "matrix"
	MatrixInvert <-NULL ##will store the value of inverted matrix
	setMatrix <-function(y) { ##define set fuction
		x<<-y ##value of matrix in parent environment
		MatrixInvert <<-NULL ##if a new matrix, reset MatrixInvert to NULL
}
getMatrix <-function()x ##value of matrix
setInverse <-function(inverse) MatrixInvert <<-inverse ##set the value of the inverted matrix
getInverse <-function() MatrixInvert ##get the value of the inverted matrix
list(getMatrix=getMatrix, setMatrix=setMatrix, setInverse=setInverse, getInverse=getInverse)
} ##will allow the use of $ operator

## This function takes the output from makeCacheMatrix() above and computes the inverse.  If the inverse already has a value then cacheSolve will return the inverse from the cache

cacheSolve <- function(x, ...) {
        MatrixInvert <-x$getInverse()
        if(!is.null(MatrixInvert)) { ##if inverted matrix is not NULL
        	message("pulling cached data") ##give message
        	return(MatrixInvert)##then return the inverted matrix
}
MatrixData <-x$getMatrix() ##get original data of matrix
MatrixInvert <-solve(MatrixData,...) ##apply the solve function to invert the matrix
x$setInverse(MatrixInvert) ##set the inverted matrix
return(MatrixInvert) ##return the inverted matrix
}