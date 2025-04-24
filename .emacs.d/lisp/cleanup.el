;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Removes *scratch* from buffer after the mode has been set.
;; (defun remove-scratch-buffer ()
;;   (if (get-buffer "*scratch*")
;;       (kill-buffer "*scratch*")))
;; (add-hook 'after-change-major-mode-hook 'remove-scratch-buffer)

;; Removes *messages* from the buffer.
;; (setq-default message-log-max nil)
;; (kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
;; (add-hook 'minibuffer-exit-hook
;;       '(lambda ()
;;          (let ((buffer "*Completions*"))
;;            (and (get-buffer buffer)
;;                 (kill-buffer buffer)))))
