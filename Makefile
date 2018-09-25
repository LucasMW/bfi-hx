SOURCES = src/Brainfuck.hx src/Main.hx
runcpp:  bin/cpp/bfi
	./bin/cpp/bfi hello.bf
bin/cpp/bfi: $(SOURCES)
	haxe -main Main -cp src -cpp bin/cpp
	mv bin/cpp/Main bin/cpp/bfi
	#upx bin/cpp/bfi #decrease file size of bfi
	du -sh bin/cpp/bfi
performancecpp: bin/cpp/bfi
	time (echo "100" | ./bin/cpp/bfi  test/examples/prime.bf)

runphp:  bin/php/bfi.php
	php bin/php/bfi.php hello.bf
bin/php/bfi.php: $(SOURCES)
	haxe -main Main -cp src -php bin/php
	mv bin/php/index.php bin/php/bfi.php
	du -sh bin/php
performancephp: bin/php/bfi.php
	time (echo "100" | php bin/php/bfi.php  test/examples/prime.bf)

runcs: bin/cs/bin/bfi.exe
	wine bin/cs/bin/bfi.exe hello.bf
bin/cs/bin/bfi.exe: $(SOURCES)
	haxe -main Main -cp src -cs bin/cs
	mv bin/cs/bin/Main.exe bin/cs/bin/bfi.exe
	du -sh bin/cs/bin/bfi.exe
performancecs: bin/cs/bin/bfi.exe
	time (echo "100" | wine bin/cs/bin/bfi.exe  test/examples/prime.bf)

runneko: bin/bfi.n
	neko bin/bfi.n hello.bf
bin/bfi.n: $(SOURCES)
	haxe -main Main -cp src -neko bin/bfi.n
	#nekotools boot bin/bfi.n #compile bin/bfi.n to binary
	du -sh bin/bfi.n
performanceneko: bin/bfi.n
	time (echo "50" | neko bin/bfi.n  test/examples/prime.bf)

runjava:  bin/java/bfi.jar
	java -jar bin/java/bfi.jar hello.bf
bin/java/bfi.jar: $(SOURCES)
	haxe -main Main -cp src -java bin/java
	mv bin/java/main.jar bin/java/bfi.jar
	du -sh bin/java/bfi.jar
performancejava: bin/java/bfi.jar
	time (echo "100" | java -jar bin/java/bfi.jar  test/examples/prime.bf)

runpython:  bin/bfi.py
	python3 bin/bfi.py hello.bf
bin/bfi.py: $(SOURCES)
	haxe -main Main -cp src -python bin/bfi.py
	du -sh bin/bfi.py
performancepython: bin/bfi.py 
	time (echo "100" | python3 bin/bfi.py  test/examples/prime.bf)


#All targets that are working right now
all: bin/cpp/bfi bin/php/bfi.php bin/cs/bin/bfi.exe bin/bfi.n bin/java/bfi.jar bin/bfi.py
	du -sh bin/*
performanceall: performancecpp performancephp performancecs performancejava performancepython performanceneko


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
