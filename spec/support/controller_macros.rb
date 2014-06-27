module ControllerMacros
  # module LoginController
    # def login_user
    #     @request.env["devise.mapping"] = Devise.mappings[:user]
    #     user = FactoryGirl.create(:user)
    #     #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    #     sign_in user
    # end
  # end

  module LoginRequest
    def login_user
      @user = FactoryGirl.create(:user)
      @current_user = @user
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: 'changeme'
      click_button 'Sign in'
    end
  end
end


