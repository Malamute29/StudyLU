Factory:define :user do |user|
  user.username                   "test_user"
  user.user_id                    0102030405
  user.f_name                     "Test"
  user.l_name                     "User"
  user.email                      "testuser@gmail.com"
  user.is_admin                   false
  user.password                   "password"
  user.password_confirmation      "password"
end