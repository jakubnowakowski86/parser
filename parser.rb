

class Parser
  def initialize(log_file_name = ARGV[0])
    @log_file_name = log_file_name
  end

  def call
    validate!
    log_file_name
  end

  private

  attr_reader :log_file_name

  def validate!
    raise StandardError unless log_file_name.is_a?(String)
  end
end

Parser.new.call
