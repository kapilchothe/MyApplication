# require 'rails_helper'

# describe "employees/show.html.haml" do
#   before(:each) do
#     @employee = assign(:employee, stub_model(Employee,:id=>1,:name => "Test",:designation=>'math'))
#   end
#   it "displays the employee name with designation" do
#   	assign(:employees, [
#       Employee.create!(:name => "slicer", :designation => "math"),
#       Employee.create!(:name => "dicer", :designation => "physics")
#     ])
# binding.pry
#     render 
#     rendered.should contain("slicer")
#     rendered.should contain("dicer")
#   end
  
  # it "displays the  edit link" do
  #   render
  #   rendered.should have_selector('a',:href=>edit_employe_path(@employee.id),:content => 'Edit')
  # end
  
  # it "displays the back link to list the employee" do
  #   render
  #   rendered.should have_selector('a',:content=>'Back',:href=>employees_path)
  # end
  
# end