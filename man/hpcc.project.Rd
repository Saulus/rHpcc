\name{hpcc.project}
\alias{hpcc.project}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.project(dataframe, transfunc = NULL, record = NULL, lookahead = NULL, parallel = FALSE, keyed = FALSE, local = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{transfunc}{
%%     ~~Describe \code{transfunc} here~~
}
  \item{record}{
%%     ~~Describe \code{record} here~~
}
  \item{lookahead}{
%%     ~~Describe \code{lookahead} here~~
}
  \item{parallel}{
%%     ~~Describe \code{parallel} here~~
}
  \item{keyed}{
%%     ~~Describe \code{keyed} here~~
}
  \item{local}{
%%     ~~Describe \code{local} here~~
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
function (dataframe, transfunc = NULL, record = NULL, lookahead = NULL, 
    parallel = FALSE, keyed = FALSE, local = FALSE) 
{
    if (missing(dataframe)) {
        stop("no dataframe")
    }
    code <- sprintf("\%s := PROJECT(\%s", out.dataframe, dataframe)
    if (is.not.null(transfunc)) {
        code <- sprintf("\%s,\%s", transfunc)
    }
    else if (is.not.null(record)) {
        code <- sprintf("\%s,\%s", code, record)
    }
    else {
        stop("Either Trans or Record should be mentioned")
    }
    if (is.not.null(lookahead)) {
        code <- sprintf("\%s,PREFTECH[(\%s", code, lookahead)
        if (parallel) {
            code <- sprintf("\%s,PARALLEL", code)
        }
        code <- sprintf("\%s)", code)
    }
    if (keyed) {
        code <- sprintf("\%s,KEYED", code)
    }
    if (local) {
        code <- sprintf("\%s,LOCAL", code)
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
