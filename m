Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE59C49361
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 22:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C56A613B4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 22:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbhFQXAT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 19:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhFQXAT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Jun 2021 19:00:19 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 944AEC061760
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 15:58:11 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id v7so6192030pgl.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Jun 2021 15:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M963NEoRmxGB3SjEHSV83Kd4QRNucQJu5LIMOnGA8ko=;
        b=OA+kAIlauRSDb+CI6MbHcGOV5JOTWGds10yzRJPLfChHry7qe7mzHqK/SoLqcpGnkD
         dWsxar8ymVxO6hG0LKzzBGXLZEWRBBUyYTz4paNPRUgGFnOnDpZeO1SvfGXfJ2H8nNXf
         rsQle4mOehxCZSB/lreoBpzixda9zRj4XYMmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M963NEoRmxGB3SjEHSV83Kd4QRNucQJu5LIMOnGA8ko=;
        b=mLrPOIBhW3BvRI+PvzVr+MLh2uoPOI54euq7i3hGSH1j2iH/RaMtirRGlZn4w9Bofr
         Z3q3+pMrTtRebiW1+Qz2e2yi141LPeJaIJcXb8ogbx1Ri0V+VkBJ88Uh1vo0GtumsnFR
         cJBk8Cn7rSGLqQ04/X+AvLZ45dZIJ5Ej2JJZWvxyOefomNaxCVj4r+xoTt9squ1Ys/Ks
         io3Zz9EF1SQzEM0/81uwftitfuEvUogglFAfy/3GmJhI82QcxQ3Fy6VcJ1+tufXQkOKa
         9xu2DkPLDPO2D8UiOY4s3VyE5JA9vRhSmaAQCb5Hi61z4MRaILxqyCwB0dkZgtFVRHyH
         R5jw==
X-Gm-Message-State: AOAM530SoXkYlMm9LWwlMOV6suqiv3wNjalWkKvaFMfcwOdYmItbSD5T
        yQAoS3ewRuwgLT8bLYX4hK66SQ==
X-Google-Smtp-Source: ABdhPJw80/VBj4MS23z1Ab1xiLaaKC/Hnls4MoGH4I3uaQpLX9wLS07ARA+CD7qrqK0fOIPJCCo9Rw==
X-Received: by 2002:a63:1a0e:: with SMTP id a14mr6964360pga.294.1623970691053;
        Thu, 17 Jun 2021 15:58:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y2sm5862419pfa.195.2021.06.17.15.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:58:10 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] docs: Makefile: Use CONFIG_SHELL not SHELL
Date:   Thu, 17 Jun 2021 15:58:08 -0700
Message-Id: <20210617225808.3907377-1-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=20ce389ebab83cc7e86916a49c2f00499469448b; i=NAwohiNtDwFkaYSJPIo4V59safoFlDQ1i5ixhTHo3+0=; m=oPKwbLE1qEhjEt2G9mm8oKPcrdWBPot3oW/0aB7A1ng=; p=Xpq8PDGv9JJnD/2YCorCe1IO2oviHIBY4CrEnhSIfc8=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDL04AACgkQiXL039xtwCbUNw//VIj YQwZ8qXwPIfH4LKtC9P2Yuf9Fg9y0K5RGx256/huSMteQ+WLbvTukjOs/vPpuY4E4iFQUqm9+UdHe JDQ6IVs5CAzZmKQ3vtIW1TMyfyYEX8u5irHshSjos8wlGnRI6zdUP9LfLQqefRh3DOEeB0nNnwdM/ T4Ys/FuJDvPxxcfjlRIvvz0xq9K0Z5NF69WL7HIgW9c0KaYSMiP0H3ow9vd6I9rs5Xo7KGRuKcclk E2rRMRLvdqyN+I0Nl+WjPf8YMcO0E1IlwS3YlRe20Y03Fr/RXApOz8OIb41Wm9oLaPYulTIV9mQLN TwJFGGLreP5ROBde0+q+bNnrSYveBZdqO412BpAkKM6PSmwf13z/WvYj6Tw/b/KHadfTAaVhVRVtC gYLUDEPXqLcO/NKhONrbH/pt0d9FEcQKtYhC5QlKMhzU5sH4PcIq/7RXezh6nsG3s4yBMU3zKu1XD RtRFUkODB68mVlsQ4TKIOMcJyJrCeQqRShcGGk9wD+IyyuMwQPrgsNUPb7sEheMapuG5DSGeS57Z5 5+LikA8eIA16whFMjfb9jH6J0kudg+JvqR2JzPmgEuV/yWbvtxkmcV0XhtPv6WVRZoN0vwupOHIgn 4+tqNuwvYGqG8fe9sEGHtofYVM9DFSLz6FtT+ZbxUwdRi4NGl1F7WJGcy0RQaDjc=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix think-o about which variable to find the Kbuild-configured shell.
This has accidentally worked due to most shells setting $SHELL by
default.

Fixes: 51e46c7a4007 ("docs, parallelism: Rearrange how jobserver reservations are made")
Cc: stable@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 9c42dde97671..c3feb657b654 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -76,7 +76,7 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 	PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abspath $(srctree)/$(src)/$5/$(SPHINX_CONF)) \
 	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
-	$(SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
+	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
 	$(SPHINXBUILD) \
 	-b $2 \
 	-c $(abspath $(srctree)/$(src)) \
-- 
2.25.1

