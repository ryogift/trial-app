require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test "should valid" do
    assert @post.valid?
  end

  test "title is required" do
    @post.title = ""
    @post.valid?
    assert_includes @post.errors[:title], I18n.t("errors.messages.blank")
  end

  test "title must be 200 characters" do
    @post.title = "a" * 201
    @post.valid?
    assert_includes @post.errors[:title], I18n.t("errors.messages.too_long", count: 200)
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
