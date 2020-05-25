# frozen_string_literal: true

# PageStatistic
class PageStatistics
  attr_reader :page
  attr_reader :visits
  attr_reader :unique_visits

  def initialize(page)
    @page = page
    @ip_addresses = []
    @visits = 0
    @unique_visits = 0
  end

  def add_ip_address(ip)
    @unique_visits += 1 unless @ip_addresses.include?(ip)
    @visits += 1
    @ip_addresses << ip
  end
end
