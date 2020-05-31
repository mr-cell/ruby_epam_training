# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/page_statistics'

# LogStatisticsTest
class LogStatisticsTest < Minitest::Test
  PAGE1 = 'page1'
  IP1 = 'ip1'
  IP2 = 'ip2'

  def test_visits
    page_statistics = PageStatistics.new(PAGE1)
    page_statistics.add_ip_address(IP1)
    page_statistics.add_ip_address(IP2)

    assert_equal 2, page_statistics.visits
  end

  def test_unique_visits
    page_statistics = PageStatistics.new(PAGE1)
    page_statistics.add_ip_address(IP1)
    page_statistics.add_ip_address(IP1)

    assert_equal 1, page_statistics.unique_visits
  end
end
