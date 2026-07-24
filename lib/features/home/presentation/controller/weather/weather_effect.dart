sealed class WeatherEffect {
  const WeatherEffect();
}

class ShowOfflineSnackbar extends WeatherEffect {
  const ShowOfflineSnackbar();
}

class ShowFailureSnackbar extends WeatherEffect {
  final String message;
  const ShowFailureSnackbar(this.message);
}
