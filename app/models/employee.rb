class Employee < ActiveRecord::Base
	belongs_to :department

	validates_presence_of :name, :designation

end
