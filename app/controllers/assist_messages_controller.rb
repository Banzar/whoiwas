class AssistMessagesController < ApplicationController
  before_action :set_assist_message, only: [:show, :edit, :update, :destroy]

  # GET /assist_messages
  # GET /assist_messages.json
  def index
    unless current_user.try(:admin?)
      flash[:alert] = "Account unable to access requested loction."
      redirect_to help_path
    end
    @assist_messages = AssistMessage.all
  end

  # GET /assist_messages/1
  # GET /assist_messages/1.json
  def show
    unless current_user.try(:admin?)
      flash[:alert] = "Account unable to access requested loction."
      redirect_to help_path
    end
  end

  # GET /assist_messages/new
  def new
    @assist_message = AssistMessage.new
  end

  # GET /assist_messages/1/edit
  def edit
    unless current_user.try(:admin?)
      flash[:alert] = "Account unable to access requested loction."
      redirect_to help_path
    end
  end

  # POST /assist_messages
  # POST /assist_messages.json
  def create
    @assist_message = AssistMessage.new(assist_message_params)

    respond_to do |format|
      if @assist_message.save
        format.html { redirect_to @assist_message, notice: 'Assist message was successfully created.' }
        format.json { render :show, status: :created, location: @assist_message }
      else
        format.html { render :new }
        format.json { render json: @assist_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assist_messages/1
  # PATCH/PUT /assist_messages/1.json
  def update
    unless current_user.try(:admin?)
      flash[:alert] = "Unable to access requested location."
      redirect_to help_path
    end
    respond_to do |format|
      if @assist_message.update(assist_message_params)
        format.html { redirect_to @assist_message, notice: 'Assist message was successfully updated.' }
        format.json { render :show, status: :ok, location: @assist_message }
      else
        format.html { render :edit }
        format.json { render json: @assist_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assist_messages/1
  # DELETE /assist_messages/1.json
  def destroy
    unless current_user.try(:admin?)
      flash[:alert] = "Account unable to access requested loction."
      redirect_to help_path
    end
    @assist_message.destroy
    respond_to do |format|
      format.html { redirect_to assist_messages_url, notice: 'Assist message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assist_message
      @assist_message = AssistMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assist_message_params
      params.require(:assist_message).permit(:email, :subject, :content, :completed)
    end
end
