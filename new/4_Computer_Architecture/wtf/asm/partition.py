#!/usr/bin/python3
import sys

if (len(sys.argv)!=2):
    print('usage: {:s} <filename>'.format(sys.argv[0]));
    sys.exit(0)

fhack=open(sys.argv[1],'r')
p=0
part = open (sys.argv[1].split('.')[0]+hex(p)[-1]+'.hack','w')
i=0 
for line in fhack:
    line=line.strip('\n')
    print(line,file=part)
    i=i+1
    if (i==4):
        part.close()
        i=0
        p=p+1
        part = open (sys.argv[1].split('.')[0]+hex(p)[-1]+'.hack','w')

