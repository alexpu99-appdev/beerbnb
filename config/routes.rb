Rails.application.routes.draw do



  # Routes for the Liked trip resource:

  # CREATE
  post("/insert_liked_trip", { :controller => "liked_trips", :action => "create" })
          
  # READ
  get("/liked_trips", { :controller => "liked_trips", :action => "index" })
  
  get("/liked_trips/:path_id", { :controller => "liked_trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_liked_trip/:path_id", { :controller => "liked_trips", :action => "update" })
  
  # DELETE
  get("/delete_liked_trip/:path_id", { :controller => "liked_trips", :action => "destroy" })

  #------------------------------

  # Routes for the User profile account:

  # SIGN UP FORM
  get("/user_profile_sign_up", { :controller => "user_profile_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user_profile", { :controller => "user_profile_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile_profile", { :controller => "user_profile_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user_profile", { :controller => "user_profile_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_profile_account", { :controller => "user_profile_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_profile_sign_in", { :controller => "user_profile_authentication", :action => "sign_in_form" })
   get("/", { :controller => "user_profile_authentication", :action => "sign_in_form" })

  # AUTHENTICATE AND STORE COOKIE
  post("/user_profile_verify_credentials", { :controller => "user_profile_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_profile_sign_out", { :controller => "user_profile_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Trip resource:

  # CREATE
  post("/new_trip", { :controller => "trips", :action => "create" })
          
  # READ
  
  get("/beerme", { :controller => "trips", :action => "index" })
  
  get("/trips/:path_id", { :controller => "trips", :action => "show" })
  
  # UPDATE
  
  post("/modify_trip/:path_id", { :controller => "trips", :action => "update" })
  
  # DELETE
  get("/delete_trip/:path_id", { :controller => "trips", :action => "destroy" })

  #------------------------------

  # Routes for the Bar resource:

  # CREATE
  post("/insert_bar", { :controller => "bars", :action => "create" })
          
  # READ
  get("/bars", { :controller => "bars", :action => "index" })
  
  get("/bars/:path_id", { :controller => "bars", :action => "show" })
  
  # UPDATE
  
  post("/modify_bar/:path_id", { :controller => "bars", :action => "update" })
  
  # DELETE
  get("/delete_bar/:path_id", { :controller => "bars", :action => "destroy" })

  #------------------------------

  # Routes for the Airbnb resource:

  # CREATE
  post("/insert_airbnb", { :controller => "airbnbs", :action => "create" })
          
  # READ
  get("/airbnbs", { :controller => "airbnbs", :action => "index" })
  
  get("/airbnbs/:path_id", { :controller => "airbnbs", :action => "show" })
  
  # UPDATE
  
  post("/modify_airbnb/:path_id", { :controller => "airbnbs", :action => "update" })
  
  # DELETE
  get("/delete_airbnb/:path_id", { :controller => "airbnbs", :action => "destroy" })

  #------------------------------

end
