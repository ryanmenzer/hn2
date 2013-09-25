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

post '/post/:post_id/vote' do

  unless session?
    if request.xhr?
      p "ajhsdlfkjhasldkjfhalskdjfhalskdjfhlaksjdhflaksjdhflaksjdfhalksdjfhlaksjkldfs"
      erb :_index_errors, layout: false
    else
      redirect to "/?error=voteerror"
    end
  else
   vote = Postvote.create(params['vote'])
    if request.xhr?
      post = Post.find(params[:post_id])
      erb :_post_votes, layout: false, locals: { post: post }
    else
      redirect to '/'
    end
  end
    
end

post '/post/:post_id/:comment_id/vote' do
  unless session?
    puts "we are in part one of unless"
    redirect to "/post/#{params[:post_id]}?error=voteerror"
  else
    vote = Commentvote.create(params['vote'])
    if request.xhr?
      comment = Comment.find(params[:comment_id])
      erb :_comment_vote, layout: false, locals: { comment: comment }
    else
      redirect to "/post/#{params[:post_id]}"
    end
  end

end
