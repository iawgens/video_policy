class VideosController < ApplicationController
	respond_to :json

	def index
		@videos = Video.filter(country_code: params[:country_code], policy_codes: ['free', 'monetize'])
	end

	def show
	 	videos = Video.filter(id: params[:id], country_code: params[:country_code])
	 	@video = videos.first
	end

	def policies
		@videos = Video.filter.includes(:policies)
	end
end