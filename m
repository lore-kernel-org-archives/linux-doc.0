Return-Path: <SRS0=oITL=4O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828CBC4BA24
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 23:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E08020658
	for <linux-doc@archiver.kernel.org>; Wed, 26 Feb 2020 23:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSalGtQy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbgBZXXx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Feb 2020 18:23:53 -0500
Received: from mail-pj1-f73.google.com ([209.85.216.73]:40543 "EHLO
        mail-pj1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgBZXXw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Feb 2020 18:23:52 -0500
Received: by mail-pj1-f73.google.com with SMTP id ev1so443886pjb.5
        for <linux-doc@vger.kernel.org>; Wed, 26 Feb 2020 15:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=zMAfUHJJiNLY4kAwxfSfFqfgoKQ5jUFofqSLJDdWxPU=;
        b=GSalGtQymTDs5BKgjs6cq8yGfJg/2aIJUeFnCf+jy83fYF69PucinQ8eanbN3ge7KQ
         Utnklx6MpNNRLQ4eb9nPa8j5WU0IAfMJnBj888Kbfx+uGPaZYp5Qp2SPUu0QM73jxAEQ
         SjGzgZJ9RJqIo/ovlChaiv4ThwgBNNgc9T0ZzW3k1TmvIMB6rh6VbEwaQsu+Z6fa8nJI
         2q6bNfzpUAYKWsQtydKpeovaDWYLGgKAXSACl5BDqkBBl/NQlhq9/ZMNX2f/WDK4z6bu
         ayPfEAeVxmSAXpzgvIAZblosUPpFK+wAvSWo4IfTglQLAZY1JsDXnUKKDZT1zpNBWhp0
         XaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=zMAfUHJJiNLY4kAwxfSfFqfgoKQ5jUFofqSLJDdWxPU=;
        b=kM9Hgb04CgEwDNgPaaZR/cVvBbrvVqVXsSvO4lVvEdtuopFAO07WgdA0WihIW4KYkR
         sW1EPIZQm+ZOI+SSlLXpvXKPq+iJZllelErpb5xrVgdqrmucXQ7+t26xnck+GzPfT9zB
         12ILKXqM7bYd2NZuZDSH2+hY1BxlukmAa6V4hWAuY1qFWSvty04ZXDmgoV3e2B3tMv64
         jm/fJQ6WsjAd2FbijlHEZa8MTdec1WTWXicWmv7SRE0w3WnK9ZpmRKfmH043HSqbRfRZ
         fII7uXZP50n384NFp/EJaEqUvBVN+Nfp+jhLAtJ+TYUNtwSyPatVebnz0gbqVePKQ6ni
         IPCA==
X-Gm-Message-State: APjAAAUmpavvFX1PvoDYutTnj2RbguF0O0l2rtCjOSQi8pXYqIuqwxyJ
        WL6anGs41+/6kLe7toF8HG+Okh/uQJctvBf0908=
X-Google-Smtp-Source: APXvYqx7LBf15YkCrDwdvWPHxR1x7Hdivto6HOgT22kd7Osik9IknfZY8HczyWn3EEZxCJqEhdN1W3gFaII1S72k8mk=
X-Received: by 2002:a63:d845:: with SMTP id k5mr1115560pgj.183.1582759429173;
 Wed, 26 Feb 2020 15:23:49 -0800 (PST)
Date:   Wed, 26 Feb 2020 15:23:36 -0800
In-Reply-To: <20200225210250.64366-1-ndesaulniers@google.com>
Message-Id: <20200226232336.252872-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200225210250.64366-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v3] Documentation/llvm: add documentation on building w/ Clang/LLVM
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     corbet@lwn.net, masahiroy@kernel.org
Cc:     rdunlap@infradead.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added to kbuild documentation. Provides more official info on building
kernels with Clang and LLVM than our wiki.

Suggested-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V2 -> V3:
* Drop Randy's Suggested-by tag. Sorry Randy, I do appreciate the review
  though.
* Add F: line to MAINTAINERS.

Changes V1 -> V2:
* s/On going/ongoing/
* add Randy's Suggested-by
* add Nathan and Sedat's Reviewed-by
* Upgrade Kees' Sugguested-by to Reviewed-by
* s/suffix/prefix/

 Documentation/kbuild/index.rst |  1 +
 Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                    |  1 +
 3 files changed, 82 insertions(+)
 create mode 100644 Documentation/kbuild/llvm.rst

diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 0f144fad99a6..3882bd5f7728 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -19,6 +19,7 @@ Kernel Build System
 
     issues
     reproducible-builds
+    llvm
 
 .. only::  subproject and html
 
diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
new file mode 100644
index 000000000000..d6c79eb4e23e
--- /dev/null
+++ b/Documentation/kbuild/llvm.rst
@@ -0,0 +1,80 @@
+==============================
+Building Linux with Clang/LLVM
+==============================
+
+This document covers how to build the Linux kernel with Clang and LLVM
+utilities.
+
+About
+-----
+
+The Linux kernel has always traditionally been compiled with GNU toolchains
+such as GCC and binutils. Ongoing work has allowed for `Clang
+<https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
+used as viable substitutes. Distributions such as `Android
+<https://www.android.com/>`_, `ChromeOS
+<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
+<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
+collection of toolchain components implemented in terms of C++ objects
+<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
+supports C and the GNU C extensions required by the kernel, and is pronounced
+"klang," not "see-lang."
+
+Clang
+-----
+
+The compiler used can be swapped out via `CC=` command line argument to `make`.
+`CC=` should be set when selecting a config and during a build.
+
+	make CC=clang defconfig
+
+	make CC=clang
+
+Cross Compiling
+---------------
+
+A single Clang compiler binary will typically contain all supported backends,
+which can help simplify cross compiling.
+
+	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
+
+`CROSS_COMPILE` is not used to prefix the Clang compiler binary, instead
+`CROSS_COMPILE` is used to set a command line flag: `--target <triple>`. For
+example:
+
+	clang --target aarch64-linux-gnu foo.c
+
+LLVM Utilities
+--------------
+
+LLVM has substitutes for GNU binutils utilities. These can be invoked as
+additional parameters to `make`.
+
+	make CC=clang AS=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \\
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \\
+	  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \\
+	  HOSTLD=ld.lld
+
+Getting Help
+------------
+
+- `Website <https://clangbuiltlinux.github.io/>`_
+- `Mailing List <https://groups.google.com/forum/#!forum/clang-built-linux>`_: <clang-built-linux@googlegroups.com>
+- `Issue Tracker <https://github.com/ClangBuiltLinux/linux/issues>`_
+- IRC: #clangbuiltlinux on chat.freenode.net
+- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
+- `Wiki <https://github.com/ClangBuiltLinux/linux/wiki>`_
+- `Beginner Bugs <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
+
+Getting LLVM
+-------------
+
+- http://releases.llvm.org/download.html
+- https://github.com/llvm/llvm-project
+- https://llvm.org/docs/GettingStarted.html
+- https://llvm.org/docs/CMake.html
+- https://apt.llvm.org/
+- https://www.archlinux.org/packages/extra/x86_64/llvm/
+- https://github.com/ClangBuiltLinux/tc-build
+- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
+- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
diff --git a/MAINTAINERS b/MAINTAINERS
index 8b85f22b9b69..79e1f9bfb2b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4124,6 +4124,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 C:	irc://chat.freenode.net/clangbuiltlinux
 S:	Supported
 K:	\b(?i:clang|llvm)\b
+F:	Documentation/kbuild/llvm.rst
 
 CLEANCACHE API
 M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
-- 
2.25.0.265.gbab2e86ba0-goog

