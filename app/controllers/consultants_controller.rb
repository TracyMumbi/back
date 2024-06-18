class ConsultantsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_consultant, only: %i[show update destroy]

  # GET /consultants or /consultants.json
  def index
    page = params[:page].to_i > 0 ? params[:page].to_i : 1
    per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 10

    @consultants = Consultant.page(page).per(per_page)
    total_pages = @consultants.total_pages

    render json: {
      consultants: @consultants,
      current_page: page,
      total_pages: total_pages
    }
  end

  # GET /consultants/1 or /consultants/1.json
  def show
    render json: @consultant
  end

  # POST /consultants or /consultants.json
  def create
    @consultant = Consultant.new(consultant_params)
    if @consultant.save
      render json: @consultant, status: :created
    else
      render json: { errors: @consultant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consultants/1 or /consultants/1.json
  def update
    if @consultant.update(consultant_params)
      render json: @consultant, status: :ok
    else
      render json: { errors: @consultant.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /consultants/1 or /consultants/1.json
  def destroy
    @consultant.destroy
    render json: { message: "Consultant successfully destroyed" }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consultant
    @consultant = Consultant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def consultant_params
    params.permit(:name, :image, :email, :phone, :status)
  end
end
