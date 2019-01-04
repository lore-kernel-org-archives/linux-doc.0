Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 30FFB7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 21:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbfADVJO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 16:09:14 -0500
Received: from out002.mailprotect.be ([83.217.72.86]:36365 "EHLO
        out002.mailprotect.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfADVJO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 16:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=mailprotect.be; s=mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id
        :Date:Subject:Cc:To:From:reply-to:sender:bcc:in-reply-to:references:
        content-type; bh=B5qhF7+HLXB8Ut4HLKnwPhYPni1tggILKKN8sD8P7ug=; b=GWdymPO0cPuT
        uce/VkmpWoI7xjeC2CskaFr0UODb4ABY2mQsS4KzfDZf+zOe24FVu+aKp9xdeTinoToN57xW+cGrg
        2gQk33wM3+YH33kkV134JvspNqC6anOjWvUKaU5L6l58uiRAKVBdjAgZegJk2IPDpC6usrZerpg0H
        9G0NpdBHNaq0riH2FG3dSHggkoDMG1V4F5E6qMTJA/l6qNTgXMckIB8kqEt+6OsJnMi7qSzRHkP05
        b+cECehtGeXNhDRrHLFsVc4ZwKDBtJ6PDcdSYmmnz85IMd4eR425RdZutpLk/ADH/bZgw8CauZ3ML
        rEYroW6T84VwRZYJZjKisA==;
Received: from smtp-auth.mailprotect.be ([178.208.39.155])
        by com-mpt-out002.mailprotect.be with esmtp (Exim 4.89)
        (envelope-from <bvanassche@acm.org>)
        id 1gfWiC-0003Tp-Cf; Fri, 04 Jan 2019 22:09:01 +0100
Received: from desktop-bart.svl.corp.google.com (unknown [104.133.8.89])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id 40C65C0522;
        Fri,  4 Jan 2019 22:08:43 +0100 (CET)
From:   Bart Van Assche <bvanassche@acm.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        Matthew Wilcox <willy@infradead.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison@she-devel.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Li Yang <leo@zh-kernel.org>
Subject: [PATCH] Documentation/CodingStyle: Use directory-local variables for emacs
Date:   Fri,  4 Jan 2019 13:08:33 -0800
Message-Id: <20190104210834.89231-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.20.1.97.g81188d93c3-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: 178.208.39.155
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be; auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.25)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5t9MU1P1bzVkLwh5f/oHTGt602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
 q3u0UDjvO1tLifGj39bI0bcPyaJsYTbWtxh170GAlLRQQirzS8Ej74tvJl+kejD7XF6qTl1z05KP
 Dlm6u9FOXYQAbOhP3wJx0B1Kli8412NpJuPmlKufNYl2xo1qSdLaIk3PUj34BdiieF+v32NcF3en
 xVVrvCuirwdcalQji2tEaY7elCVY4BHiaBMJ1I6tKJqjBRwx8R/FoVTmtiM9KoXXlS/bsuZj5xjk
 SFgBVHyWPRKqDFa64/SLkXOs/N71obroGOUyy6aftoNA9yDpSuvHFRxxcURDrT77BbDsPSfVB/4x
 Yket2ArSeoFOV6Ij/uRPAGz+5d4F1x3DRJ1xnri8rXd+YQPilbHtbFYVmmyNP/jzd7CCF5RPyabM
 qnWogNhw4ic5vuBq8eojZpPGAfKf62zaKJqU8Zf+B9qSJPzSsfZHWcrkHBSGqzZlEbXO4rHgfPMf
 RX9+okLaV1ccdyRpMK7WmlMM3MM49BZ5F7sUChsVOajSaFryuM28yfNoRiP4LXR95v/77cCko/EG
 7+7uLxBlLaVvfCJf9c87raNJ3rEEAH2+T1zD59o8cPYKs494BBiYWZDfGiqYJbsV6Bia58mKB6GP
 R9UyIYODc1wVguED8Bfu31/E3ahF5MMcDI7KdpjQKcwi9Jk69TnSHoh9VM4qIjsvP92yJqFDUMWg
 YkYfhC80sNoIrLcCnn2MFoRBwXu4i9adXN8QoJkCGUT+/nq62lQ14TiNHZBO9dkjkpbpFG8w6J1f
 hOzjF0b4LXcjJZ5loquFk+pkh+w6U8HrQHUPSWoWZa/wfvkoqFK5FkJoHfMGwtP72PnxJZpB7z+8
 0JWwjUcV0wEj9itRcd7KH+nVDjFllXn2maRqR4xJOvVleQ85XMfPU/A6Zs85EHjl8kedTQDBddgS
 itHw/K1calPLDDrKATDDBZ7fFc0FDw0l2bg+z2YoA4glpLgakSw0zRVimKIVlPpLizbQBXQ4w7rA
 jhV9obhHlQtn35WrvLxnqtUCyB2oVjwpD0SDGnhQZ7XpT35mKiWY4qyAovTKsLgKiJqTF6ymUAav
 ae3aV27dM5QN3KVLwP/pKIIHQBh4yd/8+tEyvDkN3AfUBddcu9g0Uhw/YHGGdt5eD9ya81kvI1of
 3IOsrfnTjx5M5ZqkPpQBrM2wWVbjHO/cpJpsYlvFhM+mW297Uqw0ZsTjLTJBUO9GfzrLxVhP0uel
 tSacMfCNTlvBloR44kmvlvy5XDsjxS0=
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
Cc: Geyslan G. Bem <geyslan@gmail.com>
Cc: Tiago Natel de Moura <tiago4orion@gmail.com>
Cc: Alison Chaiken <alison@she-devel.com>
Cc: Joe Perches <joe@perches.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Li Yang <leo@zh-kernel.org>
---
 Documentation/process/coding-style.rst | 57 +++++++++++++++++---------
 1 file changed, 37 insertions(+), 20 deletions(-)

Changes compared to v1:
- Removed top-level .dir-locals.el file again and updated coding-style.rst instead.
- Restored the humourous paragraph about emacs.
- Left out Italian and Chinese translations.
 
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 277c113376a6..5013883aec8e 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -592,26 +592,43 @@ values.  To do the latter, you can stick the following in your .emacs file:
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
-- 
2.20.1.97.g81188d93c3-goog

