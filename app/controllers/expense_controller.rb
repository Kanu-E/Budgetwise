class ExpenseController < ApplicationController 
  
    get '/expenses/new' do
        erb :'expense/new'   
    end

    post '/expenses' do
      @exp =  current_user.expenses.build(params)
      if @exp.save
      redirect '/expenses'
      else
        erb :'expense/new'   
      end
    end

    get '/expenses' do
        if logged_in?
            erb :'expense/index' 
        else  
            redirect '/signin'
        end

    end

    get '/expenses/:id/edit' do
        @expense = Expense.find(params[:id])
        if @expense.user = current_user
        erb :'expense/edit'
        end
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