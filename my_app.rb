require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do 
    erb :index
  end

  get '/about' do

    erb :about
  end

  get'/blog/:post_name' do 
    erb "/posts/#{params[:post_name]}".to_sym
  end

  get '/dealwithit' do
    erb :dealwithit
  end

end