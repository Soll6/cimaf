#!/usr/bin/env bash
set -euo pipefail

FLUTTER_VERSION="3.32.8"
FLUTTER_HOME="${HOME}/flutter"
FLUTTER_ARCHIVE="/tmp/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"

if [ ! -x "${FLUTTER_HOME}/bin/flutter" ]; then
  curl --fail --location --retry 3 \
    "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz" \
    --output "${FLUTTER_ARCHIVE}"
  rm -rf "${FLUTTER_HOME}"
  mkdir -p "${FLUTTER_HOME}"
  tar -xJf "${FLUTTER_ARCHIVE}" -C "${HOME}"
fi

export PATH="${FLUTTER_HOME}/bin:${PATH}"
flutter config --enable-web
flutter pub get
flutter build web --release