

tets_larvae <- .read.csv.dt("./data/tets_larv.csv")
.bu(("./data/tets_larv.csv"))

tets_tree <- .read.csv.dt("./data/tets_tree.csv")
.bu(("./data/tets_tree.csv"))

tets_larvae[, table(tree_id)]

tets_tree[, table(tree_id)]

match(tets_larvae[, unique(tree_id)], tets_tree[, unique(tree_id)])

# tree id's missing from tets_larvae
tets_larvae[, unique(tree_id)][-which(tets_larvae[, unique(tree_id)] %in% tets_tree[, unique(tree_id)])]
# [1] 2017.Gof.26.High.Ungirdled 2017.Gof.27.High.Ungirdled 2017.Gof.28.High.Ungirdled 2017.Gof.33.High.Ungirdled 2017.Gof.34.Low.Ungirdled 
# [6] 2017.Gof.35.Low.Ungirdled  2017.KP.30.High.Girdled    2017.KP.31.Low.Ungirdled   2017.KP.A1.Low.Girdled     2017.KP.A2.Low.Girdled    
# [11] 2018.BP.10.High.Girdled    2018.BP.26.High.Ungirdled  2018.LA.10.High.Ungirdled  2018.LA.13.Control.Girdled 2018.LA.19.High.Girdled   
# [16] 2018.SI.16.High.Ungirdled  2018.SI.21.High.Girdled   



View(tets_larvae)

#just checking and basic details

tets_tree[, .N, year]
# year  N
# 1: 2017 99
# 2: 2018 98

tets_larvae[year==2018, .N, by=list(tree_id, instar)]

tets_larvae <- copy(tets_larvae[instar!=0,])

treesByInstar <- copy(dcast(tets_larvae, tree_id + year ~ instar, length))

treesByInstar$EABTotal <- rowSums(treesByInstar[,-(1:2)])
treesByInstar$EABLate <- rowSums(treesByInstar[,5:8])

treeInstar2018 <- copy(treesByInstar[year==2018,])


treeInstar2018$GirdledYN <- "Y"
treeInstar2018[grep("Ungirdled", tree_id ),]$GirdledYN <- "N"

treeInstar2018[, table(EABTotal)]


x11(8,8)

par(mar=c(6, 6, 1,1))
treeInstar2018[, plot(EABTotal, EABLate, type="n", axes=F, xlab="", ylab="")]


names(treeInstar2018)[3:8] <- paste0("L",names(treeInstar2018)[3:8] )

treeInstar2018[, points(EABTotal, EABLate, col=c(2,4)[as.factor(GirdledYN)], pch=c(4,1)[as.factor(GirdledYN)])] #,
              # cex=L3)]

GisN <- treeInstar2018[GirdledYN=="N", lm(EABLate~EABTotal)]
GisY <- treeInstar2018[GirdledYN=="Y", lm(EABLate~EABTotal)]

abline(GisN, col=2)
abline(GisY, col=4)

box(bty="L")

.axx()
# axis(1)
# axis(2, las=2, cex.axis=1.5)
# mtext(side=1, "EAB Total", line=3, cex=2)
# mtext(side=2, "EAB Late Instar Total", line=3, cex=2)

.mtxx("Total", "Late")

.devpdf("testEAB")



