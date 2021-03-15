Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F99BC2BA19
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 09:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7322764E99
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 09:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhCOJOi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 05:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhCOJOU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Mar 2021 05:14:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B05C061574
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 02:14:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id e18so5284787wrt.6
        for <linux-doc@vger.kernel.org>; Mon, 15 Mar 2021 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I//Q3Rak1EpVNRDtRGeww40WUlM2LbS/M05ekONU4GQ=;
        b=f1gaT8JOF07kfR1GIVt3bonS3qRiBTNvSrfnLU1MmbY4X4lmKobMadPhA7/RJHvntX
         vHqhaEUhh37jioU2zjGZ9KwpS8T21BakJizbqkFr1gLTdA5wlidamYFv2KF4k1jGBJ6g
         IqiLpigO9f+o7l2+urpFnArW8+nop+4rkPlBKo2T30Lj7vYU7EWZcTannlhJMleMXLXY
         rJrjSqyVDyxTobKo47ZCta1N/GMyzNRAlNw1+2tb3HJjyrIKXxHtIT8U468ZxnEfUiKc
         fSDGZJATEReXAAr1hfNms+W4TOsxGoQdhcCiP32hJDtrg68IbYACwqtr/V1QV9SqzGSW
         DddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I//Q3Rak1EpVNRDtRGeww40WUlM2LbS/M05ekONU4GQ=;
        b=LIzFWdHBEeYIZQaya0QLSY8cemGlaAlTZMZKnROhQS/dtv/gFsP45uSZGur8X/TtrE
         FElMqwI2tnqf+VWkQRwhFQPRGXrvyXu4ihnwE2DiY0DtY2XdN3YRTph+hzAw2RVmdAqx
         iLyTHfqNtLKI5wYjCJq5gcH3OmbxRyGA8dofcNv+padUljK2YZjMlj0sj6N7B5RyYQ8y
         lJYa4TIqnlM7OvhENsPXtAUnrXO9PCsAuknnnOaBLuPLld0MSwKDGQf4/iZ0YaFWx1WJ
         Q8nJohMXjcY7qaynbkTxQZPjx/xV2tcZg0MLIqO/tuGjokJfo/KHAa5X0wBB+nDrvRKQ
         +4NQ==
X-Gm-Message-State: AOAM531DiixTLuAGhFWdEQ/cjIj7VGLa5LdZwq9XGPPZzv4cb5qY+jJd
        mSOaqp7VfbBEin3uP5rOoVTgbw==
X-Google-Smtp-Source: ABdhPJytTVmPESyI06mXakLaYibH4Ja9idFeJCFiv7lL4WnfKbAG4SwqOFVWwSVYqr/Wjhj+1PQQ4g==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr26313900wru.381.1615799657607;
        Mon, 15 Mar 2021 02:14:17 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id z3sm17978822wrw.96.2021.03.15.02.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 02:14:17 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v5 07/11] lib: bitmap: provide devm_bitmap_alloc() and devm_bitmap_zalloc()
Date:   Mon, 15 Mar 2021 10:13:56 +0100
Message-Id: <20210315091400.13772-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210315091400.13772-1-brgl@bgdev.pl>
References: <20210315091400.13772-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Provide managed variants of bitmap_alloc() and bitmap_zalloc().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/bitmap.h |  8 ++++++++
 lib/bitmap.c           | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 3282db97e06c..73d039476fa4 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -9,6 +9,8 @@
 #include <linux/string.h>
 #include <linux/types.h>
 
+struct device;
+
 /*
  * bitmaps provide bit arrays that consume one or more unsigned
  * longs.  The bitmap interface and available operations are listed
@@ -122,6 +124,12 @@ unsigned long *bitmap_alloc(unsigned int nbits, gfp_t flags);
 unsigned long *bitmap_zalloc(unsigned int nbits, gfp_t flags);
 void bitmap_free(const unsigned long *bitmap);
 
+/* Managed variants of the above. */
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags);
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags);
+
 /*
  * lib/bitmap.c provides these functions:
  */
diff --git a/lib/bitmap.c b/lib/bitmap.c
index 78f70d9007ad..27e08c0e547e 100644
--- a/lib/bitmap.c
+++ b/lib/bitmap.c
@@ -8,6 +8,7 @@
 #include <linux/bitops.h>
 #include <linux/bug.h>
 #include <linux/ctype.h>
+#include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
@@ -1263,6 +1264,38 @@ void bitmap_free(const unsigned long *bitmap)
 }
 EXPORT_SYMBOL(bitmap_free);
 
+static void devm_bitmap_free(void *data)
+{
+	unsigned long *bitmap = data;
+
+	bitmap_free(bitmap);
+}
+
+unsigned long *devm_bitmap_alloc(struct device *dev,
+				 unsigned int nbits, gfp_t flags)
+{
+	unsigned long *bitmap;
+	int ret;
+
+	bitmap = bitmap_alloc(nbits, flags);
+	if (!bitmap)
+		return NULL;
+
+	ret = devm_add_action_or_reset(dev, devm_bitmap_free, bitmap);
+	if (ret)
+		return NULL;
+
+	return bitmap;
+}
+EXPORT_SYMBOL_GPL(devm_bitmap_alloc);
+
+unsigned long *devm_bitmap_zalloc(struct device *dev,
+				  unsigned int nbits, gfp_t flags)
+{
+	return devm_bitmap_alloc(dev, nbits, flags | __GFP_ZERO);
+}
+EXPORT_SYMBOL_GPL(devm_bitmap_zalloc);
+
 #if BITS_PER_LONG == 64
 /**
  * bitmap_from_arr32 - copy the contents of u32 array of bits to bitmap
-- 
2.30.1

