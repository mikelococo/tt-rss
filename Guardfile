# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# -fs to use the simple formatter, which is succinct
guard :rubocop, :cli => '-fs' do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard "foodcritic", :cookbook_paths => "." do
  watch(%r{attributes/.+\.rb$})
  watch(%r{providers/.+\.rb$})
  watch(%r{recipes/.+\.rb$})
  watch(%r{resources/.+\.rb$})
  watch(%r{test/.+\.rb$})
  watch(%r{spec/.+\.rb$})
end

guard :rspec, cmd: 'bundle exec rspec', :all_on_start => false do
  watch(%r{^spec/(.+)_spec\.rb$})
  watch(%r{^(recipes)/(.+)\.rb$})   { |m| "spec/#{m[1]}_spec.rb" }
  # watch('spec/spec_helper.rb')      { 'spec' }
end

guard 'kitchen' do
  watch(%r{.kitchen.yaml})
  watch(%r{.kitchen.yaml.local})
  watch(%r{test/.+})
  watch(%r{^recipes/(.+)\.rb$})
  watch(%r{^attributes/(.+)\.rb$})
  watch(%r{^files/(.+)})
  watch(%r{^templates/(.+)})
  watch(%r{^providers/(.+)\.rb})
  watch(%r{^resources/(.+)\.rb})
end
