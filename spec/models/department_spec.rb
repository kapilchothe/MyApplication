require 'rails_helper'
require 'spec_helper'
 
describe Department do 
	context  'associations' do
		it {should have_many(:employees)}
	end
	context 'validations' do
		it {should validate_presence_of (:name)}
	end
	context 'To ensure that a column of database are actually exists' do
		it {should have_db_column(:name).of_type(:string)}
	end
 
end 