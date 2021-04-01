## Test cacheSolve function

library(assertthat)

m.dim = 2
m.init <- matrix(runif(m.dim * m.dim), nrow = m.dim, ncol = m.dim)
m.test <- m.init %*% t(m.init)

m.test.sol <- solve(m.test)

a.matrix <- makeCacheMatrix(m.test)

a.matrix.sol <- cacheSolve(a.matrix)
a.matrix.sol2 <- cacheSolve(a.matrix)
# Here is expected the comment 'getting cached data'

see_if(are_equal(m.test.sol, a.matrix.sol, tol=1e-12))
see_if(are_equal(m.test.sol, a.matrix.sol2, tol=1e-12))
