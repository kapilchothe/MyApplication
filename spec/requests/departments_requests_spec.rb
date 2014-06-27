require 'spec_helper'

feature 'Department Management' do
	background do 
		login_user
	end

	scenario "rendering new department form" do
		visit new_department_path

		page.should have_field(:department_name)
	end

	# scenario "creating new department and List of Departments" do 
	# 	visit new_department_path

	# 	fill_in 'department_name', with: 'Math'
	# 	click_button 'Save'
	# 	page.should have_content("Department was successfully created.")
	# 	Department.all.each do |dept|
	# 		page.should have_content(dept.name)
	# 	end
	# end

	# scenario 'Edit Department' do
	# 	@department = FactoryGirl.create(:department)
	# 	visit departments_path
	# 	click_link 'Edit'
	# 	page.should have_field(:department_name)
	# 	fill_in 'department_name', with: 'Physics'
	# 	click_button 'Save'
	# 	page.should have_content 'Department was successfully updated.'
	# end

	# scenario 'Delete link must be available for departments' do
 #    @test_department = FactoryGirl.create(:department)
 #    visit departments_path
 #    page.should have_link('Destroy')
 #  end

 #  scenario 'deletes department' do
 #    @test_department = FactoryGirl.create(:department)
 #    visit departments_path
 #    click_link('Destroy')
 #    page.should have_content('Department was successfully destroy')
 #  end
 
end