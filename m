Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F56F4FB
	for <linux-doc@vger.kernel.org>; Sat,  6 Apr 2024 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712369104; cv=none; b=hsPwKpZL5YwL6P/AugrGZR/IBCAef1PXp5t2e2PP5R/+MNj5mcy7zpst/X7tWjjGLWGXqcjAAm+lHSAhIO1d15h5MXhwGKlupwA+N4h59bpX8G+wz9Zn5X6lZa7dYaKTLJzCLotllGJAuZ6Eseozzsb2ALrTnLt6w8hOmSVzJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712369104; c=relaxed/simple;
	bh=CnqBC9bHLyYso+6tkGK8pZtWH8IkdUdlAf0NW3JQ1tI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XiAoxBzO5GBBe8DCBJFadCCWMOaESh0Jybx8DsfTMaZjVKrv4Pmd2fCJG/9dJsUn7mZ36S2Zg2xu+VTczpuUGUa0llnAqu03e05ncrzELheFRt9fsX4/mu9cUvtMHAG7V9jxd/6rHbzzgFcS/OUPCgXPDSDbczhDXyEmtDRaWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1bIIMja; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1bIIMja"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1e36b7e7dd2so11761665ad.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Apr 2024 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712369102; x=1712973902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYCuKMFV3mSye813N/47RI+tUYIkiMriVjFqFhCZWOw=;
        b=H1bIIMja3RSWE0Pj5MleAdobu7rHUMCAMtY35AFpizsW6AMid3sBfEHzvb8lS7XVBX
         yEW3qoH6O5GJZRKttEdgK0d+o0d+nc5ToMwJLVA+2trjZ2HhlTMioXCYJzY+ah3iE9TW
         rvfgu2Mg26hcNNeC+L2Z1NtybWyGSWvzZpR4sjsSzcLgVJ0o/KR6NG+k+J6sQvwT7jws
         2zYP5BpgzVM6UXpuuXhD33RbGMKt50ah/e+5MG335It75gRyc8XkOsP4ukZT+3mzxKDO
         kjgLcFJ54TuJi8TOjr3IjpBJ0MdnuymMOkCBpU//xN3KDA+RRxWgafubqMCw11CbqtuS
         rCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712369102; x=1712973902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYCuKMFV3mSye813N/47RI+tUYIkiMriVjFqFhCZWOw=;
        b=hpddmiZvl8cbGv8Sdpt5NevvT5Mi/lZTwTp0BuHTCbguMtuCmKrkXH1wLFJ724HffO
         A+aNmkVhfk3IdM3JAtOtjSsfN18zb3665sXc+Unt9FjCn5d1uEAdbm4wGSEvM32v1QJx
         rBFDJ8FS5Zvrug4BPa6u7QWZgIFpmj8YZgERagvt9UACSNBBeVJhz5iBSV+jwT2JnhR+
         QisFbthFbL5Utxo0z//47pYX2EhY8gzFgi/Iu2D0XGjh/MfX1XmSxynzHuzMU1m1Wc9h
         yBJzWyhuc1MlFaPTA/0Pd0icUCwCpcKB3VuvxLxq7OeheRx7Hs05dHRzo+sFJ3jpAcoN
         MAtg==
X-Gm-Message-State: AOJu0YxS/+heEylonCjb4VNNiDJvXHq+m/UCuLkBUvdrQ3TIWPbZKd2Q
	FCAAA7xX2DpwbZDR3fsYwOYZqQ6ca1FJ4blNUg+SKvrLZ4sw6PcC
X-Google-Smtp-Source: AGHT+IFB31Xy1taipjqg6KC3L42JU54Nexy1v+MFAvpikLqTCF1q07vtFO6ds0OVqqpmqUKe+hWZ5g==
X-Received: by 2002:a17:903:11d0:b0:1df:f681:3cd8 with SMTP id q16-20020a17090311d000b001dff6813cd8mr3604370plh.12.1712369101596;
        Fri, 05 Apr 2024 19:05:01 -0700 (PDT)
Received: from ubuntu-2204.. (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id q5-20020a170902c74500b001e2670c3406sm2307517plq.306.2024.04.05.19.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 19:05:01 -0700 (PDT)
From: Akira Yokosawa <akiyks@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Akira Yokosawa <akiyks@gmail.com>,
	=?UTF-8?q?=D0=98=D0=B2=D0=B0=D0=BD=20=D0=98=D0=B2=D0=B0=D0=BD=D0=BE=D0=B2=D0=B8=D1=87?= <relect@bk.ru>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2] docs: Detect variable fonts and suggest denylisting them
Date: Sat,  6 Apr 2024 11:04:16 +0900
Message-Id: <20240406020416.25096-1-akiyks@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240323120204.155678-1-akiyks@gmail.com>
References: <20240323120204.155678-1-akiyks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fedora and openSUSE has started deploying "variable font" [1] format
Noto CJK fonts [2, 3].  "CJK" here stands for "Chinese, Japanese,
and Korean".

Unfortunately, XeTeX/XeLaTeX doesn't understand those fonts for
historical reasons and builds of translations.pdf end up in errors
if such fonts are present on the build host.

