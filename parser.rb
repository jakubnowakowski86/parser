require_relative 'log_reader'
require_relative 'log_grouper'

class Parser
  def self.build
    new(
      log_reader: LogReader.new,
      log_grouper: LogGrouper.new
    )
  end

  def initialize(log_reader:, log_grouper:)
    @log_reader = log_reader
    @log_grouper = log_grouper
  end

  def call(log_file_name = ARGV[0])
    validate!(log_file_name)
    logs = log_reader.call(log_file_name)
    log_grouper.call(logs)
  end

  private

  attr_reader :log_reader, :log_grouper

  def validate!(log_file_name)
    raise StandardError unless log_file_name.is_a?(String)
  end
end
