class SymbolTable:

    def __init__(self):
        self.symbols={}
        self.n={}
        self.n['static']=0
        self.n['field']=0
        self.startSubroutine()

    def startSubroutine(self):
        self.subroutineSymbols={}
        self.n['arg']=0
        self.n['var']=0

    def Define(self,name,typ,kind):
        if kind in ['static','field']:
            self.symbols[name]=(typ,kind,self.n[kind])
            self.n[kind]=self.n[kind]+1
        if kind in ['var','arg']:
            self.subroutineSymbols[name]=(typ,kind,self.n[kind])
            self.n[kind]=self.n[kind]+1

    def VarCount(self,kind):
        return self.n[kind]

    def KindOf(self,name):
        if name in self.symbols:
            return self.symbols[name][1]
        if name in self.subroutineSymbols:
            return self.subroutineSymbols[name][1]
        return None

    def TypeOf(self,name):
        if name in self.symbols:
            return self.symbols[name][0]
        if name in self.subroutineSymbols:
            return self.subroutineSymbols[name][0]
        return None

    def IndexOf(self,name):
        if name in self.symbols:
            return self.symbols[name][2]
        if name in self.subroutineSymbols:
            return self.subroutineSymbols[name][2]
        return None

