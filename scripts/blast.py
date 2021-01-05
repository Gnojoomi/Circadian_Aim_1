#!/bin/python
#!/bin/python

file2="/home/gnojoomi/circadian/sup_files/Zea_mays_Microarray.out"
query=[]
chromosome=[]
start=[]
end=[]
with open(file2, "r") as file:
    for line in file:
        first_word=line.split(' ')[0]
        if (first_word=="Query="):
            query.append(line.split(' ')[1])
        if (first_word==">"):
            chromosome.append(line.split(' ')[1])
        if (first_word=="sbjct"):
            start.append(line.split(' ')[1])
            end.append(line.split(' ')[3])
file.close()

print(len(query))
print(len(chromosome))
print(len(start))
print(len(end))

file1="/home/gnojoomi/circadian/sup_files/blast_chr_range.txt"
#fout=open(file1,"w")
#for i in range(len()):
#    name1=name[i]+'\n'
#    sequence1=sequence[i]
#    fout.write(name1)
#    fout.write(sequence1)
#fout.close()

