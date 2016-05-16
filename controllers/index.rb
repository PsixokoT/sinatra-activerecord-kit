class App < Sinatra::Base
  def index
    erb :index, :layout => true
  end
end