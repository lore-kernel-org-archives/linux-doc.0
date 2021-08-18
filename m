Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C71EC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 10:19:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0289360E09
	for <linux-doc@archiver.kernel.org>; Wed, 18 Aug 2021 10:19:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233576AbhHRKTq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Aug 2021 06:19:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbhHRKTo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Aug 2021 06:19:44 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C7CC0613CF
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 03:19:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i9so3495864lfg.10
        for <linux-doc@vger.kernel.org>; Wed, 18 Aug 2021 03:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JoodeoEbWA8KFPSDaqBt6HBmf+JeOe0hbWt7ocF/yag=;
        b=TtafLSybt2hOUnJfexb4ztfgk7g3VjwpzDU4eOcl8Afp5OKTTZO3PWGu6sn1CxpprC
         DMVZUaWW9/IXhfcuDc/BG0fykkwmsGx3kE7oA9QpgQKtR29qp+MQuPF7Gq5mRAn8ficE
         w/O9f9+t7qYGuDNWW5imwZUKFxq4emdtEGhC7UFxRJ3j7S8dPk3/GRN7luxHHZCXmWIV
         9Eb+vwsmVcY29A2IJ1HJLC6aKQ/f/St1hdTr9jwOdHga4oiJzVUMjlg2Ue5aewCGzWLJ
         2zmOYTl/9LEjlL/ZaN9FOIefAcIhHnct69g9JidKviwfGnoRuledX8oUxCNSzZa9BBb2
         k0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JoodeoEbWA8KFPSDaqBt6HBmf+JeOe0hbWt7ocF/yag=;
        b=CaqBXTLeGf3DkjWx532KFX43xm9ZoH7OKsOWGlaPEwUCoYd2RtFRpdaPYeQOeiWFMe
         DPYEtSpNcxqGU4y7Pc6JI7HSjCVZWikrIQsFoEsanVw2OvGM011Ei7RzXdAeNdInHh59
         EKdCBXQrIyDOSpI2A7QPmEkXRfKZgfafWAwJBNXJ/5rddVDFrcdC20zbHvGNkBkflaD7
         igk41eNZHnMgM83A6zH8WBoGyY+X4I9fQMTiMInY2KVKdEN5IwxuKzPMe4IZz/cZlzse
         +Y3UXXtJMhFsmISSOK3FFMS3d4/OmF4X0pzAIXcioiIVnMvm0TIeEw5RSIMD0ey/slJL
         jPjg==
X-Gm-Message-State: AOAM530CHJurLzRvmS39+2EsqVwckqVjCLAAqVsjZjboyukaq8rhZlES
        aRrainmvOmuT9L/ZjI2hua3zug==
X-Google-Smtp-Source: ABdhPJxbzXfDmvRUIZrSntXWxK+DdVtbwWfdeHc8slzuivwfHGxevf3XX3s2rp5C7mCzXMGAOqBHkA==
X-Received: by 2002:a05:6512:c0b:: with SMTP id z11mr5841550lfu.193.1629281947855;
        Wed, 18 Aug 2021 03:19:07 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id l27sm451160lfp.245.2021.08.18.03.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 03:19:07 -0700 (PDT)
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
Subject: [PATCH v4 3/6] tee: fix put order in teedev_close_context()
Date:   Wed, 18 Aug 2021 12:18:46 +0200
Message-Id: <20210818101849.602257-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210818101849.602257-1-jens.wiklander@linaro.org>
References: <20210818101849.602257-1-jens.wiklander@linaro.org>
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

