require 'simplecov'
SimpleCov.add_filter '/spec/'
SimpleCov.start

SPEC_ROOT = File.dirname(__FILE__)

$LOAD_PATH.unshift SPEC_ROOT, File.join(SPEC_ROOT, '..', 'lib')

require 'rspec'
require 'fit'

log_file = File.join SPEC_ROOT, 'test.log'
system "rm #{log_file}"
Fit.logger.level = :debug
Fit.logger.clear_appenders
Fit.logger.add_appenders Logging.appenders.file(log_file)

def example_file(filename)
  File.open File.join(SPEC_ROOT, 'support', 'examples', filename)
end
