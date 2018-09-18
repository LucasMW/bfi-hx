runcpp:  bin/cpp/bfi
	./bin/cpp/bfi hello.bf
bin/cpp/bfi: src/Brainfuck.hx src/Main.hx
	haxe -main Main -cp src -lib heaps -lib hldx -cpp bin/cpp
	mv bin/cpp/Main bin/cpp/bfi

runphp:  bin/php/bfi.php
	php bin/php/bfi.php
bin/php/bfi.php:
	haxe -main Main -cp src -lib heaps -lib hldx -php bin/php
	mv bin/php/index.php bin/php/bfi.php

runphp7:  bin/php7/bfi.php
	php bin/php7/bfi.php
bin/php7/bfi.php:
	haxe -main Main -cp src -lib heaps -lib hldx -php7 bin/php7
	mv bin/php7/index.php bin/php7/bfi.php


runjs: bin/bfi.js
	#open -a "Google Chrome" bin/index.html
	node bin/bfi.js
bin/bfi.js: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -lib heaps -js bin/bfi.js
bin/bfi.hl: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -lib heaps -lib hldx -hl bin/bfi.hl
bin/bfi.swf: src/Main.hx src/Brainfuck.hx
	haxe -main Main -cp src -lib heaps -swf bin/bfi.swf -swf-version 11.8


clean:
	rm -rf bin/bfi*
	rm -rf bin/*
