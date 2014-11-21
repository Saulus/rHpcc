\name{hpcc.output}
\alias{hpcc.output}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.output(out.dataframe, noOfRecordsNeed, download = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{out.dataframe}{
%%     ~~Describe \code{out.dataframe} here~~
}
  \item{noOfRecordsNeed}{
%%     ~~Describe \code{noOfRecordsNeed} here~~
}
  \item{download}{
%%     ~~Describe \code{download} here~~
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
function (out.dataframe, noOfRecordsNeed, download = FALSE) 
{
    functionArgs <- (as.list(match.call()))
    outX <- as.character(functionArgs$out.dataframe)
    out <- paste("OUTPUT(", out.dataframe, "[1..", noOfRecordsNeed, 
        "],named('", outX, "'));\n", sep = "")
    if (noOfRecordsNeed == 0) 
        out <- ""
    if (download) {
        .hpcc.import(import = "STD")
        out1 <- paste("OUTPUT(", out.dataframe, ",,'~rhpcc::", 
            outX, "',CSV(HEADING(SINGLE)));\n", sep = "")
        despray <- paste("Std.File.Despray('~rhpcc::", outX, 
            "','", .hpccHostName, "','/var/lib/HPCCSystems/mydropzone/", 
            outX, ".csv',,,,TRUE);\n", sep = "")
        out <- paste(out1, despray, out, sep = "")
        out <- paste(out, "STD.File.DeleteLogicalFile('~rhpcc::", 
            outX, "');\n", sep = "")
        numbas <- as.character(dim(.hpccSessionVariables)[1] + 
            1)
        .hpccSessionVariables <<- rbind(.hpccSessionVariables, 
            c(numbas, outX, 0, 0))
    }
    .hpcc.submit(out)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
