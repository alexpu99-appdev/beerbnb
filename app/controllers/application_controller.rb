class ApplicationController < ActionController::Base
  before_action(:load_current_user_profile)
  
  # Uncomment this if you want to force user_profiles to sign in before any other actions
  before_action(:force_user_profile_sign_in)
  
  def load_current_user_profile
    the_id = session[:user_profile_id]
    @current_user_profile = UserProfile.where({ :id => the_id }).first
  end
  
  def force_user_profile_sign_in
    if @current_user_profile == nil
      redirect_to("/user_profile_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
