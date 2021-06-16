Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AC6C49EA3
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 10:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02AC061164
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 10:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbhFPKja (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 06:39:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232417AbhFPKjY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 06:39:24 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB492C061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 03:37:14 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i13so3505774lfc.7
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 03:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/f1rY0k6EQWoltoVI239rx9YFVi0YDoyX+ARCpEzBL8=;
        b=llG26ISbSHMQx9SAWWK0Ew5GahaWNLFUKYF3eJzC4p33bRd9Be60A93cKFvJyK4UOz
         zPO06ptAc1p3sQr86nkEQV8CU+83twF95m4ySOp2qgCoovEzCa6CV7PO8ZkWDLhgPps1
         A+GHdG9jn2/J9PtUYjwcKSxCrFrp6ThpBnl0N9E2qlo00n53XZvUbugI9hIpCRlDBDg7
         12rNUWk/l1v9+geVlXECny1yce1nLA1zjK/tyvFZ/dspVr+VBcfQmO7KIxe/fc/iVTeq
         672zro9XoKRvv8/Q6nwkbWoNctEryLJwZW+t5S1qaS/IzciywYhp/zMpyQ4aduoFdfbc
         VQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/f1rY0k6EQWoltoVI239rx9YFVi0YDoyX+ARCpEzBL8=;
        b=klWGMfRIrYTRKi4VMdIcST2v5ZVg9bzQc3tISkUKmKvvWAfg/MBGdYHH32DphSwF5N
         0Zy7MTO2FcZ72ga5tcyBlJWiVNCRe+KZKPocfYRpllsq+v6eXvQUOJJr0i9auz2HKUDS
         PFthaNEeklOJz9NfbIIGn6Y2wxc+54kGWLCxaC1PcAzfcqJJdtHhrWZiMsOku114zXAZ
         35rqnQeINuF8OAAJ9x+iQggsQYMpwDpjHo4OH+T74WHK5hbH2Rr2gCMMpY+PD5ONbNQe
         eNSM1YEfednMzOGTALabVNS3wAEBCnh8RtxjSLHxWNcq41n69G3Fz23mrZpFtg31cW43
         PEEQ==
X-Gm-Message-State: AOAM533j9hVXqaOYsIW2VufWYMgJVO3zMCu97hiq2SWP4lMqSY6iilg1
        xqq5Rji2JF+sa0HsP2rTjGh00Q==
X-Google-Smtp-Source: ABdhPJysfxzlZ2ZCBCeU6Y2xQDldKhQEt20KJ5s961GMZJdmsWDBpqHYUiF3UpWheyplkOkqFfgg8Q==
X-Received: by 2002:a19:550f:: with SMTP id n15mr3209225lfe.660.1623839833192;
        Wed, 16 Jun 2021 03:37:13 -0700 (PDT)
Received: from jade.urgonet (h-79-136-85-3.A175.priv.bahnhof.se. [79.136.85.3])
        by smtp.gmail.com with ESMTPSA id m17sm205621lfh.288.2021.06.16.03.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 03:37:12 -0700 (PDT)
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
Subject: [PATCH v2 4/7] tee: fix put order in teedev_close_context()
Date:   Wed, 16 Jun 2021 12:36:46 +0200
Message-Id: <20210616103649.2662395-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616103649.2662395-1-jens.wiklander@linaro.org>
References: <20210616103649.2662395-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Prior to this patch was teedev_close_context() calling tee_device_put()
before teedev_ctx_put() leading to teedev_ctx_release() accessing
ctx->teedev just after the reference counter was decreased on the
teedev. Fix this by calling teedev_ctx_put() before tee_device_put().

Fixes: 217e0250cccb ("tee: use reference counting for tee_context")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 480d294a23ab..f97d95b50773 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -98,8 +98,10 @@ void teedev_ctx_put(struct tee_context *ctx)
 
 static void teedev_close_context(struct tee_context *ctx)
 {
-	tee_device_put(ctx->teedev);
+	struct tee_device *teedev = ctx->teedev;
+
 	teedev_ctx_put(ctx);
+	tee_device_put(teedev);
 }
 
 static int tee_open(struct inode *inode, struct file *filp)
-- 
2.31.1

