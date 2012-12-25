guard("minitest") {
  watch(/^test\/(.*)\/?(.*)_test\.rb/)
  watch(/^lib\/(.*)\.rb/) { |m|
    "test/#{m[1]}_test.rb"
  }
}
