\name{hpcc.string.find}
\alias{hpcc.string.find}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.string.find(nameOfString, patternToFind, constant = TRUE, instance, output = 20, submit = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nameOfString}{
%%     ~~Describe \code{nameOfString} here~~
}
  \item{patternToFind}{
%%     ~~Describe \code{patternToFind} here~~
}
  \item{constant}{
%%     ~~Describe \code{constant} here~~
}
  \item{instance}{
%%     ~~Describe \code{instance} here~~
}
  \item{output}{
%%     ~~Describe \code{output} here~~
}
  \item{submit}{
%%     ~~Describe \code{submit} here~~
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
function (nameOfString, patternToFind, constant = TRUE, instance, 
    output = 20, submit = TRUE) 
{
    out.dataframe <- .hpcc.get.name()
    .hpcc.import("Std")
    code <- paste(out.dataframe, " := Std.Str.Find(", nameOfString, 
        ",'", patternToFind, "',", instance, ");\n", sep = "")
    code <- paste(code, hpcc.output(out.dataframe = "code", noOfRecordsNeed = output))
    .hpcc.submit(code, submit)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
