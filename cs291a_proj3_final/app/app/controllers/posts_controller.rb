# app/controllers/posts_controller.rb
class PostsController < ApplicationController
    before_action :set_user
    before_action :set_post, only: [:show, :edit, :update, :destroy]
  
    # GET /users/:user_id/posts
    def index
      @posts = @user.posts
    end
  
    # GET /users/:user_id/posts/1
    def show
        @post
    end
  
    # GET /users/:user_id/posts/new
    def new
      @post = @user.posts.build
    end
  
    # GET /users/:user_id/posts/1/edit
    def edit
    end
  
    # POST /users/:user_id/posts
    def create
      @post = @user.posts.build(post_params)
  
      if @post.save
        redirect_to user_path(@user), notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /users/:user_id/posts/1
    def update
      if @post.update(post_params)
        redirect_to post_path(@user, @post), notice: 'Post was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /users/:user_id/posts/1
    def destroy
      @post.destroy
      redirect_to user_path(@user), notice: 'Post was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_post
      @post = @user.posts.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
  

=begin
class PostsController < ApplicationController
    #before_action :get_user
    def index
        #@user = User.find(params[:id])
        @posts = Post.all
    end
    
    def show
        @user = User.find(params[:id])
        @post = @user.posts.find()
    end
      
    def new
        @user = User.find(params[:user_id])
        @post = @user.posts
    end

    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        
        if @user.save
            redirect_to user_path(@user)
          else
            render :new, status: :unprocessable_entity
          end
    end
    
    def edit
        #@post = Post.find(params[:id])
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        post = @user.posts.find(params[:id])

        if @post.update(post_params)
          redirect_to @post
        else
          render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @post = @user.posts.find(params[:id])
        @post.destroy
        
        redirect_to user_path(user), status: :see_other
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body)
        end

        #def get_user
        #    @puserost = User.find(params[:id])
        #end
end
=end