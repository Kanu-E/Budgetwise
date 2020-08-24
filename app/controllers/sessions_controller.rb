class SessionsController < ApplicationController 

    get '/signup' do
        erb :'sessions/signup'
    end

    post '/signup' do
        params["username"].inspect
    end
end
