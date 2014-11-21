\name{hpcc.define.transform}
\alias{hpcc.define.transform}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.define.transform(returnType, argTypes, argNames, ..., submit = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{returnType}{
%%     ~~Describe \code{returnType} here~~
}
  \item{argTypes}{
%%     ~~Describe \code{argTypes} here~~
}
  \item{argNames}{
%%     ~~Describe \code{argNames} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
  \item{submit}{
%%     ~~Describe \code{submit} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (returnType, argTypes, argNames, ..., submit = TRUE) 
{
    transformName <- .hpcc.get.name()
    code <- paste(returnType, " ", transformName, "(")
    s <- list(...)
    for (i in seq_along(argNames)) {
        i
        code <- paste(code, argTypes[i], " ", argNames[i], sep = "", 
            collapse = NULL)
        if (i == length(argNames)) 
            break
        code <- paste(code, ",", sep = "")
    }
    code <- paste(code, ") := TRANSFORM\n", sep = "")
    for (i in seq_along(s)) {
        code <- paste(code, s[[i]], "\n", sep = "")
    }
    code <- paste(code, "END;\n", sep = "")
    .hpcc.submit(code[1])
    return(transformName)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
