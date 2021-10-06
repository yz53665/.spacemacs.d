
(defun qrq/file-name-nosuffix ()
  "返回当前文件名（无后缀）"
  (let (str)
    (setq str (file-name-nondirectory (buffer-file-name)))
    (string-match "^\\([^\\.]+\\)" str)
    (match-string 1 str)
    )
  )

(defun qrq/newline-at-80 ()
  "在第80列新建一行并缩进, 如果80列在一个词的中间, 则将整个词都放到下一行。"
  (move-to-column 80)
  (pyim-backward-word)
  (newline-and-indent)
  )

(defun qrq/auto-newline ()
  "在当前行每隔80列就调用`qrq/newline-at-80'新建一行并缩进"
  (interactive)
  (end-of-line)
  (while (> (current-column) 80)
    (qrq/newline-at-80)
    (end-of-line)
    )
  )

(defun qrq/add-prefix-at-beginning-of-line (prefix)
  "将该符号插入到该行开头"
  (beginning-of-line)
  (skip-chars-forward " \n\t")
  (insert prefix " ")
  )

(defun qrq/add-prefix-for-multiple-line ()
  "输入向下操作的行数（包括本行）, 为每一行调用`qrq/add-prefix-at-beginning-of-line'"
  (interactive)
  (setq numDownLines (read-number "please enter the number of line:"))
  (setq thePrefix (read-string "please enter the prefix:"))
  (dotimes (i (+ 1 numDownLines))
    (qrq/add-prefix-at-beginning-of-line thePrefix)
    (next-line))
  )
