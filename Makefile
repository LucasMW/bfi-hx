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

runcs: bin/cs/bfi.cs
	wine bin/cs/bin/bfi.exe hello.bf
bin/cs/bfi.cs: $(SOURCES)
	haxe -main Main -cp src -cs bin/cs
	mv bin/cs/bin/Main.exe bin/cs/bin/bfi.exe
	du -sh bin/cs/bin/bfi.exe

#All targets that are working right now
all: bin/cpp/bfi bin/php/bfi.php bin/cs/bfi.cs
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
