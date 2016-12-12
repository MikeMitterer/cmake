# ┌──────────────────────────────────────────────────────────────────┐
# │  Google-Test                                                     │
# │     Weitere Infos: https://goo.gl/gi0yRm                         │
# └──────────────────────────────────────────────────────────────────┘

# Wenn das subdir ausserhalb des subproject-root liegt muss das [binary_dir]
# angegeben werden (https://goo.gl/ZQkCre)
add_subdirectory($ENV{GTEST_ROOT} test)


