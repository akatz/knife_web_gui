require 'test_helper'

class KnifeConfigsControllerTest < ActionController::TestCase
  setup do
    @knife_config = knife_configs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:knife_configs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create knife_config" do
    assert_difference('KnifeConfig.count') do
      post :create, knife_config: { aws_key: @knife_config.aws_key, aws_secret_key: @knife_config.aws_secret_key, knife_rb: @knife_config.knife_rb }
    end

    assert_redirected_to knife_config_path(assigns(:knife_config))
  end

  test "should show knife_config" do
    get :show, id: @knife_config
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @knife_config
    assert_response :success
  end

  test "should update knife_config" do
    patch :update, id: @knife_config, knife_config: { aws_key: @knife_config.aws_key, aws_secret_key: @knife_config.aws_secret_key, knife_rb: @knife_config.knife_rb }
    assert_redirected_to knife_config_path(assigns(:knife_config))
  end

  test "should destroy knife_config" do
    assert_difference('KnifeConfig.count', -1) do
      delete :destroy, id: @knife_config
    end

    assert_redirected_to knife_configs_path
  end
end
