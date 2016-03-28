post '/signup' do
  user = User.new(params[:user]) # we are using mass assignment here instead of individual column/params
  @password = user.password#passes user entered password frm html to a variable to be encrypted by a method
  if user.save #calls for the user.save and then to check whether it manages to save successfully
    #what should happen if the user is save?
    redirect '/' #back to homepage??
  else
    @collected_errors = user.errors.full_messages
    erb :"static/signup" #to post the error messages on the same page so we call the original page again
  end
end

post '/login' do
end

get '/signup' do #to call the signup page
  erb :"static/signup"
end

get '/login' do #to call the login page
  erb :"static/login"
end