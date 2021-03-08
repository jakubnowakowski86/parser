class LogGrouper
  def call(logs, options = {})
    prepared_options = prepare_options(options)
    collection = Hash.new { |hash, key| hash[key] = [] }
    logs.each do |log|
      split_log = log.split(' ')
      key = split_log.delete(split_log[prepared_options[:group_by_column]])
      collection[key].concat(split_log) unless prepared_options[:uniqueness] && collection[key].include?(split_log[0])
    end
    collection
  end

  private

  def prepare_options(raw_options)
    {}.tap do |options|
      options[:group_by_column] = raw_options.fetch(:group_by_column, 1)
      options[:uniqueness] = raw_options.fetch(:uniqueness, true)
    end
  end
end
