# frozen_string_literal: true

require_relative 'page_statistics'

# LogStatistics
class LogStatistics
  def initialize(log_entries)
    load_visit_statistics(log_entries)
  end

  def most_visits(how_many)
    @visit_statistics.values
                     .sort_by(&:visits)
                     .reverse
  end

  def most_unique_visits(how_many)
    @visit_statistics.values
                     .sort_by(&:unique_visits)
                     .reverse
  end

  private

  def load_visit_statistics(log_entries)
    @visit_statistics = {}
    log_entries.each do |entry|
      unless @visit_statistics.key?(entry.page)
        @visit_statistics[entry.page] = PageStatistics.new(entry.page)
      end
      @visit_statistics[entry.page].add_ip_address(entry.ip)
    end
  end
end
