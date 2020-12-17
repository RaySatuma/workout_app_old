class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(id: :desc).page(params[:page])
      if logged_in?
       @post = current_user.posts.build  # form_with 用
      end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました。'
      redirect_to root_url
    else
      flash[:danger] = 'ユーザー登録が正常にできませんでした。'
      render :new
    end
  end

  private
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_comfirmation)
    end  
end


