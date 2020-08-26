class ExpenseController < ApplicationController 
  
    get '/expenses/new' do
        erb :'expense/new'   
    end

    post '/expenses' do
      exp =  Expense.create(params)
      redirect '/expenses'
    end

    get '/expenses' do
        @expenses = Expense.all
        erb :'expense/show'   
    end

end