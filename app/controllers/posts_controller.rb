class PostsController < ApplicationController
  
  # Route defined for this index action
  # the URL being /posts
  def index
    # Fetch all the posts from the Post model
    # Save this to an instance variable.
    @posts = Post.order('id DESC')
  end
  # After this index action executes Rails will
  # load the app/views/posts/index.html.erb
  def show
  	@posts = Post.find(params[:id])
  end #auto load the app/views/posts/show.html.erb

  def new
    @post = Post.new
  end # load the app/views/posts/new.html.erb

  def create # create a new post object with the data the user submitted from the new view form.
    @post = Post.new(params[:post])
    if @post.save
      redirect_to :action => :index
    else
      render :action => :new
    end

  end # Only loads a view on error, otherwise redirects
end
