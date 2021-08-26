Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63AA7C432BE
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 495946108D
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241843AbhHZMbf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241470AbhHZMbd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 08:31:33 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88219C0617AD
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:45 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h1so4788493ljl.9
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1nZh1D/vgfD/yG7MqBv8BFt2r+KBCfUf2rl9x11f65A=;
        b=kNBNiY4UKsmHZRbM99Vhd8h7GG/a9o6r1qngDP9tv1c2c7dYn161AjY9hvR9Wkg1xn
         B5RbLp9v662Oup9rkPC1iG6jTCQYctTlE+CP6c8SJWkudo6RgocexfxrpQOOczp3d36e
         iekhWD8PT/0u3JtFStgT83ARy+svf3XZWQYb6f3e+5xKNkRhkROtco7XdXzCnaaZRnCc
         pf12smkNjNNThPhq8hZq2e/WYQ5vu3MzeYNBhHsVf8VIpbjD6BBo1r37kplxKskrLyTK
         1mPsykQL7M23aBamYB3QXlco98GP18j7T0+ed6iIq0biKyLckk5qNbFWiIr8BOGSWOfK
         upig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1nZh1D/vgfD/yG7MqBv8BFt2r+KBCfUf2rl9x11f65A=;
        b=R+gal0JqTmYb9knMSKTW7SH1VT+yg9CU+n/wTKtg+RmEka9+3CVDK//5mzUhGRenRl
         JxdpZ6fAV5gwDdc879frefOoTl8aWp+sG3WI7uF41zHBORmTVNhA6AefINtiH8imW3Em
         2LvTE0G23wjOdLxAQCuaS3Ydh6fD7X/aQF3BqqXYaPfLXJs5yuX5BEcL9fGojxu2wzgv
         aco1AgVb1cPzp76K8xbvl7rXJGBHI6RTW4fbRAZMoQ8/37FAFnNvLMkI1v3D3MNy0xQU
         TaEdGhlXZP1W5PgTRCrNtJAnNYOxKEMIba5/mlfIHVDNwAQnnvuqdKc9mNsPyCByRKN6
         reEQ==
X-Gm-Message-State: AOAM532gxPs0SKLXb4a6fduHjkZbzXv2R3XdnG25NhrdiTTUdGjqKN0j
        Nz068/YFY4CK1x7ZwN4JQ1OAVY1ogwA/mg==
X-Google-Smtp-Source: ABdhPJynXFjAEzvIhb7rgJmxnTlvzFE7/PKd9Xj72TVumnAIAtDL6snB6W6EV9yC3qBRMEbKSYXApQ==
X-Received: by 2002:a2e:b042:: with SMTP id d2mr2881688ljl.279.1629981043906;
        Thu, 26 Aug 2021 05:30:43 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j21sm332283ljh.87.2021.08.26.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:30:43 -0700 (PDT)
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Jerome Forissier <jerome@forissier.org>,
        Etienne Carriere <etienne.carriere@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 4/6] tee: add tee_dev_open_helper() primitive
Date:   Thu, 26 Aug 2021 14:30:30 +0200
Message-Id: <20210826123032.1732926-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826123032.1732926-1-jens.wiklander@linaro.org>
References: <20210826123032.1732926-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adds tee_dev_open_helper() and tee_dev_ctx_put() to make it easier to
create a driver internal struct tee_context without the usual
tee_device_get() on the struct tee_device as that adds a circular
reference counter dependency and would prevent the struct tee_device
from ever being released again.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c  | 33 ++++++++++++++++++++++++---------
 include/linux/tee_drv.h | 27 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 85102d12d716..3beb682684a8 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -43,14 +43,11 @@ static DEFINE_SPINLOCK(driver_lock);
 static struct class *tee_class;
 static dev_t tee_devt;
 
-static struct tee_context *teedev_open(struct tee_device *teedev)
+struct tee_context *tee_dev_open_helper(struct tee_device *teedev)
 {
 	int rc;
 	struct tee_context *ctx;
 
-	if (!tee_device_get(teedev))
-		return ERR_PTR(-EINVAL);
-
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx) {
 		rc = -ENOMEM;
@@ -66,10 +63,30 @@ static struct tee_context *teedev_open(struct tee_device *teedev)
 	return ctx;
 err:
 	kfree(ctx);
-	tee_device_put(teedev);
 	return ERR_PTR(rc);
 
 }
+EXPORT_SYMBOL_GPL(tee_dev_open_helper);
+
+void tee_dev_ctx_put(struct tee_context *ctx)
+{
+	teedev_ctx_put(ctx);
+}
+EXPORT_SYMBOL_GPL(tee_dev_ctx_put);
+
+static struct tee_context *teedev_open(struct tee_device *teedev)
+{
+	struct tee_context *ctx;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	ctx = tee_dev_open_helper(teedev);
+	if (IS_ERR(ctx))
+		tee_device_put(teedev);
+
+	return ctx;
+}
 
 void teedev_ctx_get(struct tee_context *ctx)
 {
@@ -90,10 +107,8 @@ static void teedev_ctx_release(struct kref *ref)
 
 void teedev_ctx_put(struct tee_context *ctx)
 {
-	if (ctx->releasing)
-		return;
-
-	kref_put(&ctx->refcount, teedev_ctx_release);
+	if (ctx && !ctx->releasing)
+		kref_put(&ctx->refcount, teedev_ctx_release);
 }
 
 static void teedev_close_context(struct tee_context *ctx)
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 3ebfea0781f1..00a31ff03049 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -458,6 +458,33 @@ static inline int tee_shm_get_id(struct tee_shm *shm)
  */
 struct tee_shm *tee_shm_get_from_id(struct tee_context *ctx, int id);
 
+/**
+ * tee_dev_open_helper() - helper function to make a struct tee_context
+ * @teedev:	Device to open
+ *
+ * Creates the struct tee_context without increasing the reference counter
+ * on @teedev. This is needed for instance when a driver need an internal
+ * struct tee_context to operate on. By skipping the reference counter
+ * the circular dependency is broken.
+ *
+ * Note that this struct tee_context need special care when freeing in
+ * order to avoid the normal put on the struct tee_device.
+ * tee_dev_ctx_put() is the best choice for this.
+ *
+ * @returns a pointer 'struct tee_context' on success or an ERR_PTR on failure
+ */
+struct tee_context *tee_dev_open_helper(struct tee_device *teedev);
+
+/**
+ * tee_dev_ctx_put() - helper function to release a struct tee_context
+ * @ctx:	The struct tee_context to release
+ *
+ * Note that this function doesn't do a tee_device_put() on the internal
+ * struct tee_device so this function should normal only be used when
+ * releasing a struct tee_context obtained with tee_dev_open_helper().
+ */
+void tee_dev_ctx_put(struct tee_context *ctx);
+
 /**
  * tee_client_open_context() - Open a TEE context
  * @start:	if not NULL, continue search after this context
-- 
2.31.1

