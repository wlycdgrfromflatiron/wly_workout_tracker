class AccountController < ApplicationController
    get '/login' do
        render_form("Login", "/login")
    end

    post '/login' do
        if (un = params[:username]).empty?
            error_redirect("Please enter a username and try again", "/login")

        elsif (pw = params[:password]).empty?
            error_redirect("Please enter a password and try again", "/login")

        elsif !(user = User.find_by(username: un))
            error_redirect("That username does not exist, please check your spelling and try again", "/login")

        elsif !(user.authenticate(pw))
            error_redirect("Wrong password. Please check your spelling and try again", "/login")

        else
            session[:user_id] = user.id

            redirect to "/user"
        end
    end

    get '/logout' do
        session.delete(:user_id)
        redirect to '/'
    end

    get '/signup' do
        render_form("Sign Up", "/signup")
    end

    post '/signup' do
        if (un = params[:username]).empty?
            error_redirect("Please enter a username and try again", "/signup")
        
        elsif (pw = params[:password]).empty?
            error_redirect("Please enter a password and try again", "/signup")

        elsif User.find_by(username: un)
            error_redirect("That username is taken, please try again with another", "/signup")
        
        else
            user = User.create(username: un, password: pw)

            session[:user_id] = user.id

            redirect to "/user"
        end
    end

    def error_redirect(error_message, redirect_target)
        session[:account_error] = true
        session[:account_error_message] = error_message
        redirect to redirect_target
    end

    def render_form(form_label, form_action)
        if logged_in?
            redirect to "/user"
        else
            err_msg = (session.delete(:account_error)) ?
                session.delete(:account_error_message) :
                ''

            erb :'accounts/signup_or_login', 
                locals: {label: form_label, action: form_action, error_message: err_msg}
        end
    end
end