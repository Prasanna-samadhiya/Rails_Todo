class TodosController < ApplicationController
  before_action :set_todo, only: [ :edit, :update, :destroy ]
  before_action :authenticate_user!
  include TodoHelper

  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path, notice: "Todo Crested"
    else
      render :index
    end
  end

  def destroy
    @todo.destroy
    redirect_to todos_path, notice: "Todo Deleted"
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todo Updated"
    else
      render :edit
    end
  end

  def edit
    # byebug
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :done, :description, :user_id)
  end

  def set_todo
  @todo = Todo.find(params[:id])
  end
end
