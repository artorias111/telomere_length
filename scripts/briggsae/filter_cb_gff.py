# filter the QX1410 gff genes within a range
import os
a=open('../data/briggsae/gffs/QX1410.SB.final_merger.v2.1.renamed.csq.genes.gff','r')
#a=open('/Users/shrirambhat/Desktop/sample.gff')

"""for i in a: 
	j=i.split()
	print(j[-1])"""

x=int(input("enter the start of range\n"))
y=int(input("enter the end of range\n"))

for i in a:
	j=i.split()
	if x > int(j[3]) and y < int(j[4]):
		print(j[0]+' '+j[-1])
