class LegaciesController < ApplicationController
  before_action :set_legacy, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in?, only: [:edit, :update, :create, :new, :destroy]
  before_action :check_admin, only: [:new, :edit, :update, :create, :destroy]

  # GET /legacies
  # GET /legacies.json
  def index
    @legacies = Legacy.paginate(page: params[:page], per_page: 8)
  end

  # GET /legacies/1
  # GET /legacies/1.json
  def show
    @age = age(Legacy.find(params[:id]).born_on)
  end

  # GET /legacies/new
  def new
    @legacy = current_user.legacies.build
    @legacy.age = age(@legacy.born_on)
  end

  # GET /legacies/1/edit
  def edit
    @legacy = Legacy.find(params[:id])

    unless current_user.id == @legacy.user_id || current_user.super?
      redirect_to @legacy
      flash[:notice] = "Cannot edit Legacies that do not belong to your account."
    end
  end

  # POST /legacies
  # POST /legacies.json
  def create
    @legacy = current_user.legacies.build(legacy_params)

    respond_to do |format|
      if @legacy.save
        format.html { redirect_to @legacy, notice: 'Legacy was successfully created.' }
        format.json { render :show, status: :created, location: @legacy }
      else
        format.html { render :new }
        format.json { render json: @legacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legacies/1
  # PATCH/PUT /legacies/1.json
  def update
    @legacy.age = age(@legacy.born_on)
    respond_to do |format|
      if @legacy.update(legacy_params)
        format.html { redirect_to @legacy, notice: 'Legacy was successfully updated.' }
        format.json { render :show, status: :ok, location: @legacy }
      else
        format.html { render :edit }
        format.json { render json: @legacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legacies/1
  # DELETE /legacies/1.json
  def destroy
    @legacy.destroy
    respond_to do |format|
      format.html { redirect_to legacies_url, notice: 'Legacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legacy
      @legacy = Legacy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legacy_params
      params.require(:legacy).permit(:name, :age, :born_on, :passed_on, :country, :state, :county, :city, :about, :photo)
    end

    #Get age without entering an age, with date of birth and date of death
    def age(dob)
      died = Legacy.find(params[:id]).passed_on
      now = Time.now.utc.to_date
      if died != nil
        died.year - dob.year - ((died.month > dob.month || (died.month == dob.month && died.day >= dob.day)) ? 0 : 1)
      else
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
      end
    end

    def user_logged_in?
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
end
