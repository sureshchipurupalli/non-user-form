class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

  #	raise current_user.inspect
 
    # save list if there is a temp_list in the session
    if session[:list].present?

    	#raise current_user.inspect
     # raise session[:list]["article"].inspect
      # save list
      @list = current_user.articles.create(session[:list]["article"])
 
      # clear session
      session[:list] = nil
 
      #redirect
      flash[:notice] = "Sweet, logged in. Nice list, btw :)"      
      super
 
    else
      #if there is not temp list in the session proceed as normal
      super
    end
 
  end
 
end
