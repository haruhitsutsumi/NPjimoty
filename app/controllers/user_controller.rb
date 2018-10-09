class UserController < ApplicationController
  before_action:authenticate_user,{only:[:edit,:update]}
  before_action:forbid_login_user,{only:[:new,:create,:login_form,:login]}
  before_action:ensure_correct_user,{only:[:edit,:update]}

  def new
    @user=User.new
  end

  def create
    @user = User.new
    @user.name=params[:name]
    @user.email=params[:email]
    @user.password=params[:password]
    if @user.save
      session[:user_id]= @user.id
      flash[:notice]="ユーザーが登録されました"
      redirect_to("/deals/index")
    else
      render("/user/new")
    end
  end

  def edit
    @user=User.find_by(id: params[:id])
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email],
                      password: params[:password])
      if @user
        session[:user_id]= @user.id
        flash[:notice]="ログインしました"
        redirect_to("/deals/index")
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        @email = params[:email]
        @password = params[:password]
        render("login_form")
      end
  end

  def logout
    session[:user_id] = nil
    flash[:notice]="ログアウトしました"
    redirect_to("/deals/index")
  end
  # ログイン機能が実装できてから使うよ。
  def update
    @user = User.find_by(id: params[:id])
    @user.name=params[:name]
    @user.email=params[:email]
    if @user.save
      flash[:notice]="編集しました"
      redirect_to("/deals/index")
    else
      render("/user/edit")
    end
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/deals/index")
    end
  end
end