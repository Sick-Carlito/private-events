class EventsController < ApplicationController
	

	def new
		@event = current_user.events.build
	end

	def create
		#@user = User.find(session[:creator_id])

		@event = current_user.events.build(event_params)
		if @event.valid?
			@event.save
			@attendance = Attendance.new(user: current_user, event: @event)
			@attendance.save if @attendance.valid?			
			#@attended_event = @events.attendees << User.find(current_user.id)
			redirect_to root_path
		else
			render 'new'
		end
		
	end

	def show

		@event = Event.find(params[:id])
		@att = Attendance.where('event_id = ?', @event.id)
	end

	def index
		@events = Event.all
		@past_events = Event.past_events
		@upcoming_events = Event.upcoming_events
	end

	

	# def attend_event
	# 	@event = Event.find(params[:event_id])
	# 	current_user.attend @event
	# 	flash[:success] = 'Successfuly added to attended events!'
	# 	redirect_back(fallback_location: @event)
 #    end

 #    def leaving_event
 #    	@event = Event.find(params[:event_id])
	# 	current_user.leave @event
	# 	flash[:success] = 'Successfuly left!'
	# 	redirect_back(fallback_location: @event)
 #    end


	private
    def event_params
    	params.require(:event).permit( :name, :description, :date )
    end
end
