class SessionsController < ApplicationController 

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        if params[:username].empty? || params[:email].empty?
            @error = "There was an error, all fields must be completed"
            erb :'sessions/signup'
        else
        user = User.create(params)
            if user.valid?
                session[:user_id] = user.id
                redirect '/expenses'
            else 
            binding.pry
                @error = "The username or email already exists"  
                erb :'sessions/signup'
            end
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
            erb :'sessions/signin'
        end
       
    end

    get "/logout" do
        session.clear
        redirect "/"
    end


end
