#!/usr/bin/python3
import sys
import os
from JackTokenizer import JackTokenizer
from CompilationEngine import CompilationEngine

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

for filename in files:
    tjack=JackTokenizer(filename)
    xml=open(filename.replace('.jack','T.xml'),'w')
    print('<tokens>',file=xml)
    tjack.advance(1)
    while len(tjack.tokenList)>0:
        t=tjack.tokenList.pop(0)
        if t[1]=='<':
            tt='&lt;'
        elif t[1]=='>':
            tt='&gt;'
        elif t[1]=='&':
            tt='&amp;'
        else:
            tt=t[1]
        print('<'+t[0]+'>',tt,'</'+t[0]+'>',file=xml)
        tjack.advance(1)
    print('</tokens>',file=xml)

for filename in files:
    tjack=JackTokenizer(filename)
    xml=filename.replace('.jack','.xml')
    c=CompilationEngine(tjack,xml)
    if not c.CompileClass():
        print('error Compile')

