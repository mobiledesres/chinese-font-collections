# Alibaba fonts

## Available fonts

* [Alibaba PuHuiTi 阿里巴巴普惠体](https://fonts.alibabagroup.com/#/font)
* [More free fonts 更多免费字体](https://fonts.alibabagroup.com/#/font)

## Extracting fonts

1. Check out the [**alibaba-fonts/alibaba-fonts**](https://github.com/alibaba-fonts/alibaba-fonts) _submodule_:

    ```bash
    git submodule update --init --recursive
    ```
2. Run the [**`scripts/extract-fonts.sh`**](./scripts/extract-fonts.sh) script:

    ```bash
    ./scripts/extract-fonts.sh
    ```
3. Then the fonts will be placed in the **`fonts`** directory.

## Clean up extracted fonts

Run the [**`scripts/clean-up.sh`**](./scripts/clean-up.sh) to clean up:

```bash
./scripts/clean-up.sh
```