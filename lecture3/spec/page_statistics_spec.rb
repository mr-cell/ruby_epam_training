# frozen_string_literal: true

require_relative '../lib/page_statistics'

page1 = 'page1'
ip1 = 'ip1'
ip2 = 'ip2'

RSpec.describe PageStatistics, '#visits' do
  context 'page statistics with visits from the same ip address' do
    it 'should have two visits' do
      page_statistics = PageStatistics.new(page1)
      page_statistics.add_ip_address(ip1)
      page_statistics.add_ip_address(ip1)

      expect(page_statistics.visits).to eq 2
    end
  end

  context 'page statistics with visits from different ip addresses' do
    it 'should have two visits' do
      page_statistics = PageStatistics.new(page1)
      page_statistics.add_ip_address(ip1)
      page_statistics.add_ip_address(ip1)

      expect(page_statistics.visits).to eq 2
    end
  end
end

RSpec.describe PageStatistics, '#unique_visits' do
  context 'page statistics with visits from the same ip address' do
    it 'should have one unique visit' do
      page_statistics = PageStatistics.new(page1)
      page_statistics.add_ip_address(ip1)
      page_statistics.add_ip_address(ip1)

      expect(page_statistics.unique_visits).to eq 1
    end
  end

  context 'page statistics with visits from different ip addresses' do
    it 'should have two unique visits' do
      page_statistics = PageStatistics.new(page1)
      page_statistics.add_ip_address(ip1)
      page_statistics.add_ip_address(ip2)

      expect(page_statistics.visits).to eq 2
    end
  end
end
