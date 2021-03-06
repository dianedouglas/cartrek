class CarsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create]

  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.order(sort_column + " " + sort_direction)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        if @person
          @car.people << @person
          format.html { redirect_to @person, notice: "#{@person.name} got a new car!" }
          format.json { render :show, status: :created, location: @person }
        else
          format.html { redirect_to @car, notice: 'Car created!' }
          format.json { render :show, status: :created, location: @car }
        end
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car updated!' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car deleted!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    def set_person
      @person = Person.where(id: params['person']).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:model, :make, :color, :mileage, :is_for_sale)
    end

    def sort_direction
      # set default sort to ascending. 
      # Otherwise set it to the direction param if it is either asc or desc
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_column
      # sort by model by default.
      Car.column_names.include?(params[:sort]) ? params[:sort] : "model"
    end
end
