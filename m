Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4781C48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 10:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 908BE61369
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 10:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232462AbhFPKjb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 06:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbhFPKjZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 06:39:25 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A595C0611C0
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 03:37:15 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x24so3489253lfr.10
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 03:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nE0O5cQU8hO3PBDLKhrY8XOB0KUsBuVPprzerF6bl2k=;
        b=k16li5nOZGgYY0nec0s+jmVsg38V+i0m8AtY6nYedCt27GjPhEsBpnVbd9cbUDHXcX
         RgX6oEC4IuT9Rgr3PuKZNLnxbGM6FxMxao0YZ/fUkR21YsElDbdQat2DKYAH3abWsIuM
         aDM26qrvxIYFyR24WBmg7RMTl6CtQY/aIGnViMFbjYPK6Q7vlfInTOg2AZ0MtSzSHPYB
         s7rQvHakK/3luLxJshDNc+SP7AlT1iFj14HqUoszeAWZJEgGE06H7NDjNuuH/9oXomTA
         mCxYwXXCGq/q/ZlU5zG9OKEK/oQpUpvGcKaJrdu5T6T+b2kyqAZu+W6zdkkCdMHCr/v2
         iDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nE0O5cQU8hO3PBDLKhrY8XOB0KUsBuVPprzerF6bl2k=;
        b=JFdiFvFr1dVM9qAxlYuSuFnadru35/eU07qAsmILFIy57ZJNNiZcCdoMwtFmDE8Ewb
         aZ9SaS4H0+QWeNhcWI1ejREA2JAbWl/XJYyqyF7KIFA7IzqhQC4mQ8E3SwHLfh5SGSbq
         EimfITDUW8DY6VikQMTCA8BIge1SmmH2LnRiY0EKRjL0nuTvYHj3ykqyf8QCZ9qg2g44
         VaEWdkYTQU469SQ3jDNCIXVXrAc853HlHW+RHjtK/ONTgRfZwKMXZyicFcT+xM/+Ffr8
         09sTqRp2aRgSieI2aIvY0nC4OWQ1mQuet3qWExlQwJh4JjWJJXRY21QIKLUXCXM/IFof
         p0/A==
X-Gm-Message-State: AOAM531lk1a0TCclCTd/8M/5CEFDusN/zlYP+h2yuBB+24JSolCDW7T5
        wjMShVCsLAUnmaUDcKwXlrnJhw==
X-Google-Smtp-Source: ABdhPJxlGQxPkzYmAgnMySBW3P/4sn8vf4auEa0rSVlvSI7dwnCv9fks3Osl+2ntItuO2whQVGbO5g==
X-Received: by 2002:a19:7711:: with SMTP id s17mr3308348lfc.430.1623839833963;
        Wed, 16 Jun 2021 03:37:13 -0700 (PDT)
Received: from jade.urgonet (h-79-136-85-3.A175.priv.bahnhof.se. [79.136.85.3])
        by smtp.gmail.com with ESMTPSA id m17sm205621lfh.288.2021.06.16.03.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 03:37:13 -0700 (PDT)
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
Subject: [PATCH v2 5/7] tee: add tee_dev_open_helper() primitive
Date:   Wed, 16 Jun 2021 12:36:47 +0200
Message-Id: <20210616103649.2662395-6-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616103649.2662395-1-jens.wiklander@linaro.org>
References: <20210616103649.2662395-1-jens.wiklander@linaro.org>
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
index f97d95b50773..6d81f6268b99 100644
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
index 54269e47ac9a..f592ba4e9561 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -456,6 +456,33 @@ static inline int tee_shm_get_id(struct tee_shm *shm)
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

