
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
    render component: 'Users', props: { users: @users }
  end
  def show
    render component: 'User', props: { user: @user, courses: @user.courses, fullName: @user.full_name }
  end
  def new
    @user = User.new 
    render component: 'UserNew', props: { user: @user }
  end
  def create 
    @user = User.new(user_params)
    if @user.save 
      redirect_to @user
    else 
      render component: 'UserNew', props: { user: @user }
    end
  end
  def edit
    render component: 'UserEdit', props: { user: @user }
  end
  def update 
    if @user.update(user_params)
      redirect_to @user
    else 
      render component: 'UserEdit', props: { user: @user }
    end
  end
  def destroy
    @user.destroy
    redirect_to users_path
  end
  private 
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
    def set_user
      @user = User.find(params[:id])
    end
end





# class UsersController < ApplicationController
#   def index
#     @model_names = Model_name.all
#     render component: 'ModelNames', props:{ model_names: @model_names }
#    end
#    This action creates and sets a instance variable and grabs all the records of a Table.
   
   
#    def show
#     @model_name = Model_name.find(params[:id])
#     render component: 'ModelName', props: { model_name: @model_name }
#    end
#    Shows a single record with a given parameter of id. The id is which record you want to return.
   
   
#    def new
#     @model_name = Model_name.new
#     render component: 'ModelNameNew', props: { model_name: @model_name }
#    end
#    The new action displates the new record form and creates a record only in memory.
   
   
#    def edit
#      @model_name = Model_name.find(params[:id])
#     render component: 'ModelNameEdit', props: { model_name: @model_name }
#    end
#    The edit action displats the edit record form. Needs an id to know which record to update
   
   
#    Create / POST
   
#    def create
#      @model_name = Model_name.new(model_name_params)
#      if @model_name.save
#        do something or do somewhere
#      else
#        render component: 'ModelNameNew', props: { model_name: @model_name }
#      end
#    end
#    Creates a record in the database from parameter passed in the new action.
   
   
#    Update / PUT / PATCH
   
#    def update
#      @model_name = Model_name.find(params[:id])
#      if @model_name.update(model_name_params)
#        do something
#      else
#        render component: 'ModelNameEdit', props: { model_name: @model_name }
#      end
#    end
#    Edit a record with the given id parameter.
   
   
#    Destroy / DELETE
   
#    def destroy
#      @model_name = Model_name.find(params[:id])
#      @model_name.destroy
#      send somewhere
#      or
#      Model_name.find(params[:id]).destroy
#      send somewhere
#    end
#    Delete the entire record with a given id parameter.
   
   
#    private
#      def model_name_params
#        params.require(:model_name).permit(:attr, :attr2, :everything the table has)
#      end
#    Permitted parameter to be passed into the model.