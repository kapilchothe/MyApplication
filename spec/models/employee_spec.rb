require 'rails_helper'
require 'spec_helper'

describe Employee do 
	context 'associations' do
		it {should belong_to(:department)}
	end
	context 'validations' do
		it {should validate_presence_of (:name)}
		it {should validate_presence_of (:designation)}
	end 
	context 'To ensure that a column of the database are actually exists' do
		it { should have_db_column(:id).of_type(:integer) }
		# it { should have_db_column(:name).of_type(:string) }
		# it { should have_db_column(:designation).of_type(:string) }
		[:name, :designation].each do |field|
			it {should have_db_column(field).of_type(:string)}
		end
	end 

	context 'Validations' do
    [:name, :designation].each do |field|
      it { should validate_presence_of(field) }
    end

    # [:company_name, :representative_name, :email, :tax_id].each do |field|
    #   it { should ensure_length_of(field).is_at_most(255) }
    # end

    # it { should ensure_length_of(:business_telephone).is_at_most(30) }

    # it { should ensure_length_of(:notes).is_at_most(2000) }
  end

  # model specification 
  # before_validation(on: :create) do
  #   self.set_random_password if self.password.blank?
  # end

  # describe 'instance methods' do
  #   describe 'set_random_password' do
  #     it 'should sets a random password for admin' do
  #       @admin = Admin.new
  #       @admin.set_random_password
  #       @admin.password.should_not be_blank
  #     end
  #   end


  # model specification
  # after_create :notify_person
  
  #   describe 'notify to new admin with password after create' do

  #     it "sends an email" do
  #       expect { FactoryGirl.create(:admin) }.to change { ActionMailer::Base.deliveries.count }.by(1)
  #     end

  #     it 'should send mail to new user' do
  #       admin = FactoryGirl.create(:admin)
  #       NotificationsMailer.deliveries.last.to.should eq([admin.email])
  #     end

  #     it 'should send mail to admin with their password after create new admin.' do
  #       admin = FactoryGirl.create(:admin, :password => 'password123', :set_password => 'password123')
  #       NotificationsMailer.deliveries.last.body.match(/'password123'/).to_s.should eq("'password123'")
  #     end
  #   end
  # end

end 
 