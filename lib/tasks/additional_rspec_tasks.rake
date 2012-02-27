namespace :spec do
  (Rails.root+'spec').children.select {|f| f.directory?}.each do |spec_folders|
    spec_type = spec_folders.expand_path.basename.to_s
    desc "Run the #{spec_type} specs in spec/#{spec_type}"
    RSpec::Core::RakeTask.new(spec_type.to_sym => 'db:test:prepare') do |t|
      t.pattern = "spec/#{spec_type}/**/*_spec.rb"
    end
  end
end