Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['531518800620388'], ENV['5c81552c225f8ff3798eb50323bb2129']
  scope: 'email,first_name,last_name,name,user_birthday,read_stream', display: 'popup'
end