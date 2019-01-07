Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F2C3A7D08A
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 18:21:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728472AbfAGSV3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 13:21:29 -0500
Received: from com-out001.mailprotect.be ([83.217.72.83]:38451 "EHLO
        com-out001.mailprotect.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727304AbfAGSV3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 13:21:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=mailprotect.be; s=mail; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:
        in-reply-to:references; bh=9YLyDGyQWtHR2s0wLXVijIbxHcuDXWqix93eZ8QDEcY=; b=aM
        af6rMQ/nbL/a3s4TdlBz8DfxvSVTom+agEe4sVKA78y4EFj6l+0glTiEQMALEg1seP41yX8PRPgIi
        Q798ITOuWM6lh+37uY0kzWGZbqjrdxph5SDoiZcT+uU8cweBiBxVZlWKRGS4QCNep1Ah3hlruLdPw
        bQz2p9Sz+CA/0UbCF28dksXzOjec94qAoJQmHJ4BYd5tXyYiq7wVfHpIP4EO/pfTECfcNHf73bqDR
        7xK2GwNsLnsr3Zf6SL+9848JGUq3gGiwY5qqSdNoYpLrrgEauH73nUuigzw1Z9VGjuz2ZIvPp4e1X
        dSA0KE14mhYH8xbVpn4ohgjmkK9lD3ww==;
Received: from smtp-auth.mailprotect.be ([178.208.39.155])
        by com-mpt-out001.mailprotect.be with esmtp (Exim 4.89)
        (envelope-from <bvanassche@acm.org>)
        id 1ggZWP-000C4V-Kk; Mon, 07 Jan 2019 19:21:11 +0100
Received: from desktop-bart.svl.corp.google.com (unknown [104.133.8.89])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id DD50CC065E;
        Mon,  7 Jan 2019 19:20:50 +0100 (CET)
From:   Bart Van Assche <bvanassche@acm.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        Matthew Wilcox <willy@infradead.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>
Subject: [PATCH v3] Documentation/CodingStyle: Use directory-local variables for emacs settings
Date:   Mon,  7 Jan 2019 10:20:19 -0800
Message-Id: <20190107182019.105393-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.20.1.97.g81188d93c3-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: 178.208.39.155
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be; auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.16)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5k8/ragi40yYQ1zUo7Peavp602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
 q3u0UDjvO1tLifGj39bI0bcPyaJsYTbWtxh170GAlLRQQirzS8Ej74tvJl+kejD7XF6qTl1z05KP
 Dlm6u9FOXYQAbOhP3wJx0B1Kli8412NpJuPmlKufNYl2xo1qSdLaIk3PUj34BRKK9KYXzdAftckI
 swXHMQglVTIC8NFb2K6mbgbhB8m6qLCUtp2wOt1wm+n0sYFBEAW8lXHKU/GHm7TrW1z8JcZpMI8x
 YW2tNVR2bqNnmK7jSfNgOl85udZmC2Jv/KM6kK+dBqSM+qgAyAtf3mw1tQ9lQ9o9xVTnWfFVsTho
 KBlYzYE+hyv3PZDuZXZrrcb6WYRTkR7/YSxPV67jOaoC6e3vleHwaSET3bnQBsvVjaLa3+C42KAw
 grIA8TLxceSwvcFI62DY1w00QBcHd7zH2ME2JKDpGk/O3CQQHpe9GDh+QIFX5ugSTlF1vzLkBVUz
 WPc3xbfOVk5MCU0jW8bXCPZUeL3CKWXYU4+HG/DSc7nyNXySH0HEdXILl5h/F/019BRWIzP4ZPBR
 c8+Va2V8WLeZLipDgF4utXyGn+ro1yerjZCi1wqwfDnsQ/PVffloaludTaMNo6pBFS0W238/RbXg
 +u1vvosEWLiVYOJOgXwr62hCYuKCAcx7pfRJ+OJQST+CWxKbQsF9LvjeFw5uWalnIKDFkcg0DoDn
 7tP2jpvLFnNIEcZRPRtGZ1iNinenfzUf+GHsZRIpj8SRIZ4GpxZ6EipRzMVZ5LqwTx7Vvn9Sw3mz
 fV9lGlXMG6G//fQ7IIjh+hITOh388KckIElRoQjfjsgpF40wKc/Quif7UGLMdg3BUG9OPnB9+HBH
 QdhTXAeYUOp7A73HI6oJg7w/VoeBAJh8VSCv3ltAjS29xE5ZvUqIaqtHQT07rrP9ghYmXURlmGZY
 k8A8ENcWiEUThWM3339KCYwltwN/kUzdm0rqMDRcCgYQIezXimM8MMGBqU+0UHcV5J2FAheG+6p+
 OAm8ke9XRsSRhjbv8nXCRaGkJQifhumQOuk0hocUiLPjIsF4nWJY1XSeL7EZ41ZZvTqJDjUkLAKs
 amdWUS/4bIXFrUlLXA+tgMP9y2mItEhbnScHL8+lTGBIVE9xbEkX79uIFhWWqUGwGWdx0EaNcjX6
 LmdtwZccARixsi/mDaLj4B1/rxbQicf/5tMwo2bfwwcoLOX2zx7G4m3tArck3P6KiyZfHrh08QZz
 CYVxkkO4Q2QtHTNlfuK3ZBoXBNrUsKsxL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@com-mpt-mgt001.mailprotect.be
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In emacs 23.1 support for directory-local variables was added (see also
https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html).
Simplify the settings in coding-style.rst by using that feature.
Additionally, do not inherit any settings from emacs' linux coding style
to minimize dependencies on the version of emacs that is being used.

