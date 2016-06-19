class CommentsController < ApplicationController

  before_action :set_comment_by_user, only: [:edit, :update, :destroy]
  before_action :authorize, only: [:edit, :create, :update, :destroy, :new]

  # GET /suggestions/1/comments
  # GET /suggestions/1/comments.json
  def index
    @comments = Comment.where(user_id: session[:user_id])
  end

  # GET /suggestions/1/comments/1
  # GET /suggestions/1/comments/1.json
  def show
    @comment = Comment.where({id: params[:id], suggestion_id: params[:suggestion_id]})
  end

  # GET /suggestions/1/comments/new
  def new
    @comment = Comment.new
  end

  # GET /suggestions/1/comments/1/edit
  def edit
  end

  # POST /suggestions/1/comments
  # POST /suggestions/1/comments.json
  def create
    @comment = Comment.new(comment_params)
    # ensure the current user is the user of the comment
    @comment.user_id = session[:user_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to suggestion_path(@comment.suggestion_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1/comments/1
  # PATCH/PUT /suggestions/1/comments/1.json
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

  # DELETE /suggestions/1/comments/1
  # DELETE /suggestions/1/comments/1.json
  def destroy
    if @comment
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to suggestion_path(params[:suggestion_id]), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to suggestion_path(params[:suggestion_id]), notice: 'Comment not found to remove' }
        format.json { status :not_found }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_by_user
      @comment = Comment.find_by user_id: session[:user_id], suggestion_id: params[:suggestion_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :suggestion_id)
    end
end
