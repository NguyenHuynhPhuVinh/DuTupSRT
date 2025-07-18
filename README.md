# 🎬 DuTupSRT - Ứng dụng xem YouTube với phụ đề SRT tùy chỉnh

> Ứng dụng Flutter hiện đại cho phép xem video YouTube với phụ đề SRT tùy chỉnh, mang đến trải nghiệm xem video tuyệt vời.

## ✨ Tính năng chính

- 📺 **YouTube Player** - Phát video YouTube toàn màn hình
- 📄 **SRT Support** - Upload file SRT hoặc paste nội dung phụ đề
- 🎬 **Subtitle Overlay** - Hiển thị phụ đề chồng lên video
- ⚙️ **Subtitle Controls** - Điều chỉnh timing, style, vị trí phụ đề
- 📚 **Video History** - Lưu lịch sử video đã xem với phụ đề
- 🎨 **Modern UI** - Material Design 3 với dark/light mode

## 🏗️ Kiến trúc dự án

### Cấu trúc thư mục

```
lib/
├── main.dart                           # Entry point
├── app/
    ├── routes/                         # Navigation management
    │   ├── app_pages.dart             # Route definitions & bindings
    │   └── app_routes.dart            # Route constants
    └── modules/                       # Feature modules (Clean Architecture)
        ├── main_screen/               # 🏠 Main navigation container
        │   ├── controllers/           # Business logic
        │   ├── bindings/             # Dependency injection
        │   └── views/                # UI components
        ├── video_input/               # 📺 YouTube URL & SRT input
        ├── video_player/              # 🎬 YouTube player với subtitle overlay
        ├── subtitle_editor/           # ✏️ Chỉnh sửa phụ đề
        ├── recent_videos/             # 📚 Lịch sử video đã xem
        └── app_settings/              # ⚙️ Cài đặt ứng dụng
```

### Nguyên tắc thiết kế

#### 🎯 **Clean Architecture + MVC Pattern**

- **Separation of Concerns**: Tách biệt UI, Business Logic và Data
- **SOLID Principles**: Code dễ maintain và mở rộng
- **Dependency Injection**: Quản lý dependencies tự động

#### 📱 **Reactive Programming với GetX**

```dart
// State Management
final novels = <Novel>[].obs;           // Observable data
final isLoading = false.obs;            // Loading state

// Reactive UI
Obx(() => controller.isLoading.value
  ? LoadingWidget()
  : NovelGrid()
)
```

#### 🔗 **Dependency Injection với Bindings**

```dart
class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    // Lazy loading - chỉ tạo khi cần
    Get.lazyPut<LibraryController>(() => LibraryController());
    Get.lazyPut<NovelService>(() => NovelService());
  }
}
```

## 🛠️ Tech Stack

### Core Framework

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language

### State Management & Navigation

- **GetX** - State management, routing, dependency injection
- **Get** - Navigation và dialog management

### UI Components

- **GetWidget** - Rich UI component library
- **Google Nav Bar** - Modern bottom navigation
- **Iconsax** - Beautiful icon set
- **Material Design 3** - Modern design system

### Data & Storage

- **Hive** - Fast NoSQL database
- **Hive Flutter** - Flutter integration
- **Flutter Secure Storage** - Secure data storage

### Video & YouTube

- **YouTube Player Flutter** - YouTube video player widget
- **Video Player** - Flutter video player support
- **Subtitle** - SRT subtitle parsing and processing

### Network & File Processing

- **Dio** - Powerful HTTP client
- **File Picker** - File selection from device
- **Permission Handler** - Handle device permissions
- **Connectivity Plus** - Network status monitoring

### UI Enhancements

- **Shimmer** - Loading skeleton effects
- **Liquid Pull to Refresh** - Beautiful refresh indicator
- **Smooth Page Indicator** - Page indicators
- **Auto Size Text** - Responsive text sizing
- **Cached Network Image** - Image caching and optimization

### Utilities

- **URL Launcher** - Open external links
- **Flutter SVG** - SVG image support

## 🚀 Cài đặt và chạy dự án

### Yêu cầu hệ thống

- Flutter SDK >= 3.8.1
- Dart SDK >= 3.0.0
- Android Studio / VS Code
- Git

### Các bước cài đặt

1. **Clone repository**

```bash
git clone https://github.com/your-username/dutup-srt.git
cd dutup-srt
```

2. **Cài đặt dependencies**

