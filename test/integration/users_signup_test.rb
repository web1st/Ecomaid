

require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path params: {
        user: { 
          name: " ",
          email: "user@invalid",
          password:"bar",
          password_confirmation: "foobar" 
          }
         }
  end
  assert_template 'users/new'
  assert_select 'div#error_explanation'
  assert_select 'div.field_with_errors'
  end
end
