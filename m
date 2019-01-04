Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7C8837D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 00:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfADAkf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Jan 2019 19:40:35 -0500
Received: from com-out001.mailprotect.be ([83.217.72.83]:59441 "EHLO
        com-out001.mailprotect.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbfADAke (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Jan 2019 19:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=mailprotect.be; s=mail; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:
        in-reply-to:references; bh=ZeiSuTPGIW3gMI8Nmru7CRTWkTYw023zkODbTF1P2Lg=; b=Wk
        J/IecfkOHyAkkDOVhJLZrdd5eQ7wrkuqhZeu6rVZnJK7wPwo4DplVjb8J3MC1SZV7rfNyB4Au/dn9
        GWA5bGJJIf7PaZV3iGNY5JQ57e1Y8PKSKsxATLArRPLmCT60gOWBWlNVub5jYh00e5z4TUQCxWvWj
        p2/t+06EWGyLkIc8T2DE7yjSijV7agA6W2WRye4jec0kIRrNJrEuY3GlGbYwCBxMurlGOYyAoFQWS
        DiWsprRE0yarqWwPHM52IEu1a9o02e5xmnjO/JKj/n29hw8eIAARK9uW8a2HHUSrC8CKlKyq9Be5w
        520/B7bpUqOlW5N0ohmgXaBqqIOjXm3Q==;
Received: from smtp-auth.mailprotect.be ([178.208.39.159])
        by com-mpt-out001.mailprotect.be with esmtp (Exim 4.89)
        (envelope-from <bvanassche@acm.org>)
        id 1gfDXD-000GZN-6J; Fri, 04 Jan 2019 01:40:24 +0100
Received: from desktop-bart.svl.corp.google.com (unknown [104.133.8.89])
        (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by smtp-auth.mailprotect.be (Postfix) with ESMTPSA id ADBF1C04FC;
        Fri,  4 Jan 2019 01:40:05 +0100 (CET)
From:   Bart Van Assche <bvanassche@acm.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        "Geyslan G . Bem" <geyslan@gmail.com>,
        Tiago Natel de Moura <tiago4orion@gmail.com>,
        Alison Chaiken <alison_chaiken@mentor.com>,
        Joe Perches <joe@perches.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Zhang Le <r0bertz@gentoo.org>, Li Yang <leo@zh-kernel.org>
Subject: [PATCH] Documentation/CodingStyle: Move emacs settings into .dir-locals.el
Date:   Thu,  3 Jan 2019 16:39:57 -0800
Message-Id: <20190104003957.82220-1-bvanassche@acm.org>
X-Mailer: git-send-email 2.20.1.415.g653613c723-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: 178.208.39.159
X-SpamExperts-Domain: mailprotect.be
X-SpamExperts-Username: 178.208.39.128/27
Authentication-Results: mailprotect.be; auth=pass smtp.auth=178.208.39.128/27@mailprotect.be
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.26)
X-Recommended-Action: accept
X-Filter-ID: EX5BVjFpneJeBchSMxfU5r4cjlNH5X4C5EfnIFSKW+5602E9L7XzfQH6nu9C/Fh9KJzpNe6xgvOx
 q3u0UDjvO1tLifGj39bI0bcPyaJsYTa43A6BbHuOu26FlWSYmB0jprpEIVWhNaoEAGLLS3GB4P6V
 WgQtuS/IXgP0xwejNzDQAUvi9XHeIiNnhtyCKUw0CWnMYv6tEb1Jv/2Nu+mdKSEsBNTtaGt8Srt5
 AVv46T0L4kpQD1/qir5dRm4otNFIBW0C+kdEBWD51mU2y+yyb3AGhh7sxMnLsIKB8R7YC4j2I+z/
 DAedK9AxvQt6TXLULLV5vi9mwjAg/MjQOn6kc4zwR79THG4CQ+1urItsa08EpxzfmTEGdXqtrJYo
 DJXGO8DW/NDPPWclHrzV1PO07w2hiRVuFlI+RkloOn4J9Uu77d+1srGWfCNQmJsgrzA44+HJZ5tv
 43300GNrwimwngEbW7n+fd3NLEfpli30czL5Yeia8HRRN1XgVEyTWHpXXvVwVcs08vDIPBUwDq5/
 oaGJAeU9Zu7XWZ+dXEVNZ9AGFrGWhCvBjc2ItJXzEoB87UJ4QSwSDwuHxrFRyVb9brUFg/fIocum
 fy7nlHshc2SgmIw4GlBMUJ5tmacVuNcCPzQwTZWk0LJpbj+275alueD3JP1TZOF7xCxMWPmtOrbT
 CB+y1/kdwCnPNDJxz2+x6xRwdbvGEYre0mvLtHe5W25UyoBaNn4UvUDGLvKfl0KGpS+C6BPAIEs8
 PiiVo3EbitwIT4UrixKuvc+2A6GMBkdUx4wVmRRdNAC1VnP7J7aoVa9N1B5a7HEax6KxZtwTGplH
 cpVCCoX989hgB8R+yBmSQTjEQ7K8L3YnE3YXQev/+SVYClYiONBXrkUijWHSjLo2IVEpkcprylIB
 tIpMLIClx2Bar4+r4X5TDyO6kqbM3QJ+eNps9QCtxORQfh9Yfx+Rej4UShefUo+T6F7dpBEVniih
 uDwEGDcmr6e3OPT2vpc7DTbK73Uczg4v9NX8rPLdozHWIiOOCs6xV5cNI/YVp6E24RmQxpEMZGnv
 cSr/DD7vNZhc2WXg/G3s/mductgzcDoFd+96Xw4QUNtTnUwBPU16Lw5D6FTpb21Gqfhq+NvRNh3j
 F3bBvS1htv73jyRU1W7yjZrVL5fyX8Ze+edKEy7bP5gIt23U7fpAnNNaaosU2ouOolw9cp1YOrL6
 hzzbxWjrOIv823OwuoSzwXBEn95eECKi3gxjzXac2CLtWj2g85mHRkOrwPj67JONTwwsq9jL8kDn
 CowdqqA99B1XEvFeCBHWER7m/Rdd97Q=
X-Report-Abuse-To: spam@com-mpt-mgt001.mailprotect.be
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For new kernel developers who use emacs it is tedious to follow the
instructions in Documentation/process/coding-style.rst for configuring
emacs. Make it easier for emacs users by moving these settings into the
top-level .dir-locals.el file. Emacs supports directory-local variables
since version 23.1, released in 2009. See also
https://lists.gnu.org/archive/html/info-gnu-emacs/2009-07/msg00000.html

The settings in .dir-locals.el are not identical to those in
Documentation/process/coding-style.rst. The most important difference
is that "(arglist-cont-nonempty c-lineup-gcc-asm-reg
c-lineup-arglist-tabs-only)" (which is not a valid alist) has been
changed into "(arglist-cont-nonempty . c-lineup-arglist)". I have
verified with several large and nontrivial kernel source files that
the settings in .dir-locals.el format code according to what checkpatch
expects.

The Italian and Chinese translations of the modified paragraphs have
been generated by Google Translate.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Cc: Geyslan G. Bem <geyslan@gmail.com>
Cc: Tiago Natel de Moura <tiago4orion@gmail.com>
Cc: Alison Chaiken <alison_chaiken@mentor.com>
Cc: Joe Perches <joe@perches.com>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Zhang Le <r0bertz@gentoo.org>
Cc: Li Yang <leo@zh-kernel.org>
---
 .dir-locals.el                                | 41 +++++++++++++++
 Documentation/process/coding-style.rst        | 49 ++----------------
 .../it_IT/process/coding-style.rst            | 50 ++-----------------
 .../translations/zh_CN/coding-style.rst       | 43 +---------------
 4 files changed, 53 insertions(+), 130 deletions(-)
 create mode 100644 .dir-locals.el

diff --git a/.dir-locals.el b/.dir-locals.el
new file mode 100644
index 000000000000..8cf857a00772
--- /dev/null
+++ b/.dir-locals.el
@@ -0,0 +1,41 @@
+;; Emacs settings for Linux kernel C code.
+
+(
+ (c-mode . (
+	(c-basic-offset . 8)
+	(c-cleanup-list . (brace-else-brace))
+	(c-hanging-braces-alist . (
+			(arglist-cont-nonempty)
+			(block-close . c-snug-do-while)
+			(brace-entry-open)
+			(brace-list-open)
+			(substatement-open after)
+			))
+	(c-label-minimum-indentation . 0)
+	(c-offsets-alist . (
+			(arglist-cont-nonempty . c-lineup-arglist)
+			(arglist-intro         . +)
+			(brace-list-intro      . +)
+			(c                     . c-lineup-C-comments)
+			(case-label            . 0)
+			(comment-intro         . c-lineup-comment)
+			(cpp-define-intro      . +)
+			(cpp-macro             . -1000)
+			(cpp-macro-cont        . +)
+			(defun-block-intro     . +)
+			(else-clause           . 0)
+			(func-decl-cont        . +)
+			(inclass               . +)
+			(inher-cont            . c-lineup-multi-inher)
+			(knr-argdecl-intro     . 0)
+			(label                 . 0)
+			(statement             . 0)
+			(statement-block-intro . +)
+			(statement-case-intro  . +)
+			(statement-cont        . +)
+			(substatement          . +)
+			))
+	(indent-tabs-mode . t)
+	)
+ )
+)
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 277c113376a6..e12b845d6766 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -571,50 +571,11 @@ item, explaining its use.
 9) You've made a mess of it
 ---------------------------
 
