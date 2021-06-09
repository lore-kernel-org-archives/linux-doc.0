Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF1DC48BCF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 19:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75BC46139A
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 19:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhFITx7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 15:53:59 -0400
Received: from mail-yb1-f201.google.com ([209.85.219.201]:39926 "EHLO
        mail-yb1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhFITx7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 15:53:59 -0400
Received: by mail-yb1-f201.google.com with SMTP id r5-20020a2582850000b02905381b1b616eso32847906ybk.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 12:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=3v/xy1vVOy0p+15gYBu2aWN8fdeRRMYWYLro1y/PuTE=;
        b=fVnkgjEZumr/DFopY/S3A/YevSvqaDXOcTq5g/KTwm7eIQg9gSphvVdkxcVdbpgzLT
         lJpP9kWAQZbM3LS38aK3nN13YpgseyU1sKlcNjHWTuL2yVl79MNpmIkUr+wZDUN1BzRR
         1DINZ1J32lKAgfb9kM32SdHYwehf8Yc72xw4w4C+Z/JrjjA034RBaUHaGfd5ChSRhbCy
         xazlARv6wyC8/APKaNMGqfSCMUpYvflh4quVANFV2x39pu8s1+bvwyVuwSkrsn+d9KLV
         2aHjXFJPk7avyqicaOs967Y8kojFdtx5teRh8qLD7h6MiQMM+n/UbgO16L4eWrN6Ijhc
         ACCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=3v/xy1vVOy0p+15gYBu2aWN8fdeRRMYWYLro1y/PuTE=;
        b=VcvMxMyR1tO2wcsdXZiy1t8d4Dz4GOGcqCxdN+d01ooqJYshLxcu7Du/xryUGZHP5i
         34kBZlesgIKFsSRo1E62wZYWrLjal5RbumvK9zE8DxouWRs/WmgnEUYX/ZFmd0ktmxYB
         sPAeuyBhirmNOSARRYOQqtmG/c4rRpTcEvmXT8cxhGzRk+4JN0QXRwkMnx+33sfsdH47
         hmjTPkQy8f0C7bYxRbmOF41gBbGXnlqXMqiRsPL6SEDBuZ6ZxVoU1oGQSRC8+Wa8Dp5g
         Q6uSqncK0cFKPh3Nsq1FYiTYkN3LWzzPja6a+ldRTBzUga+cut1JDzF4fdCW7FwCmR3u
         a6yw==
X-Gm-Message-State: AOAM533VjIIpCbkbqKEZD4ZZYPAWi7QZKkvqxAvxn8Zrhun2C4gzk4jP
        5V3k6FfxIHACvc8S7D0w34Bj301HRkD9XA==
X-Google-Smtp-Source: ABdhPJw7vh85Y9sFxAP7377PCT2/FrmEYTd30+tA56N/gxjXEY7UuB+G1tBWK25kYPCwnIObHPDNDRknwOpaHw==
X-Received: from xllamas.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:b1])
 (user=cmllamas job=sendgmr) by 2002:a25:be44:: with SMTP id
 d4mr2206033ybm.497.1623268264053; Wed, 09 Jun 2021 12:51:04 -0700 (PDT)
Date:   Wed,  9 Jun 2021 19:50:58 +0000
Message-Id: <20210609195058.3518943-1-cmllamas@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH] docs: printk-formats: update size-casting examples
From:   Carlos Llamas <cmllamas@google.com>
To:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Hellwig <hch@lst.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Carlos Llamas <cmllamas@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since commit 72deb455b5ec ("block: remove CONFIG_LBDAF") sector_t and
blkcnt_t types are no longer variable in size, making them unsuitable
examples for casting to the largest possible type. This patch replaces
such examples with cycles_t and blk_status_t types, whose sizes depend
on architecture and config options respectively.

Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 Documentation/core-api/printk-formats.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index f063a384c7c8..385c0cc52f1f 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -37,14 +37,13 @@ Integer types
 		u64			%llu or %llx
 
 
-If <type> is dependent on a config option for its size (e.g., sector_t,
-blkcnt_t) or is architecture-dependent for its size (e.g., tcflag_t), use a
-format specifier of its largest possible type and explicitly cast to it.
+If <type> is architecture-dependent for its size (e.g., cycles_t, tcflag_t) or
+is dependent on a config option for its size (e.g., blk_status_t), use a format
+specifier of its largest possible type and explicitly cast to it.
 
 Example::
 
-	printk("test: sector number/total blocks: %llu/%llu\n",
-		(unsigned long long)sector, (unsigned long long)blockcount);
+	printk("test: latency: %llu cycles\n", (unsigned long long)time);
 
 Reminder: sizeof() returns type size_t.
 
-- 
2.32.0.272.g935e593368-goog

