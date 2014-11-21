\name{hpcc.showFilesToDownload}
\alias{hpcc.showFilesToDownload}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.showFilesToDownload()
}
%- maybe also 'usage' for other objects documented here.
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
function () 
{
    if (dim(.hpccSessionVariables)[1] == 0) {
        print("No Files To download")
        return()
    }
    print("Below are the files available for download")
    for (i in seq(1, dim(.hpccSessionVariables)[1])) {
        print(.hpccSessionVariables[i, 2])
    }
    inp <- 1
    while (inp != 0) {
        inp <- readline(prompt = "Type the number of the file To Download or 0 to exit : ")
        inp <- as.numeric(inp)
        if (inp > 0 & inp <= dim(.hpccSessionVariables)[1]) {
            numb <- as.numeric(inp)
            if (.hpccSessionVariables[numb, 3] > 0) 
                print("File already downloaded:")
            else {
                nameOfFile <- paste(.hpccSessionVariables[numb, 
                  2], ".csv", sep = "")
                url <- .hpcc.formURL(nameOfFile)
                print(url)
                .hpcc.downloadFile(url, nameOfFile)
                numberOfDown <- sum(as.numeric(.hpccSessionVariables[, 
                  3] > 0)) + 1
                .hpccSessionVariables[numb, 3] <- numberOfDown
            }
        }
        else if (inp != 0) 
            print("Invalid Input")
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
