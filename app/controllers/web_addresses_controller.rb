class WebAddressesController < ApplicationController
  before_action :set_web_address, only: [:show, :edit, :update, :destroy]

  # GET /web_addresses
  # GET /web_addresses.json
  def index
    @web_addresses = WebAddress.all
  end

  # GET /web_addresses/1
  # GET /web_addresses/1.json
  def show
  end

  # GET /web_addresses/new
  def new
    @web_address = WebAddress.new
  end

  # GET /web_addresses/1/edit
  def edit
  end

  # POST /web_addresses
  # POST /web_addresses.json
  def create
    @web_address = WebAddress.new(web_address_params)
    # Take the full address and shorten it
    @web_address.short_address = get_shortened_url

    respond_to do |format|
      if @web_address.save
        format.html { redirect_to @web_address, notice: 'Web address was successfully created.' }
        format.json { render :index, status: :created, location: @web_address }
      else
        format.html { render :new }
        format.json { render json: @web_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /web_addresses/1
  # PATCH/PUT /web_addresses/1.json
  def update
    respond_to do |format|
      if @web_address.update(web_address_params)
        format.html { redirect_to @web_address, notice: 'Web address was successfully updated.' }
        format.json { render :show, status: :ok, location: @web_address }
      else
        format.html { render :edit }
        format.json { render json: @web_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_addresses/1
  # DELETE /web_addresses/1.json
  def destroy
    @web_address.destroy
    respond_to do |format|
      format.html { redirect_to web_addresses_url, notice: 'Web address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_web_address
      @web_address = WebAddress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def web_address_params
      params.require(:web_address).permit(:title, :full_address)
    end

    def get_shortened_url
      new_id = WebAddress.last ? WebAddress.last.id + 1 : 1
      shortener = UrlShortener.new
      shortener.bijective_encode(new_id)
    end
end
