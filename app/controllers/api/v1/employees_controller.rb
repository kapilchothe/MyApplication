class Api::V1::EmployeesController < Api::V1::ApiController
	# skip_before_filter :authenticate_user!
	def get_employee
		binding.pry
		@employees = Employee.all
		render json: 'hi'
	end
end