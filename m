Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8E407D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Sep 2019 18:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732716AbfISSS4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Sep 2019 14:18:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44045 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732659AbfISSS4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Sep 2019 14:18:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id q21so2814662pfn.11
        for <linux-doc@vger.kernel.org>; Thu, 19 Sep 2019 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=LK/ntI5e8UZBioVWF4cAdPWBEu0iGHGSIa7+VcXi35o=;
        b=nQqsDv4htqMeTr29+sArilMSGc4WdWh8clDbsS+ZhaBH8MnOghUWrj7q7bo55eU4zE
         I+mXGqd+A3IXVvRg1mRHX8jhbtB4Q9/WWo2tQqfq3B/6/bmTsiA86mB9fIXjIarfyfUz
         T9M59UB/RUpZXAvS9UMEvet3Chkn1EjLPhN9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=LK/ntI5e8UZBioVWF4cAdPWBEu0iGHGSIa7+VcXi35o=;
        b=LTUNiWkUpwYRuXJQMf2OGKaAK5hf46YaDk+X6ZKcL4XErmUQgcmNeVA62yR22GXocF
         m9M+fjqe6j4DMzF5Ui3hZw13C3d1bHWmIMVTfz/YS/S6XuT3WJQgImwv5y2uzGGvXprt
         lUGRGy2LU9FT1VCw52okR9wPMuVVzjC7cFtdKs16h+M4v6gxkhr6szsakxKbr5Ho0Wtl
         qMmCzzNFEBVSOxvxbSJOCU4xi9QSJE9dn37ekSXCDzGAiUK9pyJtEUL5StoVmSXYyz8g
         lFSzSQlXhUBxICZaYkjPAra89qdsfCfDT+nmgPk5cR9jbtSpcSXaM6OmSkYdPRf3byNp
         IDIQ==
X-Gm-Message-State: APjAAAUJ6zVi1c7GlN3AKJYla6AsmhakO/cKL70kLybM8mprEft/QH17
        hD4mrcGVP7HJ4yAGX5jSZ6DCTw==
X-Google-Smtp-Source: APXvYqy2AC9epTUjkt4q5SHYgCwow/H1wFtZDkXZGQpB8RDBJY/GgHldQNGy/Er8PHpj0kcHasCe9g==
X-Received: by 2002:aa7:998d:: with SMTP id k13mr11961195pfh.134.1568917134616;
        Thu, 19 Sep 2019 11:18:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 37sm13724113pgv.32.2019.09.19.11.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 11:18:53 -0700 (PDT)
Date:   Thu, 19 Sep 2019 11:18:52 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: Use make invocation's -j argument for parallelism
Message-ID: <201909191116.192A096C68@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While sphinx 1.7 and later supports "-jauto" for parallelism, this
effectively ignores the "-j" flag used in the "make" invocation, which
may cause confusion for build systems. Instead, extract the available
parallelism from "make"'s job server (since it is not exposed in any
special variables) and use that for the "sphinx-build" run. Now things
work correctly for builds where -j is specified at the top-level:

	make -j16 htmldocs

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/Makefile  |  3 +--
 scripts/jobserver-count | 46 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100755 scripts/jobserver-count

diff --git a/Documentation/Makefile b/Documentation/Makefile
index e145e4db508b..4408eeaf2891 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -33,8 +33,6 @@ ifeq ($(HAVE_SPHINX),0)
 
 else # HAVE_SPHINX
 
-export SPHINXOPTS = $(shell perl -e 'open IN,"sphinx-build --version 2>&1 |"; while (<IN>) { if (m/([\d\.]+)/) { print "-jauto" if ($$1 >= "1.7") } ;} close IN')
-
 # User-friendly check for pdflatex and latexmk
 HAVE_PDFLATEX := $(shell if which $(PDFLATEX) >/dev/null 2>&1; then echo 1; else echo 0; fi)
 HAVE_LATEXMK := $(shell if which latexmk >/dev/null 2>&1; then echo 1; else echo 0; fi)
@@ -68,6 +66,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 	PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
 	$(SPHINXBUILD) \
+	-j $(shell $(srctree)/scripts/jobserver-count) \
 	-b $2 \
 	-c $(abspath $(srctree)/$(src)) \
 	-d $(abspath $(BUILDDIR)/.doctrees/$3) \
diff --git a/scripts/jobserver-count b/scripts/jobserver-count
new file mode 100755
index 000000000000..5fc9d2fd5254
--- /dev/null
+++ b/scripts/jobserver-count
@@ -0,0 +1,46 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This determines how many parallel tasks "make" is expecting, as it is
+# not exposed via an special variables.
+# https://www.gnu.org/software/make/manual/html_node/POSIX-Jobserver.html#POSIX-Jobserver
+import os, sys, fcntl
+
+# Set non-blocking for a given file descriptor.
+def nonblock(fd):
+	flags = fcntl.fcntl(fd, fcntl.F_GETFL)
+	fcntl.fcntl(fd, fcntl.F_SETFL, flags | os.O_NONBLOCK)
+	return fd
+
+# Fetch the make environment options.
+flags = os.environ.get('MAKEFLAGS', None)
+if flags == None:
+	print("1")
+	sys.exit(0)
+
+# Look for "--jobserver=R,W"
+opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
+if len(opts) != 1:
+	print("1")
+	sys.exit(0)
+
+# Parse out R,W file descriptor numbers and set them nonblocking.
+fds = opts[0].split("=", 1)[1]
+reader, writer = [nonblock(int(x)) for x in fds.split(",", 1)]
+
+# Read out as many jobserver slots as possible.
+jobs = b""
+while True:
+	try:
+		slot = os.read(reader, 1)
+		jobs += slot
+	except:
+		break
+# Return all the reserved slots.
+os.write(writer, jobs)
+
+# Report available slots (with a bump for our caller's reserveration).
+if len(jobs) < 1:
+	print("1")
+else:
+	print(len(jobs) + 1)
-- 
2.17.1


-- 
Kees Cook
