require "test_helper"

class Api::V1::TiendasControllerTest < ActionDispatch::IntegrationTest
  test "should get getTiendas" do
    get api_v1_tiendas_getTiendas_url
    assert_response :success
  end

  test "should get addTienda" do
    get api_v1_tiendas_addTienda_url
    assert_response :success
  end

  test "should get showTienda" do
    get api_v1_tiendas_showTienda_url
    assert_response :success
  end

  test "should get updateTienda" do
    get api_v1_tiendas_updateTienda_url
    assert_response :success
  end

  test "should get deleteTienda" do
    get api_v1_tiendas_deleteTienda_url
    assert_response :success
  end
end
