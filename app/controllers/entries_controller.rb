class EntriesController < ApplicationController
	before_action :set_entry, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :data]

	# GET /entries
	# GET /entries.json
	def index
		if user_signed_in?
			@entries = Entry.all.reverse
		else
			@entries = Entry.select {|x| x.private == false}.reverse
		end
	end

	# GET /entries/1
	# GET /entries/1.json
	def show
	end

	def data
		@data = Datum.find {|x| x.name == params[:name]}
		render plain: @data.body
	end

	# GET /entries/new
	def new
		@entry = Entry.new
	end

	def data_form
		@number = params[:number]
		render partial: 'data_form'
	end

	# GET /entries/1/edit
	def edit
	end

	# POST /entries
	# POST /entries.json
	def create

		@entry = Entry.new(entry_params)

		if params[:datum]
			params[:datum].each_value do |d|
				@entry.datum.new name: d[:name], body: d[:content]
			end
		end

		respond_to do |format|
			if @entry.save
				format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
				format.json { render :show, status: :created, location: @entry }
			else
				format.html { render :new }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /entries/1
	# PATCH/PUT /entries/1.json
	def update

		if params[:datum]
			params[:datum].each_value do |d|
				@entry.datum.new name: d[:name], body: d[:content]
			end
		end

		respond_to do |format|
			if @entry.update(entry_params)
				format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
				format.json { render :show, status: :ok, location: @entry }
			else
				format.html { render :edit }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /entries/1
	# DELETE /entries/1.json
	def destroy
		@entry.datum.each do |d|
			d.destroy
		end

		@entry.destroy
		respond_to do |format|
			format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_entry
			@entry = Entry.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def entry_params
			params.require(:entry).permit(:name, :description, :code, :private, :markdown)
		end
end
