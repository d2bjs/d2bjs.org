class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:index, :show, :recently_updated, :recently_created]
  before_action :authenticate_user!, except: [:index, :show, :recently_updated, :recently_created]

  respond_to :html

  def index
    respond_with(@categories)
  end

  def show
    @entries = @category.entries.order("updated_at DESC")
    respond_with(@category)
  end

  def recently_updated
    @entries = Entry.all.order("updated_at DESC")
    render :show
  end

  def recently_created
    @entries = Entry.all.order("created_at DESC")
    render :show
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :entry_ids => [])
    end

    def set_categories
      @categories = Category.all.order("name")
    end
end
