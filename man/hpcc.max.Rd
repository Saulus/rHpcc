\name{hpcc.max}
\alias{hpcc.max}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.max(dataframe, fields)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
}
  \item{fields}{
%%     ~~Describe \code{fields} here~~
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
function (dataframe, fields) 
{
    strim <- function(dataframe) {
        gsub("^\\s+|\\s+$", "", dataframe)
    }
    out.dataframe <- .hpcc.get.name()
    varlst <- strsplit(fields, ",")
    str1 <- ""
    str2 <- ""
    for (i in 1:length(varlst[[1]])) {
        k <- strim(varlst[[1]][i])
        h <- strsplit(k, " ")
        charh <- paste("'", h[[1]][1], "'", sep = "")
        str1 <- strim(paste(str1, charh, sep = ","))
        hh <- strim(paste("LEFT.", h[[1]][1], sep = ""))
        str2 <- strim(paste(str2, hh, sep = ","))
    }
    recmax <- .hpcc.get.name()
    code <- recmax
    code <- sprintf("\%s :=RECORD\n", recmax)
    code <- sprintf("\%sINTEGER3 id;\n", code)
    code <- sprintf("\%s\%s;\n", code, dataframe)
    code <- sprintf("\%sEND;\n", code)
    maxtrans <- .hpcc.get.name()
    code <- sprintf("\%s\%s \%s (\%s L, INTEGER C) := TRANSFORM\n", 
        code, recmax, maxtrans, dataframe)
    code <- sprintf("\%sSELF.id := C;\n", code)
    code <- sprintf("\%sSELF :=L;\n", code)
    code <- sprintf("\%sEND;\n", code)
    DSRMAX <- .hpcc.get.name()
    code <- sprintf("\%s\%s:=PROJECT(\%s,\%s(LEFT,COUNTER));\n", 
        code, DSRMAX, dataframe, maxtrans)
    MaxField <- .hpcc.get.name()
    code <- sprintf("\%s\%s:=RECORD\n", code, MaxField)
    code <- sprintf("\%sUNSIGNED id;\n", code)
    code <- sprintf("\%sSTRING Field;\n", code)
    code <- sprintf("\%sREAL8 value;\nEND;\n", code)
    OutDsMax <- .hpcc.get.name()
    code <- sprintf("\%s\%s:=NORMALIZE(\%s,\%s,TRANSFORM(\%s,SELF.id:=LEFT.id,SELF.Field:=CHOOSE\n                  (COUNTER\%s);SELF.value:=CHOOSE(COUNTER\%s)));\n", 
        code, OutDsMax, DSRMAX, length(varlst[[1]]), MaxField, 
        str1, str2)
    SinglemaxField <- .hpcc.get.name()
    code <- sprintf("\%s\%s := RECORD\n", code, SinglemaxField)
    code <- sprintf("\%s\%s.Field;\n", code, OutDsMax)
    code <- sprintf("\%sMaxval := MAX(GROUP,\%s.value);\nEND;\n", 
        code, OutDsMax)
    code <- sprintf("\%s\%s:= TABLE(\%s,\%s,Field);\n", code, out.dataframe, 
        OutDsMax, SinglemaxField)
    .hpcc.submit(code)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
