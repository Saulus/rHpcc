\name{hpcc.rand}
\alias{hpcc.rand}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.rand(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{
%%     ~~Describe \code{dataframe} here~~
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
function (dataframe) 
{
    out.dataframe <- .hpcc.get.name()
    MyOutRec <- .hpcc.get.name()
    xyz <- sprintf("\%s := RECORD\n", MyOutRec)
    xyz <- sprintf("\%sUNSIGNED DECIMAL8_8 rand;\n", xyz)
    xyz <- sprintf("\%s\%s;)\n", xyz, dataframe)
    xyz <- sprintf("\%sEND;\n", xyz)
    MyTrans <- .hpcc.get.name()
    xyz <- sprintf("\%s \%s(\%s L, UNSIGNED4 C) := TRANSFORM\n", 
        MyOutRec, MyTrans, dataframe)
    xyz <- sprintf("\%sSELF.rand := C/4294967295;\n", xyz)
    xyz <- sprintf("\%sSELF := L;\n", xyz)
    xyz <- sprintf("\%sEND;\n", xyz)
    xyz <- sprintf("\%s\%s:= PROJECT(\%s,\%s(LEFT, RANDOM()));\n", 
        xyz, out.dataframe, dataframe, MyTrans)
    .hpcc.submit(xyz)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
