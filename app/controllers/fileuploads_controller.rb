class FileuploadsController < ApplicationController
  before_action :set_fileupload, only: [:show, :edit, :update, :destroy]

  # GET /fileuploads
  # GET /fileuploads.json
  def index
    @fileuploads = Fileupload.all
  end

  # GET /fileuploads/1
  # GET /fileuploads/1.json
  def show
  end

  # GET /fileuploads/new
  def new
    @fileupload = Fileupload.new
  end

  # GET /fileuploads/1/edit
  def edit
  end

  # POST /fileuploads
  # POST /fileuploads.json
  def create
    @fileupload = Fileupload.new(fileupload_params)
    @fileupload.dbfile = params[:dbfile]
    @fileupload.customer = current_user.customers[0]

    respond_to do |format|
      if @fileupload.save
        format.html { redirect_to @fileupload, notice: 'Fileupload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fileupload }
      else
        format.html { render action: 'new' }
        format.json { render json: @fileupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fileuploads/1
  # PATCH/PUT /fileuploads/1.json
  def update
    respond_to do |format|
      if @fileupload.update(fileupload_params)
        format.html { redirect_to @fileupload, notice: 'Fileupload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fileupload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fileuploads/1
  # DELETE /fileuploads/1.json
  def destroy
    @fileupload.destroy
    respond_to do |format|
      format.html { redirect_to fileuploads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fileupload
      @fileupload = Fileupload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fileupload_params
      # params.require(:fileupload).permit(:dbfile)
    end
end
