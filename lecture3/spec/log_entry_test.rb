# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/log_entry'

# LogEntryTest
class LogEntryTest < Minitest::Test
  PAGE1 = 'page1'
  IP1 = 'ip1'
  def test_log_entry_equals
    log_entry1 = LogEntry.new(PAGE1, IP1)
    log_entry2 = LogEntry.new(PAGE1, IP1)

    assert_equal log_entry1, log_entry2
  end
end
