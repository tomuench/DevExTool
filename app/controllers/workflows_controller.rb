class WorkflowsController < ApplicationController
  include Devise::Controllers::Helpers

  # Overview of own workflow-steps
  # GET /workflows/index
  def index
    @workflow = Workflow.find_by(user: current_user)
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
    @workflow = Workflow.new(user: @user)
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