I have verified with several large and nontrivial kernel source files
that the new settings format code according to what checkpatch expects.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Alison Chaiken <alison@she-devel.com>
Cc: Joe Perches <joe@perches.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Geyslan G. Bem <geyslan@gmail.com>
Cc: Tiago Natel de Moura <tiago4orion@gmail.com>
---

Changes compared to v2:
- Also updated the Italian and Chinese translations of coding-style.rst.

Changes compared to v1:
- Removed top-level .dir-locals.el file again and updated coding-style.rst
  instead.
- Restored c-lineup-gcc-asm-reg.
- Restored the humourous paragraph about emacs.
- Left out Italian and Chinese translations.

 Documentation/process/coding-style.rst        | 57 ++++++++++++-------
 .../it_IT/process/coding-style.rst            | 57 ++++++++++++-------
 .../translations/zh_CN/coding-style.rst       | 57 ++++++++++++-------
 3 files changed, 111 insertions(+), 60 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index b78dd680c038..afa11024279a 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -595,26 +595,43 @@ values.  To do the latter, you can stick the following in your .emacs file:
       (* (max steps 1)
          c-basic-offset)))
 
-  (add-hook 'c-mode-common-hook
-            (lambda ()
-              ;; Add kernel style
-              (c-add-style
-               "linux-tabs-only"
-               '("linux" (c-offsets-alist
-                          (arglist-cont-nonempty
-                           c-lineup-gcc-asm-reg
-                           c-lineup-arglist-tabs-only))))))
-
-  (add-hook 'c-mode-hook
-            (lambda ()
-              (let ((filename (buffer-file-name)))
-                ;; Enable kernel mode for the appropriate files
-                (when (and filename
-                           (string-match (expand-file-name "~/src/linux-trees")
-                                         filename))
-                  (setq indent-tabs-mode t)
-                  (setq show-trailing-whitespace t)
-                  (c-set-style "linux-tabs-only")))))
+  (dir-locals-set-class-variables
+   'linux-kernel
+   '((c-mode . (
+          (c-basic-offset . 8)
+          (c-label-minimum-indentation . 0)
+          (c-offsets-alist . (
+                  (arglist-close         . c-lineup-arglist-tabs-only)
+                  (arglist-cont-nonempty .
+		      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
+                  (arglist-intro         . +)
+                  (brace-list-intro      . +)
+                  (c                     . c-lineup-C-comments)
+                  (case-label            . 0)
+                  (comment-intro         . c-lineup-comment)
+                  (cpp-define-intro      . +)
+                  (cpp-macro             . -1000)
+                  (cpp-macro-cont        . +)
+                  (defun-block-intro     . +)
+                  (else-clause           . 0)
+                  (func-decl-cont        . +)
+                  (inclass               . +)
+                  (inher-cont            . c-lineup-multi-inher)
+                  (knr-argdecl-intro     . 0)
+                  (label                 . -1000)
+                  (statement             . 0)
+                  (statement-block-intro . +)
+                  (statement-case-intro  . +)
+                  (statement-cont        . +)
+                  (substatement          . +)
+                  ))
+          (indent-tabs-mode . t)
+          (show-trailing-whitespace . t)
+          ))))
+
+  (dir-locals-set-directory-class
+   (expand-file-name "~/src/linux-trees")
+   'linux-kernel)
 
 This will make emacs go better with the kernel coding style for C
 files below ``~/src/linux-trees``.
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index b707bdbe178c..67c6d9ea7257 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -600,26 +600,43 @@ segue nel vostro file .emacs:
       (* (max steps 1)
          c-basic-offset)))
 
