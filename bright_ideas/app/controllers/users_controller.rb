class UsersController < ApplicationController
  def index
  end

  def bright_ideas
    @user = User.find(session[:user_id])
    @bright_ideas = Post.all
  end

  def show
    @user = User.find(session[:user_id])
    @my_posts = @user.posts
    @posts_liked_by_me = @user.posts_liked
    render 'show.html.erb'
  end

  def register

    user = User.create(name: params[:name], alias: params[:alias], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if user.valid?
      session[:user_id] = user[:id]
      redirect_to "/bright_ideas"
    else
      render json: user.errors
    end
  end



  def login
    # render json: params
    puts "Is this actually running"
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user[:id]

      puts session[:user_id]
      redirect_to "/bright_ideas"
    else
      render text:"something was wrong with login credentials"
    end
  end

  def create_bright_ideas
    user = User.find(session[:user_id])
     Post.create(content: params[:idea], user:user)
     redirect_to "/bright_ideas"
  end

  def like
    @user_id=session[:user_id]
    Like.create(post_id:params[:id],user_id:@user_id)
    flash[:success]="new Like created"

    redirect_to "/bright_ideas"
  end

  def unlike
    @user_id=session[:user_id]
    Like.where(post_id:params[:id],user_id:@user_id)[0].destroy
    flash[:success]=["Like changed to an UNLIKE"]
    redirect_to '/bright_ideas'
  end

  def status
    @user = User.find(session[:user_id])
    @bright_idea= Post.find(params[:id])
    @people_who_likes_this_post= @bright_idea.likes
  end

  def logout
    reset_session
    redirect_to('/main')
  end



end
