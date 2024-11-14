set -ex

# Bundle all downstream library licenses
cargo-bundle-licenses \
  --format yaml \
  --output ${SRC_DIR}/THIRDPARTY_LICENSES.yaml

maturin build -i $PYTHON --release -m kornia-py/Cargo.toml

cd kornia-py/target/wheels

# Install wheel manually
$PYTHON -m pip install *.whl