```bash
flutter pub get
```

3. **Chạy code generation (cho Hive)**

```bash
flutter packages pub run build_runner build
```

4. **Chạy ứng dụng**

```bash
flutter run
```

## 📋 Scripts hữu ích

```bash
# Cài đặt dependencies
flutter pub get

# Chạy code generation
flutter packages pub run build_runner build

# Clean và rebuild
flutter clean && flutter pub get

# Chạy tests
flutter test

# Build APK
flutter build apk --release

# Build iOS
flutter build ios --release
```

## 🏛️ Kiến trúc chi tiết

### 📦 Module Structure

Mỗi module trong dự án tuân theo pattern **MVC + Dependency Injection**:

```
module_name/
├── controllers/           # Business Logic Layer
│   └── module_controller.dart
├── bindings/             # Dependency Injection
│   └── module_binding.dart
└── views/                # Presentation Layer
    └── module_view.dart
```

### 🔄 Data Flow

```
User Action → View → Controller → Business Logic → Update State → View Auto-Update
```

### 🎯 Dependency Injection Flow

```
Route Called → Binding.dependencies() → Controller Created → View Uses Controller → Route Closed → Controller Auto-Disposed
```

## 📱 Screens Overview

### 🏠 Main Screen (Navigation Container)

- **Controller**: Quản lý tab navigation cho 5 tabs
- **View**: Google Nav Bar với responsive design
- **Features**: Smooth transitions, state persistence

### 📺 Video Input (YouTube & SRT Input)

- **Controller**: Validate YouTube URL, handle SRT file/content
- **View**: URL input field, file picker, text area
- **Features**: URL validation, file upload, paste content

### 🎬 Video Player (YouTube Player với Subtitle)

- **Controller**: YouTube player control, subtitle synchronization
- **View**: Fullscreen player với subtitle overlay
- **Features**: Play/pause, seek, fullscreen, subtitle display

### ✏️ Subtitle Editor (Chỉnh sửa phụ đề)

- **Controller**: Edit subtitle timing và content
- **View**: Timeline editor với preview
- **Features**: Timing adjustment, text editing, preview

### 📚 Recent Videos (Lịch sử video)

- **Controller**: Lưu trữ và quản lý lịch sử
- **View**: Grid layout với video thumbnails
- **Features**: History tracking, quick replay

### ⚙️ App Settings (Cài đặt ứng dụng)

- **Controller**: App preferences, subtitle styling
- **View**: Organized settings groups
- **Features**: Theme toggle, subtitle appearance, player settings

## 🔧 Development Guidelines

### 📝 Code Style

- **Naming**: camelCase cho variables, PascalCase cho classes
- **Comments**: Tiếng Việt cho business logic, English cho technical
- **Structure**: Một file một class, tối đa 300 lines

### 🧪 Testing Strategy

```bash
# Unit Tests - Business Logic
test/unit/controllers/

# Widget Tests - UI Components
test/widget/views/

# Integration Tests - Full Flow
test/integration/
```

### 🚀 Performance Best Practices

- **Lazy Loading**: Controllers chỉ tạo khi cần
- **Memory Management**: Auto-dispose với GetX
- **Image Caching**: CachedNetworkImage cho performance
- **Database**: Hive cho fast local storage

## 🤝 Contributing

### 📋 Development Workflow

1. **Fork** repository
2. **Create** feature branch: `git checkout -b feature/amazing-feature`
3. **Commit** changes: `git commit -m 'Add amazing feature'`
4. **Push** branch: `git push origin feature/amazing-feature`
5. **Open** Pull Request

### 🐛 Bug Reports

Sử dụng GitHub Issues với template:

- **Environment**: Flutter version, device info
- **Steps to reproduce**: Chi tiết các bước
- **Expected vs Actual**: Kết quả mong đợi vs thực tế
- **Screenshots**: Nếu có

## 📄 License

Dự án này được phân phối dưới MIT License. Xem `LICENSE` file để biết thêm chi tiết.

## 👥 Team

- **Developer**: Your Name
- **UI/UX**: Design Team
- **QA**: Testing Team

## 🙏 Acknowledgments

- **Flutter Team** - Amazing framework
- **GetX Community** - Powerful state management
- **Open Source Contributors** - All the amazing libraries

---

<div align="center">
  <p>Made with ❤️ and Flutter</p>
  <p>⭐ Star this repo if you find it helpful!</p>
</div>
