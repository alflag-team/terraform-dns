# dns

DNS に関する Terraform のコードを管理するリポジトリです。

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

terraform-docs を使ってドキュメントを生成しています。

モジュールを作る場合、以下のファイルを作成する必要があります。

- `zones/<zone>/header.md`: ヘッダーに表示する情報

```markdown
# Title

This zone is ...
```

- `zones/<zone>/.terraform-docs.yml`: ドキュメントの設定ファイル

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
terraform-docs zones/<zone>/
```
