#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

get '/users' do
	
	erb :users
end

post '/users' do 
	@login = params[:login]
	@password = params[:password]
	if @login == 'admin' and @password == 'secret'
		erb :users_txt
	else
		@title = 'Oooops...'
		@message = 'Sorry, wrong data!'
		erb :message
	end
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:date_time]
	@barber = params[:barber]
	users = File.open("./public/users.txt", "a")
	users.write("\nИмя: #{@username}\nТелефон: #{@phone}\nДата и время: #{@date_time}\nМастер: #{@barber}\n")
	users.close

	@title = "Спасибо!"
 	@message = "Уважаемый, #{@username}, мы ждём вас #{@datetime}"
 	erb :message
end

get '/create' do
   
    erb :create
    
end

