class LogSorter
  def call(logs, options)
    direction, sort_by_column = prepare_options(options)
    logs.to_a.sort do |previous_log, next_log|
      left_log, right_log = set_direction(previous_log, next_log, direction)
      left_log[sort_by_column] <=> right_log[sort_by_column]
    end
  end

  private

  def prepare_options(raw_options)
    [
      raw_options.fetch(:direction, :asc),
      raw_options.fetch(:sort_by_column, 0)
    ]
  end

  def set_direction(previous_log, next_logs, direction)
    if direction.eql? :asc
      [previous_log, next_logs]
    else
      [next_logs, previous_log]
    end
  end
end
