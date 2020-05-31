# frozen_string_literal: true

require_relative '../lib/log_entry'

RSpec.describe LogEntry, '#eql' do
  page1 = 'page1'
  page2 = 'page2'
  ip1 = 'ip1'
  ip2 = 'ip2'

  context 'comparing two log entries' do
    it 'should be equal if pages and ip addresses are equal' do
      log_entry1 = LogEntry.new(page1, ip1)
      log_entry2 = LogEntry.new(page1, ip1)

      expect(log_entry1).to eq log_entry2
    end

    it 'should not be equal if pages are not equal' do
      log_entry1 = LogEntry.new(page1, ip1)
      log_entry2 = LogEntry.new(page2, ip1)

      expect(log_entry1).not_to eq log_entry2
    end

    it 'should not be equal if ip addresses are not equal' do
      log_entry1 = LogEntry.new(page1, ip1)
      log_entry2 = LogEntry.new(page1, ip2)

      expect(log_entry1).not_to eq log_entry2
    end
  end
end
