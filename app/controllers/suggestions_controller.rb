class SuggestionsController < ApplicationController
  before_action :authorize, only: [:edit, :update, :destroy, :approve, :decline]
  before_action :set_suggestion, only: [:show, :edit, :update, :destroy, :approve, :decline]

  # GET /suggestions
  # GET /suggestions.json
  def index
    @suggestions = Suggestion.order(:updated_at).page params[:page]
  end

  # GET /suggestions/1
  # GET /suggestions/1.json
  def show
    @comment = Comment.new({user_id: session[:user_id], suggestion_id: @suggestion.id})
  end

  # GET /suggestions/new
  def new
    @suggestion = Suggestion.new
  end

  # GET /suggestions/1/edit
  def edit
  end

  # POST /suggestions
  # POST /suggestions.json
  def create
    @suggestion = Suggestion.new(suggestion_params)

    respond_to do |format|
      if @suggestion.save
        format.html { redirect_to @suggestion, notice: 'Thank you for this suggestion!' }
        format.json { render :show, status: :created, location: @suggestion }
      else
        format.html { render :new }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suggestions/1
  # PATCH/PUT /suggestions/1.json
  def update
    respond_to do |format|
      if @suggestion.update(suggestion_params)
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully updated.' }
        format.json { render :show, status: :ok, location: @suggestion }
      else
        format.html { render :edit }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1
  # DELETE /suggestions/1.json
  def destroy
    @suggestion.destroy
    respond_to do |format|
      format.html { redirect_to suggestions_url, notice: 'Suggestion was successfully removed.' }
      format.json { head :no_content }
    end
  end

  # PUT /suggestions/1/approve
  # PUT /suggestions/1/approve.json

  def approve
    respond_to do |format|
      if @suggestion.approve
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully approved.' }
        format.json { head :no_content }
      else
        format.html { render @suggestion, notice: 'Failed to approve.' }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suggestions/1/decline
  # DELETE /suggestions/1/decline.json

  def decline
    respond_to do |format|
      if @suggestion.decline
        format.html { redirect_to @suggestion, notice: 'Suggestion was successfully declined.' }
        format.json { head :no_content }
      else
        format.html { render @suggestion, notice: 'Failed to decline.' }
        format.json { render json: @suggestion.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def suggestion_params
    params.require(:suggestion).permit(:content, :name, :email, :approved)
  end
end
