enable "sessions"

get '/' do
  # Look in app/views/index.erb
  # redirect to '/example'
  erb :index
end

#NOTES
#what do we need for sessions?
#where?
#for both login and registration?
#what is session used for?
#allow you to access
#rule


post '/login' do
  if User.authenticate(params[:username], params[:password])
    current_user = User.find_by_username(params[:username])
    session[:user_id] = current_user.id
    puts "CHECK SESSION"
    p session
    redirect to '/user'
  else
    @error_login = true
    erb :index
  end
end

post '/register' do
  username = params[:username]
  pass = params[:password]

  if User.find_by_username(username)
    @error_register = true
    erb :index
  else
    User.create!(username: username, password: pass)
    this_user = User.find_by_username(username)
    this_user.password = pass
    this_user.save
    redirect to '/user'
  end
end

get '/user' do
  erb :dashboard
end

