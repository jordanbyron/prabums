require 'test_helper'

class WorkOrdersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:work_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work_order" do
    assert_difference('WorkOrder.count') do
      post :create, :work_order => { }
    end

    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should show work_order" do
    get :show, :id => work_orders(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => work_orders(:one).to_param
    assert_response :success
  end

  test "should update work_order" do
    put :update, :id => work_orders(:one).to_param, :work_order => { }
    assert_redirected_to work_order_path(assigns(:work_order))
  end

  test "should destroy work_order" do
    assert_difference('WorkOrder.count', -1) do
      delete :destroy, :id => work_orders(:one).to_param
    end

    assert_redirected_to work_orders_path
  end
end
