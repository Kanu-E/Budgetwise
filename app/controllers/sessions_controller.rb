class SessionsController < ApplicationController 

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.create(params)
        session[:user_id] = user.id
        redirect '/user_homepage'
    end

    get '/user_homepage' do
        erb :'sessions/index'
    end

    get '/signin' do
        erb :'sessions/signin'
    end
    
    post '/signin' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/user_homepage'
        else
            erb :'sessions/signin_error'
        end
       
    end

    get "/logout" do
        session.clear
        redirect "/"
    end


end
