enable "sessions"

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/login' do
  User.authenticate(username, password)
end

post '/register' do
  username = params[:username]
  pass = params[:password]

  if User.find_by_username(username)
    @error = true
    erb :index
  else
    User.create!(username: username, password: pass)
    this_user = User.find_by_username(username)
    this_user.password = pass
    this_user.save
    erb :dashboard
  end
end
