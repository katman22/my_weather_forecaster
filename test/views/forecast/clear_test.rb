# frozen_string_literal: true

require "test_helper"
class ClearTest < ActionView::TestCase
  test "Clear is rendered" do
    render partial: "forecast/clear"
    assert_includes rendered, "summary_response"
  end
end
