class LogOutput
  def call(logs, message)
    $stdout.puts message
    logs.each do |log|
      $stdout.puts "#{log[0]} #{log[1].size} visits"
    end
  end
end
