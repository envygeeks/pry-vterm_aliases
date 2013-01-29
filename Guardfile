guard :rspec do
  watch(%r{^spec/(.*)_spec\.rb$})
  watch(%r{^lib/(.*)\.rb}) do |file|
    "spec/#{file[1]}_spec.rb"
  end
end
