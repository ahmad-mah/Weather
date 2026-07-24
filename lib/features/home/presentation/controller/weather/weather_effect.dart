sealed class WeatherEffect {
  const WeatherEffect();
}

class ShowOfflineSnackbar extends WeatherEffect {
  const ShowOfflineSnackbar();
}

class ShowFailureSnackbar extends WeatherEffect {
  const ShowFailureSnackbar(this.message);
  final String message;
}
