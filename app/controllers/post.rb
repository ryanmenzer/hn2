# GET ))))))))))))))))))))))))))))

get '/post/new' do
  erb :new_post
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @comments = @post.comments.order("updated_at DESC")
  erb :post
end

get '/post/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit_post
end


# POST )))))))))))))))))))))))))))

post '/post/new' do
  post = Post.create(params['post'])
  redirect to "/post/#{post.id}"
end

post '/post/:id/edit' do
  post = Post.find(params[:id])
  post.update(params['post'])
  redirect to "/post/#{post.id}"
end

post '/comment/new' do
  comment = Comment.create(params['comment'])
  redirect to "/post/#{comment.post_id}"
end