-  (add-hook 'c-mode-common-hook
-            (lambda ()
-              ;; Add kernel style
-              (c-add-style
-               "linux-tabs-only"
-               '("linux" (c-offsets-alist
-                          (arglist-cont-nonempty
-                           c-lineup-gcc-asm-reg
-                           c-lineup-arglist-tabs-only))))))
-
-  (add-hook 'c-mode-hook
-            (lambda ()
-              (let ((filename (buffer-file-name)))
-                ;; Enable kernel mode for the appropriate files
-                (when (and filename
-                           (string-match (expand-file-name "~/src/linux-trees")
-                                         filename))
-                  (setq indent-tabs-mode t)
-                  (setq show-trailing-whitespace t)
-                  (c-set-style "linux-tabs-only")))))
+  (dir-locals-set-class-variables
+   'linux-kernel
+   '((c-mode . (
+          (c-basic-offset . 8)
+          (c-label-minimum-indentation . 0)
+          (c-offsets-alist . (
+                  (arglist-close         . c-lineup-arglist-tabs-only)
+                  (arglist-cont-nonempty .
+		      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
+                  (arglist-intro         . +)
+                  (brace-list-intro      . +)
+                  (c                     . c-lineup-C-comments)
+                  (case-label            . 0)
+                  (comment-intro         . c-lineup-comment)
+                  (cpp-define-intro      . +)
+                  (cpp-macro             . -1000)
+                  (cpp-macro-cont        . +)
+                  (defun-block-intro     . +)
+                  (else-clause           . 0)
+                  (func-decl-cont        . +)
+                  (inclass               . +)
+                  (inher-cont            . c-lineup-multi-inher)
+                  (knr-argdecl-intro     . 0)
+                  (label                 . -1000)
+                  (statement             . 0)
+                  (statement-block-intro . +)
+                  (statement-case-intro  . +)
+                  (statement-cont        . +)
+                  (substatement          . +)
+                  ))
+          (indent-tabs-mode . t)
+          (show-trailing-whitespace . t)
+          ))))
+
+  (dir-locals-set-directory-class
+   (expand-file-name "~/src/linux-trees")
+   'linux-kernel)
 
 Questo farà funzionare meglio emacs con lo stile del kernel per i file che
 si trovano nella cartella ``~/src/linux-trees``.
diff --git a/Documentation/translations/zh_CN/coding-style.rst b/Documentation/translations/zh_CN/coding-style.rst
index 1466aa64b8b4..3cb09803e084 100644
--- a/Documentation/translations/zh_CN/coding-style.rst
+++ b/Documentation/translations/zh_CN/coding-style.rst
@@ -535,26 +535,43 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
       (* (max steps 1)
          c-basic-offset)))
 
-  (add-hook 'c-mode-common-hook
-            (lambda ()
-              ;; Add kernel style
-              (c-add-style
-               "linux-tabs-only"
-               '("linux" (c-offsets-alist
-                          (arglist-cont-nonempty
-                           c-lineup-gcc-asm-reg
-                           c-lineup-arglist-tabs-only))))))
-
-  (add-hook 'c-mode-hook
-            (lambda ()
-              (let ((filename (buffer-file-name)))
-                ;; Enable kernel mode for the appropriate files
-                (when (and filename
-                           (string-match (expand-file-name "~/src/linux-trees")
-                                         filename))
-                  (setq indent-tabs-mode t)
-                  (setq show-trailing-whitespace t)
-                  (c-set-style "linux-tabs-only")))))
+  (dir-locals-set-class-variables
+   'linux-kernel
+   '((c-mode . (
+          (c-basic-offset . 8)
+          (c-label-minimum-indentation . 0)
+          (c-offsets-alist . (
+                  (arglist-close         . c-lineup-arglist-tabs-only)
+                  (arglist-cont-nonempty .
+		      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
+                  (arglist-intro         . +)
+                  (brace-list-intro      . +)
+                  (c                     . c-lineup-C-comments)
+                  (case-label            . 0)
+                  (comment-intro         . c-lineup-comment)
+                  (cpp-define-intro      . +)
+                  (cpp-macro             . -1000)
+                  (cpp-macro-cont        . +)
+                  (defun-block-intro     . +)
+                  (else-clause           . 0)
+                  (func-decl-cont        . +)
+                  (inclass               . +)
+                  (inher-cont            . c-lineup-multi-inher)
+                  (knr-argdecl-intro     . 0)
+                  (label                 . -1000)
+                  (statement             . 0)
+                  (statement-block-intro . +)
+                  (statement-case-intro  . +)
+                  (statement-cont        . +)
+                  (substatement          . +)
+                  ))
+          (indent-tabs-mode . t)
+          (show-trailing-whitespace . t)
+          ))))
+
+  (dir-locals-set-directory-class
+   (expand-file-name "~/src/linux-trees")
+   'linux-kernel)
 
 这会让 emacs 在 ``~/src/linux-trees`` 下的 C 源文件获得更好的内核代码风格。
 
-- 
2.20.1.97.g81188d93c3-goog

