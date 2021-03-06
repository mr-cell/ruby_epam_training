# frozen_string_literal: true

# LogEntry
class LogEntry
  attr_reader :page
  attr_reader :ip

  def initialize(page, ip)
    @page = page
    @ip = ip
  end

  def ==(other)
    page == other.page && ip == other.ip
  end

  alias eql? ==
end
