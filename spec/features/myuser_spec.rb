require 'rails_helper'

RSpec.feature "Myusers", type: :feature do
  given!(:myuser) { myuser = Myuser.create(email: "abc@abc.com", password: "123456", role: "admin") }

  scenario "sign in with valid credentials " do
    visit "/myusers/sign_in"
    fill_in "Email", with: myuser.email
    fill_in "Password", with: myuser.password
    check "Remember me"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end
