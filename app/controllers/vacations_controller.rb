require 'pry'
class VacationsController < ApplicationController

  get '/vacations/new' do
    erb :'vacations/new'
  end

  get '/vacations' do

    if !(Helpers.is_logged_in?(session))
      redirect to '/login'
    end

    @vacations = Vacation.all
    
    erb :'vacations/index'
   end
   
  post '/vacations' do 

      if params[:description].blank? || params[:date].blank? || params[:departure].blank? || params[:destination].blank? || params[:budget].blank? || params[:spending].blank?
        erb :'/errors/error'
      else 
        @vacations = Vacation.create(description: params[:description], date: params[:date], departure: params[:departure], destination: params[:destination], budget: params[:budget], spending: params[:spending], user_id: session[:user_id])       
        redirect to '/vacations'
      end

  end  

    get '/vacations/:id' do
 
      if Helpers.is_logged_in?(session) 
        @vacation = Vacation.find_by_id(params[:id])
        erb :'vacations/show'
      else
        redirect to '/login'
      end

    end

    get '/vacations/:id/edit' do 
      # if (session[:user_id]) == vacation.user_id, vacation.id) 
      
        @vacation = Vacation.find_by_id(params[:id])
        
       # if Helpers.is_logged_in?(session) && Vacation.find_by_id(params[:id]).user_id == session[:user_id] - alternate way to write below code
       if Helpers.is_logged_in?(session) && @vacation.user_id == session[:user_id]   
          erb :"/vacations/edit"
        else
          redirect to '/login' 
        end
    end  

    patch '/vacations/:id' do
    
      if Helpers.is_logged_in?(session)
        @vacation = Vacation.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        
        if @vacation.user == @user
          if @vacation.update(description: params[:description], date: params[:date], departure: params[:departure], destination: params[:destination], budget: params[:budget], spending: params[:spending])
            redirect to "/vacations/#{@vacation.id}"
          else
            redirect to "vacations/#{@vacation.id}/edit"
          end
        else
          erb :'/errors/error_delete_edit' 
        end

      else

       erb :'/users/login'
      end
    end
 
    delete '/vacations/:id' do
    
      @vacation = Vacation.find_by_id(params[:id])
      @user = User.find_by_id(session[:user_id])

      if @vacation.user_id == @user.id
        @vacation.delete
        redirect to '/vacations'
      else
        erb :'/errors/error_delete_edit'
      end

    end 

end
