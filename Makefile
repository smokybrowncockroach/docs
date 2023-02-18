GEEKDOC_VERSION ?= v0.37.1
THEME ?= hugo-geekdoc
THEMEDIR ?= themes

.PHONY: build clean serve

build: themes/hugo-geekdoc
themes/hugo-geekdoc:
	mkdir -p $(THEMEDIR)
	curl -L -o $(THEMEDIR)/hugo-geekdoc.tar.gz https://github.com/thegeeklab/hugo-geekdoc/releases/download/$(GEEKDOC_VERSION)/hugo-geekdoc.tar.gz
	curl -L -o $(THEMEDIR)/sha256sum.txt https://github.com/thegeeklab/hugo-geekdoc/releases/download/$(GEEKDOC_VERSION)/sha256sum.txt
	cd $(THEMEDIR) && sha256sum -c sha256sum.txt
	mkdir -p $(THEMEDIR)/$(THEME)
	tar -xzf $(THEMEDIR)/hugo-geekdoc.tar.gz -C $(THEMEDIR)/$(THEME)/ --strip-components=1
	rm $(THEMEDIR)/hugo-geekdoc.tar.gz
	rm $(THEMEDIR)/sha256sum.txt

clean:
	rm -rf $(THEMEDIR)/$(THEME)
serve: themes/hugo-geekdoc
	hugo server --buildDrafts
