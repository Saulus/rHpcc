\name{hpcc.iterate}
\alias{hpcc.iterate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.iterate(dataframe, calltransfunc, local = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{calltransfunc}{
%%     ~~Describe \code{calltransfunc} here~~
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
function (dataframe, calltransfunc, local = FALSE) 
{
    if (missing(dataframe)) {
        stop("no dataframe.")
    }
    out.dataframe <- .hpcc.get.name()
    code <- sprintf("\%s := ITERATE(\%s,\%s(LEFT,RIGHT)", out.dataframe, 
        dataframe, calltransfunc)
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
