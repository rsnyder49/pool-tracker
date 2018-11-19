class Helper 
  
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end
 
  def self.logged_in?(session)
    !!User.find_by_id(session[:user_id])
  end
 
  def self.show_logout(session)
    if !!User.find_by_id(session[:user_id])
      "  <form action= '/logout' method='get'>
      		<input type='submit' value='Logout' />
      	</form>"
    elsif !User.find_by_id(session[:user_id])
      nil
    end
  end
  
  def self.redirect_if_not_logged_in
    if !self.logged_in?(session)
        redirect "/login?error=You have to be logged in to do that"
    end
  end
  
end 