require_relative 'log_reader'

class Parser
  def initialize(log_file_name = ARGV[0], log_reader = LogReader.new)
    @log_file_name = log_file_name
    @log_reader = log_reader
  end

  def call
    validate!
    log_reader.call(log_file_name)
  end

  private

  attr_reader :log_file_name, :log_reader

  def validate!
    raise StandardError unless log_file_name.is_a?(String)
  end
end

Parser.new.call
