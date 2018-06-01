Given (/^I have logged in as regular user$/) do
  @test_user = User.new('s7_zabalu_e@venta.lv', 'parole')
  log_in_positive(@test_user)


end

Given (/^I check if I am logged in$/) do
  get_profile_info

end

Given (/^I try to log in without a password$/) do
  @test_user = User.new('s7_zabalu_e@venta.lv', 'parole')
  log_in_without_password(@test_user)


end

Given (/^I check if I am not logged in$/) do
  check_if_profile_not_accessible



end
Given (/^I check profile information$/) do
  get_profile_info


end
Given (/^I change profile firstName$/) do
  change_firstname



end
Given (/^I check profile firstName$/) do
  check_firstname



end
