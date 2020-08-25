class ExpenseController < ApplicationController 
  
    get '/expense/new' do
        erb :'expense/new'   
    end

    post '/expenses' do
      exp =  Expense.create(params)
    end

end