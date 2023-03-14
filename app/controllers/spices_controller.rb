class SpicesController < ApplicationController
     #GET /spices
    def index
        render json: Spice.all, status: :ok
    end     

    # POST /spices
    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end
  
     #GET /spices/1
     def show
        spice = find_spice
        render json: spice
      end 
      
    # PATCH/PUT /spices/1
    def update
        spice = find_spice
        spice.update(spice_params)
        render json: spice
    end

    # DELETE /spices/1
    def destroy
        spice = find_spice
        spice.destroy
        head :no_content
    end

    private
  
    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
    def find_spice
        Spice.find(params[:id])
    end
    def render_not_found_response
        render json: { error: "Spice not found" }, status: :not_found
    end
end
