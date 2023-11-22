# Alibaba fonts

## Extracting fonts

1. Check out the [**alibaba-fonts/alibaba-fonts**](https://github.com/alibaba-fonts/alibaba-fonts) _submodule_:

    ```bash
    git submodule update --init --recursive
    ```
2. Run the `extract-fonts.sh` script:

    ```bash
    ./scripts/extract-fonts.sh
    ```
3. Then the fonts will be placed in the **`fonts`** directory.