require 'sinatra'
require 'bcrypt'

get '/' do
  erb :index
end

post '/bcrypt' do
  if params[:p] and params[:p2] and (params[:p] == params[:p2])
    erb "BCrypted password:</br><pre>" + BCrypt::Password.create(params[:p]) + "</pre>"
  else
    @error = "Problem! try again"
    erb :index
  end
end

template :layout do
  <<-ERB
    <!doctype html>
    <html>
    <head>
      <title>Bcrypt!</title>
      <style>
        body { background: black; color: #aaa; font: 16px helvetica; }
        section { width: 968px; margin: 10px auto; }
      </style>
    </head>
    <body>
      <section>
        <%= yield %>
      </section>
    </body>
    </html>
  ERB
end

template :index do
  <<-ERB
    <% if @error %><div class="error"><%= @error %></div><% end %>
    <form action="bcrypt" method="POST">
      <div><label>Password to bcrypt<input type="password" name="p"></label></div>
      <div><label>Again <input type="password" name="p2"></label></div>
      <div><input type="submit" value="bcrypt it!"></div>
    </form>
  ERB
end
