\name{flowCutData}
\alias{flowCutData}
\docType{data}
\title{A list containing two GvHD flow frames from flowCore }
\description{
   We are taking two flowFrames from flowCore's GvHD dataset and two flowFrames from FlowRespository, an open source cytometry data repository. The first two flowFrames are GvHD flowFrame objects 's9a06' and 's5a07'.  The third flowFrame is from FlowRespository's FR-FCM-ZZ7E 'Macrophages + oATP.fcs', and the fourth is from FlowRespository's 'FR-FCM-ZZVB Specimen_001_B6 LSK.fcs'.
   We used the estimateLogical transformation on the data. We then processed the data with flowCut in the examples.
}
\usage{data(flowCutData)}

\author{
        Maintainer: Justin Meskas <jmeskas@bccrc.ca>

        Authors: Justin Meskas, Sherrie Wang
}

\examples{
data(flowCutData)
res_flowCut <- flowCut(flowCutData[[1]], Plot="All")
# See plot in working directory/flowCut

# Here is an example with decreasing the MaxValleyHgt parameter.
res_flowCut <- flowCut(flowCutData[[2]], MaxValleyHgt = 0.01, Verbose = TRUE, Plot="All")
res_flowCut$data

# Here is an example with decreasing the MaxPercCut parameter.
res_flowCut <- flowCut(flowCutData[[3]], MaxPercCut = 0.05, Verbose = TRUE)
res_flowCut$data

# Here is an example using AllowFlaggedRerun and UseOnlyWorstChannels
res_flowCut <- flowCut(flowCutData[[4]], AllowFlaggedRerun = TRUE,
                       UseOnlyWorstChannels = TRUE, Plot="All")
res_flowCut$data

# Alternative plotting option 1
res_flowCut <- flowCut(flowCutData[[1]])
library(flowDensity)
plotDens(flowCutData[[1]], c("Time","FL1-H"))
points(flowCutData[[1]]@exprs[res_flowCut$ind, c("Time","FL1-H")], pch=".")

# Alternative plotting option 2
res_flowCut <- flowCut(flowCutData[[1]], Plot="All", PrintToConsole=TRUE)
}

\keyword{datasets, FlowCytData}