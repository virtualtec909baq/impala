class MeasuresController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_measure, only: [:show, :edit, :update, :destroy]

  # GET /measures
  # GET /measures.json
  def index
    @measures = Measure.all
    @measure = Measure.new
    @filterrific = Filterrific.new(
      Measure,
      params[:filterrific] || session[:filterrific_measures]
    )
    session[:filterrific_measures] = @filterrific.to_hash
    @measures = @filterrific.find
    @measures = @measures.page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /measures/1
  # GET /measures/1.json
  def show
  end

  # GET /measures/new
  def new
    @measure = Measure.new
  end

  # GET /measures/1/edit
  def edit
  end

  # POST /measures
  # POST /measures.json
  def create
    @measure = Measure.new(measure_params)

    respond_to do |format|
      if @measure.save
        flash[:notice] = 'Se ha actualizado Unidad de medidad'
        format.html { redirect_to @measure, notice: 'Measure was successfully created.' }
        format.json { render :show, status: :created, location: @measure }
        format.js   {}
      else
        format.html { render :new }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  end

  # PATCH/PUT /measures/1
  # PATCH/PUT /measures/1.json
  def update
    respond_to do |format|
      if @measure.update(measure_params)
        flash[:notice] = 'Se ha creado Unidad de medidad'
        format.html { redirect_to @measure }
        format.json { render :show, status: :ok, location: @measure }
      else
        format.html { render :edit }
        format.json { render json: @measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measures/1
  # DELETE /measures/1.json
  def destroy
    @measure.destroy
    respond_to do |format|
      flash[:notice] = 'Se ha eliminado'
      format.html { redirect_to measures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure
      @measure = Measure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_params
      params.require(:measure).permit(:unit)
    end

end
