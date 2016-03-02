require 'sinatra'
require 'csv'
require 'pry'
require_relative "app/models/television_show"

set :views, File.join(File.dirname(__FILE__), "app/views")

get "/television_shows" do
  @tv_shows = TelevisionShow.all
  erb :index
end

get "/television_shows/new" do
  @tv_shows = TelevisionShow.all
  @message = params[:message]
  erb :new
end

post "/television_shows/new" do
  @tv_shows = TelevisionShow.all
  @show = TelevisionShow.new(params[:title],params[:network],params[:year],params[:genre],params[:synopsis])
  if @show.valid?
    File.open("television-shows.csv", 'a+') {|f| f.write("#{params[:title]},#{params[:network]},#{params[:year]},#{params[:genre]},#{params[:synopsis]} \n")}
    redirect "/television_shows"
  else
    @error = @show.error
    @error = @error.to_s.tr('[]"', '')
    redirect "/television_shows/new?message=#{@error}"
  end
end
