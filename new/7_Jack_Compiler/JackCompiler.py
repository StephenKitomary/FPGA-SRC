#!/usr/bin/python3
import sys
import os
from JackTokenizer import JackTokenizer
from CompilationEngine import CompilationEngine
from SymbolTable import SymbolTable

if (len(sys.argv)!=2):
    print('usage: {:s} <file/dir>'.format(sys.argv[0]));
    sys.exit(0)

filename=sys.argv[1]
files=[]

if os.path.isdir(filename):
    ll=os.listdir(filename)
    for name in ll:
        if len(name)>5 and name[-5:]=='.jack':
            files.append(filename+name)
    if filename[-1]!='/':
        filename=filename+'/'
else:
    if len(filename)>5 and filename[-5:]=='.jack':
        files.append(filename)
    else:
        print('usage: {:s} <filename>.jack'.format(sys.argv[0]));
        sys.exit(0)

for jackfile in files:
    vmfile=jackfile.replace('.jack','.vm')
    c=CompilationEngine(jackfile,vmfile)
    c.CompileClass()
