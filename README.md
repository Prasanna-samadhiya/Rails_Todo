# ✅ ToDo Application - Ruby on Rails 📝

A full-featured ToDo list application built with **Ruby on Rails**, using **Devise** for authentication and **User-Todo associations** to manage personalized tasks for each user.

---

## 🚀 Features

- 🔐 User Authentication via Devise
- 🧑 Each user can create, edit, and delete their own todos
- 📌 Mark todos as completed or pending
- 📆 Timestamps for creation and updates
- 📱 Responsive frontend with clean UI
- 🔎 Optional: Filter todos by status

---

## 🛠️ Tech Stack

- **Framework:** Ruby on Rails `~> 8.0.2`
- **Database:** PostgreSQL
- **Authentication:** Devise
- **Frontend:** ERB (can be extended with Tailwind, Bootstrap)
- **ORM:** ActiveRecord

---

## 🔧 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/todo-rails-app.git
cd todo-rails-app
2. Install Dependencies
bash
Copy
Edit
bundle install
3. Setup the Database
bash
Copy
Edit
rails db:create
rails db:migrate
4. Run the Server
bash
Copy
Edit
rails server
Visit the app at http://localhost:3000

🔑 Devise Authentication
This project uses Devise for user sign up, login, logout, and session management.

Registration: /users/sign_up

Login: /users/sign_in

Logout: /users/sign_out

🧩 Models and Associations
User
Devise-enabled

Has many todos

Todo
Belongs to a user

Fields: title, description, completed:boolean

# user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :todos, dependent: :destroy
end

# todo.rb
class Todo < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
end
📂 File Structure (important parts)

```app/
├── controllers/
│   ├── todos_controller.rb
│   └── users/
│       └── registrations_controller.rb (if customized)
├── models/
│   ├── user.rb
│   └── todo.rb
├── views/
│   └── todos/
│       ├── index.html.erb
│       ├── new.html.erb
│       ├── edit.html.erb
│       └── _form.html.erb
├── views/devise/
└── config/
    └── routes.rb```

🔁 Routes

devise_for :users

resources :todos

root to: "todos#index"
🧪 Running Tests (Optional)
You can use RSpec or Minitest if configured. For now:

rails test
🌐 Deployment Instructions
To deploy on platforms like Render, Fly.io, or Heroku:

Set the environment variables (e.g., RAILS_MASTER_KEY)

Ensure database and credentials are synced

Run rails db:migrate on the deployed server

✨ Future Improvements
Add category/tag support

Deadline reminders via email or notifications

Mobile-friendly design

Toggle task completion with AJAX

Drag-and-drop sorting

🤝 Contributing
Feel free to fork the repo, suggest improvements, or submit pull requests.
