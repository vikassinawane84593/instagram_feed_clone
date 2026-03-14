# Flutter Instagram Feed Clone

A pixel-perfect replication of the Instagram Home Feed built with Flutter.

## Features

* Instagram style Home Feed UI
* Stories Row
* Image Carousel (Multiple Images)
* Dot Indicator
* Like Toggle ❤️
* Save Toggle 🔖
* Double Tap to Like
* Pinch to Zoom Image
* Infinite Scroll (Pagination)
* Shimmer Loading State
* Snackbar for Unimplemented Buttons

## Architecture

This project follows a clean architecture with separation of concerns.

Folder Structure:

lib/

* models → Post data model
* services → Repository for fetching mock data
* providers → State management using Provider
* widgets → Reusable UI components
* screens → Application screens

State Management: **Provider**

## Mock Data Layer

Posts are fetched using a repository layer which simulates a network request with a **1.5 second delay**.

Pagination is implemented to load **10 posts per page**.

## Packages Used

* provider
* cached_network_image
* shimmer

## Run Project

Clone the repository and run:

flutter pub get
flutter run

## Demo

The demo video demonstrates:

* Shimmer loading state
* Infinite scrolling
* Image carousel
* Pinch to zoom
* Like and save toggle

## Author

Vikas Sonawane