set -ex

pushd crates/kornia
# Bundle all downstream library licenses
cargo-bundle-licenses \
  --format yaml \
  --output ${SRC_DIR}/THIRDPARTY_LICENSES.yaml
popd

# Run the maturin build via pip which works for direct and
# cross-compiled builds.
cd kornia-py
$PYTHON -m pip install . -vv
