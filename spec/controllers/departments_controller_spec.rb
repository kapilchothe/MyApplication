require 'rails_helper'

describe DepartmentsController do 
	before(:each) do
    # login_user
    user = FactoryGirl.create(:user)
    sign_in user
		@department = FactoryGirl.create(:department)
  end

 #  before(:each) do
	# end

  describe "Get 'index" do
    it "returns http success" do
      get :index
      response.should be_success
    end
 
    it 'should render index page' do
      get :index
      response.should render_template(:index)
    end

    it "assigns departments as @departments" do
      get :index
      assigns(:departments).should =~ [@department]
    end
  end 
	 
	describe "Get 'new'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "should render index page" do
      get :index
      response.should render_template(:index)
    end

    it "assigns a new user as @department" do
      get :new
      assigns(:department).should be_a_new(Department)
    end
  end

	it "responds to POST" do 
		post :create, department: {name: @department.name} 
		response.should redirect_to Department.last
	end
  
  it "edit action should render edit template" do
  	get :edit, :id => @department.id
  	response.should render_template(:edit)
  end

  it 'destroy action should destroy records and redirect to index action' do
  	get :destroy, :id => @department.id
  	response.should redirect_to(departments_url)
  end

  describe "Get show" do
  	before(:each) do
  		@department = Department.create! :name => "xyz"
  	end

  	it "should find department by its id" do
  		get :show, :id => @department.id
  		assigns[:department].name.should == "xyz"
  	end
  end

  describe "PUT update" do
  	it 'update action should change the records' do
  		put :update, :id => @department.id, :department => @department.attributes = { :name => "Sideshow"}
  		response.should redirect_to(department_path(@department.id))
  	end
  end
end 