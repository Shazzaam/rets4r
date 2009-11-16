namespace :coverage do
  task :default => :all

  desc "Remove files generated by RCov"
  task :clean do
    rm_f 'coverage'
    rm_f 'coverage.data'
  end

  desc "Run code-coverage analysis for tests"
  task :test => :clean do
    files = "test/ts_all.rb"
    rcov = "rcov --sort coverage --aggregate coverage.data --text-summary -Ilib"
    command = "#{rcov} #{files}"
    puts "Command: "+command
    system command
#    system "#{rcov} #{files.join(' ')}"
  end

  desc "Run both tests and features to generate aggregated coverage"
  task :all => [:clean, :test]
end