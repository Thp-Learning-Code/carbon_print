class FootPrintsController < ApplicationController
  before_action :set_foot_print, only: [:show, :edit, :update, :destroy]

  # GET /foot_prints
  # GET /foot_prints.json
  def index
    @foot_prints = FootPrint.all
  end

  # GET /foot_prints/1
  # GET /foot_prints/1.json
  def show
      @distance = @foot_print.product.distance_to(@foot_print).round.to_f * 1.609
     
      url_city_product = "https://api.airvisual.com/v2/nearest_city?lat=#{@foot_print.latitude}&lon=#{@foot_print.longitude}&key=BbFES4LurEehNo6PR"
      @response_product = open(url_city_product).read 
      @res_product = JSON.parse(@response_product).with_indifferent_access
    puts  @res_product[:data][:current][:pollution][:mainus]
          @aqius_product    = @res_product[:data][:current][:pollution][:aqius]
          @city_product     = @res_product[:data][:city]
          @country_product  = @res_product[:data][:country]
          @state_product    = @res_product[:data][:state]
      puts "*"*90
      puts "*"*90
  end

  # GET /foot_prints/new
  def new
    @foot_print = FootPrint.new
    @product = Product.find(params[:product_id])
  end

  # GET /foot_prints/1/edit
  def edit
  end

  # POST /foot_prints
  # POST /foot_prints.json
  def create
    @foot_print = FootPrint.new(foot_print_params)
    @foot_print.user_id = current_user.id
    @foot_print.geocode
    @distance = @foot_print.product.distance_to(@foot_print).round.to_f * 1.609
    @foot_print.result = @foot_print.product.tx_total + @distance * 1.5
    respond_to do |format|
      if @foot_print.save
        format.js
        format.html { redirect_to @foot_print, notice: 'Foot print was successfully created.' }
      else
        format.html { render :new }
      end
    end

  end

  # PATCH/PUT /foot_prints/1
  # PATCH/PUT /foot_prints/1.json
  def update
    respond_to do |format|
      if @foot_print.update(foot_print_params)
        format.html { redirect_to @foot_print, notice: 'Foot print was successfully updated.' }
        format.json { render :show, status: :ok, location: @foot_print }
      else
        format.html { render :edit }
        format.json { render json: @foot_print.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foot_prints/1
  # DELETE /foot_prints/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_foot_print
      @foot_print = FootPrint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def foot_print_params
      params.require(:foot_print).permit(:delivery_address, :zip_code, :town, :country, :latitude, :longitude, :result, :user_id, :product_id)
    end
end

def a_voir

  if user_signed_in?
    url_city_user    = "https://api.airvisual.com/v2/nearest_city?lat=#{current_user.latitude}&lon=#{current_user.longitude}&key=BbFES4LurEehNo6PR"
    puts @response = open(url).read 
    puts current_user.latitude
    # puts "*"*90
    # puts @response.to_json
    @res = JSON.parse(@response).with_indifferent_access
      @aqius = @res[:data][:current][:pollution][:aqius]
      @res[:data][:current][:pollution][:mainus]
      @city = @res[:data][:city]
      @country = @res[:data][:country]
      @state = @res[:data][:state]
      puts "*"*90
  end
end