./plugins/optipng/generated/%.png: ./%.png
	mkdir -p $(dir $@)
	optipng -o 7 -out $@ $<
