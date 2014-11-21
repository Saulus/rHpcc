hpcc.dataset <- function(logicalfilename,filetype='thor', inlineData, layoutname) {
	outputDataset <- ""
	eclQuery<-''
	outputDatasetName <- hpcc.get.name()
	if(!missing(logicalfilename)) {
		recordLayout <- hpcc.data.layout(logicalfilename)
		data <- sprintf("'~%s'", logicalfilename)
		if (!missing(layoutname)) {
			functionArgs <- (as.list(match.call()))
			recLayoutName <- as.character(functionArgs$layoutname)
			eclQuery <- sprintf("%s := %s;", recLayoutName, layoutname)
		} else {
			recLayoutName <- hpcc.get.name()
			eclQuery <- sprintf("%s := %s",recLayoutName, recordLayout)
		}
		data <- sprintf("%s, %s, %s", data,recLayoutName,filetype)
		if (!missing(inlineData)) {
			functionArgs <- (as.list(match.call()))
			data <- sprintf( "[ %s ], %s", inlineData, recLayoutName )
		}
		
	} else {
		stop('Arguments are not proper')
	}
	outputDataset <- sprintf("%s := DATASET(%s);\n",outputDatasetName, data)
	eclQuery <- sprintf("%s %s",eclQuery,outputDataset)
	hpcc.submit(eclQuery)
	return(outputDatasetName)
}
