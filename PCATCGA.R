# Install Packages
library("utils", "ggbiplot", "tidyverse", "tibble")

# Set Working Directory (change each experiment)
setwd("C:\\Users\\Richard\\Documents\\R\\Research 2018\\November 2018")

# Check Working Directory
getwd()

# Import Luminex Data (change each experiment)
TCGA_2014 <- read.csv("TCGA_2014_AC_Immune_Gene_Transcription.csv", stringsAsFactors = FALSE)

# Check Import Structure
str(TCGA_2014)

# Assign First Column as Row Names
rownames(TCGA_2014) <- TCGA_2014$Name
TCGA_2014 %>% remove_rownames() %>% column_to_rownames(var ="Name")

# PCA Group Assigning
## Make sure that there are no blank recurrant columns of values
## Don't include the first column with samples names as character string
TCGA_2014.pca <- prcomp(TCGA_2014[,(-1:-2)], center = T, scale. = T)
summary(TCGA_2014.pca)

# Make A Plot
ggbiplot(TCGA_2014.pca, ellipse = F, obs.scale = 1, var.scale = 1, choices = c(1,2), 
         var.axes = F, labels = rownames(TCGA_2014), labels.size = 1.75) + ggtitle("TCGA MTs PCA")
         
# Export The Plot
ggsave('TCGA MTs PCA.pdf', last_plot())

