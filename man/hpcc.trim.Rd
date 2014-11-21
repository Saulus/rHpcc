\name{hpcc.trim}
\alias{hpcc.trim}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.trim(nameOfString, LEFT = FALSE, RIGHT = FALSE, ALL = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nameOfString}{
%%     ~~Describe \code{nameOfString} here~~
}
  \item{LEFT}{
%%     ~~Describe \code{LEFT} here~~
}
  \item{RIGHT}{
%%     ~~Describe \code{RIGHT} here~~
}
  \item{ALL}{
%%     ~~Describe \code{ALL} here~~
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
function (nameOfString, LEFT = FALSE, RIGHT = FALSE, ALL = FALSE) 
{
    d <- ""
    out.dataframe <- .hpcc.get.name()
    if (LEFT) 
        d <- paste(d, ",LEFT")
    if (RIGHT) 
        d <- paste(d, ",RIGHT")
    if (ALL) 
        d <- paste(d, ",ALL")
    code <- paste(out.dataframe, " := TRIM(", nameOfString, ",", 
        d, sep = "")
    .hpcc.submit(code)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
