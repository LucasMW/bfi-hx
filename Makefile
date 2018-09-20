SOURCES = src/Brainfuck.hx src/Main.hx
runcpp:  bin/cpp/bfi
	./bin/cpp/bfi hello.bf
bin/cpp/bfi: $(SOURCES)
	haxe -main Main -cp src -cpp bin/cpp
	mv bin/cpp/Main bin/cpp/bfi
	#upx bin/cpp/bfi
	du -sh bin/cpp/bfi

runphp:  bin/php/bfi.php
	php bin/php/bfi.php hello.bf
bin/php/bfi.php: $(SOURCES)
	haxe -main Main -cp src -php bin/php
	mv bin/php/index.php bin/php/bfi.php
	du -sh bin/php

runcs: bin/cs/bin/bfi.exe
	wine bin/cs/bin/bfi.exe hello.bf
bin/cs/bin/bfi.exe: $(SOURCES)
	haxe -main Main -cp src -cs bin/cs
	mv bin/cs/bin/Main.exe bin/cs/bin/bfi.exe
	du -sh bin/cs/bin/bfi.exe

runneko: bin/bfi.n
	neko bin/bfi.n hello.bf
bin/bfi.n: $(SOURCES)
	haxe -main Main -cp src -neko bin/bfi.n
	du -sh bin/bfi.n

runjava:  bin/java/bfi.jar
	java -jar bin/java/bfi.jar hello.bf
bin/java/bfi.jar: $(SOURCES)
	haxe -main Main -cp src -java bin/java
	mv bin/java/main.jar bin/java/bfi.jar
	du -sh bin/java/bfi.jar

runpython:  bin/bfi.py
	python3 bin/bfi.py hello.bf
bin/bfi.py: $(SOURCES)
	haxe -main Main -cp src -python bin/bfi.py
	du -sh bin/bfi.py


#All targets that are working right now
all: bin/cpp/bfi bin/php/bfi.php bin/cs/bin/bfi.exe bin/bfi.n
	du -sh bin/*


runjs: bin/bfi.js
	#open -a "Google Chrome" bin/index.html
	node bin/bfi.js
bin/bfi.js: $(SOURCES)
	haxe -main Main -cp src -js bin/bfi.js
bin/bfi.hl: $(SOURCES)
	haxe -main Main -cp src -hl bin/bfi.hl
bin/bfi.swf: $(SOURCES)
	haxe -main Main -cp src -swf bin/bfi.swf -swf-version 11.8


clean:
	rm -rf bin/bfi*
	rm -rf bin/*
