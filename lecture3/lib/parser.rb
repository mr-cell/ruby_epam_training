# frozen_string_literal: true

require_relative 'log_statistics'
require_relative 'log_reader'

# Parser
class Parser
  def initialize(file_path)
    @file_path = File.expand_path(file_path)
  end

  def load
    log_entries = LogReader.new(@file_path).read
    @log_statistics = LogStatistics.new(log_entries)
  end

  def print_most_visits(how_many)
    print("List of webpages with most views\n")
    @log_statistics.most_visits(how_many).each do |page_statistics|
      print("#{page_statistics.page} #{page_statistics.visits}\n")
    end
  end

  def print_most_unique_visits(how_many)
    print("List of webpages with most unique views\n")
    @log_statistics.most_unique_visits(how_many).each do |page_statistics|
      print("#{page_statistics.page} #{page_statistics.unique_visits}\n")
    end
  end

  private

  attr_reader :file_path
end

parser = Parser.new('../public/webserver.log')
parser.load
parser.print_most_visits(6)
print("\n")
parser.print_most_unique_visits(6)
