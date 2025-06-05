# README

## Running locally

1. Install ruby dependencies: `bundle install`
2. Setup the `GITHUB_API_TOKEN` environment variable in the `.env.development` file to be able to fetch the agra repository PRs.
3. Create the database and the tables: `bin/rails db:create db:migrate`
4. Seed the data using `bin/rails db:seed`
5. Run the application: `bin/rails s`
6. Browse the site at http://localhost:3000 and confirm that you can log in using the credentials `admin@example.com` / `password123`
7. Confirm that you can pull agra's PRs from http://localhost:3000/pull_request

