class PeopleController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_car, only: [:new, :create]

  # GET /people
  # GET /people.json
  def index
    @people = Person.order(sort_column + " " + sort_direction)
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        if @car
          @person.cars << @car
          format.html { redirect_to @car, notice: 'Owner was successfully created.' }
          format.json { render :show, status: :created, location: @car }
        else
          format.html { redirect_to @person, notice: 'Person was successfully created.' }
          format.json { render :show, status: :created, location: @person }
        end
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    def set_car
      @car = Car.where(id: params['car']).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :email, :phone_number)
    end

    def sort_direction
      # set default sort to ascending. 
      # Otherwise set it to the direction param if it is either asc or desc
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_column
      # sort by name by default.
      Person.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
end
