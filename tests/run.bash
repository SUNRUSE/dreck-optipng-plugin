#!/usr/bin/env bats

@test "first run" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/first-run/expected/. $expected
  cp -r ./plugins/dreck $expected/plugins
  mkdir -p $expected/plugins/optipng
  cp -r . $expected/plugins/optipng
  actual=$temporaryDirectory/actual
  cp -r ./tests/first-run/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./plugins/dreck $actual/plugins
  mkdir -p $actual/plugins/optipng
  cp -r . $actual/plugins/optipng
  cd $actual

  make --file ./plugins/dreck/makefile

  cd $repository
  convert $expected/plugins/other-plugin/example.png $temporaryDirectory/expected.rgba
  convert $actual/plugins/optipng/generated/plugins/other-plugin/generated/example.png $temporaryDirectory/actual.rgba
  cmp $temporaryDirectory/expected.rgba $temporaryDirectory/actual.rgba
  rm -rf $actual/plugins/optipng/generated
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}

@test "only additions" {
  repository=$(pwd)
  temporaryDirectory=$(mktemp -d)
  expected=$temporaryDirectory/expected
  cp -r ./tests/only-additions/expected/. $expected
  cp -r ./plugins/dreck $expected/plugins
  mkdir -p $expected/plugins/optipng
  cp -r . $expected/plugins/optipng
  actual=$temporaryDirectory/actual
  cp -r ./tests/only-additions/input/. $actual
  mkdir -p $actual/plugins/dreck
  cp -r ./plugins/dreck $actual/plugins
  mkdir -p $actual/plugins/optipng
  cp -r . $actual/plugins/optipng
  cd $actual

  make --file ./plugins/dreck/makefile

  cd $repository
  convert $expected/plugins/other-plugin/example.png $temporaryDirectory/expected.rgba
  convert $actual/plugins/optipng/generated/plugins/other-plugin/generated/example.png $temporaryDirectory/actual.rgba
  cmp $temporaryDirectory/expected.rgba $temporaryDirectory/actual.rgba
  convert $expected/plugins/other-plugin/example-2.png $temporaryDirectory/expected-2.rgba
  convert $actual/plugins/optipng/generated/plugins/other-plugin/generated/example-2.png $temporaryDirectory/actual-2.rgba
  cmp $temporaryDirectory/expected-2.rgba $temporaryDirectory/actual-2.rgba
  rm -rf $actual/plugins/optipng/generated
  diff --brief --recursive $actual $expected
  rm -rf $temporaryDirectory
}
