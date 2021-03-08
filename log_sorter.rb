class LogSorter
  def call(logs, options)
    prepared_options = prepare_options(options)
    logs.to_a.sort do |previous_log, next_log|
      left_log, right_log = set_direction(previous_log, next_log, options)
      compare(left_log[prepared_options[:sort_by_column]], right_log[prepared_options[:sort_by_column]])
    end
  end

  private

  def prepare_options(raw_options)
    {}.tap do |options|
      options[:direction] = raw_options.fetch(:direction, :asc)
      options[:sort_by_column] = raw_options.fetch(:sort_by_column, 0)
    end
  end

  def set_direction(previous_log, next_logs, options)
    if options[:direction].eql? :asc
      [previous_log, next_logs]
    else
      [next_logs, previous_log]
    end
  end

  def compare(left_log, right_log)
    if left_log.is_a?(Array)
      left_log.size <=> right_log.size
    else
      left_log <=> right_log
    end
  end
end
