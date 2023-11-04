# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
    before_action :set_user_and_post
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
  
    # GET /users/:user_id/posts/:post_id/comments
    def index
      @comments = @post.comments
    end
  
    # GET /users/:user_id/posts/:post_id/comments/1
    def show
        @comment
    end
  
    # GET /users/:user_id/posts/:post_id/comments/new
    def new
      @comment = @post.comments.build
    end
  
    # GET /users/:user_id/posts/:post_id/comments/1/edit
    def edit
    end
  
    # POST /users/:user_id/posts/:post_id/comments
    def create
      @comment = @post.comments.build(comment_params)
  
      if @comment.save
        redirect_to post_path(@user, @post), notice: 'Comment was successfully created.'
      else
        render :new
      end
    end
  
    # PATCH/PUT /users/:user_id/posts/:post_id/comments/1
    def update
      if @comment.update(comment_params)
        redirect_to user_post_comment_path(@user, @post, @comment), notice: 'Comment was successfully updated.'
      else
        render :edit
      end
    end
  
    # DELETE /users/:user_id/posts/:post_id/comments/1
    def destroy
      @comment.destroy
      redirect_to post_path(@user, @post), notice: 'Comment was successfully destroyed.'
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_user_and_post
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:post_id])
    end
  
    def set_comment
      @comment = @post.comments.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  end
