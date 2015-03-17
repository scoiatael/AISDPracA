test:
	ghc --make Main.hs -rtsopts -prof -auto-all -caf-all -O3
	cat 3.in | ./Main +RTS -h > 3T.out
	hp2ps -c Main.hp
	rm *.hp *.o *.hi
	convert Main.ps  -quality 100 -rotate 270 -flatten Main.png
	xdg-open Main.png

verify:
	g++ verify.cpp -o verify -std=c++0x
