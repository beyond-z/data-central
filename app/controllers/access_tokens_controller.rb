class AccessTokensController < ApplicationController
  before_action :set_access_token, only: [:show, :edit, :update, :destroy]

  # GET /access_tokens
  # GET /access_tokens.json
  def index
    @access_tokens = AccessToken.all
  end

  # GET /access_tokens/1
  # GET /access_tokens/1.json
  def show
  end

  # GET /access_tokens/new
  def new
    @access_token = AccessToken.new
  end

  # GET /access_tokens/1/edit
  def edit
  end

  # POST /access_tokens
  # POST /access_tokens.json
  def create
    @access_token = AccessToken.new(access_token_params)

    respond_to do |format|
      if @access_token.save
        format.html { redirect_to access_tokens_path, notice: 'Access Token was successfully created.' }
        format.json { render :show, status: :created, location: @access_token }
      else
        format.html { render :new }
        format.json { render json: @access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /access_tokens/1
  # PATCH/PUT /access_tokens/1.json
  def update
    respond_to do |format|
      if @access_token.update(access_token_params)
        format.html { redirect_to access_tokens_path, notice: 'Access Token was successfully updated.' }
        format.json { render :show, status: :ok, location: @access_token }
      else
        format.html { render :edit }
        format.json { render json: @access_token.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /access_tokens/1
  # DELETE /access_tokens/1.json
  def destroy
    @access_token.destroy
    respond_to do |format|
      format.html { redirect_to access_tokens_url, notice: 'Access Token was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access_token
      @access_token = AccessToken.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_token_params
      params.require(:access_token).permit(:name)
    end
end
