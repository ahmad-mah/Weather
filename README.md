# Weather App

A Flutter weather app that shows current weather for any city — works offline, adapts to any screen size, and loads instantly from cache.

---

## How It Works (Non-Technical)

1. **Open the app** → A splash animation plays, then the home screen appears.
2. **Cache check** → If you've searched before, your last result shows immediately — no loading, no waiting. The app doesn't even ask the internet.
3. **First time / no cache** → The app asks for your location. If you allow it, weather for your city shows up. If you deny, it defaults to a fallback city.
4. **Search a city** → Type a city name and tap search. A shimmer placeholder appears while loading, then the weather data slides in.
5. **Offline?** → If you search without internet, a red snackbar pops up saying "No internet connection" — nothing else changes.
6. **Fresh data when online** → Every successful search saves the result to local storage. Next time you open the app, that cached data is what you see first — the app upgrades it later if you search again online.

---

## Requirements Checklist

### ✅ All Required Features (Met)

| Feature | What It Does | Where |
|---|---|---|
| **City Search** | Text field + search button to look up any city | `search_text_field.dart` |
| **Weather Display** | Shows city name, temperature, condition text, and weather icon | `mobile_header_section.dart`, `tablet_header_section.dart`, `desktop_header_section.dart` |
| **Loading State** | Skeleton shimmer while fetching — no spinner, just a smooth placeholder | `home_mobile_view_body.dart` (via Skeletonizer) |
| **API Integration** | Connects to WeatherAPI.com with a configurable API key | `api_service.dart` + `.env` |
| **State Management** | BLoC pattern manages all state — weather data, location, and UI transitions | `weather_cubit.dart`, `location_cubit.dart` |
| **Error Handling** | Shows error messages for invalid cities and network failures | `weather_failed_content.dart`, `use_weather_effects.dart` |
| **Code Quality** | Clean Architecture (data / domain / presentation layers), dependency injection, atomic widgets | Full project structure |

### ✅ Bonus Features (Met)

| Feature | What It Does | Where |
|---|---|---|
| **Responsive Design** | Three separate layouts: mobile, tablet, desktop — auto-detected by screen width | `home_adaptive_layout.dart` + 3 view body files |
| **Offline Caching** | Saves last successful search to Hive (local database). Cache-first strategy: show cache immediately, refresh later | `weather_local_data_source.dart`, `weather_repository_impl.dart` |

---

## Architecture

```
┌────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                      │
│                                                            │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐                 │
│  │  Mobile  │  │  Tablet  │  │ Desktop  │  3 responsive   │
│  │  View    │  │  View    │  │  View    │  layouts         │
│  └────┬─────┘  └────┬─────┘  └────┬─────┘                 │
│       └──────────────┼─────────────┘                       │
│                      ▼                                     │
│  ┌──────────────────────────────────────┐                  │
│  │         WeatherCubit                 │  Manages state   │
│  │         LocationCubit                │  and side effects│
│  └──────────────┬───────────────────────┘                  │
└─────────────────┼──────────────────────────────────────────┘
                  │
┌─────────────────┼──────────────────────────────────────────┐
│                 ▼                 DOMAIN LAYER              │
│  ┌──────────────────────────────────────┐                  │
│  │  GetWeatherUseCase                   │  Business logic  │
│  │  WeatherRepository (abstract)        │  contracts       │
│  └──────────────────┬───────────────────┘                  │
└─────────────────────┼──────────────────────────────────────┘
                      │
┌─────────────────────┼──────────────────────────────────────┐
│                     ▼               DATA LAYER              │
│  ┌────────────────────┐  ┌────────────────────┐            │
│  │  RemoteDataSource  │  │  LocalDataSource   │            │
│  │  (WeatherAPI.com)  │  │  (Hive — on disk)  │            │
│  └─────────┬──────────┘  └─────────┬──────────┘            │
│            │                       │                       │
│            ▼                       ▼                       │
│       InternetService          weather_cache              │
│       (connectivity)           (Hive box)                 │
└───────────────────────────────────────────────────────────┘
```

### Why This Architecture

- **Data Layer** talks to the outside world — the API and local storage.
- **Domain Layer** defines "what the app can do" — use cases and rules.
- **Presentation Layer** handles the UI and user interactions.

Each layer only talks to the layer below it. This keeps the code testable, swappable, and maintainable. Want to change the API? Only the data layer changes. Want to redesign the UI? Only presentation changes.

---

## Data Flow

