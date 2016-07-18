.PHONY: help
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z0-9\./\_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

images: im.png im-border.png im-trim.png im-sepia.png im-animate.gif im-montage.png cc.large.png im-red.png im-crop.png ## images

im-red.png:
	convert im.png -bordercolor red -border 5x5 im-red.png

im.png:
	wget https://upload.wikimedia.org/wikipedia/commons/0/0d/Imagemagick-logo.png
	mv Imagemagick-logo.png im.png
	convert im.png -background white -alpha remove im.png

im-border.png:
	convert im.png -bordercolor black -border 5x5 im-border.png
	
im-crop.png: ## im-crop.png
	convert im.png -gravity East -crop 50x100%+0+0 im-crop.png

im-trim.png:
	convert im.png -trim im-trim.png
	
im-sepia.png:
	convert im.png -sepia-tone 65% im-sepia.png
	
im-animate.gif: ## animation
	convert -delay 10 -morph 10 im.png im-sepia.png im-animate.gif
	gifsicle --unoptimize im-animate.gif | convert - im-animate-%d.png

im-montage.png:
	montage im.png im-sepia.png -geometry +2+2 -tile 2x im-montage.png

cc.large.png:
	wget http://mirrors.creativecommons.org/presskit/icons/cc.large.png

render: images ## render tex
	xelatex imagemagick_cheetsheet.tex

all: render ## all
	@echo "cheatsheat pdf built"

clean:
	-rm *.snm
	-rm *.nav
	-rm *.log
	-rm *.toc
	-rm *.png
	-rm *.out
	-rm *.aux
	-rm *.gif
	
