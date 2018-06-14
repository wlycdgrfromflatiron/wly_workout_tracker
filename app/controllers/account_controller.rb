class AccountController < ApplicationController
    get '/login' do
        render_form("Login", "/login")
    end

    post '/login' do
    end

    get '/logout' do
    end

    get '/signup' do
        render_form("Sign Up", "/signup")
    end

    post '/signup' do
    end

    def render_form(form_label, form_action)
        if logged_in?
            redirect to "/users/#{session[:user_id]}"
        else
            erb :'accounts/signup_or_login', 
                locals: {label: form_label, action: form_action}
        end
    end
end