class UsersController < ApplicationController

	def index
    if params[:first_name].present?
      @users = User.where("first_name = ? or last_name = ? or date_of_birth =? or email_address =? or gender =?", params[:first_name], params[:first_name], params[:first_name],params[:first_name],params[:first_name]).paginate(:page => params[:page])
    else
    @users = User.paginate(:page => params[:page])
    end
	end

	def new
		@user = User.new
	end
		
	def create
		@user = User.new(params[:user])		
		if @user.save
			flash[:notice] = 'User successfully created' 
			redirect_to user_path(@user)
		else
			flash[:error] = 'Invalid details details '
			render :new
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end	
	
	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to @user, notice: 'User was successfully updated.'
		else	
			render action: "edit" 
		end
	end

	def destroy
	    @user = User.find(params[:id])
	    @user.destroy
	    redirect_to users_url
	end
end
