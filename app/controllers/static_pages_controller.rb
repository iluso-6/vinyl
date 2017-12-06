class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
  end

  def register
  end

  def login
  end

  def profile
  end

  def catalog
  #  @recordings = Recording.all
  end
  
  def search
       @search_term = params[:q]
       st = "%#{params[:q]}%"
       @items = Item.where("title like ? or artist like ?", st, st)
      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @items }
      end
  end

  def cart
  end

  def checkout
  end

  def confirmation
  end
end
