
Main:
	ghc --make Main.hs -rtsopts -prof -auto-all -caf-all -O3

test: Main
	cat $(TEST).in | ./Main +RTS -h > /dev/null
	hp2ps -c Main.hp
	rm *.hp *.o *.hi
	convert Main.ps  -quality 100 -rotate 270 -flatten Main.png
	xdg-open Main.png

test-all: Main verify
	ruby test-all.rb

verify:
	g++ verify.cpp -o verify -std=c++0x
