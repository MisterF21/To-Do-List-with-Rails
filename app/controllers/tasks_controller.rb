class TasksController < ApplicationController
  def index
    @tasks = Task.all
    render('tasks/index.html.erb')
  end

  def new
    @task = Task.new
    render('tasks/new.html.erb')
  end

  def create
    @task = Task.create(:task => params[:task])

    if @task.save
      render('tasks/success.html.erb')
    else
      render('tasks/new.html.erb')
    end
  end

  def show
    @task = Task.find(params[:id])
    render('tasks/show.html.erb')
  end

  def edit
    @task = Task.find(params[:id])
    render('tasks/edit.html.erb')
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(:task => params[:task],
                    :done => params[:done])
      render('tasks/success.html.erb')
    else
      render('tasks/edit.html.erb')
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render('tasks/destroy.html.erb')
  end

  def done
    @done_tasks = Task.where(:done => true)
    @not_done_tasks = Task.where(:done => nil)
    @task = Task.find(params[:id])
    if @done_tasks
      render('tasks/done.html.erb')
    else
      render('tasks/index.html.erb')
    end
  end
end