To help developers work around the issue, add a script to check the
presence of "variable font" Noto CJK fonts and to emit suggestions.
The script is invoked in the error path of "make pdfdocs" so that the
suggestions are made only when a PDF build actually fails.

The first suggestion is to denylist those "variable font" files by
activating a per-user and command-local fontconfig setting.

For further info and backgrounds, please refer to the header comment
of scripts/check-variable-font.sh newly added in this commit.

Link: [1] https://en.wikipedia.org/wiki/Variable_font
Link: [2] https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
Link: [3] https://build.opensuse.org/request/show/1157217
Reported-by: Jonathan Corbet <corbet@lwn.net>
Link: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
Reported-by: "Иван Иванович" <relect@bk.ru>
Link: https://lore.kernel.org/linux-doc/1708585803.600323099@f111.i.mail.ru/
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
Changes in v2:

- Stop suggesting removal of variable-font packages. (Jon)
- Rewrite changelog and add a couple of links for reference. (Randy)
- Suggest denylisting "variable font" files for XeLaTeX in "make pdfdocs"
  as a less invasive option.
- Simplify message from check-variable-font.sh and expand the header
  comments of the script.
- Add template of fonts.conf for denylisting in the header comments.
- Add rules for activating the XeLaTeX only fonts.conf in
  Documentation/Makefile.

v1: https://lore.kernel.org/r/20240323120204.155678-1-akiyks@gmail.com/

Jon, how does the suggestion of denylisting sound to you?

For the denylisting to work, $HOME/deny-vf/fontconfig/fonts.conf needs
to be created manually.

It would be possible to automate this step, but fonts.conf might need
adjustments in case "variable font" files to be denied reside somewhere
else.

        Thanks, Akira
---
 Documentation/Makefile                      |   7 +-
 Documentation/sphinx/kerneldoc-preamble.sty |   9 +-
 MAINTAINERS                                 |   1 +
 scripts/check-variable-fonts.sh             | 117 ++++++++++++++++++++
 4 files changed, 129 insertions(+), 5 deletions(-)
 create mode 100755 scripts/check-variable-fonts.sh

diff --git a/Documentation/Makefile b/Documentation/Makefile
index b68f8c816897..a961692baa12 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -28,6 +28,10 @@ BUILDDIR      = $(obj)/output
 PDFLATEX      = xelatex
 LATEXOPTS     = -interaction=batchmode -no-shell-escape
 
+# For denylisting "variable font" files
+# Can be overridden by setting as an env variable
+FONTS_CONF_DENY_VF ?= $(HOME)/deny-vf
+
 ifeq ($(findstring 1, $(KBUILD_VERBOSE)),)
 SPHINXOPTS    += "-q"
 endif
@@ -151,10 +155,11 @@ pdfdocs:
 
 else # HAVE_PDFLATEX
 
+pdfdocs: DENY_VF = XDG_CONFIG_HOME=$(FONTS_CONF_DENY_VF)
 pdfdocs: latexdocs
 	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), \
