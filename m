Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3987C432BE
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AED8D60F39
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhGXVJh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:09:37 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:44060
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230452AbhGXVJ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:09:27 -0400
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E27FE3F34D
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163397;
        bh=i+Q0llccIqMx5SsL7f2qLyVatbD4Rx39C8icqgEfdwA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ekS53k4Smw9XVnH+au6OsJ+Mkenc5/eTJ/Oxz07HCWukS7Il0jH4iJyrEw3aulfFc
         ALcyMHXOMPCP/9M8i2GXnsCRplk+AF1WErU25f5Ww9JCPHOuDEPo3BpkYGpTcbU6v+
         W7sP1bcjZmyQIpbyYTDtsT6lk5Ll3g/mRHF5B7ZhqCi4XVPlArISgmUEYclf7WCO7N
         4eqgHRm4TUoAsvsxQ14g3gGvhIKXPEBEsiZiRluq5/yLCG50w69/D0h5yzFidzQaHj
         9W+mo7ELle2tO2V4RORqnq4Qv+UKhH2eoTDwrOKkQGUnHH72yHuNKpXJzVhDco5ZsP
         YWni+HPDEfGRw==
Received: by mail-ej1-f71.google.com with SMTP id og15-20020a1709071dcfb029051ab3a0d553so1070855ejc.6
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i+Q0llccIqMx5SsL7f2qLyVatbD4Rx39C8icqgEfdwA=;
        b=Eyj9ph8WkfgESGKUOD6dwkyWZ3QzB0iErP5paGGxV+BIg8/XQcIebb4Hz5pUli42Yl
         S5h/25sA/BjU2t5f7PyXVFV2IB4nTVBlpcGgFrvu63xRuq9n5sV1uNvElIzMRYL8rdRO
         iZJgLYodUzQikB1oplTIoZLUIdNwqPorMbdP6OpHoza0YhDQu2sMhJmnSPsH5Ey+kx/O
         pfuVQqn0DnD47opHJ82iSQks6znCQAdqu20BS9gxW/dNVOe5NMFYdy0Ep2ejQuw4XGJf
         qh4wCKL7cShJIz/Bc3lyXHuYHr+UcKmPjFFYHSN434zVEyM79NwqNrH6hJ12sG/RaRSN
         vmCA==
X-Gm-Message-State: AOAM531p5g7OmzkQ+9NHvnAGSO1qcFxraJO5MFyLS9rUlaipjgTJYaUK
        Vw8ra7SZ+qVt11RzySXVnY0CgZyQAPVpGpi9acsa7aElG4xjBEYdBXzhOeN2MOC78tdU7Qjkz6j
        ugFqxYrVmzt6nM4/YLMZZ7PxNSEw6twQHL8yVOg==
X-Received: by 2002:a05:6402:430e:: with SMTP id m14mr10296154edc.120.1627163397541;
        Sat, 24 Jul 2021 14:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymDQtRzFb9UEZAtt6Ovb/j39XIvk8E2P6p5LIuQnS1n8kjgb+MF7fTYK1hCJjwQajwuR/7Qw==
X-Received: by 2002:a05:6402:430e:: with SMTP id m14mr10296138edc.120.1627163397361;
        Sat, 24 Jul 2021 14:49:57 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id s10sm12821908ejc.39.2021.07.24.14.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:49:56 -0700 (PDT)
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
Subject: [PATCH 12/12] nfc: constify nfc_digital_ops
Date:   Sat, 24 Jul 2021 23:49:28 +0200
Message-Id: <20210724214928.122096-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Neither the core nor the drivers modify the passed pointer to struct
nfc_digital_ops, so make it a pointer to const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/nfcsim.c      | 2 +-
 drivers/nfc/port100.c     | 2 +-
 drivers/nfc/st95hf/core.c | 2 +-
 drivers/nfc/trf7970a.c    | 2 +-
 include/net/nfc/digital.h | 4 ++--
 net/nfc/digital_core.c    | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/nfc/nfcsim.c b/drivers/nfc/nfcsim.c
