class App < Sinatra::Base

  route :get, :post, '/' do
    index
  end

end