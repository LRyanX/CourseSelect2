require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "homepage layout links" do
    get root_path
    assert_template 'homes/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", "http://www.ucas.ac.cn/"
    assert_select "a[href=?]", "http://lib.ucas.ac.cn/"
		assert_select "a[href=?]", "http://sep.ucas.ac.cn/"
  end
end
