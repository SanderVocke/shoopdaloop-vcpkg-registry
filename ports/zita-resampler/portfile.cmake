vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SanderVocke/shoop-zita-resampler
    REF "v1.8.0-4"
    SHA512 a1da72c41213526606924669e13ccf30da1902137cec21cb63c32a4cee7df40d35bd63b11affcf3ed3e5edc4a967bc126811bc06b70410c216460aaa32ebb4c6
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()
# vcpkg_fixup_pkgconfig()