index a9864fcdfba6..143dc49b815b 100644
--- a/drivers/nfc/nfcsim.c
+++ b/drivers/nfc/nfcsim.c
@@ -320,7 +320,7 @@ static int nfcsim_tg_listen(struct nfc_digital_dev *ddev, u16 timeout,
 	return nfcsim_send(ddev, NULL, timeout, cb, arg);
 }
 
-static struct nfc_digital_ops nfcsim_digital_ops = {
+static const struct nfc_digital_ops nfcsim_digital_ops = {
 	.in_configure_hw = nfcsim_in_configure_hw,
 	.in_send_cmd = nfcsim_in_send_cmd,
 
diff --git a/drivers/nfc/port100.c b/drivers/nfc/port100.c
index 1d614f9d864a..ccb5c5fab905 100644
--- a/drivers/nfc/port100.c
+++ b/drivers/nfc/port100.c
@@ -1463,7 +1463,7 @@ static int port100_listen(struct nfc_digital_dev *ddev, u16 timeout,
 	return port100_tg_send_cmd(ddev, skb, timeout, cb, arg);
 }
 
-static struct nfc_digital_ops port100_digital_ops = {
+static const struct nfc_digital_ops port100_digital_ops = {
 	.in_configure_hw = port100_in_configure_hw,
 	.in_send_cmd = port100_in_send_cmd,
 
diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 2dc788c363fd..993818742570 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -1037,7 +1037,7 @@ static void st95hf_abort_cmd(struct nfc_digital_dev *ddev)
 {
 }
 
-static struct nfc_digital_ops st95hf_nfc_digital_ops = {
+static const struct nfc_digital_ops st95hf_nfc_digital_ops = {
 	.in_configure_hw = st95hf_in_configure_hw,
 	.in_send_cmd = st95hf_in_send_cmd,
 
diff --git a/drivers/nfc/trf7970a.c b/drivers/nfc/trf7970a.c
index 33978022ae47..1aed44629aaa 100644
--- a/drivers/nfc/trf7970a.c
+++ b/drivers/nfc/trf7970a.c
@@ -1861,7 +1861,7 @@ static void trf7970a_abort_cmd(struct nfc_digital_dev *ddev)
 	mutex_unlock(&trf->lock);
 }
 
-static struct nfc_digital_ops trf7970a_nfc_ops = {
+static const struct nfc_digital_ops trf7970a_nfc_ops = {
 	.in_configure_hw	= trf7970a_in_configure_hw,
 	.in_send_cmd		= trf7970a_send_cmd,
 	.tg_configure_hw	= trf7970a_tg_configure_hw,
diff --git a/include/net/nfc/digital.h b/include/net/nfc/digital.h
index 963db96bcbbb..bb3e8fdc0692 100644
--- a/include/net/nfc/digital.h
+++ b/include/net/nfc/digital.h
@@ -191,7 +191,7 @@ struct digital_poll_tech {
 
 struct nfc_digital_dev {
 	struct nfc_dev *nfc_dev;
-	struct nfc_digital_ops *ops;
+	const struct nfc_digital_ops *ops;
 
 	u32 protocols;
 
@@ -236,7 +236,7 @@ struct nfc_digital_dev {
 	void (*skb_add_crc)(struct sk_buff *skb);
 };
 
-struct nfc_digital_dev *nfc_digital_allocate_device(struct nfc_digital_ops *ops,
+struct nfc_digital_dev *nfc_digital_allocate_device(const struct nfc_digital_ops *ops,
 						    __u32 supported_protocols,
 						    __u32 driver_capabilities,
 						    int tx_headroom,
diff --git a/net/nfc/digital_core.c b/net/nfc/digital_core.c
index 8f2572decccd..fefc03674f4f 100644
--- a/net/nfc/digital_core.c
+++ b/net/nfc/digital_core.c
@@ -745,7 +745,7 @@ static const struct nfc_ops digital_nfc_ops = {
 	.im_transceive = digital_in_send,
 };
 
-struct nfc_digital_dev *nfc_digital_allocate_device(struct nfc_digital_ops *ops,
+struct nfc_digital_dev *nfc_digital_allocate_device(const struct nfc_digital_ops *ops,
 					    __u32 supported_protocols,
 					    __u32 driver_capabilities,
 					    int tx_headroom, int tx_tailroom)
-- 
2.27.0

