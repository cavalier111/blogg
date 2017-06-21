require 'test_helper'

class YourScaffoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @your_scaffold = your_scaffolds(:one)
  end

  test "should get index" do
    get your_scaffolds_url
    assert_response :success
  end

  test "should get new" do
    get new_your_scaffold_url
    assert_response :success
  end

  test "should create your_scaffold" do
    assert_difference('YourScaffold.count') do
      post your_scaffolds_url, params: { your_scaffold: { description: @your_scaffold.description, image: @your_scaffold.image, title: @your_scaffold.title } }
    end

    assert_redirected_to your_scaffold_url(YourScaffold.last)
  end

  test "should show your_scaffold" do
    get your_scaffold_url(@your_scaffold)
    assert_response :success
  end

  test "should get edit" do
    get edit_your_scaffold_url(@your_scaffold)
    assert_response :success
  end

  test "should update your_scaffold" do
    patch your_scaffold_url(@your_scaffold), params: { your_scaffold: { description: @your_scaffold.description, image: @your_scaffold.image, title: @your_scaffold.title } }
    assert_redirected_to your_scaffold_url(@your_scaffold)
  end

  test "should destroy your_scaffold" do
    assert_difference('YourScaffold.count', -1) do
      delete your_scaffold_url(@your_scaffold)
    end

    assert_redirected_to your_scaffolds_url
  end
end
