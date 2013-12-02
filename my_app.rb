require 'sinatra'
require 'yaml'

class MyApp < Sinatra::Base
  before do
    @posts = Dir.glob("views/posts/*.erb").map {|path| path.split("/").last.gsub(".erb", "") }
    @sorted_posts = meta_data.sort_by {|post, data_hash| data_hash["date"]}.reverse
  end

  get '/' do 
    erb :index
  end

  get '/about' do
    erb :about
  end

  get'/blog/:post_name' do 
    #since @posts now exists, I can call it other places (because line 14 created an array of post names)
    html = erb("/posts/#{params[:post_name]}".to_sym, layout: false)
    html = html.split("\n\n", 2).last
    erb html
  end

  def meta_data
    if @meta_data
      @meta_data
    else
      @meta_data = {}
      @posts.each do |post|
        html = erb("/posts/#{post}".to_sym, layout: false)
        puts html.inspect
        meta = YAML.load(html.split("\n\n", 2).first)
        @meta_data[post] = meta
      end
      @meta_data
    end
  end

  get '/byfirst' do
    @recent = false
    erb :adablog
  end

  get '/ada-blog' do
    @recent = false
    erb :adablog
  end

  get '/bylast' do
    @recent = true
    erb :adablog
  end

  get '/dealwithit' do
    erb :dealwithit
  end

end