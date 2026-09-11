#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
for suite in test/mio/methods/*_test.cljc; do
  echo "== $suite =="
  bb "$suite"
done
kbb test/mio/cell_test.cljk
