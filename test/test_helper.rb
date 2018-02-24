require 'minitest/reporters'
require 'minitest'

require_relative '../lib/minitest/xs_and_os_plugin'
module Minitest
  # copied from minitest
  def self.init_plugins(options)
    extensions.each do |name|
      msg = "plugin_#{name}_init"
      send msg, options if respond_to?(msg)
    end
    fix_reporters
  end
  
  def self.fix_reporters
    dr = reporter.reporters.find {|r| r.is_a? Minitest::Reporters::DelegateReporter}
    
    # getting rid of default reporters
    drr = dr.instance_variable_get(:@reporters)
    drr.delete_if {|r| r.is_a?(Minitest::SummaryReporter) || r.is_a?(Minitest::ProgressReporter)}
  end
end
Minitest::Reporters.use!
Minitest::Reporters.use! Minitest::Reporters::TravisReporter.new
