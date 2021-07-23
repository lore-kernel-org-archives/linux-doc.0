Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA24BC4338F
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:44:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3B3960E8E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jul 2021 09:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231503AbhGWJEE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jul 2021 05:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231482AbhGWJED (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jul 2021 05:04:03 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835D7C061575
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a7so942029ljq.11
        for <linux-doc@vger.kernel.org>; Fri, 23 Jul 2021 02:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WPLYx23a2mlUDNIPIrmDSM+cSt8akT06mvONQVQY3/s=;
        b=rCZNiQTtlGlnelUgxTWe4qNxD7ZBVpZgUQsXhcEhdRoKuCGWpPiAOXtoTVWlWQpoLC
         LJRQccJsNRTOJJF2w8+52TBOW9t4f9iXcQL42XbxhkQZNoCXRkgE/5dsDdA+QXtW5QRx
         o0ZuMJyvGQ7HKHgGUGQRka8rstx+KtyPrioXNrkHPzL0L+lCxstbYcyKBooqzbXKLRll
         sRi4Kz3HFkHMMt1TqCMacoALTx7DZX4qemcG91xk1Bg4wNOijr2QCs54EFqwuiKDnQma
         O8ZxOQOh5POr/YMLAsJu5yydL/xt3plOha5Nr1HVox1GWERCHcaxVKE5tEc4W5EY5j2s
         /jrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WPLYx23a2mlUDNIPIrmDSM+cSt8akT06mvONQVQY3/s=;
        b=RSr2E2VhfgsLhWRVKT31ra4mlRpTIWKymaTVyReDr2W6SSR4YLi/0sTi5pyfiyHRwY
         S11BoBtQ2MmE8aeItZ84UgPsbEe9DJhLY6NsHDAHQ+C8DskJdY+Jr3hnpA6B71xGHf/d
         TsTn+b5oGq4CoK2ioOoEMYBUG0T7Y1wAb7JOxD/brx8HBTDVeTrrZpB7tFTl5W/TqL2c
         cMSBfra0zSNB4dokk2wCX7H34gFyrxAE3VzpNx2t3CegvoVi1s2y0h0Y1/cfggY1vj8i
         8S4liSm8EhAdvsy5tETGNNOQ/zy/ahw0a16xyQ3Kslpkpt4zetRaJD/HkvUvMlZBLHjr
         t4Tw==
X-Gm-Message-State: AOAM533SGKZLFXJVohG9cSmf6mCDEca66QMsLD6jF2dyJToZDXFfUvSH
        6dR17VkJqWbn2q4B9aQQRZ3rGA==
X-Google-Smtp-Source: ABdhPJwryV2kGUFQOzaeEnVmeuptMeG5ynwTmIpI2zfA8ANVJqV3rrWwmLtiVSvvMHmHB3bPpncBcQ==
X-Received: by 2002:a2e:b4a8:: with SMTP id q8mr2724250ljm.263.1627033474846;
        Fri, 23 Jul 2021 02:44:34 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id f2sm403808ljq.131.2021.07.23.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 02:44:34 -0700 (PDT)
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
Subject: [PATCH v3 4/6] tee: add tee_dev_open_helper() primitive
Date:   Fri, 23 Jul 2021 11:44:20 +0200
Message-Id: <20210723094422.2150313-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723094422.2150313-1-jens.wiklander@linaro.org>
References: <20210723094422.2150313-1-jens.wiklander@linaro.org>
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

