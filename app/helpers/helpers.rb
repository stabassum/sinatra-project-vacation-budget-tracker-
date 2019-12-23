require 'sinatra/base'
require 'pry'
class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end
 
  def self.is_logged_in?(session) #user with valid user id can be found 
    #current user is the user that is found and then is logged 
    !!session[:user_id]
  end
  
end