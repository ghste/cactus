# Cactus Inc. Dashboard App

A cross-platform (mobile & web) Flutter application for **Cactus Inc.**, the premier provider of high-style cacti.  
This app lets **vendors**, **employees**, and **customers** log in, access their respective dashboards, and manage cactus inventory, profiles, and orders with a responsive, adaptive UI.

---

## Table of Contents

1. [Overview](#overview)  
2. [Features](#features)  
3. [Architecture](#architecture)  
4. [Getting Started](#getting-started)  
5. [Modular (Feature-Based) Organization](#getting-started)  

---

## Overview

Cactus Inc. Dashboard App is built in Flutter using a **feature-module** approach:
- **Authentication** with persistent login state (via SharedPreferences on web/mobile).  
- **Vendor**, **Customer**, and **Employee** dashboards, each with its own feature module.  
- **Adaptive navigation** and **buttons** so UI/UX matches iOS, Android, and Web conventions.  
- **GoRouter** for declarative routing and conditional transitions (fade on logout, platform animations elsewhere).

---

## Features

- **Persistent Login**  
  - Stores user type (vendor/customer/employee) in local storage (SharedPreferences) so you stay logged in across page reloads on web or app restarts on mobile.

- **Role-Based Dashboards**  
  - **Vendor Dashboard**: View cactus inventory.  
  - **Customer Home**: Browse cactus catalog.
  - **Employee Profile**: Update your profile.

- **NavigationStack Helper**  
  - On **Web**: records URL history, uses `context.go(...)` to update address bar, and custom back logic.  
  - On **Mobile**: uses `context.push(...)`/`context.pop()` for native slide animations (iOS swipe-back, Android back button).

---

## Architecture

This project follows a **modular structure**—each “feature” lives in its own package 
 
---

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=2.17.0)  
- For Web: Chrome  
- For Mobile: Xcode (iOS) or Android Studio (Android) configured

## Modular (Feature-Based) Organization

“Modular” - splitting codebase into self-contained units (modules or packages), where each unit corresponds to a distinct feature or concern.

### Folder structure

- **cactus/**
  - **features/**
    - **core_ui/** - UI elements, page transitions, animations for iOS, Android, and Web conventions
    - **core_router/** - Routes, NavigationStack, AppRoutes
    - **feature_auth/** - AuthService, LoginPage, NotFoundPage
    - **dashboard/**
      - **dashboard_vendor/** - VendorDashboardPage, VendorSettingsPage
      - **dashboard_customer/** - CustomerHomePage
      - **dashboard_employee/** - EmployeeProfilePage
  - **lib/**
    - **main.dart** - Calls initAuthService(), sets up GoRouter
  - **pubspec.yaml**
  - **README.md**

Each of these folders is effectively its own mini-app (often called a “package” or “feature module”) with its own:

- **UI code** (pages, widgets, styling)
- **Business logic or “ViewModel”** (in MVVM, see below)
- **Data models or services** needed for that feature

### Benefits

#### Separation of Concerns

- Each module contains only the code related to one specific feature. For example, authentication logic lives in **feature_auth**, vendor-dashboard screens and logic live in **dashboard_vendor**, and so on.
- By isolating code in this way, we prevent unrelated features from creeping into each other. If a team member needs to work on the “customer dashboard,” they don’t have to march through authentication or routing code.

#### Reusability & Encapsulation

- Modules can be published as independent packages or reused across multiple apps. For instance, if we create a second Flutter app for a sister company, we could drop in **feature_auth** and **core_router** without re-writing or copying those files.
- Internally, each module exposes only what it needs to (for example, its public Page widgets or ViewModel classes) and hides implementation details in private files.

#### Parallel Development

- Teams can work on different modules simultaneously without merge conflicts. One developer can refine **dashboard_vendor** while another implements new auth flows in **feature_auth**, and a third tweaks page transitions in **core_ui**.

#### Scalability & Maintenance

- As the app grows, we simply add more feature folders. We avoid a monolithic `lib/` folder where everything lives—such a monolith often becomes unwieldy as the number of screens, services, and widgets grows.
- When a module becomes too large, we can split it into sub-modules or extract shared code into a separate package (for example, a “shared networking” or “storage” module).

#### Clear Dependency Graph

- We know exactly which modules depend on which:
  - Each dashboard module depends on **feature_auth** (to check login state) and on **core_ui** (for adaptive widgets).
- We avoid circular dependencies by enforcing a rule that modules only depend on layers below them (for example, the vendor dashboard might depend on **feature_auth** and **core_ui**, but **core_ui** does not depend on **dashboard_vendor**).
