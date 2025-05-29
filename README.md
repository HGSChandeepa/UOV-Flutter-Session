# 📱 UOV Flutter Session

Here is the full code repository from the flutter session for UOV .
This Flutter Notes App project is designed to help you understand the fundamentals of building, structuring, and managing a Flutter application with clean architecture and state management.

## 🎓 Learning Resources

### 1. DP Education IT Campus — Flutter Series (By Me)

A beginner-friendly, structured Flutter series to learn Flutter from scratch with practical examples.

[![DP Education Flutter Course](dp.png)](https://youtube.com/playlist?list=PLWOPiU7tDzap4WdZn4ZbdUj9dfqgDLxKW&si=CTY42KTJ4Wyx-2cb)
🔗 [**Watch the Course on YouTube**](https://youtube.com/playlist?list=PLWOPiU7tDzap4WdZn4ZbdUj9dfqgDLxKW&si=CTY42KTJ4Wyx-2cb)

### 2. Adomic YouTube Channel — Advanced Projects & Tutorials

Here I post more advanced Flutter apps, real-world tutorials, and dev tips to help you level up as a software engineer.

[![Adomic YouTube Channel](adomic.png)](https://www.youtube.com/@adomicarts)
🔗 [**Visit Adomic Channel**](https://www.youtube.com/@adomicarts)

## 📝 About the Project

This is a simple **Notes App** built with Flutter. It allows users to:

* ✍️ Create new notes
* 📝 Edit existing notes
* 🗑️ Delete notes
* 🕒 Automatically manage creation and update timestamps

Each note includes:

* `title`: A short heading
* `description`: The content of the note
* `createdAt`: DateTime the note was created *(auto-set)*
* `updatedAt`: DateTime the note was last updated *(auto-set)*

## 🛠️ Folder Structure

```
lib/
├── models/
│   └── note.dart           # Note model with factory constructor
│
├── services/
│   └── note_service.dart   # Logic for CRUD operations
│
├── widgets/
│   └── note_tile.dart      # UI component for displaying a note
│
└── pages/
    └── notes_page.dart     # Main screen showing the list of notes
```

## 🚀 Getting Started

### ✅ Prerequisites

* Flutter SDK installed
* Android Studio or VS Code
* Connected device or emulator

### 📦 Installation

```bash
git clone https://github.com/your-username/uov-flutter-session.git
cd uov-flutter-session
flutter pub get
flutter run
```
## 💡 Features

* ✍️ Add, edit, and delete notes
* 🕒 Auto-managed timestamps
* 💼 Clean architecture and folder structure
* 🎯 Minimal, professional UI

## 🙌 Contributing

Feel free to fork this repo, suggest improvements, or submit pull requests.
You can also use this as a starter template for your own Flutter apps!

## 📫 Contact

* 🎓 [Learn from DP Education Flutter Series](https://youtube.com/playlist?list=PLWOPiU7tDzap4WdZn4ZbdUj9dfqgDLxKW&si=CTY42KTJ4Wyx-2cb)
* 📺 [Subscribe to Adomic YouTube Channel](https://www.youtube.com/@adomicarts)



Let me know if you'd like to include badges, add a license section, or convert this into a `README.md` file!
