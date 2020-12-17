class PostsController < ApplicationController

  def create
  
    @post = current_user.posts.build(post_params)
    
    if @post.save
      flash[:success] = 'メッセージを投稿しました。 '
      redirect_to current_user
      
    else
      flash.Now[:danger] = 'メッセージが正常に投稿できませんでした。'
      render 'users/index'
    end
  end
  
  private
    def post_params
      params.require(:post).permit(:content)
    end
end
