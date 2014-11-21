\name{hpcc.convertFilesToFFObjects}
\alias{hpcc.convertFilesToFFObjects}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.convertFilesToFFObjects()
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
    if (sum(as.numeric(.hpccSessionVariables[, 3])) == 0) {
        print("No Files are downloaded in your system")
        return()
    }
    print("Below are the files downloaded into your System ")
    downloadedFiles <- .hpccSessionVariables(.hpccSessionVariables[, 
        3] > 0)
    for (i in seq(1, length(downloadedFiles))) {
        print(paste(downloadedFiles[i, 3], "--", downloadedFiles[i, 
            2], sep = "  "))
    }
    inp <- 1
    while (inp > 0) {
        inp <- readline(prompt = "Type the file number indicated above to convert that file or 0 to exit : ")
        inp <- as.numeric(inp)
        if (inp > 0 & inp <= dim(downloadedFiles)[1]) {
            numb <- as.numeric(inp)
            if (.hpccSessionVariables[numb, 3] == 1) 
                print("File already Converted:")
            else {
                nameOfFile <- paste(.hpccSessionVariables[numb, 
                  2], ".csv", sep = "")
                url <- .hpcc.formURL(nameOfFile)
                print(url)
                .hpcc.downloadFile(url, nameOfFile)
                .hpccSessionVariables[numb, 4] = 1
            }
        }
        else if (inp != 0) {
            print("Invalid Input")
        }
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
