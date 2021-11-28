User.create!(
  id: 1,
  name: 'sample_user',
  email: 'sample@example.com',
  password: 'password',
  # password_confirmation: 'password', なぜかこれを入れるとエラーになる
  current_hourly_wage: 1000
  )