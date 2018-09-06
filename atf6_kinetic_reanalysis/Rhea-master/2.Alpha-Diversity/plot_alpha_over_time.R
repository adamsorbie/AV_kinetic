library(dplyr)
library(ggplot2)

alpha_div <- read.table("alpha-diversity_mod.tab", sep="\t", header = T, row.names = 1)
mapping_file <- read.table("mapping_file.tab", sep="\t", header = T, row.names = 1, comment.char = "")
  
shannon.effective <- alpha_div %>% select(Sample_id, Shannon.effective)
richness <- alpha_div %>% select(Sample_id, Richness)

merged_shan <- merge(shannon.effective, mapping_file, by="row.names", all=T)
merged_rich <- merge(richness, mapping_file, by="row.names", all=T)

shannon_grouped_mean <- aggregate(merged_shan$Shannon.effective, by=list(Age=merged_shan$Age, 
                                                                         Genotype=merged_shan$Genotype, 
                                                                         sex=merged_shan$sex), mean)
rich_grouped_mean <- aggregate(merged_rich$Richness, by=list(Age=merged_rich$Age, 
                                                             Genotype=merged_rich$Genotype, 
                                                             sex=merged_rich$sex), mean)

shannon_plot <- ggplot(data = shannon_grouped_mean, aes(x = Age , y= x, color=Genotype)) +
                geom_point(size=4) +
                geom_line() +
                facet_grid(shannon_grouped_mean$sex~shannon_grouped_mean$Genotype) +
                theme_bw() +
                xlab("Time (weeks)") +
                ylab("Shannon Diversity") +
                ggtitle("Shannon diversity across time")
shannon_plot
