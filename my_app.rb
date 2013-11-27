require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do 
    erb :index
  end

  get '/about' do

    erb :about
  end

  get '/dealwithit' do
    erb :dealwithit
  end
end