\name{hpcc.execute}
\alias{hpcc.execute}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.execute(signal)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{signal}{
%%     ~~Describe \code{signal} here~~
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
function (signal) 
{
    if (is.null(.uUrlHpccforEx)) 
        stop("Please start HPCC using the function - hpcc.begin()")
    for (i in seq(from = 1, to = length(.hpccImport))) {
        if (i != 1) 
            eclCode <- sprintf("\%s,", eclCode)
        else eclCode <- "IMPORT "
        eclCode <- sprintf("\%s \%s", eclCode, .hpccImport[i])
    }
    eclCode <- sprintf("\%s ;\n", eclCode)
    eclCode <- sprintf("\%s \%s", eclCode, .eclQuery)
    .eclQuery <<- ""
    fileout <- getwd()
    str <- .libPaths()
    eclCode <- paste("<![CDATA[", eclCode, "]]>")
    body <- ""
    body <- paste("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n                 <soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"\n                 xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\"\n                 xmlns=\"urn:hpccsystems:ws:ecldirect\">\n                 <soap:Body>\n                 <RunEclRequest>\n                 <userName>r2hpccUser</userName>\n                 \n                 <cluster>", 
        .hpccClustername, "</cluster>\n                 <limitResults>0</limitResults>\n                 <eclText>", 
        eclCode, "</eclText>\n                 <snapshot>test</snapshot>\n                 \n                 </RunEclRequest>\n                 </soap:Body>\n                 </soap:Envelope>\n", 
        sep = "")
    eclCode <<- eclCode
    headerFields = c(Accept = "text/xml", Accept = "multipart/*", 
        `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "urn:hpccsystems:ws:ecldirect")
    reader = basicTextGatherer()
    handle = getCurlHandle()
    url <- .uUrlHpccforEx
    curlPerform(url = url, httpheader = headerFields, ssl.verifypeer = FALSE, 
        postfields = body, writefunction = reader$update, curl = handle)
    status = getCurlInfo(handle)$response.code
    varWu1 <- reader$value()
    newlst <- xmlParse(varWu1)
    layout <- getNodeSet(newlst, "//*[local-name()='results']/text()", 
        namespaces = xmlNamespaceDefinitions(newlst, simplify = TRUE))
    colLayout <- layout[[1]]
    layout1 <- xmlToList(colLayout)
    .hpccData <- .data.result(layout1)
    hpcc.showFilesToDownload()
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
