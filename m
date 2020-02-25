Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140A6C35E15
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 21:03:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DA69420714
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 21:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="az9/lEQ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729018AbgBYVC7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 16:02:59 -0500
Received: from mail-qv1-f74.google.com ([209.85.219.74]:36075 "EHLO
        mail-qv1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbgBYVC7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 16:02:59 -0500
Received: by mail-qv1-f74.google.com with SMTP id b8so805257qvw.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=vWB3la6MZAcuUeVOqIcp281F5LSfjcobFajXxwkFi6A=;
        b=az9/lEQ6wwXYJyI3Gy29nxJIfWaxkNA++/xMMPhGH9Bp55F58tIoAVd2evBeCT3IlI
         KKgT00uOWJLWB6jM4tMv/BPZk2IBrtNGq1UX9hERFKv4CE6BDLW/6YKDNoqRugx0oOT1
         JFEPhPT7z9F67zo+gQk9nVxt8J2a//vG9eP1UplMOqDnWzcoXl0qqUpUbhow29LFFsDn
         reHM0SO7vQWbTfc/yOUJLSXO7dgd9DEpCrAc4RVQU0ltXVvkKgrYgYLltwqnerD/XmQS
         /3lvr+TKKjaUhwe/wV9rXCo1vDnYLQPRPVlKZHfsvP2A00O5Bpk2Anzs0X1WZLoKap6w
         wzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=vWB3la6MZAcuUeVOqIcp281F5LSfjcobFajXxwkFi6A=;
        b=kZNnqODbj6Q0ee/wJxuEE/X7wp5WITuUlYWlBNXGHancoDMf6GWWz7AECpTPcMSPIz
         kN7PsDSvgDDWRJ+UyeGqk3a4oBYgudjXi1Eu90Wj/zxuO6I6+y6zrZu4TnSAdFIfA7uZ
         IbexA6u1JLavlMiw4bQmcWzUbdYg3vzqQ3onhZotKQvCKqhULyeM6xVGbSQLfjmBDn0a
         eofxRdgp6F9i9Jc826JSAEvuIiUhkVCEar6JYtjCMRWt/ir2c5ggTXk6JPTVZ0+C1967
         GKz3qpqbzOUAcIqViHfjHkIf0xGPBW9IUgNnnPkFBKQjS8Ri70yj3ldgGwBigGoZLk5S
         DZxQ==
X-Gm-Message-State: APjAAAUdsIPZwu/cCeUZWUNt9UXv37XCWpmGiyhHyqLqtMkvOVV8qLb4
        M0ZDAbTLE95yTAy30kBiea4/0ntOl+AcRWiGC4E=
X-Google-Smtp-Source: APXvYqw9j4SjKcqy0U3A0k0fMjgQj/y1SE9wLfZHXsZM0aTr3GyALCU9cgEB1u7akUo3JkjTfFIOLdEo4I2R8DIwtHE=
X-Received: by 2002:ad4:48c6:: with SMTP id v6mr930719qvx.207.1582664577840;
 Tue, 25 Feb 2020 13:02:57 -0800 (PST)
Date:   Tue, 25 Feb 2020 13:02:49 -0800
In-Reply-To: <20200224174129.2664-1-ndesaulniers@google.com>
Message-Id: <20200225210250.64366-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2] Documentation/llvm: add documentation on building w/ Clang/LLVM
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     corbet@lwn.net, masahiroy@kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Added to kbuild documentation. Provides more official info on building
kernels with Clang and LLVM than our wiki.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* s/On going/ongoing/
* add Randy's Suggested-by
* add Nathan and Sedat's Reviewed-by
* Upgrade Kees' Sugguested-by to Reviewed-by
* s/suffix/prefix/


 Documentation/kbuild/index.rst |  1 +
 Documentation/kbuild/llvm.rst  | 80 ++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)
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
-- 
2.25.0.265.gbab2e86ba0-goog

