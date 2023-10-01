# dns

DNSに関するTerraformのコードを管理するリポジトリです。

## ディレクトリ構成

```plain
-- README.md
-- main.tf
-- provider.tf
-- variables.tf
-- versions.tf
-- modules/
   -- <module>
      -- .terraform-docs.yml
      -- header.md
      -- main.tf
      -- outputs.tf
      -- variables.tf
      -- versions.tf
   -- ...
```

## terraform ドキュメントの生成

terraform-docsを使ってドキュメントを生成しています。

モジュールを作る場合、以下のファイルを作成する必要があります。

- `modules/<module>/header.md`: ヘッダーに表示する情報

```markdown
# Title

This module is ...
```

- `modules/<module>/.terraform-docs.yml`: ドキュメントの設定ファイル

```yaml
formatter: markdown table
header-from: header.md
output:
  file: README.md
  mode: inject
  template: |-
    <!-- BEGIN_TF_DOCS -->
    {{ .Content }}
    <!-- END_TF_DOCS -->
```

### ドキュメントの生成

以下のコマンドでドキュメントを生成できます。

```bash
terraform-docs modules/<module>/
```
