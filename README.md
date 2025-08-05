# Dasher Prototype

A SwiftUI-based iOS prototype application featuring interactive maps powered by Mapbox and a comprehensive showcase of native iOS components.

## Prerequisites

- Xcode 26.0 or later
- Cursor AI Editor

## Setup Instructions

### Clone the Repository
```bash
git clone https://github.com/tduarte-dd/Dasher-Prototype.git
cd "Dasher Prototype"
```

### Configuration and Usage

- Instructions are available on [Google Docs](https://docs.google.com/document/d/1bsG73m-JH46BBuBy8MfJWoltFelblHDZO3o8z8NyO5E/edit?usp=sharing)

## Project Structure

```
Dasher Prototype/
├── Dasher Prototype/
│   ├── Dasher_PrototypeApp.swift      # App entry point
│   ├── ContentView.swift              # Main map view with bottom sheet
│   ├── ComponentShowcaseView.swift    # UI components showcase
│   ├── MapConfiguration.swift         # Map setup and location services
│   ├── Assets.xcassets/               # App icons and assets
│   └── DasherIcon.icon/              # Custom icon assets
├── Dasher-Prototype-Info.plist        # App configuration (Mapbox token here)
└── Dasher Prototype.xcodeproj/        # Xcode project file
```
## Overview

Dasher Prototype is a modern iOS application built with SwiftUI that demonstrates:
- **Interactive Maps**: Custom-styled Mapbox integration with user location tracking
- **Component Library**: Extensive showcase of native iOS UI components and controls
- **Modern UI**: Clean, glass-morphism design with bottom sheet interactions
- **Location Services**: CoreLocation integration for real-time positioning

## Features

### 🗺️ Map Integration
- Custom Mapbox style integration
- Real-time user location tracking with accuracy ring
- Follow-puck viewport for smooth navigation
- Location permission management

### 🎨 Component Showcase
The app includes a comprehensive showcase of iOS components including:
- **Typography**: Various text styles and font weights
- **Basic Controls**: Toggles, sliders, steppers
- **Input Controls**: Text fields, search bars, date pickers
- **Selection Controls**: Segmented controls, menus, pickers
- **Action Buttons**: Primary, secondary, and specialized button styles
- **Visual Elements**: SF Symbols, expandable sections, badges
- **Status & Progress**: Progress bars, loading indicators, status dots

## Key Components

### MapConfiguration.swift
- Handles Mapbox map setup and styling
- Manages location permissions via `LocationPermissionManager`
- Configures custom map style: `mapbox://styles/doordash/cm5x2b2jz00cj01slckm8h5w0`

### ContentView.swift
- Main app interface with map and bottom sheet
- Location permission requests
- Interactive UI elements with glass morphism design

### ComponentShowcaseView.swift
- Comprehensive showcase of iOS UI components
- Demonstrates SwiftUI best practices
- Interactive examples of various control types

## Customization

### Changing Map Style
To use a different Mapbox style, update the `customStyleURI` in `MapConfiguration.swift`:

```swift
static let customStyleURI = "mapbox://styles/your-username/your-style-id"
```

## Troubleshooting

### Map Not Loading
- Verify your Mapbox access token is correctly added to `Dasher-Prototype-Info.plist`
- Ensure you have an active internet connection

### Location Not Working
- Grant location permissions when prompted
- Check device/simulator location settings
- Verify `NSLocationWhenInUseUsageDescription` is set in Info.plist

### Build Errors
- Ensure you're using Xcode 15.0 or later
- Clean build folder (⌘+Shift+K) and rebuild
- Verify all dependencies are properly resolved

## Acknowledgments

- Built with SwiftUI and iOS 26+
- Maps powered by [Mapbox](https://www.mapbox.com)
- Icons and symbols from SF Symbols
- Custom styling inspired by modern mobile design patterns