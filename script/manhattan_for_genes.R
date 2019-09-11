library(GenomicRanges)
library(tidyverse)
library(ggbio)

manhattan_for_genes <- function(res_file, top=20, main_title="Gene Based Test", sig.level=2.5e-6, verbose=T){
  res <- read_tsv(res_file, col_names=F, col_types="ccdddidcic")
  res <- res %>% separate(2, c("chr", "pos"), sep=":") %>%
    separate(3, c("pos", "end")) %>% select(1,2,3,4,5,6,7) %>%
    set_names("gene", "chr", "start", "end", "stat", "pval", "maf") %>% filter(!is.na(pval))
  n_row <- nrow(res) 
  
  if(verbose){
    message(sprintf("%d genes passed the maf cutoff and will be used", n_row), appendLF=TRUE)
  }
  
  res$start <- as.integer(res$start)
  res$end <- as.integer(res$end)
  res <- res %>% mutate(end = ifelse(start <= end, end, start+1))
  
  tst <- makeGRangesFromDataFrame(res, keep.extra.columns=T, ignore.strand = T)
  
  suppressMessages(ggp <- ggbio::autoplot(object=tst, aes(y=-log10(pval),color=seqnames, alpha=-log(pval)), 
                         coord="genome", geom='point', space.skip=0.01))
  bp <- ggp@ggplot
  df <- bp$data
  
  ## add vline
  vline.df <- df
  vline.df <- do.call(rbind, by(vline.df, vline.df$seqnames, function(dd){
    data.frame(start=min(dd$start), end=max(dd$end))
  }))
  ## compute gap
  gap <- (vline.df$start[-1] + vline.df$end[-nrow(vline.df)])/2
  bp <- bp + geom_vline(xintercept=gap, alpha=0.5, color='gray70') + theme(panel.grid=element_blank())
  
  ## hilight
  if(!is.null(top)){
    df_highlight <- arrange(df, desc(-log(pval))) %>% slice(1:top)
    top.label.size <- 3
    top.label.col <- "darkblue"
    bp <- bp + ggrepel::geom_text_repel(data=df_highlight, aes(x=midpoint, y=-log10(pval), label=gene), 
                                        size=top.label.size, color=top.label.col, fontface='bold.italic', 
                                        point.padding=unit(0.2,"lines"), segment.color='grey50', 
                                        segment.alpha=0.5, arrow=arrow(length=unit(0.01,'npc')))
    
  }
  ## add hline
  lowest_p <- -log10(df_highlight[1, ]$pval)
  if(!is.null(sig.level)){
    sig.level <-  2.5e-6
    h <- -log10(sig.level)
    if(lowest_p > h){
      bp <- bp + geom_hline(aes(yintercept=h))
    }
  }
  # bp <- bp + theme(axis.title.y=element_text(size=12), 
  #                  axis.text.y=element_text(color="black",size=8), 
  #                  axis.text.x=element_text(angle=45, hjust=1,color="black",size=10), panel.background=element_rect(fill=rgb(0.95,0.95,0.95,1)))
  
  ## caption and title
  if(!is.null(main_title)){
    caption <- paste("Created by rareGWAMA from Beta version")
    bp <- bp + labs(caption=caption) + 
      theme(plot.caption=element_text(hjust=1,face='bold.italic',size=8,colour='#002147'))
    bp <- bp + ggtitle(main_title) + 
      theme(plot.title = element_text(hjust = 0.5), legend.position="none")
  }
  
  ## just assigned, not print
  invisible(bp)
}
