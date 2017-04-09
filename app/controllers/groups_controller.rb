class GroupsController < ApplicationController


  def index
     @currentUser = current_user
     @groups = @currentUser.groups
    @group = Group.new

  end

  def friends
    @currentUser = current_user
    @friends = @currentUser.friends
    @group = Group.find(params[:id])

    # @followres = @group.all_following

  end
  def add_friend
    @currentUser = current_user
    @group = Group.find(params[:group_id])
    @friend=User.find(params[:friend_id])
    @friend.follow(@group)
      # respond_to do |format|
      #
      #           format.html { redirect_to user_groups_path(@currentUser,@group), notice: 'hiiiiiiiiiiiii created.' }
      # end
  end
  def list_member
    @group = Group.find(params[:group_id])
    @followres = @group.followers
    render 'list'
  end
  def show
    redirect_to '/groups/index'
  end


   def new
    @currentUser= current_user
    @group = @currentUser.groups.new
  end

  def create
    @currentUser= current_user
    @group = @currentUser.groups.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_groups_path(@currentUser,@group), notice: 'group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end


  private
   def group_params
      params.require(:group).permit(:name , :user_id)
    end
end
