Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7E5C4332F
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 07:16:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 895FF611C5
	for <linux-doc@archiver.kernel.org>; Wed,  6 Oct 2021 07:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237488AbhJFHRz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 03:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237443AbhJFHRx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 03:17:53 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0D1C061765
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 00:16:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b20so6407822lfv.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 00:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G+uudF1elXgj2CYRAAhjhZzuZ2zqS9rHSGsbl2nlFFY=;
        b=RlM9lc7CB9JdOyTQ4MpXfKSPDtGKS7wFz07culpDMMYoAgsdu5TTGdBFAeBRwSyUCG
         LmRMkPZx4wKMMiZf5EDQvcgc3fLPj5mddxFnmakv9nn5aUpsMZNtxZaHemqAvkyWYWzt
         UWXjxQUZl7A0FVdws0zCpBxPtuHQOA5BhL4FHOXrqM9vWKK9lFpA6HqYwTHtwLlzAZD7
         YCMDlm/XgTs6xmlJqFo3UJF567VMi5q7267KLROyK0Q/SFsToG8Rue7mDEhVnOYW89R5
         ZIYb1RXmcao6GHNGHfXQHTt1HJC0hYLH2ME6DAWwk77ORxAKqzo/I2GrxuUI5qm5ujNk
         /61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G+uudF1elXgj2CYRAAhjhZzuZ2zqS9rHSGsbl2nlFFY=;
        b=Pm1D4EeCLEkZpHMyLe06MunBJgFueLjhF71GnrTnebO+6IHDsM/tr/7jdruViowQcH
         1Ne/WzZjO6pFwvMrHczAmYw1lxM2FhNTV3Rfw0NB4x9VtTzihh7vOgYx2ovavSASTLNQ
         uxHIWaWmC/C8ayIN2zDBHVGrGUUngr7xzhUTb7o9MUeG6Yo9L30SC+k2w4mjBtQ3nyRL
         6ewFH1FWt7ElOq4RefR8dcgkV81B2gmhYElXhCHhTu17t10ouKpIRjM9ezMaka3qf18a
         U35/GFwwrDhgpstDYUwn1LiI6rFqg6iAAk5EETWFep00gxU14LuJFJNxU9vFAd0Wiujz
         P5BA==
X-Gm-Message-State: AOAM5315ndnUZT/atrGU3bF7hrKp8kZY/mPulgmhZZ6KmJOWoHaQqTB3
        eQcgLOJkCKKJ6r1SEI9d7Ldy3Q==
X-Google-Smtp-Source: ABdhPJwf2FRNpTOXAY89XLRF5kXnJJw701ler3rWnJUuAKx7wE4mqyW0rOll/wLKeBRqtPuTgFgqEA==
X-Received: by 2002:a2e:a791:: with SMTP id c17mr26518748ljf.509.1633504560446;
        Wed, 06 Oct 2021 00:16:00 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id y7sm960376lfk.143.2021.10.06.00.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 00:16:00 -0700 (PDT)
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
Subject: [PATCH v6 4/6] tee: export teedev_open() and teedev_close_context()
Date:   Wed,  6 Oct 2021 09:15:44 +0200
Message-Id: <20211006071546.2540920-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211006071546.2540920-1-jens.wiklander@linaro.org>
References: <20211006071546.2540920-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Exports the two functions teedev_open() and teedev_close_context() in
order to make it easier to create a driver internal struct tee_context.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c  |  6 ++++--
 include/linux/tee_drv.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 85102d12d716..3fc426dad2df 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -43,7 +43,7 @@ static DEFINE_SPINLOCK(driver_lock);
 static struct class *tee_class;
 static dev_t tee_devt;
 
-static struct tee_context *teedev_open(struct tee_device *teedev)
+struct tee_context *teedev_open(struct tee_device *teedev)
 {
 	int rc;
 	struct tee_context *ctx;
@@ -70,6 +70,7 @@ static struct tee_context *teedev_open(struct tee_device *teedev)
 	return ERR_PTR(rc);
 
 }
+EXPORT_SYMBOL_GPL(teedev_open);
 
 void teedev_ctx_get(struct tee_context *ctx)
 {
@@ -96,13 +97,14 @@ void teedev_ctx_put(struct tee_context *ctx)
 	kref_put(&ctx->refcount, teedev_ctx_release);
 }
 
-static void teedev_close_context(struct tee_context *ctx)
+void teedev_close_context(struct tee_context *ctx)
 {
 	struct tee_device *teedev = ctx->teedev;
 
 	teedev_ctx_put(ctx);
 	tee_device_put(teedev);
 }
+EXPORT_SYMBOL_GPL(teedev_close_context);
 
 static int tee_open(struct inode *inode, struct file *filp)
 {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 3ebfea0781f1..26f42c4cd7a1 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -582,4 +582,18 @@ struct tee_client_driver {
 #define to_tee_client_driver(d) \
 		container_of(d, struct tee_client_driver, driver)
 
+/**
+ * teedev_open() - Open a struct tee_device
+ * @teedev:	Device to open
+ *
+ * @return a pointer to struct tee_context on success or an ERR_PTR on failure.
+ */
+struct tee_context *teedev_open(struct tee_device *teedev);
+
+/**
+ * teedev_close_context() - closes a struct tee_context
+ * @ctx:	The struct tee_context to close
+ */
+void teedev_close_context(struct tee_context *ctx);
+
 #endif /*__TEE_DRV_H*/
-- 
2.31.1

