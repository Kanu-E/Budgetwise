class ExpenseController < ApplicationController 
  
    get '/expense/new' do
        erb :'expense/new'   
    end

end