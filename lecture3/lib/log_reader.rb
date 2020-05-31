# frozen_string_literal: true

require_relative('log_entry')

# LogReader
class LogReader
  def initialize(file_path)
    @file_path = file_path
  end

  def read
    raise FileNotFoundError unless File.file?(@file_path)

    log_file = File.open(@file_path)

    log_file.readlines.collect do |line|
      page, ip = line.split(' ')
      log_entry = LogEntry.new(page, ip)
    end
  end
end

class FileNotFoundError < RuntimeError; end
