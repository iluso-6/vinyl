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
   @items = Item.all
  end

  def cart
  end

  def checkout
  end

  def confirmation
  end
end
