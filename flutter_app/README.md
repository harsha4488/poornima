# Poornima Jewellers Flutter App

Premium dark/gold vertical app experience for Poornima Jewellers.

## Current Bengaluru reference rates shown in the app

As checked on 16 September 2026:

- 24K gold: ₹15,317/g
- 22K gold: ₹14,040/g
- 18K gold: ₹11,488/g
- Silver: ₹245/g

These are indicative market reference rates, not Poornima showroom quotes. Verify showroom pricing before publishing as an official rate card.

## Run locally

```bash
flutter pub get
flutter run -d chrome
```

## Build for `poornimajewellers.com/app/`

```bash
flutter clean
flutter pub get
flutter build web --base-href /app/
```

The output is in `build/web/`. Deploy that folder under the `/app/` path of the website host.

## Important

The app uses the supplied Poornima logo mark and the Poornima jewellery image set included in `assets/images`.
