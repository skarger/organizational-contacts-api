# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec, verion: 2, cmd: 'bundle exec rspec' do 
  watch(%r{^spec/.+_spec\.rb$})
  watch('company_contacts_api.rb') { "spec" }
  watch('content_preparer.rb') { "spec" }
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb') { "spec" }
end
