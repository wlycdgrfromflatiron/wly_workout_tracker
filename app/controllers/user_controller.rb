class User < ApplicationController
    get '/users/:id' do
        erb :'/users/show'
    end
end