class DEA():
    def __init__(self,word):
        self.state=0
        self.commandType=0
        self.symbol=''
        self.comp=''
        self.jump=''
        self.dest=''
        for c in word:
            if (c!=' ' and c!='\t' and c!='\n'):
                self.next(c)
    def next(self,c):
        if (self.state==0):
            if (c=='@'):
                self.commandType=Parser.A_COMMAND
                self.state=1
            elif (c=='/'):
                self.state=2
            elif (c=='('):
                self.commandType=Parser.L_COMMAND
                self.state=3
            else:
                self.commandType=Parser.C_COMMAND
                self.comp+=c
                self.state=4

        elif (self.state==1):
            if (c=='/'):
                self.state=7
            else:
                self.symbol+=c
        elif (self.state==3):
            if (c==')'):
                self.state=7
            else:
                self.symbol+=c
        elif (self.state==4):
            if (c=='='):
                self.dest=self.comp
                self.comp=''
                self.state=5
            elif (c==';'):
                self.state=6
            elif (c=='/'):
                self.state=7
            else:
                self.comp+=c
        elif (self.state==5):
            if (c==';'):
                self.state=6
            elif (c=='/'):
                self.state=7
            else:
                self.comp+=c
        elif (self.state==6):
            if (c=='/'):
                self.state=7
            else:
                self.jump+=c
        elif (self.state==7):
            pass

class Parser():
    A_COMMAND=1
    C_COMMAND=2
    L_COMMAND=3
    def __init__(self,filename):
        self.fileasm=open(filename,'r')
        self.lines=[]
        self.line=-1
        for line in self.fileasm:
            dea=DEA(line)
            self.lines.append(dea)
        self.fileasm.close()
    def hasMoreCommands(self):
        return (len(self.lines)>self.line+1)
    def advance(self):
        self.line+=1
    def commandType(self):
        return self.lines[self.line].commandType
    def symbol(self):
        return self.lines[self.line].symbol
    def dest(self):
        return self.lines[self.line].dest
    def comp(self):
        return self.lines[self.line].comp
    def jump(self):
        return self.lines[self.line].jump
