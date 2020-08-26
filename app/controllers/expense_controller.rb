class ExpenseController < ApplicationController 
  
    get '/expenses/new' do
        erb :'expense/new'   
    end

    post '/expenses' do
      exp =  current_user.expenses.build(params)
      exp.save
      redirect '/expenses'
    end

    get '/expenses' do
        if logged_in?
            @expenses = Expense.all
            erb :'expense/index' 
        else  
            redirect '/signin'
        end

    end

    get '/expenses/:id' do
        @expense = Expense.find(params["id"])
        erb :'expense/show'
    end

    get '/expenses/:id/edit' do
        @expense = Expense.find(params[:id])
        erb :'expense/edit'
    end

    patch '/expenses/:id' do
        expense = Expense.find(params[:id])
        expense.update(title: params[:title], amount: params[:amount])
        redirect '/expenses'
    end

    delete '/expenses/:id' do
        expense = Expense.find(params[:id])
        expense.destroy
        redirect '/expenses'
    end

end