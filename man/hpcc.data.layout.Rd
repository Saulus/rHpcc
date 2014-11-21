\name{hpcc.data.layout}
\alias{hpcc.data.layout}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
title
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
hpcc.data.layout(logicalfilename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{logicalfilename}{
%%     ~~Describe \code{logicalfilename} here~~
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
function (logicalfilename) 
{
    out.struct <- ""
    body <- paste("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n                <soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\"\n                xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\"\n                xmlns=\"urn:hpccsystems:ws:wsdfu\">\n                <soap:Body>\n                <DFUInfoRequest>\n                <Name>", 
        logicalfilename, "</Name>\n                </DFUInfoRequest>\n                </soap:Body>\n                </soap:Envelope>")
    headerFields = c(Accept = "text/xml", Accept = "multipart/*", 
        `Content-Type` = "text/xml; charset=utf-8", SOAPAction = "urn:hpccsystems:ws:wsdfu")
    reader = basicTextGatherer()
    handle = getCurlHandle()
    url <- .uUrlHpcc
    curlPerform(url = url, httpheader = headerFields, ssl.verifypeer = FALSE, 
        postfields = body, writefunction = reader$update, curl = handle)
    status = getCurlInfo(handle)$response.code
    if (status >= 200 && status <= 300) {
        sResponse <- reader$value()
        responseXml <- xmlParse(sResponse)
        layout <- getNodeSet(responseXml, "//*[local-name()='Ecl']/text()", 
            namespaces = xmlNamespaceDefinitions(responseXml, 
                simplify = TRUE))
        if (length(layout) > 0) {
            colLayout <- layout[[1]]
            out.struct <- xmlToList(colLayout, addAttributes = TRUE)
        }
    }
    return(out.struct)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
