require 'test_helper'

class PageDetailTest < ActiveSupport::TestCase

  test "Nokogiri has h1, h2, h3 tags" do
    pd = PageDetail.create(:url => "http://localhost:3000/temp.html") # local nokogiri home page
    assert_equal  2, pd.h1_tags.size
    assert_equal 11, pd.h2_tags.size
    assert_equal 12, pd.h3_tags.size
  end

  test "validate url format" do
    pd = PageDetail.create(:url => nil)
    assert_match /can't be blank/, pd.errors[:url].join
    pd = PageDetail.create(:url => "somestring")
    assert_match /URL must start with http:\/\/ or https:\/\//, pd.errors[:url].join
  end

  test "unreachable url" do
    pd = PageDetail.create(:url => "http://dummysite.unreachable.com")
    assert pd.errors.include?(:url)
    assert_match /Problem with the url/, pd.errors[:url].join
  end
end
