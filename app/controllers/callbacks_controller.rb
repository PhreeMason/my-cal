class CallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect current_user.calendar
  end
end
