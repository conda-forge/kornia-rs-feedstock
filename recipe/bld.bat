REM Create temp folder
mkdir tmpbuild_%PY_VER%
set TEMP=%CD%\tmpbuild_%PY_VER%

set PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1
REM Bundle all downstream library licenses
pushd crates\kornia
cargo-bundle-licenses ^
    --format yaml ^
    --output %SRC_DIR%\THIRDPARTY_LICENSES.yaml ^
    || goto :error
popd
REM set UTF-8 mode by default
chcp 65001
set PYTHONUTF8=1
set PYTHONIOENCODING="UTF-8"
set TMPDIR=tmpbuild_%PY_VER%
REM Run the maturin build via pip
cd kornia-py
%PYTHON% -m pip install . -vv
