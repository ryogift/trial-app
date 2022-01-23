require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test "should valid" do
    assert @post.valid?
  end

  test "content is required" do
    @post.content = ""
    @post.valid?
    assert_includes @post.errors[:content], I18n.t("errors.messages.blank")
  end

  test "content must be 1000 characters" do
    @post.content = "a" * 1001
    @post.valid?
    assert_includes @post.errors[:content], I18n.t("errors.messages.too_long", count: 1000)
  end
end
