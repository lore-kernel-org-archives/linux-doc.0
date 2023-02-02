Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AB8C61DA4
	for <linux-doc@archiver.kernel.org>; Thu,  2 Feb 2023 18:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbjBBSF7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 13:05:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjBBSF6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 13:05:58 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ED76F700
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 10:05:55 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id g138-20020a25db90000000b0080c27bde887so2406450ybf.18
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 10:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pcrdwdxm3GaoayBnAN0D1xU3wF7llh/DmYJIvd7/CSs=;
        b=mzUE3hQUlTgZW+KoG/RsOuhs2zwW1QN1QpRvovVnEF9IN2laZNI+3boFOK/RoKamBV
         Ik3TENNNFksJOyFwovOwFRrUJ/C/ArP78Rq3buhwWQByumqUSbokOCoVWrY0yREvU/aP
         MopjTY6vlzHrnmtXmSaIAJEafRfIbORNX7iTr1GXFRn5wcxE5ehAvfAeEeMSAUdK7tg+
         sE5VR9pQ5OPdUO4z3B7h/R2lJL7IvOM3BpQSxY9B7CZdJTk8N7+UQFj/AJSinav5Zy81
         Z4+rtFznfMaTktQ2u/R8sn6a0/9R6HqqTH3psEJKlcyoKRZUgbNU2kkgS/YnC2J9oOd+
         FBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pcrdwdxm3GaoayBnAN0D1xU3wF7llh/DmYJIvd7/CSs=;
        b=uNcUoN4RORX57e9fh4bmm/JlFEAmKcQid8e/TCaPR0yZsTgP+Nep4FWR50iExVwd4y
         mztsrq9yZwNzQfYrzzBuITQfk3lV+anyaR3JaEF8ntQO8JPErggvgpHrWDZ7DgN/DHoY
         +Ci33RzyPhGr/A8n6DxO5CZSJRT9jXOVMOWg0wA4MHpsAohpNX/MTpvIXWRRr0O3d031
         2Kenragxwi1dKmki59bHxCwRT/C+fGGd4zTJmelOKE50InDm6m61ICmU//10aIVgCnpx
         xhve4Hf1JE/0pWDZ0TRrDHJUC2tOAMXXCT6RSkCFK0rbG3XdMDRWbO2r4shgqzVgSpx6
         w2uQ==
X-Gm-Message-State: AO0yUKUlRUo9Qb4k6O1Ax0v6HJ/juOhEPZf85/njxAd/I4Pj3QxMGikv
        GFNsoTqohUcYk0gTRRIbOr/YzX0eKVdwqcpW0l8=
X-Google-Smtp-Source: AK7set9MnxxlJeWO4CaZjVHGtPtPKCQhta0jpl3+E87wBf9g+u8F6ZpwMKBXdb24b/9R/88Os7Gf6mOLLMdzToqto5Y=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:6989:8074:882f:1b03])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:1801:b0:7c8:3b5:b58d with
 SMTP id cf1-20020a056902180100b007c803b5b58dmr1053700ybb.494.1675361154937;
 Thu, 02 Feb 2023 10:05:54 -0800 (PST)
Date:   Thu,  2 Feb 2023 10:05:48 -0800
In-Reply-To: <202302021759.syE8waoZ-lkp@intel.com>
Mime-Version: 1.0
References: <202302021759.syE8waoZ-lkp@intel.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675361148; l=2471;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=1znbSDzr7hZkfxh9QWcbuf6FrYA2adf+h8XbmU+08m8=;
 b=iFY7n4mMPyovBg+3CK51+G1hMOc0LKIuvX7lW/a+IEZTQWbLGmXirNYWH5oelsG9pgTMvNZI/cL1
 ZwOw0DmCCxOprJENMrlBxlOfc8QFh7HD/W9cTqGqfACAK2gmfd0L
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
Message-ID: <20230202180548.229213-1-ndesaulniers@google.com>
Subject: [PATCH v2] Documentation/llvm: add Chimera Linux, Google and Meta datacenters
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bill Wendling <morbo@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Yonghong Song <yhs@fb.com>,
        Daniel Kolesa <q66@chimera-linux.org>,
        Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Chimera Linux is a Linux distribution from 2021 that builds its kernels
with Clang.

Google transitioned its data center fleet to run Clang built kernels in
2021, and Meta did so as well in 2022.  Meta talked about this at LPC
2022 at a talk titled Kernel Live Patching at Scale.

These were important milestones for building the kernel with Clang.
Making note of them helps improve confidence in the project.

Reviewed-by: Tom Rix <trix@redhat.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
Co-developed-by: Yonghong Song <yhs@fb.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Cc: Daniel Kolesa <q66@chimera-linux.org>
Cc: Chris Mason <clm@meta.com>
---
For Bernd Helmle!

Changes v1 -> v2:
* pick up RB tags.
* switch signed-off-by to co-developed-by, as per Nathan.
* restore `<` I dropped accidentally in v1, as per kernel test robot.

 Documentation/kbuild/llvm.rst | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 6b2bac8e9ce0..bfb51685073c 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -15,12 +15,15 @@ such as GCC and binutils. Ongoing work has allowed for `Clang
 <https://clang.llvm.org/>`_ and `LLVM <https://llvm.org/>`_ utilities to be
 used as viable substitutes. Distributions such as `Android
 <https://www.android.com/>`_, `ChromeOS
-<https://www.chromium.org/chromium-os>`_, and `OpenMandriva
-<https://www.openmandriva.org/>`_ use Clang built kernels.  `LLVM is a
-collection of toolchain components implemented in terms of C++ objects
-<https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM that
-supports C and the GNU C extensions required by the kernel, and is pronounced
-"klang," not "see-lang."
+<https://www.chromium.org/chromium-os>`_, `OpenMandriva
+<https://www.openmandriva.org/>`_, and `Chimera Linux
+<https://chimera-linux.org/>`_ use Clang built kernels. Google's and Meta's
+datacenter fleets also run kernels built with Clang.
+
+`LLVM is a collection of toolchain components implemented in terms of C++
+objects <https://www.aosabook.org/en/llvm.html>`_. Clang is a front-end to LLVM
+that supports C and the GNU C extensions required by the kernel, and is
+pronounced "klang," not "see-lang."
 
 Clang
 -----
-- 
2.39.1.519.gcb327c4b5f-goog