-That's OK, we all do.  You've probably been told by your long-time Unix
-user helper that ``GNU emacs`` automatically formats the C sources for
-you, and you've noticed that yes, it does do that, but the defaults it
-uses are less than desirable (in fact, they are worse than random
-typing - an infinite number of monkeys typing into GNU emacs would never
-make a good program).
-
-So, you can either get rid of GNU emacs, or change it to use saner
-values.  To do the latter, you can stick the following in your .emacs file:
-
-.. code-block:: none
-
-  (defun c-lineup-arglist-tabs-only (ignored)
-    "Line up argument lists by tabs, not spaces"
-    (let* ((anchor (c-langelem-pos c-syntactic-element))
-           (column (c-langelem-2nd-pos c-syntactic-element))
-           (offset (- (1+ column) anchor))
-           (steps (floor offset c-basic-offset)))
-      (* (max steps 1)
-         c-basic-offset)))
-
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
-
-This will make emacs go better with the kernel coding style for C
-files below ``~/src/linux-trees``.
+``GNU emacs`` automatically formats the C sources for you. However,
+the defaults it uses are less than desirable. Use a version of emacs
+that support directory local variables such that it automatically
+picks up the settings from .dir-locals.el in the kernel top level
+directory.
 
 But even if you fail in getting emacs to do sane formatting, not
 everything is lost: use ``indent``.
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index b707bdbe178c..05a86c69bd5d 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -578,51 +578,11 @@ commento per spiegarne l'uso.
 9) Avete fatto un pasticcio
 ---------------------------
 
