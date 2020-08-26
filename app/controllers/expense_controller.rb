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
        erb :'expense/index'   
    end

    get '/expenses/:id/edit' do
        @expense = Expense.find(params[:id])
        erb :'expense/edit'
    end




end