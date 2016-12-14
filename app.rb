require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get("/lists/new") do
  erb(:list_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.new({:name => name, :id => nil})
  list.save()
  erb(:list_success)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  @list = List.find(list_id)
  @task = Task.new({:description => description, :list_id => list_id, :done => false})
  if @task.save()
    redirect("/tasks/".concat(@task.id().to_s()))
  else
    erb(:index)
  end
end

get('/tasks/:id') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:index)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end

delete('/tasks/:id') do
  @task1 = Task.find(params.fetch("id").to_i())
  if @task1.destroy()
    redirect("/tasks")
  else
    erb(:task)
  end
end
