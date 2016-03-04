class ProfilesController < ApplicationController

	before_action :authenticate_user!

	def new
		@profile = Profile.new
		@tags = Tag.all
	end

	def create
		@profile = Profile.new({name: params[:profile][:name], user_id: current_user.id})
		if @profile.save
			Tag.all.each do |t|
				if params[:tags].keys.include? t.id.to_s
					v = 1
				else
					v = 0
				end
				ProfileTag.new({profile_id: @profile.id, tag_id: t.id, value: v}).save
			end
			redirect_to profiles_path, notice: 'Profile was successfully created.'
		else
			render 'new'
		end
	end

	def index
		@profiles = Profile.where(user_id: current_user.id).order("created_at DESC")
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def search_init
		session[:n_rounds] = 0
		session[:history_all] = []
		session[:history_chosen] = []
		redirect_to action: :search
	end

	def search_next
		@profile = Profile.find(params[:id])
		session[:history_all] += session[:current_choice]
		session[:history_chosen] += [params[:chosen]]
		# INSERT ALGO HERE
		redirect_to action: :search
	end

	def search
		@history = Gift.find(session[:history_chosen])
		@profile = Profile.find(params[:id])
		@gifts = Gift.find_by_sql ["SELECT gifts.* FROM gifts
			INNER JOIN gift_tags ON gifts.id = gift_tags.gift_id
			INNER JOIN profile_tags ON profile_tags.tag_id = gift_tags.tag_id
			WHERE profile_tags.profile_id = ? AND gifts.id NOT IN #{get_history_string}
			GROUP BY gifts.id
			ORDER BY SUM(profile_tags.value*gift_tags.value) DESC
			LIMIT 2
			", @profile.id]
		session[:current_choice] = []
		@gifts.each do |g|
			session[:current_choice] += [g.id]
		end
		session[:n_rounds] += 1
	end

	private

	def get_history_string
		s = '('
		session[:history_all].each do |v|
			s += v.to_s + "," unless v.nil?
		end
		s += '-1)'
	end

end
