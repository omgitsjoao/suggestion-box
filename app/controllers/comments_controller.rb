class CommentsController < ApplicationController

  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:edit, :create, :update, :destroy, :new]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.where(user_id: session[:id])
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    # ensure the current user is the user of the comment
    @comment.user_id = session[:user_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment not found to remove' }
        format.json { status :not_found }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_by_user
      @comment = Comment.where({user_id: params[:id], suggestion_id: params[:id]})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :suggestion_id)
    end
end
