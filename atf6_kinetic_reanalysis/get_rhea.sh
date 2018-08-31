curl -LOk https://github.com/Lagkouvardos/Rhea/archive/master.zip 
unzip master.zip
rm -f master.zip 
mkdir IMNGS_output
unzip Analysis* -d IMNGS_output
cp IMNGS_output/OTUs-Table.tab Rhea-master/1.Normalization 
cp IMNGS_output/mapping_file.tab IMNGS_output/OTUs-Tree.tre Rhea-master/3.Beta-Diversity 
echo "DONE" 
