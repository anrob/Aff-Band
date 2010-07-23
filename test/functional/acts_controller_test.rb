require 'test_helper'

class ActsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Act.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Act.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Act.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to act_url(assigns(:act))
  end
  
  def test_edit
    get :edit, :id => Act.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Act.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Act.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Act.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Act.first
    assert_redirected_to act_url(assigns(:act))
  end
  
  def test_destroy
    act = Act.first
    delete :destroy, :id => act
    assert_redirected_to acts_url
    assert !Act.exists?(act.id)
  end
end
