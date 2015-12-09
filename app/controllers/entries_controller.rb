class EntriesController < ApplicationController
	before_action :set_entry, only: [:show, :edit, :update, :destroy, :data, :data_form]
	before_action :set_category, only: [:new, :edit, :show, :update, :create]
	before_action :authenticate_user!, except: [:show]
	respond_to :html

	# GET /entries
	# GET /entries.json
	# def index
	# 	if user_signed_in?
	# 		@entries = Entry.all
	# 	else
	# 		@entries = Entry.select {|x| x.private == false}.reverse
	# 	end
	# 	@entries = @entries.sort_by{|entry| entry.updated_at }
	# end


	# GET /entries/1
	# GET /entries/1.json
	def show
		# authenticate_user! if(@entry.private)
		@widgets = @entry.widgets.sort_by{|widget| widget.index }
	end

	# def data
	# 	authenticate_user! if(@entry.private)
	# 	@data = @entry.datum.find {|x| x.name == params[:name]}
	# 	render plain: @data.body
	# end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    @entry = @category.entries.create(entry_params)
		show_it
  end

  def update
    @entry.update(entry_params)
		show_it
  end

  def destroy
    @entry.destroy
    redirect_to :back
  end


	private
		# Use callbacks to share common setup or constraints between actions.
		def set_entry
			@entry = Entry.find(params[:id])
		end
		def set_category
			@category = Category.find(
				params[:category_id] ||
				params[:example_category_id] ||
				params[:getting_started_category_id]
			)
		end

		def entry_params
			params.require(:entry).permit(
				:name, :description, :markdown,
				widgets_attributes: [:id, :name, :caption, :css, :html, :js, :markdown, :code_visibility, :_destroy]
			)
		end

		def show_it
			if @category.type == "ExampleCategory"
				redirect_to [@category, @entry]
			elsif @category.type == "GettingStartedCategory"
				redirect_to getting_started_path
			else
				redirect_to root_url
			end
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		# def entry_params
		# 	params.require(:entry).permit(
		# 		:name, :description, :thumbnail, :code, :private, :markdown, :iframe, :category_ids => [],
		# 		widgets_attributes: [:id, :index, :name, :caption, :type, :iframe_url, :embedded_code, :image, :markdown, :_destroy],
		# 		datum_attributes: [:id, :name, :body, :_destroy]
		# 	)
		# end
end
