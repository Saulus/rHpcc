\name{hpcc.join}
\alias{hpcc.join}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.join(Dataset1, Dataset2, joinCondition, fields, fieldNames = NULL, type = "Inner")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Dataset1}{
%%     ~~Describe \code{Dataset1} here~~
}
  \item{Dataset2}{
%%     ~~Describe \code{Dataset2} here~~
}
  \item{joinCondition}{
%%     ~~Describe \code{joinCondition} here~~
}
  \item{fields}{
%%     ~~Describe \code{fields} here~~
}
  \item{fieldNames}{
%%     ~~Describe \code{fieldNames} here~~
}
  \item{type}{
%%     ~~Describe \code{type} here~~
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
function (Dataset1, Dataset2, joinCondition, fields, fieldNames = NULL, 
    type = "Inner") 
{
    out.dataframe <- .hpcc.get.name()
    record <- ""
    transform <- ""
    transformArg <- ""
    if (fields == Dataset1 || fields == "LEFT") {
        transformArg <- "TRANSFORM(LEFT)"
    }
    else if (fields == Dataset2 || fields == "RIGHT") {
        transformArg <- "TRANSFORM(RIGHT)"
    }
    else {
        recordName <- .hpcc.get.name()
        record <- paste(recordName, " := RECORD\n", sep = "")
        for (i in seq_along(fields)) {
            record <- paste(record, "TYPEOF(", fields[i], ") ", 
                "Field", i, ";\n", sep = "", collapse = "")
        }
        record <- paste(record, "END;\n", sep = "", collapse = "")
        transFormName <- .hpcc.get.name()
        transformArg <- paste(transFormName, "(LEFT,RIGHT)", 
            sep = "")
        transform <- paste(recordName, " ", transFormName, "(RECORDOF(", 
            Dataset1, ") ", Dataset1, ",RECORDOF(", Dataset2, 
            ") ", Dataset2, ") := TRANSFORM\n", sep = "")
        for (i in seq_along(fields)) {
            x <- paste("SELF.Field", i, " := ", fields[i], ";\n", 
                sep = "")
            if (!is.null(fieldNames)) {
                x <- paste("SELF.", fieldNames[i], " := ", fields[i], 
                  ";\n", sep = "")
            }
            transform <- paste(transform, x, sep = "")
        }
        transform <- paste(transform, "END;\n", sep = "", collapse = "")
    }
    join <- paste(out.dataframe, " := JOIN(", Dataset1, ",", 
        Dataset2, ",", joinArg, ",", transformArg, ",", type, 
        ");\n", sep = "")
    code <- paste(record, transform, join, out, sep = "", collapse = "")
    .hpcc.submit(code = code)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
