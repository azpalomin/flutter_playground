class Environment {
  // check that this var will actually be set (-Ddart.vm.product=true  or  kReleaseMode)
  static const String environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
  static const bool dev = environment == 'dev';
  static const bool internal = dev || stage || local;
  static const bool invalid = !dev && !stage && !prod && !local;
  static const bool local = environment == 'local';
  static const bool prod = environment == 'prod';
  static const bool stage = environment == 'stage';
  static const bool test = dev || local;

  static const stripeMerchantIdentifier = 'stutor.flutter.stripe';
  static const stripeUrlScheme = 'flutterstripe';

  static String get vapidKey {
    if (prod) return 'BNOwuVdJt0jhccDoKvHOhePlmk8ZFNVNvEVgoA2JLL-5gtI9wWHn5CtOCz2U8HLdjElBo_lJ6XbQN9NkJzzVD1o';
    if (stage) return 'BGXa_OQ-ZT63L_-l3ewNhNUNzisqAaPvVkgBOZj-yYqW9aRjEQNoZklf73uaFnFNkC-MXMd8FGfYu0VB6QzWzk8';
    if (test) return 'BGF8Orq770KRN3kL5s0WD5PiSFKyrodIhJCLDJSIUxY_KXxfFpxNVOWFtDXvZ2VKPEGdrcPJZ36OohICIx1wV5M';
    throw UnsupportedError('Vapid key not set for environment $environment');
  }

  static String get apiUrl {
    if (dev) return 'us-central1-stutor-dev.cloudfunctions.net';
    if (local) return 'localhost:5001';
    if (prod) return 'us-central1-stutor-547d4.cloudfunctions.net';
    if (stage) return 'us-central1-stutor-448b2.cloudfunctions.net';
    throw UnsupportedError('Api url not set for environment $environment');
  }

  static String get gcStorageUrl {
    if (dev) return 'gs://stutor-dev.appspot.com/';
    if (local) return 'gs://stutor-dev.appspot.com/';
    if (prod) return 'gs://stutor-547d4.appspot.com/';
    if (stage) return 'gs://stutor-448b2.appspot.com/';
    throw UnsupportedError('Google cloud storage uri not set for environment $environment');
  }

  static String get stripePublishableKey {
    if (prod) {
      return 'pk_live_51LEzBhFuL90xChNXWvGagLnIbzcnOK5Om33eSsQOlT6n78N4oAALQ9ZPaR'
          'j7u8dsga218oVI1g1sfUJEH9ILMZrf00ZjPjbEWG';
    }
    if (!prod && !invalid) {
      return 'pk_test_51LEzBhFuL90xChNXk4aGAhyCCoKEBQUFlNn1uidT7B9Uhs8KiGIhrS5ozHa'
          'ijMuM3SKEkKn6WWJPSl0W0Jccgn2f0067SxXok9';
    }
    throw UnsupportedError('Stripe merchant identifier not set for environment $environment');
  }

  static String urlExtension(String path) {
    if (local) return '/stutor-dev/us-central1$path';
    return path;
  }
}
