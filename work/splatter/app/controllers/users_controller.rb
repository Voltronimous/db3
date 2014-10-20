class UsersController < ApplicationController
  before_filter :set_headers

  # GET /users
  # GET /users.json
  def index
    @users = User.all

    #render json: @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    db = UserRepository.new(Riak::Client.new)
    @user = db.find(params[:id])

    #unfiltered output before switch to jbuilder view
    #render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new
    @user.email = params[:email]
    @user.name = params[:name]
    @user.password = params[:password]
    @user.blurb = params[:blurb]

    db = UserRepository.new(Riak::Client.new)

    if db.save(@user)
      render json: @user, status: :created, location: @user
    else
      render json: "error", status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update(user_params(params[:user]))
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    head :no_content
  end
  
  # fetch a users splatts
  # GET /users/splatts/1
  # GET /users/splatts/1.json
  def splatts
    @user = User.find(params[:id])
    
    @splatts = @user.splatts	
    #render json: @user.splatts
  end
    
  # follows methods
  # 
  # show who a given user follows
  # GET /users/show_follows/1
  def show_follows
    @user = User.find(params[:id])
    
    @users = @user.follows
    #render json: @user.follows
  end

  # show who follows a given user
  # GET /users/show_followers/1
  def show_followers
    @user = User.find(params[:id])

    @users = @user.followed_by
    #render json: @user.followed_by
  end

  # add a follower
  def add_follows
    # params[:id] is user who follows
    # params[:follows_id] is user to be followed
   
    # make follower
    @follower = User.find(params[:id])
    # make followed
    @followed = User.find(params[:follows_id])
  
    if @follower.follows << @followed  
      head :no_content
    else
     render json @follower.errors, status: :unprocessable_entity
    end
  end

  # remove a follower
  def delete_follows
    @follower = User.find(params[:id])
    @followed = User.find(params[:follows_id])
  
    if @follower.follows.delete(@followed)
      head :no_content
    else
      render json @follower.errors, status: :unprocessable_entity
    end

  end

  # GET /users/splatts-feed/1
  def splatts_feed
    @feed = Splatt.find_by_sql("SELECT users.name, splatts.created_at, splatts.body FROM users JOIN follows on users.id = follows.followed_id JOIN splatts on follows.followed_id = splatts.user_id WHERE follows.follower_id = #{params[:id]} ORDER BY splatts.created_at DESC")

    #render json: @feed
  end

private
  # whitelist create user parameters
  def user_params(params)
    params.permit(:email, :password, :name, :blurb)
  end

  # set header for access control
  def set_headers 
    headers['Access-Control-Allow-Origin'] = '*';
  end

end
