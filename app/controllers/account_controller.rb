class AccountController < ApplicationController
    get '/login' do
        render_form("Login", "/login", "Don't have an account yet? Sign up <a href='/signup'>here</a>")
    end

    post '/login' do
        assert_param_prenence '/login'

        if !(user = User.find_by(username: un))
            error_redirect("That username does not exist, please check your spelling and try again", "/login")

        elsif !(user.authenticate(pw))
            error_redirect("Wrong password. Please check your spelling and try again", "/login")

        else
            session[:user_id] = user.id

            redirect to "/workouts"
        end
    end

    get '/logout' do
        session.delete(:user_id)
        redirect to '/'
    end

    get '/signup' do
        render_form("Sign Up", "/signup", "Already have an account? Log in <a href='/login'>here</a>")
    end

    post '/signup' do
        assert_param_presence '/signup'

        if User.find_by(username: un)
            error_redirect("That username is taken, please try again with another", "/signup")
        
        else
            user = User.create(username: un, password: pw)

            session[:user_id] = user.id

            redirect to "/workouts"
        end
    end

    def assert_param_presence(redirect_target)
        if (un = params[:username]).empty?
            error_redirect("Please enter a username and try again", redirect_target)
        elsif (pw = params[:password]).empty?
            error_redirect("Please enter a password and try again", redirect_target)
        end
    end

    def error_redirect(error_message, redirect_target)
        session[:account_error] = true
        session[:account_error_message] = error_message
        redirect to redirect_target
    end

    def render_form(form_label, form_action, form_link)
        if logged_in?
            redirect to "/user"
        else
            err_msg = (session.delete(:account_error)) ?
                session.delete(:account_error_message) :
                ''

            erb :'accounts/signup_or_login', 
                locals: {label: form_label, action: form_action, other_form_link: form_link, error_message: err_msg}
        end
    end
end