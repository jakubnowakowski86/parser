class LogReader
  def call(file_name)
    File.open(file_name).read.lines.map! { |line| line.gsub!("\n", '')}
  rescue StandardError => e
    $stderr.puts "Something went wrong..."
  end
end
