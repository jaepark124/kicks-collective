class ShoesController < ApplicationController
  before_action :set_shoe, only: [:show, :edit, :update, :destroy]
  layout "application"

    # GET /Shoes
    # GET /Shoes.json
    def index
      @shoes = Shoe.includes(:comments).all.default_sort
    end

    # GET /Shoes/1
    # GET /Shoes/1.json
    def show
      @comment = Comment.new
    end


    # GET /Shoes/new
    def new
      @shoe = Shoe.new
      @brands = Brand.all.by_name
    end

    # GET /Shoes/1/edit
    def edit
    end

    # POST /Shoes
    # POST /Shoes.json
    def create
      @shoe = Shoe.new(shoe_params)
      @shoe.user_id = current_user.id

      respond_to do |format|
        if @shoe.save
          format.html { redirect_to shoes_path, notice: 'Shoe was successfully created.' }
        else
          # puts "Something went wrong"
          format.html { render :new }
        end
      end
    end

    # PATCH/PUT /Shoes/1
    # PATCH/PUT /Shoes/1.json
    def update
      respond_to do |format|
        if @shoe.update(shoe_params)
          format.html { redirect_to shoe_path(@shoe), notice: 'Shoe was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /samples/1
    # DELETE /samples/1.json
    def destroy
      @shoe.destroy
      respond_to do |format|
        format.html { redirect_to samples_url, notice: 'Sample was successfully destroyed.' }
      end
    end

    private
      # Never trust parameters from the scary internet, only allow the white list through.
      def shoe_params
        params.require(:shoe).permit(:name, :price, :brand, :main_image, :thumb_image)
      end

      def set_shoe
        @shoe= Shoe.includes(:comments).find(params[:id])
        @brands = Brand.all.by_name
      end

end
