# Live Comments - Hotwire Learning Application

A real-time commenting system built with Ruby on Rails and Hotwire (Turbo + Stimulus) for learning modern Rails development patterns.

## 🚀 Features

- **Real-time Comments**: Add, edit, and delete comments without page refreshes
- **Live Updates**: Comments appear instantly using Turbo Streams
- **Like System**: Like and unlike comments with live counter updates
- **Nested Comments**: Reply to comments with threaded discussions
- **User Authentication**: Secure user management with Devise
- **Modern UI**: Clean, responsive design with Tailwind CSS
- **Hotwire Integration**: Demonstrates Turbo and Stimulus usage

## 🛠 Tech Stack

- **Ruby on Rails 7** - Web framework
- **Hotwire** - Real-time updates (Turbo + Stimulus)
- **Devise** - User authentication
- **Tailwind CSS** - Styling
- **PostgreSQL** - Database
- **Import Maps** - JavaScript bundling

## 📋 Prerequisites

- Ruby 3.2.0 or higher
- Rails 7.0 or higher
- PostgreSQL
- Node.js (for asset compilation)

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/eng-usamak/live_comments.git
cd live_comments
```

### 2. Install Dependencies

```bash
# Install Ruby gems
bundle install

# Install Node.js packages (if needed)
npm install
```

### 3. Database Setup

```bash
# Create and setup database
rails db:create
rails db:migrate
rails db:seed
```

### 4. Start the Server

```bash
# Start the development server
bin/dev
```

The application will be available at `http://localhost:3000`

## 📁 Project Structure

```
live_comments/
├── app/
│   ├── controllers/          # Rails controllers
│   ├── models/              # ActiveRecord models
│   ├── views/               # ERB templates with Turbo Streams
│   ├── javascript/          # Stimulus controllers
│   └── assets/              # CSS and images
├── config/                  # Rails configuration
└── db/                      # Database migrations and schema

```

## 🔧 Key Components

### Models

- **User**: Authentication and user management
- **Post**: Main content posts
- **Comment**: Nested comments with replies
- **Like**: Like/unlike functionality

### Controllers

- **PostsController**: CRUD operations for posts
- **CommentsController**: Real-time comment management with Turbo Streams

### Views

- **Turbo Streams**: Real-time updates for comments and likes
- **Stimulus Controllers**: Enhanced interactivity
- **Partial Templates**: Reusable comment components

## 🎯 Learning Objectives

This project demonstrates:

1. **Hotwire Integration**: Using Turbo Streams for real-time updates
2. **Stimulus Controllers**: JavaScript organization and interactivity
3. **Nested Resources**: Managing related data models
4. **Real-time Features**: Live updates without page refreshes
5. **Modern Rails Patterns**: Rails 7 best practices

## 🧪 Testing

```bash
# Run the test suite
rails test

# Run specific tests
rails test test/controllers/comments_controller_test.rb
```

## 📝 API Endpoints

### Posts

- `GET /posts` - List all posts
- `GET /posts/:id` - Show specific post
- `POST /posts` - Create new post
- `PATCH /posts/:id` - Update post
- `DELETE /posts/:id` - Delete post

### Comments

- `POST /posts/:post_id/comments` - Create comment
- `PATCH /posts/:post_id/comments/:id` - Update comment
- `DELETE /posts/:post_id/comments/:id` - Delete comment
- `POST /posts/:post_id/comments/:id/like` - Like comment
- `DELETE /posts/:post_id/comments/:id/like` - Unlike comment

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**KaSuRi** (eng-usamak)

- Email: usamak.islam@gmail.com
- GitHub: [@eng-usamak](https://github.com/eng-usamak)

## 🙏 Acknowledgments

- Built for learning Hotwire and modern Rails development
- Inspired by real-time commenting systems
- Uses Rails 7 and Hotwire best practices
