\name{hpcc.string.replace}
\alias{hpcc.string.replace}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.string.replace(nameOfString, existingPattern, newPattern, constant = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{nameOfString}{
%%     ~~Describe \code{nameOfString} here~~
}
  \item{existingPattern}{
%%     ~~Describe \code{existingPattern} here~~
}
  \item{newPattern}{
%%     ~~Describe \code{newPattern} here~~
}
  \item{constant}{
%%     ~~Describe \code{constant} here~~
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
function (nameOfString, existingPattern, newPattern, constant = TRUE) 
{
    out.dataframe <- .hpcc.get.name()
    .hpcc.import("Std")
    code <- paste(out.dataframe, " := Std.Str.FindReplace(", 
        nameOfString, ",'", existingPattern, "','", newPattern, 
        "');\n", sep = "")
    .hpcc.submit(code, submit)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