-Va bene, li facciamo tutti.  Probabilmente vi è stato detto dal vostro
-aiutante Unix di fiducia che ``GNU emacs`` formatta automaticamente il
-codice C per conto vostro, e avete notato che sì, in effetti lo fa, ma che
-i modi predefiniti non sono proprio allettanti (infatti, sono peggio che
-premere tasti a caso - un numero infinito di scimmie che scrivono in
-GNU emacs non faranno mai un buon programma).
-
-Quindi, potete sbarazzarvi di GNU emacs, o riconfigurarlo con valori più
-sensati.  Per fare quest'ultima cosa, potete appiccicare il codice che
-segue nel vostro file .emacs:
-
-.. code-block:: none
-
-  (defun c-lineup-arglist-tabs-only (ignored)
-    "Line up argument lists by tabs, not spaces"
-    (let* ((anchor (c-langelem-pos c-syntactic-element))
-           (column (c-langelem-2nd-pos c-syntactic-element))
-           (offset (- (1+ column) anchor))
-           (steps (floor offset c-basic-offset)))
-      (* (max steps 1)
-         c-basic-offset)))
-
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
-
-Questo farà funzionare meglio emacs con lo stile del kernel per i file che
-si trovano nella cartella ``~/src/linux-trees``.
+`` GNU emacs`` formatta automaticamente le sorgenti C per te. Tuttavia,
+le impostazioni predefinite che utilizza sono meno desiderabili.
+Utilizzare una versione di emacs che supporti le variabili locali della
+directory in modo tale che raccolga automaticamente le impostazioni da
+.dir-locals.el nella directory di livello superiore del kernel.
 
 Ma anche se doveste fallire nell'ottenere una formattazione sensata in emacs
 non tutto è perduto: usate ``indent``.
diff --git a/Documentation/translations/zh_CN/coding-style.rst b/Documentation/translations/zh_CN/coding-style.rst
index 1466aa64b8b4..32a72a9c110a 100644
--- a/Documentation/translations/zh_CN/coding-style.rst
+++ b/Documentation/translations/zh_CN/coding-style.rst
@@ -516,47 +516,8 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
 9) 你已经把事情弄糟了
 ------------------------------
 
-这没什么，我们都是这样。可能你的使用了很长时间 Unix 的朋友已经告诉你
-``GNU emacs`` 能自动帮你格式化 C 源代码，而且你也注意到了，确实是这样，不过它
-所使用的默认值和我们想要的相去甚远 (实际上，甚至比随机打的还要差——无数个猴子
-在 GNU emacs 里打字永远不会创造出一个好程序) (译注：Infinite Monkey Theorem)
-
-所以你要么放弃 GNU emacs，要么改变它让它使用更合理的设定。要采用后一个方案，
-你可以把下面这段粘贴到你的 .emacs 文件里。
-
-.. code-block:: none
-
-  (defun c-lineup-arglist-tabs-only (ignored)
-    "Line up argument lists by tabs, not spaces"
-    (let* ((anchor (c-langelem-pos c-syntactic-element))
-           (column (c-langelem-2nd-pos c-syntactic-element))
-           (offset (- (1+ column) anchor))
-           (steps (floor offset c-basic-offset)))
-      (* (max steps 1)
-         c-basic-offset)))
-
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
-
-这会让 emacs 在 ``~/src/linux-trees`` 下的 C 源文件获得更好的内核代码风格。
+``GNU emacs``會自動為您設置C源代碼。但是，它使用的默認值不太理想。
+使用支持目錄本地變量的emacs版本，以便它自動從內核頂級目錄中的.dir-locals.el中獲取設置。
 
 不过就算你尝试让 emacs 正确的格式化代码失败了，也并不意味着你失去了一切：还可
 以用 ``indent`` 。
-- 
2.20.1.415.g653613c723-goog

