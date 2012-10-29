all: lib\vimtweak.dll clean

lib\vimtweak.dll: src/vimtweak.c
	cl /LD user32.lib /Felib/ /Fosrc/ $?

cleanall: clean
	del /Q lib\vimtweak.dll

clean: 
	del /Q src\*.obj
	del /Q lib\*.exp
	del /Q lib\*.lib

