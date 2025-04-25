vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO SanderVocke/shoop-zita-resampler
    REF "v1.8.0-3"
    SHA512 8d559d41de0423e2727dab2137e6d094d994d8232db78e4c547441c2d8f6e6a380bf7c9d23d8c8841f9b9cb53723aabcc3fcc4f47970320c79100707bd2d1ddf
    HEAD_REF main
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)
vcpkg_cmake_install()

file(GLOB files "${CURRENT_PACKAGES_DIR}/lib/cmake/zita-resampler/*.cmake")
foreach(file ${files})
  get_filename_component(filename ${file} NAME)
  file(RENAME "${file}" "${CURRENT_PACKAGES_DIR}/share/zita-resampler/cmake/${filename}")
endforeach()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/cmake")

file(MAKE_DIRECTORY ${CURRENT_PACKAGES_DIR}/debug/share/zita-resampler/cmake)
file(GLOB files "${CURRENT_PACKAGES_DIR}/debug/lib/cmake/zita-resampler/*.cmake")
foreach(file ${files})
  get_filename_component(filename ${file} NAME)
  file(RENAME "${file}" "${CURRENT_PACKAGES_DIR}/debug/share/zita-resampler/cmake/${filename}")
endforeach()
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/cmake")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

vcpkg_copy_pdbs()
vcpkg_cmake_config_fixup()
# vcpkg_fixup_pkgconfig()
