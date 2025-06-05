if Rails.env.development?
  # Create a development user if it doesn't exist
  unless User.exists?(email: 'admin@example.com')
    User.create!(
      email: 'admin@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    puts "Created development user: admin@example.com / password123"
  end
end
