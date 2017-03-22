class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all

    # For filter
    @subcategories = Product.select(:subcategory).map(&:subcategory).uniq
    @brands = Product.select(:brand).map(&:brand).uniq
    @categories = Product.select(:category).map(&:category).uniq
    # To check if admin is logged in
    @session = session[:user_id]

    if params[:category]
      @products = Product.where(:category => params[:category])
    elsif params[:brand]
      @products = Product.where(:brand => params[:brand])
    elsif params[:subcategory]
      @products = Product.where(:subcategory => params[:subcategory])
    else
      @products = Product.all
    end
  end

  def new
    @session = session[:user_id]
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    upload_picture
    if @product.save
      redirect_to products_path
    else
      redirect_to new_product_path
    end
  end

  def search
    @session = session[:user_id]
    puts 'entered'
    puts "#{params[:search]}"
    @products = Product.where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(category) LIKE ? OR lower(brand) LIKE ? OR lower(subcategory) LIKE ?", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
    render "index"
  end

  def show
    @product= Product.find(params[:id])
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit
    @session = session[:user_id]
  end
  
  def update
    upload_picture
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find_by_id(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :brand, :subcategory)
  end

  def upload_picture
    if params[:product][:image] != nil
      uploaded_file = params[:product][:image].path
      cloudnary_file = Cloudinary::Uploader.upload(uploaded_file)
      @product.image = cloudnary_file['public_id']
    else
      cloudnary_file = Cloudinary::Uploader.upload("../assets/images/photo_default.png")
      @product.image = cloudnary_file['public_id']
    end
    params[:product].delete :image
  end
end
