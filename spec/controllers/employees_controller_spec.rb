require 'rails_helper'
require 'spec_helper'

describe EmployeesController do 
 	# login_user   
	
	before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
    @employee = FactoryGirl.create(:employee)
  end

	# it "should get index" do
	# 	get 'index'
	# 	response.should be_success
	# end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it 'should render index page' do
      get :index
      expect(response).to render_template('index')
    end

    it "assigns all employees as @employee" do
    #   admin = FactoryGirl.create(:admin)
    #   get :index
    #   assigns(:admins).should =~ [@current_admin, admin]
      get :index
      assigns(:employees).should =~ [@employee]
    end
  end

 describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end

    it 'should render new page' do
      get :new
      response.should render_template('new')
    end

    it "assigns a new user as @employee" do
      get :new
      assigns(:employee).should be_a_new(Employee)
    end                 
  end
                                                                                                                 
	# it "new action should render new template" do
 #    get :new 
	#   response.should render_template(:new)
	# end

	# it "responds to POST" do
 #    post :create, employee:  {name: @employee.name, designation: @employee.designation}
 #    response.should redirect_to Employee.last
 #  end  

  describe "POST 'create'" do
    it 'should increase Employee count by 1' do
      expect {
        post :create, {employee: FactoryGirl.attributes_for(:employee)}
      }.to change(Employee, :count).by(1)
    end

    it "should redirect to the employees index page " do
      post :create, {employee: FactoryGirl.attributes_for(:employee)}
      expect(response).to redirect_to Employee.last
    end

    it 'should render new template when employee is invalid' do
      post :create, {employee: FactoryGirl.attributes_for(:employee, :name => nil )}
      expect(response).to render_template('new')
    end
  end 
  
  # it "edit action should render edit template" do
  #   get :edit, :id => @employee.id
  #  response.should render_template(:edit)
  # end

  describe "GET 'edit' " do
    before do
      @employee = FactoryGirl.create(:employee)
    end

    it "returns http success" do
      get :edit, {id: @employee.id}
      response.should be_success
    end

    it 'should render edit page' do
      get :edit, {id: @employee.id}
      expect(response).to render_template('edit')
    end

    it "assigns a employee as @employee" do
      get :edit, {id: @employee.id}
      assigns(:employee).should eq(@employee)
    end
  end


  it "destroy action should destroy model and redirect to index action" do
    @employee = FactoryGirl.create(:employee)
    delete :destroy, :id => @employee.id
    response.should redirect_to(employees_url)
  end
   
  # describe "PUT 'update/:id'" do
  #   it "allows an employee to be updated" do
  #     @employee = FactoryGirl.create(:employee)
  #     put :update, :id => @employee.id, :employee => @employee.attributes = { :name => "Sideshow", :designation => "xyz"}
  #     response.should redirect_to(employee_path(@employee.id))
  #    end 
  # end
 
  describe "PUT 'update/:id'" do
    before do
      @employee = FactoryGirl.create(:employee)
    end

    it "allows an employee to be updated" do
      @employee = FactoryGirl.create(:employee)
      put :update, :id => @employee.id, :employee => @employee.attributes = { :name => "Sideshow", :designation => "xyz"}
      response.should redirect_to(employee_path(@employee.id))
    end 
    

    # it 'returns to edit page after failuer' do
    #   put :update,  {employee: {name: 'xyz', designation: 'pqr'}, id: @employee.id}
    #   expect(response).to render_template('edit')
    # end

    it 'should update the employee' do
      put :update, {employee: FactoryGirl.attributes_for(:employee, :name => 'xyz', :designation => 'pqr'), id: @employee.id}
      Employee.find(@employee.id).name.should eq('xyz')
    end
 
    # it 'should not update other admin password' do
    #   old_password = @admin.encrypted_password
    #   put :update, { admin: FactoryGirl.attributes_for(:admin, :password => 'password123', :password_confirmation => 'password123'), id: @admin.id}
    #   Admin.find(@admin.id).encrypted_password.should eq(old_password)
    # end

    # it 'should be able to update only own password' do
    #   old_password = @admin.encrypted_password
    #   put :update, { admin: FactoryGirl.attributes_for(:admin, :password => 'password123', :password_confirmation => 'password123'), id: @current_admin.id}
    #   Admin.find(@current_admin.id).encrypted_password.should_not eq(old_password)
    # end
  end

  


  describe "GET show" do
    before(:each) do
      @employee = Employee.create! :name => "Name", :designation => 'test'
    end

    it "should find the employee by its id" do
      get :show, :id => @employee.id
      assigns[:employee].name.should == "Name"
    end
  end

  describe "DELETE 'delete'" do
    before do
      @employee = FactoryGirl.create(:employee)
    end

    it "returns http success" do
      expect { delete :destroy, {id: @employee.id} }.to change(Employee, :count).by(-1)
    end

    it "should redirect to Employees index page" do
      delete :destroy, id: @employee.id
      expect(response).to redirect_to(employees_path)
    end

    # describe 'should not delete current login admin' do
    #   it 'should redirect to admin index  page' do
    #     delete :destroy, id: @current_admin
    #     expect(response).to redirect_to(admins_path)
    #   end

    #   it 'should not delete current login admin ' do
    #     expect { delete :destroy, {id: @current_admin.id} }.to change(Admin, :count).by(0)
    #   end
    # end

    describe 'DELETE delete failure for invalid id' do
      it 'returns error for no record found' do
        expect {delete :destroy, {id: 0}}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    describe 'DELETE delete failure when object delete fails' do
      before(:each) do
        request.env['HTTP_REFERER'] = employees_path
      end

      # below giving deprecation warning check it

      # it 'redirects to index page when delete fails' do
      #   @employee = FactoryGirl.create(:employee)
      #   Employee.any_instance.should_receive(:destroy).and_return(false)
      #   delete :destroy, id: @employee.id
      #   response.should redirect_to(employees_path)
      # end
    end
  end





end    

