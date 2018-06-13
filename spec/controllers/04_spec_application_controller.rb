describe ApplicationController do
    context 'GET /' do
        context 'logged in' do
            it 'redirects to Workouts index'
        end

        context 'not logged in' do
            it 'returns status 200 OK'
            it 'includes link to Login form'
            it 'includes link to Signup form'
        end
    end
end