Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 011B7C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 14:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243880AbiCUOwH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Mar 2022 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240991AbiCUOwH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 10:52:07 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD65463C6
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 07:50:41 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id t9-20020a5b03c9000000b0063363e52dd1so12210090ybp.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 07:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=j/FXTEmOSxH0gjgjdSzeFMh8shZcXNYs1S5aZMLLEM4=;
        b=SBrVSoKXdDsuaByiB5bpEuvHlzX6PEE7ScTFdcnyvBB3LM8FjBIxb4HE452P7nW/1P
         x8Uhx569twf4z5ULHgqQdUEGzVl4SU+QwvbLAIFQyuTyB21bcIOsfkT6/PBkBr+1n4Y9
         hsFezBjQyP+3jHyQKzGIyLT/UH4/gWuwY3xOeR6unA65Om/6xbAmfUO+De3vhuy15UEC
         zrrJLt9FdxLdYyM926/tTlpnRZTG53MfuP8rZklNPPTyNZfK1RA5vggICA2wqeExGlfZ
         AfbURLvOReHTpT55NHCBSLztJoEA6UoKzhUD4WkTaY5lbkIRXroMJHZHY4psJj9DqtPU
         W+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j/FXTEmOSxH0gjgjdSzeFMh8shZcXNYs1S5aZMLLEM4=;
        b=51gl3pSQYNU9wuRPc4b9WKzGtBgUB8U4NsjqV+hLrTVqKbfSKZojHjlnpeo1es4Rag
         d0LbIjke/r1nJqsgIhD+fvjkUGEzxgMXy19LSebU5kqr1KQ9w+etySVbPL29nY0/gskm
         N+cjrhAHkWuqyobXh6gBI6Q5ofQQE4TZDCYXEpwfnkR6prvHuyRQeuPQzgVPtlC8lkFq
         joH57dJWJE9Jc2C1NbGbAqj/pUJ1wHtXFXQz78znPaE5sehx7SU1TdwteFRPTUURJce6
         dP64sFra5jEXYNnCibUjl5DT+7q4FQIdFxutCi/DeNCXtc8xoMb0k7ciYHMlg+s8uuh5
         k+3Q==
X-Gm-Message-State: AOAM531WHBFOabpdwOMIwSj0zfZddq6WZ/haTR/t/PIlFla1QwH4/L8z
        dY1opBfLpSNchgHit390BPyGD7jtYVPC
X-Google-Smtp-Source: ABdhPJxLCtNARAk+EJOSYZ01zh/M9UDj+P8uAmI3Yand6sFtWYVr5ajlQJ7KLCg0hyNWZ/skpNcv8bBOhH9u
X-Received: from bg.sfo.corp.google.com ([2620:15c:11a:202:3257:ddd6:5193:4ceb])
 (user=bgeffon job=sendgmr) by 2002:a25:7686:0:b0:633:bdb7:1e75 with SMTP id
 r128-20020a257686000000b00633bdb71e75mr14061753ybc.634.1647874240929; Mon, 21
 Mar 2022 07:50:40 -0700 (PDT)
Date:   Mon, 21 Mar 2022 07:50:37 -0700
In-Reply-To: <20220315172221.9522-1-bgeffon@google.com>
Message-Id: <20220321145037.1024083-1-bgeffon@google.com>
Mime-Version: 1.0
References: <20220315172221.9522-1-bgeffon@google.com>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
Subject: [PATCH] zram: Add a huge_idle writeback mode
From:   Brian Geffon <bgeffon@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-block@vger.kernel.org, Brian Geffon <bgeffon@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Today it's only possible to write back as a page, idle, or huge.
A user might want to writeback pages which are huge and idle first
as these idle pages do not require decompression and make a good
first pass for writeback.

Idle writeback specifically has the advantage that a refault is
unlikely given that the page has been swapped for some amount of
time without being refaulted.

Huge writeback has the advantage that you're guaranteed to get
the maximum benefit from a single page writeback, that is, you're
reclaiming one full page of memory. Pages which are compressed in
zram being written back result in some benefit which is always
less than a page size because of the fact that it was compressed.

This change allows for users to write back huge pages which are
also idle.

Signed-off-by: Brian Geffon <bgeffon@google.com>
---
 Documentation/admin-guide/blockdev/zram.rst |  6 ++++++
 drivers/block/zram/zram_drv.c               | 10 ++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index 3e11926a4df9..af1123bfaf92 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -343,6 +343,12 @@ Admin can request writeback of those idle pages at right timing via::
 
 With the command, zram writeback idle pages from memory to the storage.
 
+Additionally, if a user choose to writeback only huge and idle pages
+this can be accomplished with::
+
+        echo huge_idle > /sys/block/zramX/writeback
+
+
 If admin want to write a specific page in zram device to backing device,
 they could write a page index into the interface.
 
diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index cb253d80d72b..f196902ae554 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -643,8 +643,8 @@ static int read_from_bdev_async(struct zram *zram, struct bio_vec *bvec,
 #define PAGE_WB_SIG "page_index="
 
 #define PAGE_WRITEBACK 0
-#define HUGE_WRITEBACK 1
-#define IDLE_WRITEBACK 2
+#define HUGE_WRITEBACK (1<<0)
+#define IDLE_WRITEBACK (1<<1)
 
 
 static ssize_t writeback_store(struct device *dev,
@@ -664,6 +664,8 @@ static ssize_t writeback_store(struct device *dev,
 		mode = IDLE_WRITEBACK;
 	else if (sysfs_streq(buf, "huge"))
 		mode = HUGE_WRITEBACK;
+	else if (sysfs_streq(buf, "huge_idle"))
+		mode = IDLE_WRITEBACK | HUGE_WRITEBACK;
 	else {
 		if (strncmp(buf, PAGE_WB_SIG, sizeof(PAGE_WB_SIG) - 1))
 			return -EINVAL;
@@ -725,10 +727,10 @@ static ssize_t writeback_store(struct device *dev,
 				zram_test_flag(zram, index, ZRAM_UNDER_WB))
 			goto next;
 
-		if (mode == IDLE_WRITEBACK &&
+		if (mode & IDLE_WRITEBACK &&
 			  !zram_test_flag(zram, index, ZRAM_IDLE))
 			goto next;
-		if (mode == HUGE_WRITEBACK &&
+		if (mode & HUGE_WRITEBACK &&
 			  !zram_test_flag(zram, index, ZRAM_HUGE))
 			goto next;
 		/*
-- 
2.35.1.894.gb6a874cedc-goog

