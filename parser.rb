class Parser
  def initialize(log_file_name = ARGV[0])
    @log_file_name = log_file_name
  end

  def call
    log_file_name
  end

  private

  attr_reader :log_file_name
end

Parser.new.call
