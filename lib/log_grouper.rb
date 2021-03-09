class LogGrouper
  def call(logs, options = {})
    group_by_column, uniqueness = prepare_options(options)
    collection = Hash.new { |hash, key| hash[key] = [] }
    logs.each do |log|
      split_log = log.split(' ')
      key = split_log.delete(split_log[group_by_column])
      collection[key].concat(split_log) unless uniqueness && collection[key].include?(split_log[0])
    end
    collection
  end

  private

  def prepare_options(raw_options)
    [
      raw_options.fetch(:group_by_column, 1),
      raw_options.fetch(:uniqueness, true)
    ]
  end
end
