# ┌──────────────────────────────────────────────────────────────────┐
# │  GPIO Zugriff RASPI                                              │
# └──────────────────────────────────────────────────────────────────┘

# Wenn das subdir ausserhalb des subproject-root liegt muss das [binary_dir]
# angegeben werden (https://goo.gl/ZQkCre)
add_subdirectory($ENV{GPIO_ROOT} gpio)



