# also here:  /Users/jeff/Dropbox/R/GarnasModifiedProjectTemplate-master/reports/make_html.R

library(R2HTML)
title<-"some title"
graph1<-"/Users/jeff/Documents/R/projects2015/pver2015_relook/graphspng_version/ggp.png"

target<-HTMLInitFile(outdir = getwd(), filename=filename, extension="html",
   HTMLframe=FALSE, BackGroundColor = "FFFFFF", BackGroundImg = "",
   Title = title, CSSFile="/Users/jeff/Documents/RWork/mystyle.css", useLaTeX=TRUE, useGrid=TRUE)

HTML("<h1> d    </h1>",file=target)

.html_graph(graphfilepng = graph1, caption = "null defaults to filename")

HTML(summary(m1),file=target)

HTML("<h2>   d </h2>",file=target)


HTML(table(sample(1:4, 100, replace = TRUE)),nsmall=1,file=target)

HTML("<h1>MADE BY:  current filepath </h1>")

HTMLEndFile()
.bu(target)



.html_graph()


.html_graph<-function(graphfilepng, caption=NULL, showfilename=TRUE){
   if (!is.null(caption) & showfilename) caption<-paste(caption, graphfilepng, sep="\n")
   if (is.null(caption) & showfilename) caption<-graphfilepng
   if (!is.null(caption) & !showfilename) caption<-"graph"
   HTMLInsertGraph(GraphFileName=graphfilepng, 
   Caption=.wordwrap( paste("<h1>",caption, "</h1>", sep=""), 150), GraphBorder=0, Align="center", WidthHTML=800, HeightHTML=NULL, append=TRUE)
}


 HTMLInsertGraph(GraphFileName=graph1, 
   Caption=.wordwrap( paste("<h1>","caption", "/<h1>", sep=""), 150), GraphBorder=0, Align="center", WidthHTML=800, HeightHTML=NULL, append=TRUE)

