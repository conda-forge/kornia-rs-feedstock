set -ex

# Bundle all downstream library licenses
cargo-bundle-licenses \
  --format yaml \
  --output ${SRC_DIR}/THIRDPARTY_LICENSES.yaml

cd kornia-py
# Run the maturin build via pip which works for direct and
# cross-compiled builds.
$PYTHON -m pip install . -vv
