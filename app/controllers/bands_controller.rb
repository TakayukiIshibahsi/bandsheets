class BandsController < ApplicationController
  before_action :set_band, only: %i[ show edit update destroy ]

  # GET /bands or /bands.json
  def index
    @bands = Band.all
    @count = Band.all.length()
  end

  # GET /bands/1 or /bands/1.json
  def show
  end


  def member 
    @people=Person.all
    @count=@people.length
    begin 
      @person=Person.new(person_id:Person.find(params[:name]).id, person_name:params[:name], band_id:params[:band_id])
    rescue => e
      @person=Person.new(person_id:nil, person_name:params[:name], band_id:params[:band_id])
    end
    respond_to do |format|
      if @person.save
        format.html { redirect_to "/bands/"+params[:band_id], notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end
  # GET /bands/new
  def new
    @band = Band.new
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands or /bands.json
  def create
    @band = Band.new(band_params)

    respond_to do |format|
      if @band.save
        format.html { redirect_to band_url(@band), notice: "Band was successfully created." }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1 or /bands/1.json
  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to band_url(@band), notice: "Band was successfully updated." }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1 or /bands/1.json
  def destroy
    @band.destroy!
    
    respond_to do |format|
      format.html { redirect_to bands_url, notice: "Band was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def band_params
      params.require(:band).permit(:id, :band_name)
    end
end
