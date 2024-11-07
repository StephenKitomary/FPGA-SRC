import sys

class JackTokenizer:
    
    symbols='{}()[].,;+-*/&|<>=~'
    digits='0123456789'
    letters='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_'
    keywords=['class','constructor','function','method','field','static','var','int','char','boolean','void','true','false','null','this','let','do','if','else','while','return']
    
    def __init__(self,filename):
        self.stream=open(filename,'r')
        self.tokenList=[]
        self.token=None
        self.status=0 
        self.line=0

    def error(self,s):
        print('Error Tokenizer: {:s}'.format(s))
        sys.exit(-1)

    def readChar(self,c):
        if c=='\n':
            self.line=self.line+1
        if self.status==0:
            if c=='':
                self.status=10
            elif c=='/':
                self.status=5
            elif c in JackTokenizer.symbols:
                self.tokenList.append(('symbol',c))
                self.status=0
            elif c in JackTokenizer.digits:
                self.token=c
                self.status=2
            elif c in JackTokenizer.letters:
                self.token=c
                self.status=3
            elif c=='"':
                self.token=''
                self.status=4
            elif c in ['\n','\t',' ']:
                pass
            else:
                self.error('symbol {:d}'.format(ord(c)))
        elif self.status==2:
            if c in JackTokenizer.digits:
                self.token+=c
            else:
                if int(self.token)>=0 and int(self.token)<=32767:
                    self.tokenList.append(('integerConstant',self.token))
                    self.status=0
                    self.readChar(c)
                else:
                    self.error('int')
        elif self.status==3:
            if c in JackTokenizer.letters or c in JackTokenizer.digits:
                self.token+=c
            else:
                if self.token in JackTokenizer.keywords:
                    self.tokenList.append(('keyword',self.token))
                else:
                    self.tokenList.append(('identifier',self.token))
                self.status=0
                self.readChar(c)
        elif self.status==4:
            if c=='"':
                self.tokenList.append(('stringConstant',self.token))
                self.status=0
            elif c=='/n':
                self.error('string')
            else:
                self.token+=c
        elif self.status==5:
            if c=='/':
                self.status=6
            elif c=='*':
                self.status=7
            else:
                self.tokenList.append(('symbol','/'))
                self.status=0
                self.readChar(c)
        elif self.status==6:
            if c=='\n':
                self.status=0
        elif self.status==7:
            if c=='*':
                self.status=8
        elif self.status==8:
            if c=='/':
                self.status=0
            elif c=='*':
                self.status=8
            else:
                self.status=7
        else:
            self.error('status {:d}'.format(self.status))
    
    def advance(self,n):
        while self.status!=10 and len(self.tokenList)<n:
            self.readChar(self.stream.read(1))

