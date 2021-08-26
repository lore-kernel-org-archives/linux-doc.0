Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938CEC19F37
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BD40610CA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Aug 2021 12:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241738AbhHZMbe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Aug 2021 08:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241221AbhHZMbc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Aug 2021 08:31:32 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA40C0613D9
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:44 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id k5so6501190lfu.4
        for <linux-doc@vger.kernel.org>; Thu, 26 Aug 2021 05:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JoodeoEbWA8KFPSDaqBt6HBmf+JeOe0hbWt7ocF/yag=;
        b=gZMisyRDxgH5gaSMdaSrLWrVBgnJiieFFNBcmjDx33BBp2VM2mCTz9s8UTZi7/BJ54
         pZgn93V8Mcb9S2QKsXTdwwOL7O1KDzQUt56MI1ztVplj6OREFy7JveICkKz//LHg2619
         TqP9/aqM54aR3TctwTgrQdMcHL7XKWQ40vrUjM4eQthXogUG6POhttFg1AzilsGCE99i
         9NRja4Jhksy+I5wQyzEaxpej5QAm8Cmh03E9KSgFIEpKAkOXKTnytB9i1hD/DBRWcqN0
         eOpZbST42OrMEzQxDVHyfPLETKwSeUcLfBOzZe97pbX39jafv5Gh6/x7LdtRmWVmB37c
         pJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoodeoEbWA8KFPSDaqBt6HBmf+JeOe0hbWt7ocF/yag=;
        b=P3T9huwnI/1LAxKYZcUQpFhYbbVryUN8VDtmhMYOEP1Om4T1j32kXn2Iu0nzaTBkbV
         r2vFDhqKvMVLmD/WDbuWTE9L2fjMs6CfmVADFae5uZbj83AWX1wp7qcyevyCBfldcU/U
         lBRoNbEnWFgJnJHWs/hjESSIGf9viLriwgTIdDgjQ4GgWEqWyuuUi3XkHRFrIwtfQ8fe
         I2/u3gMdD8YCeKI2OQYDFda73m72ZFI0RaOylCbmxsT5LMCmc0HN8faK5IhIR/3v+k9R
         +MUxFDK/1vJymWdSm/KuLfGEmyHX6qNK0dAccVH2yGi8ZItHKSK6j7vUvoljqjW/QjFv
         gZbw==
X-Gm-Message-State: AOAM531NoQ12xEKv7Sbc0QW0+VynmcOVLyqqY23ijY/UVNPat3aWcoXf
        HQ+G53f6A5I7eCjA/WdXkIzPng==
X-Google-Smtp-Source: ABdhPJzPoA85sfVjo4hiwKhrFd0MZiun3ogANCDG9hsxjklStOkxEllbiklrHLRGsCcjvj3zrjuTig==
X-Received: by 2002:a05:6512:ad6:: with SMTP id n22mr2695207lfu.532.1629981042914;
        Thu, 26 Aug 2021 05:30:42 -0700 (PDT)
Received: from jade.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j21sm332283ljh.87.2021.08.26.05.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 05:30:42 -0700 (PDT)
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
Subject: [PATCH v5 3/6] tee: fix put order in teedev_close_context()
Date:   Thu, 26 Aug 2021 14:30:29 +0200
Message-Id: <20210826123032.1732926-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826123032.1732926-1-jens.wiklander@linaro.org>
References: <20210826123032.1732926-1-jens.wiklander@linaro.org>
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
index 2b37bc408fc3..85102d12d716 100644
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

