class App

  get "/daily/list/:app_key" do
    @tasks = Task.all(:date => Date.today, :app_key => params[:app_key], :published => false)
    @tasks.to_json
  end

  put "/daily/add" do
    @tasks = Task.all(:date => Date.today, :app_key => params[:app_key]).count
    if @tasks > 1
      halt 500 , "Only can add two dailys for day"
    end
    Task.create(text: params[:text], app_key: params[:app_key])
  end

  get "/send" do
    daily = Daily.new
    @tasks = Task.all(:date => Date.today, :published => false)
    @tasks.each do |item|
      daily.send(item.app_key, item.text)
      item.published = true
      item.save
    end
  end
end
