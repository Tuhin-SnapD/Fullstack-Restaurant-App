# 🍽️ Restaurant Management System

A comprehensive restaurant management system featuring a Node.js/Express backend API and two modern frontend applications built with React and Angular. This project demonstrates full-stack development with multiple frontend frameworks consuming the same RESTful API.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Detailed Setup](#detailed-setup)
  - [Backend Server Setup](#backend-server-setup)
  - [React Frontend Setup](#react-frontend-setup)
  - [Angular Frontend Setup](#angular-frontend-setup)
- [API Documentation](#api-documentation)
- [Features](#features)
- [Project Structure](#project-structure)
- [Development](#development)
- [Deployment](#deployment)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)

## 🎯 Overview

This restaurant management system consists of three main components:

- **Backend Server** (`Server-Restaurant/`): Node.js/Express API with MongoDB
- **React Frontend** (`React-Restaurant-App/`): Modern React application with Redux
- **Angular Frontend** (`Angular-Restaurant-App/`): Angular application with Material Design

Both frontends consume the same RESTful API, demonstrating how different frameworks can work with a unified backend.

## 🏗️ Architecture

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   React App     │    │  Angular App    │    │  Backend API    │
│   (Port 3000)   │    │  (Port 4200)    │    │  (Port 8000)    │
└─────────┬───────┘    └─────────┬───────┘    └─────────┬───────┘
          │                      │                      │
          └──────────────────────┼──────────────────────┘
                                 │
                    ┌─────────────▼─────────────┐
                    │      MongoDB Database     │
                    │      (Port 27017)        │
                    └───────────────────────────┘
```

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

- **Node.js** (v14.0.0 or higher)
- **npm** (v6.0.0 or higher) or **yarn** (v1.22.0 or higher)
- **MongoDB** (v4.4 or higher)
- **Git** (v2.20 or higher)

### Optional Software

- **MongoDB Compass** (GUI for MongoDB)
- **Postman** or **Insomnia** (API testing)
- **VS Code** (recommended editor)

### System Requirements

- **RAM**: Minimum 4GB, Recommended 8GB
- **Storage**: At least 2GB free space
- **OS**: Windows 10+, macOS 10.14+, or Ubuntu 18.04+

## 🚀 Quick Start

For experienced developers who want to get everything running quickly:

```bash
# 1. Clone the repository
git clone <repository-url>
cd Restaurant

# 2. Install MongoDB (if not already installed)
# Windows: Download from https://www.mongodb.com/try/download/community
# macOS: brew install mongodb-community
# Ubuntu: sudo apt install mongodb

# 3. Start MongoDB
# Windows: Start MongoDB service
# macOS: brew services start mongodb-community
# Ubuntu: sudo systemctl start mongodb

# 4. Setup Backend
cd Server-Restaurant
npm install
cp env.example .env
npm run populate
npm run dev

# 5. Setup React Frontend (Terminal 2)
cd ../React-Restaurant-App
npm install
npm start

# 6. Setup Angular Frontend (Terminal 3)
cd ../Angular-Restaurant-App
npm install
npm start
```

## 📖 Detailed Setup

### Backend Server Setup

The backend provides a RESTful API with authentication, file uploads, and database management.

#### 1. Navigate to Backend Directory

```bash
cd Server-Restaurant
```

#### 2. Install Dependencies

```bash
npm install
```

#### 3. Environment Configuration

```bash
# Copy the example environment file
cp env.example .env
```

Edit the `.env` file with your configuration:

```env
# Server Configuration
NODE_ENV=development
PORT=8000

# Database Configuration
MONGO_URL=mongodb://127.0.0.1:27017/conFusion

# Security (Generate strong keys for production)
SECRET_KEY=your-super-secret-key-here-make-it-long-and-random
JWT_SECRET=your-jwt-secret-key-here

# Facebook OAuth (optional)
FACEBOOK_CLIENT_ID=your-facebook-client-id
FACEBOOK_CLIENT_SECRET=your-facebook-client-secret

# File Upload Configuration
UPLOAD_PATH=./uploads
MAX_FILE_SIZE=5242880

# Session Configuration
SESSION_SECRET=your-session-secret-key
SESSION_TTL=86400

# CORS Configuration
ALLOWED_ORIGINS=http://localhost:3000,http://localhost:4200,http://localhost:8000
```

#### 4. Database Setup

Ensure MongoDB is running:

```bash
# Check MongoDB status
mongod --version

# Start MongoDB (if not running)
# Windows: Start MongoDB service
# macOS: brew services start mongodb-community
# Ubuntu: sudo systemctl start mongodb
```

#### 5. Populate Database

```bash
# Populate with sample data
npm run populate
```

#### 6. Start the Server

```bash
# Development mode with auto-restart
npm run dev

# Production mode
npm start
```

The server will start on `http://localhost:8000`

#### 7. Verify Backend Setup

Test the API endpoints:

```bash
# Test basic connectivity
curl http://localhost:8000/

# Test dishes endpoint
curl http://localhost:8000/dishes

# Test promotions endpoint
curl http://localhost:8000/promotions
```

### React Frontend Setup

The React frontend provides a modern, responsive interface with Redux state management.

#### 1. Navigate to React Directory

```bash
cd React-Restaurant-App
```

#### 2. Install Dependencies

```bash
npm install
```

#### 3. Configure API Endpoint

The React app is already configured to connect to `http://localhost:8000/`. If you need to change this, edit:

```javascript
// src/shared/baseUrl.js
export const baseUrl = 'http://localhost:8000/';
```

#### 4. Start the React Application

```bash
npm start
```

The React app will start on `http://localhost:3000`

#### 5. Verify React Setup

- Open `http://localhost:3000` in your browser
- You should see the restaurant homepage
- Navigate through the menu, about, and contact pages
- Test the dish detail pages and comment functionality

### Angular Frontend Setup

The Angular frontend provides a sophisticated interface with Material Design components.

#### 1. Navigate to Angular Directory

```bash
cd Angular-Restaurant-App
```

#### 2. Install Dependencies

```bash
npm install
```

#### 3. Configure API Endpoint

The Angular app is already configured to connect to `http://localhost:8000/`. If you need to change this, edit:

```typescript
// src/app/shared/baseurl.ts
export const baseURL = 'http://localhost:8000/';
```

#### 4. Start the Angular Application

```bash
# For Windows (with legacy OpenSSL support)
npm start

# For macOS/Linux
ng serve
```

The Angular app will start on `http://localhost:4200`

#### 5. Verify Angular Setup

- Open `http://localhost:4200` in your browser
- You should see the restaurant homepage
- Navigate through the menu, about, and contact pages
- Test the dish detail pages and comment functionality

## 📚 API Documentation

### Base URL
```
http://localhost:8000
```

### Authentication Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/users/signup` | Register new user |
| POST | `/users/login` | User login |
| GET | `/users/logout` | User logout |
| GET | `/users/facebook/token` | Facebook OAuth |

### Restaurant Data Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/dishes` | Get all dishes |
| GET | `/dishes/:id` | Get specific dish |
| POST | `/dishes/:id/comments` | Add comment to dish |
| GET | `/promotions` | Get all promotions |
| GET | `/leaders` | Get leadership team |
| POST | `/feedback` | Submit feedback |

### File Upload Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/imageUpload` | Upload image files |

### Example API Usage

```bash
# Get all dishes
curl http://localhost:8000/dishes

# Get specific dish
curl http://localhost:8000/dishes/0

# Add comment (requires authentication)
curl -X POST http://localhost:8000/dishes/0/comments \
  -H "Content-Type: application/json" \
  -d '{"rating": 5, "comment": "Excellent dish!", "author": "John Doe"}'

# Get promotions
curl http://localhost:8000/promotions
```

## ✨ Features

### Backend Features
- **RESTful API** with Express.js
- **MongoDB** database with Mongoose ODM
- **JWT Authentication** and session management
- **File upload** support with Multer
- **CORS** configuration for cross-origin requests
- **Facebook OAuth** integration
- **Input validation** and error handling
- **Security middleware** (XSS protection, CSRF, etc.)

### React Frontend Features
- **Modern React** with Hooks and functional components
- **Redux** state management with Redux Toolkit
- **React Router** for client-side routing
- **Bootstrap** and Reactstrap for UI components
- **Form validation** with react-hook-form
- **Responsive design** for all devices
- **Loading states** and error handling

### Angular Frontend Features
- **Angular 6+** with TypeScript
- **Angular Material** design components
- **Angular Router** for navigation
- **Reactive Forms** with validation
- **HTTP Client** for API communication
- **Animations** and transitions
- **Responsive design** with Flex Layout

### Shared Features
- **Menu browsing** with categories
- **Dish details** with images and descriptions
- **User reviews** and ratings
- **Contact forms** with validation
- **About pages** with team information
- **Promotional content** display

## 📁 Project Structure

```
Restaurant/
├── Server-Restaurant/           # Backend API
│   ├── app.js                  # Main application file
│   ├── config.js               # Configuration settings
│   ├── authenticate.js         # Authentication middleware
│   ├── models/                 # MongoDB models
│   │   ├── dishes.js
│   │   ├── comments.js
│   │   ├── leaders.js
│   │   ├── promotions.js
│   │   └── users.js
│   ├── routes/                 # API routes
│   │   ├── dishRouter.js
│   │   ├── commentRouter.js
│   │   ├── leaderRouter.js
│   │   ├── promoRouter.js
│   │   └── users.js
│   ├── uploads/                # File upload directory
│   ├── sessions/               # Session storage
│   └── populateDb.js           # Database seeding
│
├── React-Restaurant-App/       # React Frontend
│   ├── src/
│   │   ├── components/         # React components
│   │   │   ├── HeaderComponent.js
│   │   │   ├── FooterComponent.js
│   │   │   ├── MenuComponent.js
│   │   │   ├── DishdetailComponent.js
│   │   │   ├── AboutComponent.js
│   │   │   └── ContactComponent.js
│   │   ├── redux/              # Redux store and actions
│   │   │   ├── configureStore.js
│   │   │   ├── ActionTypes.js
│   │   │   ├── ActionCreators.js
│   │   │   ├── dishes.js
│   │   │   ├── comments.js
│   │   │   ├── leaders.js
│   │   │   └── promotions.js
│   │   └── shared/             # Shared utilities
│   │       └── baseUrl.js
│   └── public/
│
└── Angular-Restaurant-App/     # Angular Frontend
    ├── src/
    │   ├── app/
    │   │   ├── components/     # Angular components
    │   │   │   ├── header/
    │   │   │   ├── footer/
    │   │   │   ├── menu/
    │   │   │   ├── dishdetail/
    │   │   │   ├── about/
    │   │   │   └── contact/
    │   │   ├── services/       # Angular services
    │   │   │   ├── dish.service.ts
    │   │   │   ├── leader.service.ts
    │   │   │   └── promotion.service.ts
    │   │   └── shared/         # Shared models and utilities
    │   │       ├── dish.ts
    │   │       ├── leader.ts
    │   │       ├── promotion.ts
    │   │       └── baseurl.ts
    │   └── assets/
    └── angular.json
```

## 🛠️ Development

### Development Workflow

1. **Start all services**:
   ```bash
   # Terminal 1: Backend
   cd Server-Restaurant && npm run dev
   
   # Terminal 2: React Frontend
   cd React-Restaurant-App && npm start
   
   # Terminal 3: Angular Frontend
   cd Angular-Restaurant-App && npm start
   ```

2. **Access applications**:
   - Backend API: `http://localhost:8000`
   - React App: `http://localhost:3000`
   - Angular App: `http://localhost:4200`

### Code Quality

#### Backend
```bash
cd Server-Restaurant
npm run lint          # Lint code
npm test              # Run tests
```

#### React Frontend
```bash
cd React-Restaurant-App
npm test              # Run tests
npm run build         # Build for production
```

#### Angular Frontend
```bash
cd Angular-Restaurant-App
ng test               # Run tests
ng build              # Build for production
ng lint               # Lint code
```

### Database Management

#### View Database
```bash
# Using MongoDB Compass
# Connect to: mongodb://localhost:27017/conFusion

# Using MongoDB Shell
mongosh
use conFusion
db.dishes.find()
```

#### Reset Database
```bash
cd Server-Restaurant
npm run populate
```

## 🚀 Deployment

### Backend Deployment

#### Environment Variables for Production
```env
NODE_ENV=production
PORT=8000
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/restaurant
SECRET_KEY=your-production-secret-key
JWT_SECRET=your-production-jwt-secret
ALLOWED_ORIGINS=https://yourdomain.com,https://www.yourdomain.com
```

#### Deploy to Heroku
```bash
cd Server-Restaurant
heroku create your-restaurant-api
heroku config:set NODE_ENV=production
heroku config:set MONGO_URL=your-mongodb-atlas-url
git push heroku main
```

#### Deploy to DigitalOcean
```bash
# Set up Droplet with Node.js
# Upload code and run:
npm install
npm start
```

### Frontend Deployment

#### React App Deployment
```bash
cd React-Restaurant-App
npm run build
# Deploy build/ folder to Netlify, Vercel, or AWS S3
```

#### Angular App Deployment
```bash
cd Angular-Restaurant-App
ng build --prod
# Deploy dist/ folder to Netlify, Vercel, or AWS S3
```

### Docker Deployment

#### Backend Dockerfile
```dockerfile
FROM node:16-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
EXPOSE 8000
CMD ["npm", "start"]
```

#### Frontend Dockerfile (React)
```dockerfile
FROM node:16-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

## 🔧 Troubleshooting

### Common Issues

#### 1. MongoDB Connection Issues
```bash
# Check if MongoDB is running
sudo systemctl status mongodb

# Start MongoDB
sudo systemctl start mongodb

# Check MongoDB logs
sudo journalctl -u mongodb
```

#### 2. Port Already in Use
```bash
# Find process using port
lsof -i :8000
lsof -i :3000
lsof -i :4200

# Kill process
kill -9 <PID>
```

#### 3. Node.js Version Issues
```bash
# Check Node.js version
node --version

# Use nvm to switch versions
nvm use 16
```

#### 4. CORS Issues
```bash
# Check CORS configuration in Server-Restaurant/config.js
# Ensure frontend URLs are in ALLOWED_ORIGINS
```

#### 5. File Upload Issues
```bash
# Check uploads directory permissions
chmod 755 Server-Restaurant/uploads

# Check file size limits in config.js
```

### Performance Optimization

#### Backend
- Enable MongoDB indexing
- Implement caching with Redis
- Use compression middleware
- Optimize database queries

#### Frontend
- Enable code splitting
- Implement lazy loading
- Optimize images
- Use CDN for static assets

### Security Best Practices

#### Backend
- Use environment variables for secrets
- Implement rate limiting
- Validate all inputs
- Use HTTPS in production
- Regular security updates

#### Frontend
- Sanitize user inputs
- Implement CSRF protection
- Use secure HTTP headers
- Regular dependency updates

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**:
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Make your changes** and test thoroughly
4. **Commit your changes**:
   ```bash
   git commit -m 'Add amazing feature'
   ```
5. **Push to the branch**:
   ```bash
   git push origin feature/amazing-feature
   ```
6. **Open a Pull Request**

### Development Guidelines

- Follow the existing code style
- Write meaningful commit messages
- Include tests for new features
- Update documentation as needed
- Test on multiple browsers/devices

### Code Style

#### JavaScript/TypeScript
- Use ES6+ features
- Prefer const/let over var
- Use meaningful variable names
- Add JSDoc comments for functions

#### CSS/SCSS
- Use BEM methodology
- Keep specificity low
- Use CSS custom properties
- Mobile-first approach

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Prof. Jogesh Muppala** - Associate Professor at Hong Kong University of Science and Technology
- **React Team** - For the amazing framework
- **Angular Team** - For the comprehensive platform
- **Express.js Team** - For the web framework
- **MongoDB Team** - For the database

## 📞 Support

For support and questions:

- **Email**: support@restaurant-app.com
- **Issues**: [GitHub Issues](https://github.com/your-username/Restaurant/issues)
- **Documentation**: [Project Wiki](https://github.com/your-username/Restaurant/wiki)

---

**Made with ❤️ for the culinary arts**

*L'Étoile Restaurant - Where culinary artistry meets timeless elegance* 