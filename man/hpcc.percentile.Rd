\name{hpcc.percentile}
\alias{hpcc.percentile}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.percentile(dataset, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataset}{
%%     ~~Describe \code{dataset} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
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
function (dataset, ...) 
{
    parameters <- list(...)
    if (length(parameters)\%\%2 != 0) 
        stop("Parameters are wrong")
    out.dataframe <- .hpcc.get.name()
    fieldsRaw <- parameters[seq.int(1, length(parameters), 2)]
    percentilesRaw <- parameters[seq.int(2, length(parameters), 
        2)]
    value <- ""
    field <- ""
    percents <- ""
    normalize <- ""
    high <- 0
    for (i in 1:length(fieldsRaw)) {
        if (length(percentilesRaw[[i]]) > high) 
            high <- length(percentilesRaw[[i]])
        if (i == length(fieldsRaw)) {
            value <- paste(value, "LEFT.", fieldsRaw[[i]], sep = "")
            field <- paste(field, "'", fieldsRaw[[i]], "'", sep = "")
            normalize <- paste(normalize, fieldsRaw[[i]], "P[COUNTER]", 
                sep = "")
        }
        else {
            value <- paste(value, "LEFT.", fieldsRaw[[i]], ",", 
                sep = "", collapse = NULL)
            field <- paste(field, "'", fieldsRaw[[i]], "',", 
                sep = "")
            normalize <- paste(normalize, "IF(SELF.field='", 
                fieldsRaw[[i]], "',", fieldsRaw[[i]], "P[COUNTER],", 
                sep = "")
        }
        percents <- paste(percents, "SET OF INTEGER ", fieldsRaw[[i]], 
            "P := [0,1,5,10,25,50,75,90,95,99,100", sep = "")
        dfg <- paste("", percentilesRaw[[i]], sep = "", collapse = ",")
        percents <- paste(percents, ",", dfg, "];\n", sep = "", 
            collapse = NULL)
    }
    for (i in 1:length(fieldsRaw)) {
        normalize <- paste(normalize, ")", sep = "")
    }
    NormRec <- .hpcc.get.name()
    percentile <- sprintf("\%s:=RECORD\nINTEGER4 number;\nSTRING field;\nREAL value;\nEND;\n", 
        NormRec)
    OutDS <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=NORMALIZE(\%s,\%s,TRANSFORM(\%s,SELF.number:=COUNTER,\n                        SELF.field:=CHOOSE(COUNTER,\%s),\n                        SELF.value:=CHOOSE(COUNTER,\%s)));\n", 
        percentile, OutDS, dataset, length(fieldsRaw), NormRec, 
        field, value)
    RankableField <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := RECORD\n\%s;\nUNSIGNED pos:=0;\nEND;\n", 
        percentile, RankableField, OutDS)
    Ta <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=TABLE(SORT(\%s,field,Value),\%s);\n", 
        percentile, Ta, OutDS, RankableField)
    percentile <- sprintf("\%sTYPEOF(\%s) add_rank(\%s le, UNSIGNED c):=TRANSFORM\nSELF.pos:=c;\nSELF:=le;\nEND;\n", 
        percentile, Ta, Ta)
    P <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=PROJECT(\%s,add_rank(LEFT,COUNTER));\n", 
        percentile, P, Ta)
    RS <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=RECORD\nSeq:=MIN(GROUP,\%s.pos);\n\%s.field;\nEND;\n", 
        percentile, RS, P, P)
    Splits <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := TABLE(\%s,\%s,field,FEW);\n", 
        percentile, Splits, P, RS)
    to <- .hpcc.get.name()
    percentile <- sprintf("\%sTYPEOF(\%s) \%s(\%s le, \%s ri):=TRANSFORM\nSELF.pos:=1+le.pos-ri.Seq;\nSELF:=le;\nEND;\n", 
        percentile, Ta, to, P, Splits)
    outfile <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := JOIN(\%s,\%s,LEFT.field=RIGHT.field, \%s(LEFT,RIGHT),LOOKUP);\n", 
        percentile, outfile, P, Splits, to)
    N <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=COUNT(\%s);\n", percentile, N, 
        dataset)
    percentile <- paste(percentile, percents, sep = "")
    Rec1 <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=RECORD\nSTRING field;\nINTEGER4 percentiles;\nEND;\n", 
        percentile, Rec1)
    MyTab <- .hpcc.get.name()
    percentile <- paste(percentile, MyTab, ":=NORMALIZE(", Splits, 
        ",", (11 + high), ",TRANSFORM(", Rec1, ",SELF.field:=LEFT.field,\n                      SELF.percentiles:=", 
        normalize, ");\n", sep = "")
    PerRec <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=RECORD\n\%s;\nREAL rank:=IF(\%s.percentiles = -1,0,\n                        IF(\%s.percentiles = 0,1,\n                        IF(ROUND(\%s.percentiles*(\%s+1)/100)>=\%s,\%s,\n                        \%s.percentiles*(\%s+1)/100)));\nEND;\n", 
        percentile, PerRec, MyTab, MyTab, MyTab, MyTab, N, N, 
        N, MyTab, N)
    valuestab <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := TABLE(\%s,\%s);\n", percentile, 
        valuestab, MyTab, PerRec)
    rankRec <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := RECORD\nSTRING field := \%s.field;\n\n                        REAL rank := \%s.rank;\nINTEGER4 intranks;\nREAL decranks;\n\n                        INTEGER4 plusOneranks;\n\n                        \%s.percentiles;\nEND;\n", 
        percentile, rankRec, valuestab, valuestab, valuestab)
    tr <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s \%s(\%s L, INTEGER C) := TRANSFORM\n\n                        SELF.decranks := IF(L.rank - (ROUNDUP(L.rank) - 1) = \n                        1,0,L.rank - (ROUNDUP(L.rank) - 1));\n\t\t\t\t\t\t  \n                        SELF.intranks := IF(ROUNDUP(L.rank) = L.rank,L.rank,(ROUNDUP(L.rank) - 1));\n\n                        SELF.plusOneranks := SELF.intranks + 1;\n\n                        SELF := L;\n\n                        END;\n", 
        percentile, rankRec, tr, valuestab)
    ranksTab <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := PROJECT(\%s,\%s(LEFT,COUNTER));\n", 
        percentile, ranksTab, valuestab, tr)
    ranksRec <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := RECORD\nSTRING field;\n\%s.decranks;\n\%s.percentiles;\n\n                        INTEGER4 ranks;\nEND;\n", 
        percentile, ranksRec, ranksTab, ranksTab)
    rankTab <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := NORMALIZE(\%s,2,TRANSFORM(\%s,SELF.field := LEFT.field; \n                        SELF.ranks := CHOOSE(COUNTER,LEFT.intranks,LEFT.plusOneranks),SELF := LEFT));\n", 
        percentile, rankTab, ranksTab, ranksRec)
    MTable <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s:=SORT(JOIN(\%s, \%s, LEFT.field = RIGHT.field AND \n                        LEFT.ranks = RIGHT.pos),field,percentiles,ranks);\n", 
        percentile, MTable, rankTab, outfile)
    MyTable <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s := DEDUP(\%s, LEFT.percentiles = RIGHT.percentiles AND \n                        LEFT.ranks = RIGHT.ranks AND LEFT.field = RIGHT.field);\n", 
        percentile, MyTable, MTable)
    RollThem <- .hpcc.get.name()
    percentile <- sprintf("\%s\%s \%s(\%s L, \%s R) := TRANSFORM\nSELF.value := L.value + L.decranks*(R.value - L.value);\nSELF := L;\nEND;\n", 
        percentile, MyTable, RollThem, MyTable, MyTable)
    beforeOut <- .hpcc.get.name()
    percentile <- paste(percentile, beforeOut, ":= ROLLUP(", 
        MyTable, ", LEFT.percentiles = RIGHT.percentiles \n                      AND LEFT.field=RIGHT.field, ", 
        RollThem, "(LEFT,RIGHT));\n", sep = "")
    percentile <- sprintf("\%s\%s := TABLE(\%s,{field,percentiles,value});\n", 
        percentile, out.dataframe, beforeOut)
    .hpcc.submit(percentile)
    return(out.dataframe)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
