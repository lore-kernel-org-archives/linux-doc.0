Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8514DC4727D
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 21:19:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27B9520757
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 21:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y7594vIb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgI2VTn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 17:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgI2VTn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 17:19:43 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD5FC061755
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 14:19:43 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id d198so4812371pfd.15
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 14:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=zLJyFMf9XZVQIy9gnwTsATrEt+DgUwH6ys2B+6ApuhI=;
        b=Y7594vIbHkXBhApmTedw2NwyrpJX9f2YfI72IgOYLGX/daGmvomA28H71cor7NZwm8
         rhkEBz7K2u6j3w5klPkBAnppYc0cuCn4RnyLCDfttpT4iDWk/n94iCjGAyKlW2n5HKFv
         VZD80GgYBFs4kqSlF/45g2NKdo+yFdg4pHUfz8VxC89N+fm2M6pDetzbdZyiv3grIhWa
         ap5hgRUbvDzc79SpSnPaJ5WA1QmEAg097fIckc35Qc5saTiIWtXSiIAsSZhdZQWhyJIQ
         3X5tYfFzxQR0xYWMH+W0II9PkT9SbovJ5UMOG1DwLs1ZAzODwQFn/4CsCnMvoeXYBi6y
         tEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=zLJyFMf9XZVQIy9gnwTsATrEt+DgUwH6ys2B+6ApuhI=;
        b=sulZyZ1EA5AJKHIQr0OZ6AubVBEJnqCZpEzEyJuxh3tfzbAA4vGu5SUw6syAVaPaHe
         RZ70/xmGjzvyr5JWjiPYdBUMuQMMV9ILvX7P5Lqz2QCKcE8aUe1c9ARG/Tc/y/tlUgWc
         TGkKpKZYgHw8xksorusyKYZhNUliJuDd7KzozAvrAEIqgIiAg9SWHfdhSvp2nZJIwM5F
         LTDR9mUifZ/KWrY2y2lSpMEmvloKehl8+TeFU9sHbfmkGbBD5fHyfpP+kcmhtFivdGlT
         y0t1R1qXIqZhJ182By+8GDUhMalXgrCLZnwDCYzIT5zXmU0+BbfbDy7divos3NUQ5wwj
         GhfQ==
X-Gm-Message-State: AOAM530/94RE0HSI2PPOkLBcj7WaX8599k+ttmPw+PrLqA3dWqEeWMPF
        DyY5yeA78CWQBKUuDyKUQbjifJT+J1yw8P8i6+I=
X-Google-Smtp-Source: ABdhPJxMiJ29B6/aBRGEVbZqKnFd8BQ8IkyftiV8NGjJZ/F47cWFXbYu/vlnLs/c9iNH8M+N1zQ5Jkxd0qSzOpcar/4=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:aa7:9592:0:b029:13e:d13d:a054 with
 SMTP id z18-20020aa795920000b029013ed13da054mr5822227pfj.26.1601414382399;
 Tue, 29 Sep 2020 14:19:42 -0700 (PDT)
Date:   Tue, 29 Sep 2020 14:19:35 -0700
Message-Id: <20200929211936.580805-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
Subject: [PATCH] docs: programming-languages: refresh blurb on clang support
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Building the kernel with Clang doesn't rely on third party patches, and
has not for a few years now.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/process/programming-language.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/process/programming-language.rst b/Documentation/process/programming-language.rst
index e5f5f065dc24..63af142d64ec 100644
--- a/Documentation/process/programming-language.rst
+++ b/Documentation/process/programming-language.rst
@@ -6,14 +6,15 @@ Programming Language
 The kernel is written in the C programming language [c-language]_.
 More precisely, the kernel is typically compiled with ``gcc`` [gcc]_
 under ``-std=gnu89`` [gcc-c-dialect-options]_: the GNU dialect of ISO C90
-(including some C99 features).
+(including some C99 features). ``clang`` [clang]_ is also supported, see docs
+docs on :ref:`Building Linux with Clang/LLVM <kbuild_llvm>`.
 
 This dialect contains many extensions to the language [gnu-extensions]_,
 and many of them are used within the kernel as a matter of course.
 
-There is some support for compiling the kernel with ``clang`` [clang]_
-and ``icc`` [icc]_ for several of the architectures, although at the time
-of writing it is not completed, requiring third-party patches.
+There is some support for compiling the kernel with ``icc`` [icc]_ for several
+of the architectures, although at the time of writing it is not completed,
+requiring third-party patches.
 
 Attributes
 ----------
-- 
2.28.0.709.gb0816b6eb0-goog

