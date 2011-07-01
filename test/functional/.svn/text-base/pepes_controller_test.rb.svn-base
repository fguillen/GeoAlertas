require File.dirname(__FILE__) + '/../test_helper'

class PepesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pepes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_pepe
    assert_difference('Pepe.count') do
      post :create, :pepe => { }
    end

    assert_redirected_to pepe_path(assigns(:pepe))
  end

  def test_should_show_pepe
    get :show, :id => pepes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => pepes(:one).id
    assert_response :success
  end

  def test_should_update_pepe
    put :update, :id => pepes(:one).id, :pepe => { }
    assert_redirected_to pepe_path(assigns(:pepe))
  end

  def test_should_destroy_pepe
    assert_difference('Pepe.count', -1) do
      delete :destroy, :id => pepes(:one).id
    end

    assert_redirected_to pepes_path
  end
end
