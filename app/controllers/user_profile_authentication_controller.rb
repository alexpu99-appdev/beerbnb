class UserProfileAuthenticationController < ApplicationController
  # Uncomment this if you want to force user_profiles to sign in before any other actions
  skip_before_action(:force_user_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    if @current_user != nil
      redirect_to("beernme", { :notice => "Welcome back" + @current_user.first_name + "!"})
    else
      render({ :template => "user_authentication/sign_in.html.erb" })
    end
  end

  def create_cookie
    user_profile = UserProfile.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if user_profile != nil
      are_they_legit = user_profile.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/user_profile_sign_in", { :alert => "Incorrect password." })
      else
        session[:user_profile_id] = user_profile.id
      
        redirect_to("/beerme", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/user_profile_sign_in", { :alert => "No user_profile with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "user_authentication/sign_up.html.erb" })
  end

  def create
    @user_profile = UserProfile.new
    @user_profile.email = params.fetch("query_email")
    @user_profile.password = params.fetch("query_password")
    @user_profile.password_confirmation = params.fetch("query_password_confirmation")
    @user_profile.first_name = params.fetch("query_first_name")
    @user_profile.last_name = params.fetch("query_last_name")

    save_status = @user_profile.save

    if save_status == true
      session[:user_profile_id] = @user_profile.id
   
      redirect_to("/beerme", { :notice => "User profile account created successfully."})
    else
      redirect_to("/user_profile_sign_up", { :alert => "User profile account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "user_profile_authentication/edit_profile.html.erb" })
  end

  def update
    @user_profile = @current_user_profile
    @user_profile.email = params.fetch("query_email")
    @user_profile.password = params.fetch("query_password")
    @user_profile.password_confirmation = params.fetch("query_password_confirmation")
    @user_profile.first_name = params.fetch("query_first_name")
    @user_profile.last_name = params.fetch("query_last_name")
    
    if @user_profile.valid?
      @user_profile.save

      redirect_to("/beerme", { :notice => "User profile account updated successfully."})
    else
      render({ :template => "user_profile_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_user_profile.destroy
    reset_session
    
    redirect_to("/", { :notice => "UserProfile account cancelled" })
  end
 
end
