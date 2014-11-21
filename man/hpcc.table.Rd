\name{hpcc.table}
\alias{hpcc.table}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.table(dataframe, format, expression = NULL, few = NULL, unsorted = FALSE, local = FALSE, keyed = FALSE, merge = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{format}{
%%     ~~Describe \code{format} here~~
}
  \item{expression}{
%%     ~~Describe \code{expression} here~~
}
  \item{few}{
%%     ~~Describe \code{few} here~~
}
  \item{unsorted}{
%%     ~~Describe \code{unsorted} here~~
}
  \item{local}{
%%     ~~Describe \code{local} here~~
}
  \item{keyed}{
%%     ~~Describe \code{keyed} here~~
}
  \item{merge}{
%%     ~~Describe \code{merge} here~~
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
function (dataframe, format, expression = NULL, few = NULL, unsorted = FALSE, 
    local = FALSE, keyed = FALSE, merge = FALSE) 
{
    out.dataframe <- .hpcc.get.name()
    if (missing(dataframe)) {
        stop("no dataframe")
    }
    code <- sprintf("\%s := TABLE(\%s,\%s", out.dataframe, dataframe, 
        format)
    if (is.not.null(expression)) {
        code <- sprintf("\%s,\%s", code, expression)
        if (few == "FEW" || few == "few" || few == "MANY" || 
            few == "many") {
            code <- sprintf("\%s,\%s", few)
        }
        if (unsorted) {
            code <- sprintf("\%s,UNSORTED", code)
        }
    }
    if (local) {
        code <- sprintf("\%s,LOCAL", code)
    }
    if (keyed) {
        code <- sprintf("\%s,KEYED", code)
    }
    if (merge) {
        code <- sprintf("\%s,MERGE", code)
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
