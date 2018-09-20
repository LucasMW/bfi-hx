runcpp:  bin/cpp/bfi
	./bin/cpp/bfi hello.bf
bin/cpp/bfi: src/Brainfuck.hx src/Main.hx
	haxe -main Main -cp src -cpp bin/cpp
	mv bin/cpp/Main bin/cpp/bfi
	du -sh bin/cpp/bfi

runphp:  bin/php/bfi.php
	php bin/php/bfi.php
bin/php/bfi.php:
	haxe -main Main -cp src -php bin/php
	mv bin/php/index.php bin/php/bfi.php
runcs: bin/cs/bfi.cs
	wine bin/cs/bin/bfi.exe hello.bf
bin/cs/bfi.cs:
	haxe -main Main -cp src -cs bin/cs
	mv bin/cs/bin/Main.exe bin/cs/bin/bfi.exe
	du -sh bin/cs/bin/bfi.exe
runphp7:  bin/php7/bfi.php
	php bin/php7/bfi.php
bin/php7/bfi.php:
	haxe -main Main -cp src -php7 bin/php7
	mv bin/php7/index.php bin/php7/bfi.php

runjs: bin/bfi.js
	#open -a "Google Chrome" bin/index.html
	node bin/bfi.js
bin/bfi.js: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -js bin/bfi.js
bin/bfi.hl: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -hl bin/bfi.hl
bin/bfi.swf: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -swf bin/bfi.swf -swf-version 11.8


clean:
	rm -rf bin/bfi*
	rm -rf bin/*
