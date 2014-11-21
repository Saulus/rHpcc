\name{hpcc.dataset}
\alias{hpcc.dataset}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.dataset(logicalfilename, filetype = "thor", inlineData, layoutname)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{logicalfilename}{
%%     ~~Describe \code{logicalfilename} here~~
}
  \item{filetype}{
%%     ~~Describe \code{filetype} here~~
}
  \item{inlineData}{
%%     ~~Describe \code{inlineData} here~~
}
  \item{layoutname}{
%%     ~~Describe \code{layoutname} here~~
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
function (logicalfilename, filetype = "thor", inlineData, layoutname) 
{
    outputDataset <- ""
    eclQuery <- ""
    outputDatasetName <- .hpcc.get.name()
    if (!missing(logicalfilename)) {
        recordLayout <- hpcc.data.layout(logicalfilename)
        data <- sprintf("'~\%s'", logicalfilename)
        recLayoutName <- .hpcc.get.name()
        eclQuery <- sprintf("\%s := \%s", recLayoutName, recordLayout)
        data <- sprintf("\%s, \%s, \%s", data, recLayoutName, filetype)
    }
    else if (!missing(inlineData) & !missing(layoutname)) {
        functionArgs <- (as.list(match.call()))
        eclQuery <- sprintf("\%s := \%s;", as.character(functionArgs$layoutname), 
            layoutname)
        data <- sprintf("[ \%s ], \%s", inlineData, as.character(functionArgs$layoutname))
    }
    else {
        stop("Arguments are not proper")
    }
    outputDataset <- sprintf("\%s := DATASET(\%s);\n", outputDatasetName, 
        data)
    eclQuery <- sprintf("\%s \%s", eclQuery, outputDataset)
    .hpcc.submit(eclQuery)
    return(outputDatasetName)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
