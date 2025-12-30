;;; +gptel.el --- GPTel -*- lexical-binding: t; -*-

(use-package gptel
  :straight t
  :defer t
  :config
  ;; Default GPTel model and backend
  (setq gptel-model 'claude-sonnet-4
        gptel-backend (gptel-make-gh-copilot "Copilot"))

  ;; Expert mode
  (setq gptel-expert-commands t)
  ;; Autoscroll when AI is typing
  (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)

  ;; Register backends
  (gptel-make-gemini "Gemini" :stream t :key gptel-api-key)
  (gptel-make-anthropic "Claude" :stream t :key gptel-api-key)
  (gptel-make-openai "OpenRouter"
    :host "openrouter.ai"
    :endpoint "/api/v1/chat/completions"
    :stream t
    :key gptel-api-key
    :models '(
              google/gemini-2.5-pro
              google/gemini-2.5-flash
              anthropic/claude-sonnet-4.5)))

(use-package gptel-magit
  :straight t
  :defer t
  :hook (magit-mode . gptel-magit-install))