```
USER TYPES CITY
       │
       ▼
SearchTextField calls weatherCubit.searchWeather(city)
       │
       ▼
WeatherCubit checks internet
       │
       ├── OFFLINE ──► ShowOfflineSnackbar effect → red snackbar → return
       │
       └── ONLINE ──► emit(WeatherLoading)
                       │
                       ▼
                GetWeatherUseCase.execute(city)
                       │
                       ▼
                WeatherRepositoryImpl.getWeather(city)
                       │
                       ├── Read cache first (always)
                       │
                       ├── Check internet
                       │
                       ├── ONLINE:
                       │    ├── Call API via RemoteDataSource
                       │    ├── Save result to LocalDataSource (Hive)
                       │    └── Return fresh data
                       │
                       └── OFFLINE / API ERROR:
                            ├── Have cache? → Return cached (stale) data
                            └── No cache?  → Return Failure
                       │
                       ▼
                result.fold(
                  failure → emit(WeatherFailed) + ShowFailureSnackbar
                  data    → emit(WeatherSuccess)
                )
```

---

## Caching Strategy (Offline-First)

| Scenario | Behavior |
|---|---|
| **App start, cache exists** | Show cached data instantly. No API call. |
| **App start, no cache** | Trigger location search → fetch from API. |
| **User searches online** | Fetch from API, save to cache, show fresh data. |
| **User searches offline** | Show snackbar "No internet". Don't change current UI. |
| **API fails, cache exists** | Return cached data silently (stale is better than error). |
| **API fails, no cache** | Show error screen. |

---

## Project Structure

```
lib/
├── app.dart                          # App entry — MaterialApp.router + DevicePreview
├── main.dart                         # Initialization — Hive, dotenv, service locator
│
├── core/                             # Shared across all features
│   ├── constants/                    # App strings, Lottie asset paths
│   ├── di/                           # Service locator (get_it)
│   ├── error/                        # Failure types, API exception
│   ├── extensions/                   # Theme helpers, location formatters
│   ├── helpers/                      # Snackbar, status bar
│   ├── routes/                       # GoRouter config
│   ├── services/                     # ApiService, InternetService, LocationService
│   ├── theme/                        # Colors, themes
│   ├── typography/                   # Responsive font sizing
│   └── widgets/                      # Shared UI — error widget, loading spinner, keyboard dismisser
│
├── features/
│   ├── splash/                       # Animated Lottie splash → auto-navigate
│   └── home/                         # Main weather feature
│       ├── data/                     # API calls, Hive storage, repository implementation
│       ├── domain/                   # Weather entity, repository interface, use case
│       └── presentation/
│           ├── controller/           # WeatherCubit + LocationCubit + states + effects
│           ├── hooks/                # useWeatherEffects — snackbar subscription
│           └── view/
│               ├── widgets/          #
│               │   ├── desktop/      # Desktop-specific weather content
│               │   ├── mobile/       # Mobile-specific content
│               │   ├── tablet/       # Tablet-specific content
│               │   ├── search_text_field.dart
│               │   ├── location_button.dart
│               │   ├── weather_failed_content.dart
│               │   ├── details_card_info.dart
│               │   └── home_adaptive_layout.dart
│               ├── home_view.dart
│               ├── home_mobile_view_body.dart
│               ├── home_tablet_view_body.dart
│               └── home_desktop_view_body.dart
```

---

## Responsive Breakpoints

| Screen Width | Layout | Key Differences |
|---|---|---|
| < 750px | **Mobile** | Single-column, bottom-aligned, compact details card |
| 750 – 1200px | **Tablet** | Centered, wider padding, same core widgets |
| ≥ 1200px | **Desktop** | Air conditions section (8 metrics), sliver layout, wider spacing |

---

## Tech Stack

| Package | Purpose |
|---|---|
| **flutter_bloc** | State management (BLoC pattern) |
| **dio** | HTTP client for API calls |
| **hive_ce** | Local caching (Hive Community Edition) |
| **get_it** | Dependency injection |
| **go_router** | Declarative routing |
| **geolocator** | Device location |
| **internet_connection_checker_plus** | Internet connectivity check |
| **flutter_screenutil** | Responsive screen sizing |
| **skeletonizer** | Shimmer loading placeholders |
| **flutter_hooks** | Hook-based lifecycle |
| **lottie** | Animations (splash, error) |
| **cached_network_image** | Weather icon caching |
| **flutter_dotenv** | Environment variables (API key) |

---

## Setup

1. Clone the repo.
2. Add your WeatherAPI key to `.env`:
   ```
   API_BASE_URL=https://api.weatherapi.com/v1
   API_KEY=your_key_here
   ```
3. Run `flutter pub get`.
4. Run `flutter run`.

---

## What It Looks Like

| Mobile | Tablet | Desktop |
|---|---|---|
| City + temp + icon | Centered layout | Full-width with air conditions panel |
| Details card below | Details card to side | Sliver scrolling |
| Search bar at top | Same header structure | Gradient background |
