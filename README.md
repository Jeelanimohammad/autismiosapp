# Autism iOS App, Web App, Backend REST API & Database Platform

Complete multi-platform repository containing the iOS Native Application (Swift / SwiftUI), Web Application (React / Vite), PHP REST API Backend, and MySQL Database Schema.

## Repository Structure

```
├── FRONTEND/   # Native iOS Application (Xcode project written in Swift / SwiftUI)
├── WEB/        # Web Application (React / Vite single-page application)
├── BACKEND/    # PHP REST API Backend (Server endpoints for Auth, Assessment, Advice)
└── DATABASE/   # MySQL Database Dump (autism_database.sql)
```

---

## 📱 iOS App (`FRONTEND`)

### Tech Stack & Prerequisites
- **Language**: Swift 5+
- **UI Framework**: SwiftUI
- **IDE**: Xcode 15+
- **Minimum iOS Version**: iOS 15.0+

### Setup Instructions
1. Open `FRONTEND/Autism.xcodeproj` in **Xcode**.
2. Update the backend URL in `FRONTEND/Autism/Common/NetworkManager.swift`:
   ```swift
   let baseURL = "http://YOUR_SERVER_IP_OR_DOMAIN/autism"
   ```
3. Select your Simulator or Connected iOS Device and press **Run** (`⌘R`).

---

## 🌐 Web Application (`WEB`)

### Tech Stack
- **Framework**: React 19 / Vite
- **Routing**: React Router DOM
- **Icons**: Lucide React
- **Charts**: Recharts

### Setup Instructions
1. Navigate to the web folder:
   ```bash
   cd WEB
   npm install
   ```
2. Start development server:
   ```bash
   npm run dev
   ```
3. Build for production:
   ```bash
   npm run build
   ```

---

## ⚙️ Backend REST API (`BACKEND`)

### Tech Stack
- **Server**: PHP 7.4+ / 8.x (Apache / Nginx / XAMPP / WAMP)
- **Database**: MySQL / MariaDB

### Deployment Instructions
1. Upload the files inside `BACKEND/` to your server web root (e.g. `/var/www/html/autism` or `htdocs/autism`).
2. Update database connection settings in `BACKEND/config.php`:
   ```php
   $host = "127.0.0.1";
   $user = "root";
   $pass = "";
   $db   = "autism";
   ```

---

## 🗄️ Database (`DATABASE`)

### Setup Instructions
1. Create a MySQL database named `autism`.
2. Import `DATABASE/autism_database.sql`:
   ```bash
   mysql -u root -p autism < DATABASE/autism_database.sql
   ```
   *or import via phpMyAdmin.*
