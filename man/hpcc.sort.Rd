\name{hpcc.sort}
\alias{hpcc.sort}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.sort(dataframe, fields, joined = NULL, skew = NULL, threshold = NULL, few = NULL, joinedset = NULL, limit = NULL, target = NULL, size = NULL, local = NULL, stable = NULL, unstable = NULL, algorithm = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{fields}{
%%     ~~Describe \code{fields} here~~
}
  \item{joined}{
%%     ~~Describe \code{joined} here~~
}
  \item{skew}{
%%     ~~Describe \code{skew} here~~
}
  \item{threshold}{
%%     ~~Describe \code{threshold} here~~
}
  \item{few}{
%%     ~~Describe \code{few} here~~
}
  \item{joinedset}{
%%     ~~Describe \code{joinedset} here~~
}
  \item{limit}{
%%     ~~Describe \code{limit} here~~
}
  \item{target}{
%%     ~~Describe \code{target} here~~
}
  \item{size}{
%%     ~~Describe \code{size} here~~
}
  \item{local}{
%%     ~~Describe \code{local} here~~
}
  \item{stable}{
%%     ~~Describe \code{stable} here~~
}
  \item{unstable}{
%%     ~~Describe \code{unstable} here~~
}
  \item{algorithm}{
%%     ~~Describe \code{algorithm} here~~
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
function (dataframe, fields, joined = NULL, skew = NULL, threshold = NULL, 
    few = NULL, joinedset = NULL, limit = NULL, target = NULL, 
    size = NULL, local = NULL, stable = NULL, unstable = NULL, 
    algorithm = NULL) 
{
    out.dataframe <- .hpcc.get.name()
    strim <- function(x) {
        gsub("^\\s+|\\s+$", "", x)
        gsub("^,+|,+$", "", x)
    }
    is.not.null <- function(x) !is.null(x)
    if (missing(dataframe)) {
        stop("no dataframe.")
    }
    else {
        if (is.not.null(joined)) {
            joinstr <- strim(sprintf("\%s(\%s)", joined, joinedset))
        }
        else {
            joinstr <- strim(joined)
        }
        if (is.not.null(skew)) {
            limt <- strim(sprintf("\%s,\%s", limit, target))
            skewstr <- strim(sprintf("\%s(\%s)", skew, limt))
        }
        else {
            skewstr <- strim(skew)
        }
        if (is.not.null(threshold)) {
            threstr <- strim(sprintf("\%s(\%s)", threshold, size))
        }
        else {
            threstr <- strim(threshold)
        }
        if (is.not.null(stable)) {
            stabstr <- strim(sprintf("\%s(\%s)", stable, algorithm))
        }
        else {
            stabstr <- strim(stable)
        }
        if (is.not.null(unstable)) {
            unstabstr <- strim(pastesprintf("\%s(\%s)", unstable, 
                algorithm))
        }
        else {
            unstabstr <- strim(unstable)
        }
        str1 <- strim(sprintf("\%s,\%s,\%s", dataframe, fields, 
            joinstr))
        str2 <- strim(sprintf("\%s,\%s", str1, skewstr))
        str3 <- strim(sprintf("\%s,\%s", str2, threstr))
        str4 <- strim(sprintf("\%s,\%s", str3, stabstr))
        str5 <- strim(sprintf("\%s,\%s", str4, unstabstr))
        str6 <- strim(sprintf("\%s,\%s", str5, local))
        str7 <- strim(sprintf("\%s,\%s", str6, few))
        xyz <- strim(sprintf("\%s := SORT(\%s);", out.dataframe, 
            str7))
        xyz <- sprintf("\%s := SORT(\%s,\%s);", out.dataframe, dataframe, 
            fields)
        .hpcc.submit(xyz)
        return(out.dataframe)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
