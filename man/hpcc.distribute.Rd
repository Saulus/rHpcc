\name{hpcc.distribute}
\alias{hpcc.distribute}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.distribute(dataframe, expression = NULL, index = NULL, skew = NULL, sorts = NULL, joincondition = NULL, maxskew = NULL, skewlimit = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{expression}{
%%     ~~Describe \code{expression} here~~
}
  \item{index}{
%%     ~~Describe \code{index} here~~
}
  \item{skew}{
%%     ~~Describe \code{skew} here~~
}
  \item{sorts}{
%%     ~~Describe \code{sorts} here~~
}
  \item{joincondition}{
%%     ~~Describe \code{joincondition} here~~
}
  \item{maxskew}{
%%     ~~Describe \code{maxskew} here~~
}
  \item{skewlimit}{
%%     ~~Describe \code{skewlimit} here~~
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
function (dataframe, expression = NULL, index = NULL, skew = NULL, 
    sorts = NULL, joincondition = NULL, maxskew = NULL, skewlimit = NULL) 
{
    if (missing(dataframe)) {
        stop("Data Frame Missing")
    }
    out.dataframe = .hpcc.get.name()
    code <- sprintf("\%s := DISTRIBUTE(\%s", out.dataframe, dataframe)
    if (is.not.null(expression)) {
        code <- sprintf("\%s,\%s", code, expression)
        if (is.not.null(sorts)) {
            code <- sprintf("\%s,MERGE(\%s)", code, sorts)
        }
    }
    else if (is.not.null(index)) {
        code <- sprintf("\%s,\%s", code, index)
        if (is.not.null(joincondition)) {
            code <- sprintf("\%s,\%s", code, joincondition)
        }
    }
    else if (is.not.null(maxskew)) {
        code <- sprintf("\%s,SKEW(\%s", code, maxskew)
        if (is.not.null(joincondition)) {
            code <- sprintf("\%s,\%s", code, joincondition)
        }
        code <- sprintf("\%s)", code)
    }
    code <- sprintf("\%s)", code)
    .hpcc.submit(code)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
