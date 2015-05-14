class OffersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  # GET /Offers
  # GET /Offers.json
  def index
    @offer = Offer.new()
    @product = Product.new()
    @location = Location.new()
    @search = Offer.ransack(params[:q])
    @offers = @search.result.page(params[:page])
    respond_to do |format|
      format.html
      format.js
      format.csv { send_data @offers.to_csv }
      format.xls { send_data @offers.to_csv(col_sep: "\t") }
    end
  end
  
  # GET /Offers/1
  # GET /Offers/1.json
  def show
    @offer_users = OfferUser.where(offer_id: params[:id])
    @offer_user = OfferUser.new()
    if OfferUser.find_by_offer_id_and_user_id(params[:id], current_user)
      @offer_user_find_by_id = OfferUser.find_by_offer_id_and_user_id(params[:id], current_user).status
    else
      @offer_user_find_by_id = false
    end
    
  end

  # GET /Offers/new
  def new
    @offer = Offer.new
  end

  # GET /Offers/1/edit
  def edit
  end

  # POST /Offers
  # POST /Offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        flash[:notice] = 'Se ha creado una oferta'
        format.html { redirect_to @offer}
        format.json { render :show, status: :created, location: @offer }
        format.js   {}
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  end

  
  # POST /Offer_User
  # POST /Offer_User.json
  def create_offer_user
    @offer_user = OfferUser.new(quantity: params[:offer_user][:quantity], price: params[:offer_user][:price], offer_id: params[:offer_user][:offer_id], user_id: params[:offer_user][:user_id])
    respond_to do |format|
      if @offer_user.save
        flash[:notice] = 'Se ha creado una  solicitud de oferta'
        format.html { redirect_to root_path}
        format.js   {}
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
        format.js   {}
      end
    end
  end

  def change_status 
    @offer = Offer.find(params[:id]) 
    val = @offer.status == 1 ? 2 : 1 
    @offer.update_attribute(:status, val)  
    respond_to do |format|
      if @offer.status == 1
        format.html { redirect_to @offer, notice: 'Se ha Activado su oferta' }
      else @offer.status == 2
        format.html { redirect_to @offer, notice: 'Se ha Desactivado su oferta' }
      end
    end    
  end

  def extend
    @offer = Offer.find(params[:id]) 
    @offer.update(params[:date])  
    respond_to do |format|
      format.html { render :show }
    end    
  end


  # PATCH/PUT /Offers/1
  # PATCH/PUT /Offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        flash[:notice] = 'La Oferta ha sido modificada'
        format.html { redirect_to @offer }
        format.json { render :show, status: :ok, location: @offer }
        format.js   { js_redirect_to(offer_path @offer)}
      else
        format.html { render :edit }
        format.js   {}
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Offers/1
  # DELETE /Offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      flash[:notice] = 'Se ha eliminado exitosamente'
      format.html { redirect_to offers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_user_params
      params.require(:offer_user).permit(:destination, :product, :observations,:volumen, :service_start_date, :service_finish_date, :offer_start_date, :offer_finish_date, :liquid_load, :container, :general_load, :load_compensation, :kind, :unit, :price ,:origins)
    end

    def offer_params
      params.require(:offer).permit(:destination, :product, :observations,:volumen, :service_start_date, :service_finish_date, :offer_start_date, :offer_finish_date, :liquid_load, :container, :general_load, :load_compensation, :kind, :unit, :price ,:origins)
    end
  end
