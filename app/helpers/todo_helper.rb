module TodoHelper
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def sayhi
    puts "hi"
  end
end
