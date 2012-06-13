require 'sinatra'
require 'bcrypt'

get '/' do
  erb :index
end

post '/bcrypt' do
  if pass = params[:password]
    erb "Crypted password:</br>" + BCrypt::Password.create(pass)
  else
    erb "Gotta have a password!"
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
    <form action="bcrypt" method="POST">
      <div>
        <label>
          Password to bcrypt
          <input type="password" name="password">
          <input type="submit" name="bcrypt it!">
        </label>
    </form>
  ERB
end

