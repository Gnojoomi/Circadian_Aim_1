#!/bin/python
#!/bin/python

file1="/home/gnojoomi/circadian/sup_files/Microarray.txt"
file2="/home/gnojoomi/circadian/sup_files/Microarray_final.txt"

fin=open(file1,"r")
lines=fin.readlines()[1:]
name=[]
sequence=[]
for x in lines:
        #print(x.split(' ')[0])
        #print(x.split(' ')[1])
        name.append(x.split(' ')[0])
        sequence.append(x.split(' ')[1])
fin.close()

fout=open(file2,"w")
for i in range(len(name)):
    name1=name[i]+'\n'
    sequence1=sequence[i]
    fout.write(name1)
    fout.write(sequence1)
fout.close()

