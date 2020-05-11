Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D4BC47255
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:32:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFC7520714
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:32:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="j5MDUIJ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgEKXcn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 19:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728165AbgEKXcm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 19:32:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 191DDC05BD0B
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:32:42 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x77so5470075pfc.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PH+Lgq2PDxQGasQrINJJUArPMyAqt1Bu550VMx9KhTM=;
        b=j5MDUIJ57Zb1XMPHrvgMGx/+NPr8bHDEO2bG4ZiPGcMzfH94HkqBHKr8M2/V4xIYiU
         BiLuPzcO/L8cllSMOGWudertUXZcW5VpV7+5sVr9B+sNj38x8i6CpvlNyLwk9yT1+ZMJ
         hqC3QlGT30FSrfmGBpVD7dEF1ERoGLxJe7bDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PH+Lgq2PDxQGasQrINJJUArPMyAqt1Bu550VMx9KhTM=;
        b=RfrOHB9aHc5BJ9TzVf0T1PDCMazCYaQtcriZDkJADyZ0EUvi0TNomBjjerLaN8cxih
         locO/sUwBNqfsWuc5GyZl43cGK0GEfw+1qbFg4vN2DixWh/wSEEY/ypTqYNFD0VeIfHq
         S696wnofB0aSovVhxnHNnPK3WwDyY+dTd9WNAW/4aidAn8EFLHl1HvvOMRGo4Q2DycWj
         eUg12VlDkVC9ImThB5XuPyO4Y6rTR6U1o3ypvtlGS9kFfpOvV2XKdTSX6dPecZ7CMLyy
         n3jMNECKCFxsEiCgAjgnpgc2Gg9KAxRh3wh3Xt+f/8ap8zn1cnh28ZLOVEp5wggVCsP+
         M53g==
X-Gm-Message-State: AGi0PuZ1RlX41w/ZEg8l8QVc4vDDOEqSe6mfg9TtC+SEBb2JM8+tMNal
        V9cLIhtVaLPvn5ZPYVPC388R/g==
X-Google-Smtp-Source: APiQypICx+ruy2OmXqybOfijHEnitIe0QnR1AxpP3stz09rJYnTQHfeE4j8jAEYs7JzXimY/e1a4bQ==
X-Received: by 2002:a63:5b1f:: with SMTP id p31mr17466913pgb.335.1589239961627;
        Mon, 11 May 2020 16:32:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 10sm10195129pfn.204.2020.05.11.16.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:32:38 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [PATCH v8 11/11] pstore/blk: Introduce "best_effort" mode
Date:   Mon, 11 May 2020 16:32:29 -0700
Message-Id: <20200511233229.27745-12-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200511233229.27745-1-keescook@chromium.org>
References: <20200511233229.27745-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to use arbitrary block devices as a pstore backend, provide a
new module param named "best_effort", which will allow using any block
device, even if it has not provided a panic_write callback.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/blk.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index a1bd7c1fdfa0..9000d2e9f1c5 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -51,6 +51,10 @@ static long ftrace_size = -1;
 module_param(ftrace_size, long, 0400);
 MODULE_PARM_DESC(ftrace_size, "ftrace size in kbytes");
 
+static bool best_effort;
+module_param(best_effort, bool, 0400);
+MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require storage driver pstore support, default: off)");
+
 /*
  * blkdev - the block device to use for pstore storage
  *
@@ -378,7 +382,8 @@ static int __register_pstore_blk(struct pstore_blk_info *info)
 	}
 
 	/* only allow driver matching the @blkdev */
-	if (!binfo.devt || MAJOR(binfo.devt) != info->major) {
+	if (!binfo.devt || (!best_effort &&
+			    MAJOR(binfo.devt) != info->major)) {
 		pr_debug("invalid major %u (expect %u)\n",
 				info->major, MAJOR(binfo.devt));
 		ret = -ENODEV;
@@ -480,6 +485,20 @@ int pstore_blk_get_config(struct pstore_blk_config *info)
 }
 EXPORT_SYMBOL_GPL(pstore_blk_get_config);
 
+static int __init pstore_blk_init(void)
+{
+	struct pstore_blk_info info = { };
+	int ret = 0;
+
+	mutex_lock(&pstore_blk_lock);
+	if (!pstore_zone_info && best_effort && blkdev[0])
+		ret = __register_pstore_blk(&info);
+	mutex_unlock(&pstore_blk_lock);
+
+	return ret;
+}
+late_initcall(pstore_blk_init);
+
 static void __exit pstore_blk_exit(void)
 {
 	mutex_lock(&pstore_blk_lock);
-- 
2.20.1

