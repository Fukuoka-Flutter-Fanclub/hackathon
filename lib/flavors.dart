enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor appFlavor = Flavor.dev;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'FFFdev';
      case Flavor.prod:
        return 'FFF';
    }
  }
}
