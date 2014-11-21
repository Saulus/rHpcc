\name{hpcc.rollup}
\alias{hpcc.rollup}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.rollup(recordset, condition = NULL, transfunc, GROUPED = FALSE, out.dataframe, fieldList = NULL, local = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{recordset}{
%%     ~~Describe \code{recordset} here~~
}
  \item{condition}{
%%     ~~Describe \code{condition} here~~
}
  \item{transfunc}{
%%     ~~Describe \code{transfunc} here~~
}
  \item{GROUPED}{
%%     ~~Describe \code{GROUPED} here~~
}
  \item{out.dataframe}{
%%     ~~Describe \code{out.dataframe} here~~
}
  \item{fieldList}{
%%     ~~Describe \code{fieldList} here~~
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
function (recordset, condition = NULL, transfunc, GROUPED = FALSE, 
    out.dataframe, fieldList = NULL, local = FALSE) 
{
    if (missing(dataframe)) {
        stop("no dataframe")
    }
    out.dataframe <- .hpcc.get.name()
    code <- sprintf("\%s := ROLLUP(\%s", out.dataframe, recordset)
    a <- TRUE
    if (is.not.null(condition)) {
        code <- sprintf("\%s,\%s", code, condition)
        a <- FALSE
    }
    else if (GROUPED) {
        code <- sprintf("\%s,GROUP")
        a <- FALSE
    }
    code <- sprintf("\%s,\%s(LEFT,RIGHT)", code, transfunc)
    if (a & is.not.null(fieldList)) {
        code <- sprintf("\%s,\%s", code, fieldList)
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
