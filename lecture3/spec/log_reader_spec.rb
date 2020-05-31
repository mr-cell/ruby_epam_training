# frozen_string_literal: true

require_relative '../lib/log_reader'
require_relative '../lib/log_entry'

RSpec.describe LogReader, '#read' do
  context 'read from log file' do
    it 'should return an array of log entries' do
      expected_log_entries = [LogEntry.new('page1', 'ip1'),
                              LogEntry.new('page2', 'ip2'),
                              LogEntry.new('page3', 'ip3')]
      file_path = File.expand_path(File.dirname(__FILE__) + '/test.log')
      log_reader = LogReader.new(file_path)

      actual_log_entries = log_reader.read

      expect(actual_log_entries).to eq expected_log_entries
    end
  end

  context 'read from nonexistent file' do
    it 'should raise FileNotFoundError' do
      file_path = 'non_existent_path'
      log_reader = LogReader.new(file_path)

      expect { log_reader.read }.to raise_error(FileNotFoundError)
    end
  end
end
