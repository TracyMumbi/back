class ChildrenController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /children or /children.json
  def index
    @children = Child.all
    render json: @children
  end

  # GET /children/1 or /children/1.json
  def show
    @child = set_child
    render json: @child
  end

  # POST /children or /children.json
  def create
    @child = Child.new(child_params)
    if @child.save
      render json: @child, status: :created
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /children/1 or /children/1.json
  def update
    @child = set_child
    if @child.update(child_params)
      render json: @child, status: :ok
    else
      render json: { errors: @child.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /children/1 or /children/1.json
  def destroy
    @child = set_child
    @child.destroy
    render json: { message: "Child successfully destroyed" }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_child
    @child = Child.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def child_params
    params.permit(:weight, :age)
  end
end
