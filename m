Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F15C432BE
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E07D160E92
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbhGXVHp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:07:45 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:43786
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229873AbhGXVHm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:07:42 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id F23563F350
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163291;
        bh=HMf7kqYi2lIBuMtdvTj3OQjTri7oTHLzgmpSExYTBzw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Kw7pscoN/D0J7VhYP+UOWEnmM8jMZhQ6HCzWZI37WPRRz/evg7bbKiEJvX2Wd/BlL
         HxO9m/C9J8qdDigwcl4VlgXx0SHfr+i5YolpOysY4sZBOSB+dJVLXPweOCItfIz19y
         YDLfPusuTBDjqXQHnifYSSwGRzmlf4UYPeMYjvDd6emg/LoytuNyrOyvuOFfZ3xl70
         hUH4w61xBQ1h7OavRcIUz59+Zm2tMsTj5Jmrmu7U0DVD99ts7qu8foTkcnQ4liK3tR
         YCMurGjdvC1Cahiyi0YME8JUCbqXOFLJLm95UGtTrPpEDmKTMYZpPncnVZBrDjVBrU
         hZbDMdkebQWlQ==
Received: by mail-ed1-f71.google.com with SMTP id p7-20020aa7c8870000b02903a1187e547cso2825005eds.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMf7kqYi2lIBuMtdvTj3OQjTri7oTHLzgmpSExYTBzw=;
        b=oqnVhzKHvWYXuuZLSkMNbSSRfVGYN74DDLOhzXHNwmTCVJFt87zefAREy1fraOZWuO
         eF7oON4YUTidUzQ22RdMTwnr51vjeiCNoyWuSr8LyGoQTNz9pbn245XUzCFWdeuuUcr/
         TBOCdavy/MjzPMwD4pVDbYoyjrR3XNYWkp0C08Sq9j8QF7uR5suTvZE+yvEjzIisvy3w
         YgSLN72Diumdu9ynmdvGblRSpw7VtazH4VdmOaUL/ZBUMycvqfLX+6TSmG16M/8tF3gH
         iUgeEG6t5eexq8uALinpAqvY4nP1OHMGFdF8iieGKgVykq5dWfVjuDuTuzl2ON8pct/L
         pjhw==
X-Gm-Message-State: AOAM532Ild9/EVylNgmKg2HqPRNuLHX9j8ri/3jFa5SyMWOV1JFgUDnb
        luDfK0LW7jhQClln5+GnFflhHFVBjXFKd2OHHu2ugWu6WnrOEbqJnph2iD2BhuN1/ZqHAHMNqww
        FUymQmR11sr24g1HSYbeT/gcyOMQwKMPv1wabVA==
X-Received: by 2002:a50:8a89:: with SMTP id j9mr12845883edj.226.1627163291309;
        Sat, 24 Jul 2021 14:48:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwd4RK7rN/a4XS7Agkz5BbHQ1x3eZGsYYyx6EQXs4h6bYFyxMm86+u03VzFoh6LPSZbpiQ4BQ==
X-Received: by 2002:a50:8a89:: with SMTP id j9mr12845871edj.226.1627163291195;
        Sat, 24 Jul 2021 14:48:11 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id j5sm8383005edv.10.2021.07.24.14.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:48:10 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Charles Gorand <charles.gorand@effinnov.com>,
        Krzysztof Opasiak <k.opasiak@samsung.com>,
        Mark Greer <mgreer@animalcreek.com>,
        Bongsu Jeon <bongsu.jeon@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org
Subject: [PATCH 03/12] nfc: s3fwrn5: constify nci_ops
Date:   Sat, 24 Jul 2021 23:47:34 +0200
Message-Id: <20210724214743.121884-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s3fwrn5 driver modifies static struct nci_ops only to set prop_ops.
Since prop_ops is build time constant with known size, it can be made
const.  This allows to removeo the function setting the prop_ops -
s3fwrn5_nci_get_prop_ops().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/s3fwrn5/core.c | 7 +++----
 drivers/nfc/s3fwrn5/nci.c  | 8 +-------
 drivers/nfc/s3fwrn5/nci.h  | 2 +-
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/nfc/s3fwrn5/core.c b/drivers/nfc/s3fwrn5/core.c
index 865d3e3d1528..1c412007fabb 100644
--- a/drivers/nfc/s3fwrn5/core.c
+++ b/drivers/nfc/s3fwrn5/core.c
@@ -143,11 +143,13 @@ static int s3fwrn5_nci_post_setup(struct nci_dev *ndev)
 	return nci_core_init(info->ndev);
 }
 
-static struct nci_ops s3fwrn5_nci_ops = {
+static const struct nci_ops s3fwrn5_nci_ops = {
 	.open = s3fwrn5_nci_open,
 	.close = s3fwrn5_nci_close,
 	.send = s3fwrn5_nci_send,
 	.post_setup = s3fwrn5_nci_post_setup,
+	.prop_ops = s3fwrn5_nci_prop_ops,
+	.n_prop_ops = ARRAY_SIZE(s3fwrn5_nci_prop_ops),
 };
 
 int s3fwrn5_probe(struct nci_dev **ndev, void *phy_id, struct device *pdev,
@@ -167,9 +169,6 @@ int s3fwrn5_probe(struct nci_dev **ndev, void *phy_id, struct device *pdev,
 
 	s3fwrn5_set_mode(info, S3FWRN5_MODE_COLD);
 
-	s3fwrn5_nci_get_prop_ops(&s3fwrn5_nci_ops.prop_ops,
-		&s3fwrn5_nci_ops.n_prop_ops);
-
 	info->ndev = nci_allocate_device(&s3fwrn5_nci_ops,
 		S3FWRN5_NFC_PROTOCOLS, 0, 0);
 	if (!info->ndev)
diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index f042d3eaf8f6..819e3474a437 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -20,7 +20,7 @@ static int s3fwrn5_nci_prop_rsp(struct nci_dev *ndev, struct sk_buff *skb)
 	return 0;
 }
 
-static struct nci_driver_ops s3fwrn5_nci_prop_ops[] = {
+struct nci_driver_ops s3fwrn5_nci_prop_ops[4] = {
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_SET_RFREG),
@@ -43,12 +43,6 @@ static struct nci_driver_ops s3fwrn5_nci_prop_ops[] = {
 	},
 };
 
-void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n)
-{
-	*ops = s3fwrn5_nci_prop_ops;
-	*n = ARRAY_SIZE(s3fwrn5_nci_prop_ops);
-}
-
 #define S3FWRN5_RFREG_SECTION_SIZE 252
 
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name)
diff --git a/drivers/nfc/s3fwrn5/nci.h b/drivers/nfc/s3fwrn5/nci.h
index a80f0fb082a8..5c22c5315f79 100644
--- a/drivers/nfc/s3fwrn5/nci.h
+++ b/drivers/nfc/s3fwrn5/nci.h
@@ -50,7 +50,7 @@ struct nci_prop_fw_cfg_rsp {
 	__u8 status;
 };
 
-void s3fwrn5_nci_get_prop_ops(struct nci_driver_ops **ops, size_t *n);
+extern struct nci_driver_ops s3fwrn5_nci_prop_ops[4];
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name);
 
 #endif /* __LOCAL_S3FWRN5_NCI_H_ */
-- 
2.27.0

