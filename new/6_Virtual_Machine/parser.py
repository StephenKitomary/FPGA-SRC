class Parse():
    def __init__(self,line):
        self.kommentar=''
        self.arg1=''
        self.arg2=''
        self.commandType=0 
        self.kommentar=''
        lin=line.strip()
        if ('//' in line):
            self.kommentar=line[lin.index('//')::].strip('\n')
        lin=lin.split('//')[0]
        lin=lin.strip()
        lin=lin.split(' ')
        if len(lin)==1:
            self.arg1=lin[0].strip()
            if self.arg1=='return':
                self.commandType=Parser.C_RETURN
            elif len(self.arg1)>0:
                self.commandType=Parser.C_ARITHMETIC
        elif len(lin)==2:
            self.arg1=lin[1].strip()
            if lin[0]=='label':
                self.commandType=Parser.C_LABEL
            elif lin[0]=='goto':
                self.commandType=Parser.C_GOTO
            elif lin[0]=='if-goto':
                self.commandType=Parser.C_IF
            else:
                print('Error: {:s}'.format(str(lin)))
        elif len(lin)==3:
            comm=lin[0].strip()
            self.arg1=lin[1].strip()
            arg2=lin[2].strip()
            if arg2.isnumeric():
                self.arg2=int(lin[2].strip())
            if comm=='push':
                self.commandType=Parser.C_PUSH
            elif comm=='pop':
                self.commandType=Parser.C_POP
            elif comm=='function':
                self.commandType=Parser.C_FUNCTION
            elif comm=='call':
                self.commandType=Parser.C_CALL
            else:
                print('Error Parser: {:s}'.format(str(lin)))
        
class Parser():
    C_ARITHMETIC=1
    C_PUSH=2
    C_POP=3
    C_LABEL=4
    C_GOTO=5
    C_IF=6
    C_FUNCTION=7
    C_RETURN=8
    C_CALL=9
    def __init__(self,filename):
        self.fileasm=open(filename,'r')
        self.lines=[]
        self.line=-1
        for line in self.fileasm:
            parse=Parse(line)
            self.lines.append(parse)
        self.fileasm.close()
    def hasMoreCommands(self):
        return (len(self.lines)>self.line+1)
    def advance(self):
        self.line+=1
    def commandType(self):
        return self.lines[self.line].commandType
    def arg1(self):
        return self.lines[self.line].arg1
    def arg2(self):
        return self.lines[self.line].arg2
    def kommentar(self):
        return self.lines[self.line].kommentar
