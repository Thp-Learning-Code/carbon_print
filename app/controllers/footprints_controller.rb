class FootprintsController < ApplicationController
  before_action :set_footprint, only: [:show, :edit, :update, :destroy]

    # GET /footprints
    # GET /footprints.json
    def index
      @footprints = Footprint.all
    end

    # GET /footprints/1
    # GET /footprints/1.json
    def show
        @distance = @footprint.product.distance_to(@footprint).round.to_f * 1.609

        url_city_product = "https://api.airvisual.com/v2/nearest_city?lat=#{@footprint.latitude}&lon=#{@footprint.longitude}&key=BbFES4LurEehNo6PR"
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

    # GET /footprints/new
    def new
      @footprint = Footprint.new
      @product = Product.find(params[:product_id])
    end

    # GET /footprints/1/edit
    def edit
    end

    # POST /footprints
    # POST /footprints.json
    def create
      @footprint = Footprint.new(footprint_params)
      @footprint.user_id = current_user.id
      @footprint.geocode
      @distance = @footprint.product.distance_to(@footprint).round.to_f * 1.609
      @footprint.result = @footprint.product.tx_total + @distance * 1.5
      respond_to do |format|
        if @footprint.save
          format.js
          format.html { redirect_to @footprint, notice: 'Foot print was successfully created.' }
        else
          format.html { render :new }
        end
      end

    end

    # PATCH/PUT /footprints/1
    # PATCH/PUT /footprints/1.json
    def update
      respond_to do |format|
        if @footprint.update(footprint_params)
          format.html { redirect_to @footprint, notice: 'Foot print was successfully updated.' }
          format.json { render :show, status: :ok, location: @footprint }
        else
          format.html { render :edit }
          format.json { render json: @footprint.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /footprints/1
    # DELETE /footprints/1.json


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_footprint
        @footprint = FootPrint.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def footprint_params
        params.require(:footprint).permit(:delivery_address, :zip_code, :town, :country, :latitude, :longitude, :result, :user_id, :product_id)
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
