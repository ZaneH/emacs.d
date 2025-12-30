# emacs.d config

> [!note]
> When starting Emacs for the first time, set `LSP_USE_PLISTS` to true to avoid
> [this issue](https://github.com/emacs-lsp/lsp-mode/issues/3311#issuecomment-1010074041). If the LSP server starts acting up,
> remove `~/.emacs.d/straight/repos/lsp*` folders and re-run the command below.

```bash
$ LSP_USE_PLISTS=true emacs
```

### Requirements

**npm**

- `typescript`
- `typescript-language-server`
- `copilot-language-server`

## Preview

![Emacs config preview](./screenshot.png)
