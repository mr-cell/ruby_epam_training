# frozen_string_literal: true

require_relative '../lib/log_statistics'
require_relative '../lib/page_statistics'
require_relative '../lib/log_entry'

RSpec.describe LogStatistics, '#statistics' do
  context 'loading log statistics' do
    PAGE1 = 'page1'
    PAGE2 = 'page2'
    IP1 = 'ip1'
    IP2 = 'ip2'

    it 'should result in array of entries sorted by most visits' do
      page1_statistics = create_expected_page_statistics(PAGE1, [IP1, IP1])
      page2_statistics = create_expected_page_statistics(PAGE2, [IP1])
      expected_page_statistics = [page1_statistics, page2_statistics]
      log_entries = [LogEntry.new(PAGE1, IP1), LogEntry.new(PAGE1, IP1), LogEntry.new(PAGE2, IP1)]
      log_statistics = LogStatistics.new(log_entries)

      actual_page_statistics = log_statistics.most_visits(2)

      expect(actual_page_statistics).to eq expected_page_statistics
    end

    it 'should result in array of entries sorted by most unique visits' do
      page1_statistics = create_expected_page_statistics(PAGE1, [IP1, IP1])
      page2_statistics = create_expected_page_statistics(PAGE2, [IP1, IP2])
      expected_page_statistics = [page2_statistics, page1_statistics]
      log_entries =
        [LogEntry.new(PAGE1, IP1), LogEntry.new(PAGE1, IP1), LogEntry.new(PAGE2, IP1), LogEntry.new(PAGE2, IP2)]
      log_statistics = LogStatistics.new(log_entries)

      actual_page_statistics = log_statistics.most_unique_visits(2)

      expect(actual_page_statistics).to eq expected_page_statistics
    end
  end
end

def create_expected_page_statistics(page, ip_addresses)
  page_statistics = PageStatistics.new(page)
  ip_addresses.each { |ip| page_statistics.add_ip_address(ip) }
  page_statistics
end
