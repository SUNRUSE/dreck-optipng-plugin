./plugins/other-plugin/generated/example.png:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/example.png $@

./plugins/other-plugin/generated/example-2.png:
	mkdir -p $(dir $@)
	cp ./plugins/other-plugin/example-2.png $@

./plugins/other-plugin/generated/dreck_optipng_output_png_paths.txt:
	mkdir -p $(dir $@)
	echo $(DRECK_OPTIPNG_OUTPUT_PNG_PATHS) > $@
