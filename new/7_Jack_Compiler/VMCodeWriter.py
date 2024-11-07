class VMCodeWriter():
    def __init__(self,name):
        self.fvm=open(name,'w')
    
    def writePush(self,segment,index):
        self.fvm.write('push {:s} {:d}\n'.format(segment,index))
    
    def writePop(self,segment,index):
        self.fvm.write('pop {:s} {:d}\n'.format(segment,index))
    
    def writeArithmetic(self,command):
        self.fvm.write('{:s}\n'.format(command))
    
    def writeLabel(self,label):
        self.fvm.write('label {:s}\n'.format(label))

    def writeGoto(self,label):
        self.fvm.write('goto {:s}\n'.format(label))
    
    def writeIf(self,label):
        self.fvm.write('if-goto {:s}\n'.format(label))
    
    def writeCall(self,label,nArgs):
        self.fvm.write('call {:s} {:d}\n'.format(label,nArgs))
    
    def writeFunction(self,label,nArgs):
        self.fvm.write('function {:s} {:d}\n'.format(label,nArgs))
    
    def writeReturn(self):
        self.fvm.write('return\n')

    def close(self):
        self.fm.close()


