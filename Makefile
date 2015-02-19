all: slide1.svg index.html

index.html: index.pl
	perl $< > $@

slide1.svg: plack.dot.tt2 gen
	zsh gen $< 1 5 
