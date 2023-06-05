class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new
      @post["body"] = params["post"]["body"]
      @post.image.attach(params["post"]["image"])
      @post["user_id"] = @current_user["id"]
      @post.save
    else
      flash["notice"] = "Login first."
    end
    redirect_to "/posts"
  end

end
