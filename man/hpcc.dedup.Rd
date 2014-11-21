\name{hpcc.dedup}
\alias{hpcc.dedup}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.dedup(dataframe, condition = NULL, all = FALSE, hash = NULL, keep = 1, keeper = 0, local = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{condition}{
%%     ~~Describe \code{condition} here~~
}
  \item{all}{
%%     ~~Describe \code{all} here~~
}
  \item{hash}{
%%     ~~Describe \code{hash} here~~
}
  \item{keep}{
%%     ~~Describe \code{keep} here~~
}
  \item{keeper}{
%%     ~~Describe \code{keeper} here~~
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
function (dataframe, condition = NULL, all = FALSE, hash = NULL, 
    keep = 1, keeper = 0, local = FALSE) 
{
    out.dataframe <- .hpcc.get.name()
    code <- sprintf("\%s := DEDUP(\%s", out.dataframe, dataframe)
    if (is.not.null(condition)) {
        code <- sprintf("\%s,\%s", condition)
        if (all) {
            code <- sprintf("\%s,ALL", code)
            if (is.not.null(hash)) {
                code <- sprintf("\%s,\%s", code, hash)
            }
        }
        else if (keep != 1 & is.numeric(keep)) {
            code <- sprintf("\%s,KEEP \%s", code, keep)
        }
        if (keeper == "RIGHT" || keeper == 1) {
            code <- sprintf("\%s,RIGHT", code)
        }
        if (local) {
            code <- sprintf("\%s,\%s", code, local)
        }
    }
    code <- sprintf("\%s);\n", code)
    .hpcc.submit(code)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
