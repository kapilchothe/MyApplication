require 'rails_helper'

feature 'Employee Management' do 
	background do
		login_user	
	end

	scenario 'Rendering new Employee form' do
		visit new_employee_path

		page.should have_field(:employee_name)
		page.should have_field(:employee_designation)
	end

	scenario 'It gives error for invalid data' do
    visit new_employee_path
    click_button('Save')
    page.should have_content("Name can't be blank")
    page.should have_content("Designation can't be blank")
  end

  scenario 'Create employee and list all employees' do
    visit new_employee_path
    fill_in 'employee_name', with: 'Test EMP'
    fill_in 'employee_designation', with: 'Designation emp'
    click_button 'Save'
    page.should have_content('Employee was successfully created.')
    Employee.all.each do |emp|
      page.should have_content(emp.name)
      page.should have_content(emp.designation)
    end
  end

  scenario 'Edit Employee' do
  	@test_employee = FactoryGirl.create(:employee)
    visit employees_path
    click_link "Edit"
    page.should have_field(:employee_name)
    page.should have_field(:employee_designation)
    fill_in 'employee_name', with: 'Edited Employee'
    click_button 'Save'
    page.should have_content('Employee was successfully updated.')
    page.should have_content('Edited Employee')
  end

  scenario 'Delete link must be available for employees' do
    @test_employee = FactoryGirl.create(:employee)
    visit employees_path
    page.should have_link('Destroy')
  end

  scenario 'deletes employee' do
    @test_employee = FactoryGirl.create(:employee)
    visit employees_path
    click_link('Destroy')
    page.should have_content('Employee was successfully destroyed.')
  end

  
end 