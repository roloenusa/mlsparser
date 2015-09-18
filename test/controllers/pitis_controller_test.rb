require 'test_helper'

class PitisControllerTest < ActionController::TestCase
  setup do
    @piti = pitis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pitis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create piti" do
    assert_difference('Piti.count') do
      post :create, piti: { down: @piti.down, insurance: @piti.insurance, interest: @piti.interest, listing_id: @piti.listing_id, maturity: @piti.maturity, price: @piti.price, price: @piti.price, tax: @piti.tax }
    end

    assert_redirected_to piti_path(assigns(:piti))
  end

  test "should show piti" do
    get :show, id: @piti
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @piti
    assert_response :success
  end

  test "should update piti" do
    patch :update, id: @piti, piti: { down: @piti.down, insurance: @piti.insurance, interest: @piti.interest, listing_id: @piti.listing_id, maturity: @piti.maturity, price: @piti.price, price: @piti.price, tax: @piti.tax }
    assert_redirected_to piti_path(assigns(:piti))
  end

  test "should destroy piti" do
    assert_difference('Piti.count', -1) do
      delete :destroy, id: @piti
    end

    assert_redirected_to pitis_path
  end
end
