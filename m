Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277CAC432C3
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 10:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC6F064F41
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 10:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbhCDKcC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Mar 2021 05:32:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238558AbhCDKbn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Mar 2021 05:31:43 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9D4FC0613E2
        for <linux-doc@vger.kernel.org>; Thu,  4 Mar 2021 02:30:12 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m7so798510wmq.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Mar 2021 02:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jzLcn/9JFFu/zAnz2fz4llMxe0ZNESpsBe/AAdOPAB8=;
        b=tuRBMG8HzrbDNFK8qAYS22PR4XQ2So85s7DniK8OWce7W92hEoiJwjeBU2i2PY3X6l
         ouGt9uuEdG/TNzuKbXDdMBzv60SNx9ywfNVhzNiAo7JXpYnaKPPFL11M4k2tl7iFSrte
         ZXlJOQfCvCeEvhP5Xt9/W1FScPmHLQgb+PHAu3Tb8sSdiF8LUGhBpuPjC8OYpwIdJDaT
         9+JTGwgtBqmhkH5eT0PzY0YZ+w2S7TY5fiHBnRcNEr5rmRDDOVv5KNekn9HZ8xJTwDjO
         5WhJoGB6Q6g96ok0hzPlUyDW1B1RJyptPiXTZ84Amg1hKWsWGlLuwuY6lpZNoJTg6gTU
         jMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jzLcn/9JFFu/zAnz2fz4llMxe0ZNESpsBe/AAdOPAB8=;
        b=cjHGQUhTlOKMit4xgogVbEyrP1g3pSsMOQ9jTZBJN3q4/CHtb01oA/nYZaeLR/4x4f
         MGPnmEyMBlpsA2Kil06k3MBVnKvdrJ40BuMZPs2VaOZlIoSRUAjFt+R67jQYVq7djkm5
         S7jZrMUMHbdhcQwKlQsawzFKuPn/TuzyAIk+j4b4XXJiaNiJlBUgS77KHTSoA1aiOqNF
         tiNqEH2hTZ7JXXq1auO1alykU5/Dm1jEMF3pnLopat9GPf02qqXIjSa8l2Ki240n52nE
         NJh6synsCerWPIUxZazPeQOa8g5rYPlhu0EI5ckpIgZzHKHmvl3lB9RedtzDUDSiZVu9
         YYtA==
X-Gm-Message-State: AOAM530+JW/y6fnsXITjeJqt8qCCMsaS1NIXhxS1kNLx/QHNjKfbU7yq
        W0aItI5WkaVL8g2YiJKAtu86+w==
X-Google-Smtp-Source: ABdhPJwOYvL1KO3KRXjN8n30tg8GfdxYxQb08ru+C3Jv/q3rkh1v5cZ0T6iJXrCdfEmnn+bpte48GA==
X-Received: by 2002:a05:600c:2204:: with SMTP id z4mr3303682wml.31.1614853811561;
        Thu, 04 Mar 2021 02:30:11 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id f7sm35501854wre.78.2021.03.04.02.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 02:30:11 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 06/12] lib: bitmap: order includes alphabetically
Date:   Thu,  4 Mar 2021 11:24:46 +0100
Message-Id: <20210304102452.21726-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20210304102452.21726-1-brgl@bgdev.pl>
References: <20210304102452.21726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

For better readability and maintenance: order the includes in bitmap
source files alphabetically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 include/linux/bitmap.h | 4 ++--
 lib/bitmap.c           | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 6939a8983026..3282db97e06c 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -4,10 +4,10 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/types.h>
 #include <linux/bitops.h>
-#include <linux/string.h>
 #include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/types.h>
 
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 75006c4036e9..78f70d9007ad 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -3,17 +3,18 @@
  * lib/bitmap.c
  * Helper functions for bitmap.h.
  */
-#include <linux/export.h>
-#include <linux/thread_info.h>
-#include <linux/ctype.h>
-#include <linux/errno.h>
+
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/bug.h>
+#include <linux/ctype.h>
+#include <linux/errno.h>
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
 #include <asm/page.h>
-- 
2.29.1

