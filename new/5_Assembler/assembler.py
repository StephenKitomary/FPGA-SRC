#!/usr/bin/python3
import sys
from parser import Parser
from code import *
from symbolTable import SymbolTable

if (len(sys.argv)!=2):
    print('usage: {:s} <filename>'.format(sys.argv[0]));
    sys.exit(0)

fhack=open(sys.argv[1].replace('.asm','.hack'),'w')
fasm=Parser(sys.argv[1])
t=SymbolTable()
ram=16
i=0

while (fasm.hasMoreCommands()):
    fasm.advance()
    if (fasm.commandType()==Parser.A_COMMAND):
        i+=1
    elif (fasm.commandType()==Parser.C_COMMAND):
        i+=1
    elif (fasm.commandType()==Parser.L_COMMAND):
        if t.contains(fasm.symbol()):
            print('ERR: Symbol {:s} in {:s}, Line {:d}'.format(fasm.symbol(),sys.argv[1],i))
            exit(0)
        else:
            t.addEntry(fasm.symbol(),i)

fasm.line=-1
i=0
print(t)
while (fasm.hasMoreCommands()):
    fasm.advance()
    if (fasm.commandType()==Parser.A_COMMAND):
        if fasm.symbol().isnumeric():
            s=int(fasm.symbol())
        else:
            if not(t.contains(fasm.symbol())):
                t.addEntry(fasm.symbol(),ram)
                ram+=1
            s=t.getAddress(fasm.symbol())
        binary='{0:016b}'.format(s)
        print(binary,file=fhack)
    elif (fasm.commandType()==Parser.C_COMMAND):
        binary='111'+comp(fasm.comp())+dest(fasm.dest())+jump(fasm.jump())
        print(binary,file=fhack)
print('',file=fhack)
fhack.close()
