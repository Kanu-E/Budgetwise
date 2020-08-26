class SessionsController < ApplicationController 

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        if params[:username].empty? || params[:email].empty?
            erb :'sessions/signup_error'
        else
        user = User.create(params)
        session[:user_id] = user.id
        redirect '/expenses'
        end
    end

    get '/signin' do
        erb :'sessions/signin'
    end
    
    post '/signin' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/expenses'
        else
            erb :'sessions/signin_error'
        end
       
    end

    get "/logout" do
        session.clear
        redirect "/"
    end


end
