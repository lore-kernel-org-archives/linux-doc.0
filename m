Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 679B3C43334
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jun 2022 16:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237486AbiFQQ6r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Jun 2022 12:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383070AbiFQQ6l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 12:58:41 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCFBD2FFD1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 09:58:40 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id e6-20020a259246000000b00668cc122ca7so276779ybo.9
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 09:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=HIkosMxJu0DsWXpVdxpWrXztbgfsO84tS9Or7dZuu1Q=;
        b=hNEMukuOffSzyw5d6QBcwxNcqKUnC8L7F85D8e4DMiaNmNOcfyuY3Zx7l9WU+TMSNN
         bng7bOJtVv2lMxmVy9WRgT/M1tn0wUyWP+6xcjbbtGndZqD195wLuodEcCItkC1CZnwm
         /yxrwNI4Jl3rGOwj9tm7zr/ciXe+j2yqDhblmTlIoLedlOlLT8hBZJzfF50f4JP6HsDE
         TTStfbmqBaNN8+9kBYjLLKaASBEYJYJhXGYhCWWlCOyrbr25ynvp1kJOOXIRI90IP9Jv
         y88Cvk9Toe3vn+iXOoUKaaV/nJk7QeRSxPxV71CsQGaCI4XKbAKe8LGojB2WJ/BVl/2m
         PH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=HIkosMxJu0DsWXpVdxpWrXztbgfsO84tS9Or7dZuu1Q=;
        b=tl6zSa16hlX5F+ii5hhLp2OawhzXcJ7S7PYBHXW032GBbCR4zuqCFJkPMUg1qT1WMS
         oRZrI6MztCAXuEUnzC+vHYAfqovpVmu3vGzysRsVqTiQ6EhfOiIZB1cRiszjOlYubtec
         kXzzew0jIe+RJ2ptrd8Dtd+EwPzPbaUfolwOkZLxlsntFw43QsxrDoKwhDd5BDNOxEdS
         LuBWDmnqcPcDQcuRmKxBsFM8oxQPPMtrjnoSC68GnJIqAHPpZ+vRPEZvhVoDv7mLj4P5
         bE/BsyUB4yi6PX8orVGBb742dJKr/idTN78vwGiwBjkZQN8LNJ3KnN77T//3pSjvWKbp
         PzeQ==
X-Gm-Message-State: AJIora+rBemkDVj0QKSRQMywS3eMAEIAF9frkfat7zUPBKaQICd85Z3X
        7uZOqT+R70FljPShpjierbt6ZgaVF35E3Bxx0lI=
X-Google-Smtp-Source: AGRyM1uaTYh1F8LDuoxG1oRipLMJSHEmWpZiFQyuyySsXPgzvm1S5MjCu7Uh4zVtK17/lbBhl7nz67P0zLVAEzLDqRc=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:7e0c:dc00:6576:994e])
 (user=ndesaulniers job=sendgmr) by 2002:a0d:cf04:0:b0:30f:c6e3:b62c with SMTP
 id r4-20020a0dcf04000000b0030fc6e3b62cmr12128627ywd.306.1655485120058; Fri,
 17 Jun 2022 09:58:40 -0700 (PDT)
Date:   Fri, 17 Jun 2022 09:58:17 -0700
Message-Id: <20220617165817.3204917-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=lvO/pmg+aaCb6dPhyGC1GyOCvPueDrrc8Zeso5CaGKE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655485097; l=1310;
 s=20211004; h=from:subject; bh=pe+YwCN7a/5bmdaqbfY3NE5BJF4TRtPW3C6ELb8zZF8=;
 b=eNQ0gyHPhuoYjZ/pWdaRl9A62Rla+ymyhL1crK6lecZwFPypboi8Y9gWiEqW6dcb1XWwvQeLFVZ1
 KEYzifuFCQCYqa7UTDNE+9DgoPPpMYO6Qjfxhtbg/G3o5f3JfD/C
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
Subject: [PATCH] Documentation/llvm: Update Supported Arch table
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michael Opdenacker <michael.opdenacker@bootlin.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, llvm@lists.linux.dev,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While watching Michael's new talk on Clang-built-Linux, I noticed the
arch table in our docs that he refers to is outdated.

Add hexagon and User Mode.  Bump MIPS and RISCV to LLVM=1.  PowerPC is
almost LLVM=1 capable; ppc64le works, but ppc64 (big endian) and ppc32
still need more work.

Link: https://youtu.be/W4zdEDpvR5c?t=399
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/kbuild/llvm.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index b854bb413164..6b2bac8e9ce0 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -129,18 +129,24 @@ yet. Bug reports are always welcome at the issue tracker below!
    * - arm64
      - Supported
      - ``LLVM=1``
+   * - hexagon
+     - Maintained
+     - ``LLVM=1``
    * - mips
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1``
    * - powerpc
      - Maintained
      - ``CC=clang``
    * - riscv
      - Maintained
-     - ``CC=clang``
+     - ``LLVM=1``
    * - s390
      - Maintained
      - ``CC=clang``
+   * - um (User Mode)
+     - Maintained
+     - ``LLVM=1``
    * - x86
      - Supported
      - ``LLVM=1``
-- 
2.36.1.476.g0c4daa206d-goog

