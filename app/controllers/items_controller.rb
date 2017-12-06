class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
      
  end

  # GET /items/1
  # GET /items/1.json
  def show
   # @item.audioarray
  end
  

  # GET /items/new
  def new
     @categories = Category.all
      @objArray = Array.new
 @categories.each do |cat|
   @objArray << cat.title 
  end
    
    if user_signed_in? && current_user.email?
    @item = Item.new(:owner => current_user.email)
    @item.save
  else
     @item = Item.new
  end

   # @item.audioarray
  #  <%= @recording  %>
   # @recording = Recording.new
  #  5.times { @item.recordings.build }
  #  @recordings = @item.recordings.all
  end

  # GET /items/1/edit
  def edit
    @categories = Category.all
   @objArray = Array.new
 @categories.each do |cat|
   @objArray << cat.title
 end
#  @recordings = @items.recordings.build(:upsongs => audiotar) 
#  @recordings.save
  end

  # POST /items
  # POST /items.json
  def create
  
    
    @item = Item.new(item_params)

#  @recordings = @items.recordings.build(:upsongs => audiotar) 
#  @recordings.save

    #  5.times { @item.recordings.build() }
    respond_to do |format|
      if @item.save
     
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:avatar, :song, :audiotar, :audioarray ,:myarray, :owner, :music, :artist, :title, :price, :image_url, :genre, :label, :year)
    end
end
