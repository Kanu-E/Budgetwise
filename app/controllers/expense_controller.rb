class ExpenseController < ApplicationController 
  
    get '/expenses/new' do
        if logged_in?
            erb :'expense/new'   
        end
    end

    post '/expenses' do
      @exp =  current_user.expenses.build(params)
        if @exp.save
            redirect '/expenses'
        else
            @error = "There was an error, all fields must be completed"
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
        if logged_in?
            get_expense
        else
            redirect '/signin'
        end
        
        if @expense.user == current_user
            erb :'expense/edit'
        else
            redirect '/expenses'
        end
    end

    patch '/expenses/:id' do
        get_expense
        expense.update(title: params[:title], amount: params[:amount])
        redirect '/expenses'
    end

    delete '/expenses/:id' do
        get_expense
        if expense.user == current_user
        expense.destroy
        redirect '/expenses'
        else
        redirect '/expenses'
        end
    end

    def get_expense
        @expense = Expense.find(params[:id])
    end
    
end