-	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit; \
+	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" $(DENY_VF) -C $(BUILDDIR)/$(var)/latex || sh $(srctree)/scripts/check-variable-fonts.sh || exit; \
 	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
 	   mv $(subst .tex,.pdf,$(wildcard $(BUILDDIR)/$(var)/latex/*.tex)) $(BUILDDIR)/$(var)/pdf/; \
 	)
diff --git a/Documentation/sphinx/kerneldoc-preamble.sty b/Documentation/sphinx/kerneldoc-preamble.sty
index 3092df051c95..d479cfa73658 100644
--- a/Documentation/sphinx/kerneldoc-preamble.sty
+++ b/Documentation/sphinx/kerneldoc-preamble.sty
@@ -215,11 +215,12 @@
 	    due to the lack of suitable font families and/or the texlive-xecjk
 	    package.
 
-	    If you want them, please install ``Noto Sans CJK'' font families
-	    along with the texlive-xecjk package by following instructions from
+	    If you want them, please install non-variable ``Noto Sans CJK''
+	    font families along with the texlive-xecjk package by following
+	    instructions from
 	    \sphinxcode{./scripts/sphinx-pre-install}.
-	    Having optional ``Noto Serif CJK'' font families will improve
-	    the looks of those translations.
+	    Having optional non-variable ``Noto Serif CJK'' font families will
+	    improve the looks of those translations.
 	\end{sphinxadmonition}}
     \newcommand{\kerneldocEndSC}{}
     \newcommand{\kerneldocBeginTC}[1]{}
diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..3a4768c2f712 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6406,6 +6406,7 @@ S:	Maintained
 P:	Documentation/doc-guide/maintainer-profile.rst
 T:	git git://git.lwn.net/linux.git docs-next
 F:	Documentation/
+F:	scripts/check-variable-font.sh
 F:	scripts/documentation-file-ref-check
 F:	scripts/kernel-doc
 F:	scripts/sphinx-pre-install
diff --git a/scripts/check-variable-fonts.sh b/scripts/check-variable-fonts.sh
new file mode 100755
index 000000000000..12765e54e4f3
--- /dev/null
+++ b/scripts/check-variable-fonts.sh
@@ -0,0 +1,117 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) Akira Yokosawa, 2024
+#
+# For "make pdfdocs", reports of build errors of translations.pdf started
+# arriving early 2024 [1, 2].  It turned out that Fedora and openSUSE
+# tumbleweed have started deploying variable-font [3] format of "Noto CJK"
+# fonts [4, 5].  For PDF, a LaTeX package named xeCJK is used for CJK
+# (Chinese, Japanese, Korean) pages.  xeCJK requires XeLaTeX/XeTeX, which
+# does not (and likely never will) understand variable fonts for historical
+# reasons.
+#
+# The build error happens even when both of variable- and non-variable-format
+# fonts are found on the build system.  To make matters worse, Fedora enlists
+# variable "Noto CJK" fonts in the requirements of langpacks-ja, -ko, -zh_CN,
+# -zh_TW, etc.  Hence developers who have interest in CJK pages are more
+# likely to encounter the build errors.
+#
+# This script is invoked from the error path of "make pdfdocs" and emits
+# suggestions if variable-font files of "Noto CJK" fonts are in the list of
+# fonts accessible from XeTeX.
+#
+# Assumption:
+# File names are not modified from those of upstream Noto CJK fonts:
+#     https://github.com/notofonts/noto-cjk/
+#
+# References:
+# [1]: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
+# [2]: https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
+# [3]: https://en.wikipedia.org/wiki/Variable_font
+# [4]: https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
+# [5]: https://build.opensuse.org/request/show/1157217
+#
+#===========================================================================
+# Workarounds for building translations.pdf
+#===========================================================================
+#
+# * Denylist "variable font" Noto CJK fonts.
+#   - Create $HOME/deny-vf/fontconfig/fonts.conf from template below, with
+#     tweaks if necessary.  Remove leading "# ".
+#   - Path of fontconfig/fonts.conf can be overridden by setting an env
+#     variable FONTS_CONF_DENY_VF.
+#
+#     * Template:
+# -----------------------------------------------------------------
+# <?xml version="1.0"?>
+# <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
+# <fontconfig>
+# <!--
+#   Ignore variable-font glob (not to break xetex)
+# -->
+#     <selectfont>
+#         <rejectfont>
+#             <!--
+#                 for Fedora
+#             -->
+#             <glob>/usr/share/fonts/google-noto-*-cjk-vf-fonts</glob>
+#             <!--
+#                 for openSUSE tumbleweed
+#             -->
+#             <glob>/usr/share/fonts/truetype/Noto*CJK*-VF.otf</glob>
+#         </rejectfont>
+#     </selectfont>
+# </fontconfig>
+# -----------------------------------------------------------------
+#
+#     The denylisting is activated for "make pdfdocs".
+#
+# * For skipping CJK pages in PDF
+#   - Uninstall texlive-xecjk.
+#     Denylisting is not needed in this case.
+#
+# * For printing CJK pages in PDF
+#   - Need non-variable "Noto CJK" fonts.
+#     * Fedora
+#       - google-noto-sans-cjk-fonts
+#       - google-noto-serif-cjk-fonts
+#     * openSUSE tumbleweed
+#       - Non-variable "Noto CJK" fonts are not available as distro packages
+#         as of April, 2024.  Fetch a set of font files from upstream Noto
+#         CJK Font released at:
+#           https://github.com/notofonts/noto-cjk/tree/main/Sans#super-otc
+#         and at:
+#           https://github.com/notofonts/noto-cjk/tree/main/Serif#super-otc
+#         , then uncompress and deploy them.
+#       - Remember to update fontconfig cache by running fc-cache.
+#
+# !!! Caution !!!
+#     Uninstalling "variable font" packages can be dangerous.
+#     They might be depended upon by other packages important for your work.
+#     Denylisting should be less invasive, as it is effective only while
+#     XeLaTeX runs in "make pdfdocs".
+
+# Default per-user fontconfig path (overridden by env variable)
+: ${FONTS_CONF_DENY_VF:=$HOME/deny-vf}
+
+export XDG_CONFIG_HOME=${FONTS_CONF_DENY_VF}
+
+vffonts=`fc-list -b | grep -iE 'file: .*noto.*cjk.*-vf' | \
+	 sed -e 's/\tfile:/  file:/' -e 's/(s)$//' | sort | uniq`
+
+if [ "x$vffonts" != "x" ] ; then
+	echo '============================================================================='
+	echo 'XeTeX is confused by "variable font" files listed below:'
+	echo "$vffonts"
+	echo
+	echo 'For CJK pages in PDF, they need to be hidden from XeTeX by denylisting.'
+	echo 'Or, CJK pages can be skipped by uninstalling texlive-xecjk.'
+	echo
+	echo 'For more info on denylisting, other options, and variable font, see header'
+	echo 'comments of scripts/check-variable-fonts.sh.'
+	echo '============================================================================='
+fi
+
+# As this script is invoked from Makefile's error path, always error exit
+# regardless of whether any variable font is discovered or not.
+exit 1

base-commit: 9e192b39a5992d8b730383d57416964b44ea1041
-- 
2.34.1

