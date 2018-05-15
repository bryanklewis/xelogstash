TARGETDIR=D:\Deploy\xelogstash
#buildTime=$(shell %date%)
#sha1ver=_sha1ver_
# @echo "test"
sha1ver := $(shell git rev-parse HEAD)
test := $(shell date /t)
#buildTime := $(shell @echo %date%)
#j=%date%

all: clean buildEXE copyFiles

buildEXE:
#	@echo $(buildTime)
#	$(info "bang" $(sha1ver))
#	$(info $(test))
# 	go generate 
	go build -o "$(TARGETDIR)\xelogstash.EXE" -a -ldflags "-X main.sha1ver=$(sha1ver)" .\cmd\xelogstash  

buildRace:
#	go generate 
	go build -a -o "$(TARGETDIR)\xelogstash.EXE" -race -ldflags "-X main.sha1ver=$(sha1ver)" .\cmd\xelogstash 

copyFiles:
# 	copy README.html $(TARGETDIR)
#	copy LICENSE.html $(TARGETDIR)

clean:
# 	del /Q embed_static.go
# 	del /Q /S $(TARGETDIR)\config
#	del /q $(TARGETDIR)\xelogstash.exe

race: clean buildRace copyFiles

 



