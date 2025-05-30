class WorkflowsController < ApplicationController
  include Devise::Controllers::Helpers

  # Overview of own workflow-steps
  # GET /workflows/index
  def index
    @workflow = Workflow.find_by(user: current_user) if current_user

    if @workflow.nil?
      redirect_to "/"
    end
  end

  # Creating a new survey workflow for a new user
  # GET /workflows/new
  def new
    @user = User.new()
  end

  # Creating a new survey workflow for a new user
  # POST /workflows/create
  def create

    # User erzeugen
    @user = User.new(workflow_create_user_params)
    @user.save

    # Workflow erzeugen
    # Assign a user_group randomnly to the users count
    user_group = User.count.even? ? Workflow::USER_GROUP_A : Workflow::USER_GROUP_B
    @workflow = Workflow.new(user: @user, user_group: user_group)
    @workflow.save

    # Workflow Steps erzeugen
    @workflow.create_workflow_steps

    if @workflow.save
      sign_in(@user)
      redirect_to "/workflows/index"
    else
      render 'new'
    end
  end

  def show
  end

  private

  def workflow_create_user_params
    params.permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end
