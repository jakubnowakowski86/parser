require_relative 'log_reader'
require_relative 'log_grouper'
require_relative 'log_sorter'
require_relative 'log_output'

class LogMain
  def self.build
    new(
      log_reader: LogReader.new,
      log_grouper: LogGrouper.new,
      log_sorter: LogSorter.new,
      log_output: LogOutput.new
    )
  end

  def initialize(log_reader:, log_grouper:, log_sorter:, log_output:)
    @log_reader = log_reader
    @log_grouper = log_grouper
    @log_sorter = log_sorter
    @log_output = log_output
  end

  def call(log_file_name = ARGV[0])
    logs = log_reader.call(log_file_name)

    ### most page views
    grouped_most_page_views = log_grouper.call(logs, group_by_column: 0, uniqueness: false)
    sorted_most_page_views = log_sorter.call(grouped_most_page_views, direction: :asc, sort_by_column: 1)
    log_output.call(sorted_most_page_views, 'list of webpages with most page views ordered from most pages views to less page views e.g.:')

    ### most unique page views
    grouped_most_unique_page_views = log_grouper.call(logs, group_by_column: 0, uniqueness: true)
    sorted_most_unique_page_views = log_sorter.call(grouped_most_unique_page_views, direction: :asc, sort_by_column: 1)
    log_output.call(sorted_most_unique_page_views, 'list of webpages with most unique page views also ordered e.g.:')
  end

  private

  attr_reader :log_reader, :log_grouper, :log_sorter, :log_output
end
