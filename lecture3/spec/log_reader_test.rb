# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/log_reader'
require_relative '../lib/log_entry'

# LogReaderTest
class LogReaderTest < Minitest::Test
  def test_read_shold_return_list_of_log_entries
    expected_log_entries = [LogEntry.new('page1', 'ip1'),
                            LogEntry.new('page2', 'ip2'),
                            LogEntry.new('page3', 'ip3')]
    file_path = File.expand_path(File.dirname(__FILE__) + '/test.log')
    log_reader = LogReader.new(file_path)

    actual_log_entries = log_reader.read

    assert_equal expected_log_entries, actual_log_entries
  end

  def test_read_non_existent_file_should_throw_exception
    file_path = 'non_existent_path'
    log_reader = LogReader.new(file_path)

    assert_raises(FileNotFoundError) { log_reader.read }
  end
end
