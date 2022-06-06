./plugins/optipng/generated/%.png: ./%.png
	mkdir -p $(dir $@)
	rm -f $@
	optipng -o 7 -out $@ $<
