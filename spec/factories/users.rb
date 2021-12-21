FactoryBot.define do
  factory :user do
    email                 {'test@example'}
    password              {'aaaaa0'}
    password_confirmation {password}
    nickname              {'nobi'}
    first_name            {'佐藤'}
    last_name             {'太郎'}
    kana_first_name       {'サトウ'}
    kana_last_name        {'タロウ'}
    birthday              {'2000-10-19'}
  end
end