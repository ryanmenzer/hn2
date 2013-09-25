# GET==================================

get '/' do
  @posts = Post.all.order("updated_at DESC")
  erb :index
end

get '/:username/posts' do
  @user = User.find_by_username(params[:username])
  @posts = @user.posts.order("updated_at DESC")
  erb :user_posts
end

get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect to '/'
end

# POST=================================

post '/login' do
  user = User.find_by_username(params['login']['username'])

  if user
    if user.password == params['login']['password']
      session[:user_id] = user.id
      redirect to '/'
    else
      redirect to '/login?error=loginerror'
    end
  else
    redirect to '/login?error=loginerror'
  end
  redirect to '/'
end

post '/signup' do
  user = User.find_by_username(params['signup']['username'])

  if user
    redirect to '/login?error=signuperror'
  else
    user = User.create(params['signup'])
    session[:user_id] = user.id
    redirect to '/'
  end

end
