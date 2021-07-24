Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555E6C4320A
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3702660E0C
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhGXVIH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:08:07 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:58418
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230045AbhGXVHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:07:43 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D9D893F361
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163292;
        bh=UnOWzB6PFujT/DWlS5nVosxLJqokbjOw4vZz2zLdo+w=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=YjWltS/CBz5qfjclYPDluGSMvxC/KOJZOJKDQLYWOWNnN04iTchFQWRwIB35GNXGN
         twY/R2w+/hZdhxQsgu4SD9mI8CFmrSGhCNFWLvu9aUriA7MZrmtDm8hVAtBe6PKsJ4
         Nm4M553rIvsT700BlEAJTdnrlC2zIo1GfjTTG0R6ojlnHqTgSUAlh/OPl7zyUA98pZ
         tkJ7NFD+092+FYMYrsKyqMQATN/rm57e83DDtHF1yJdXWvRAWZBwNB3/vC5pcGnzYB
         0UNO4A5X7RLB/0LtzrKGavk6ETPcI6NjrBw47ozgpbXIdYMMu4kyTdkCNbUniWkPhp
         lcf8GNXvDKCwA==
Received: by mail-ed1-f71.google.com with SMTP id p7-20020aa7c8870000b02903a1187e547cso2825018eds.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UnOWzB6PFujT/DWlS5nVosxLJqokbjOw4vZz2zLdo+w=;
        b=KOZLq2K3SAJqlmuzB3whFU0KNAzE+HkcH0RPYSyai+gCDCcOemnJjM584K6/iU7RkA
         jrysbZwQZP34F9qvVdNMjF7SFqy9vRarPAvg4pkA4abvJp9Uz+dM0KaWMvKVTON/iBGB
         2LqbPAE650nGfIt+HG1V06V8+u3bnfBm4Vdq6+um5qHgr5Txu0OVjUnxOmL64v79fXAv
         SejZkUSC/6FwtuF9qWwN9Z5hGdxQKG04WCm9G3y2T+wiZywzMrkBi9KaBgFYmoYSBhiJ
         LC6k49xpnB1b7S6pzGTttbs13Reqry0Wet630o7pDqnnPVxcra0O2MPdGeJ7sOyTSQo6
         j60A==
X-Gm-Message-State: AOAM532ZWcgnHpFJcDvt9Sy7BMt1htmE7eiaYylmIYHDKoX5SbYxbMTv
        pDFxRf8pI/OSG5QEAcwdVuIJ5gO4rSgrhtmNdiZH5SAQzLACJ4qxubmlj0HPP03lV0sdCAPWT/9
        NBBbwpElRqvx2gCoM/1YL2kyBt0GleMLlB8PNtA==
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr10466738eji.177.1627163292621;
        Sat, 24 Jul 2021 14:48:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcC7JbUplW/EECe6Pj5DymoKEbtDHlyJUdE09NwDpBM4vPpQiH5q7A9qSREZv1RYkK2nQ3Kg==
X-Received: by 2002:a17:906:f15:: with SMTP id z21mr10466728eji.177.1627163292493;
        Sat, 24 Jul 2021 14:48:12 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id j5sm8383005edv.10.2021.07.24.14.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:48:12 -0700 (PDT)
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
Subject: [PATCH 04/12] nfc: constify nci_driver_ops (prop_ops and core_ops)
Date:   Sat, 24 Jul 2021 23:47:35 +0200
Message-Id: <20210724214743.121884-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Neither the core nor the drivers modify the passed pointer to struct
nci_driver_ops (consisting of function pointers), so make it a pointer
to const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/fdp/fdp.c      |  4 ++--
 drivers/nfc/s3fwrn5/nci.c  |  2 +-
 drivers/nfc/s3fwrn5/nci.h  |  2 +-
 drivers/nfc/st-nci/core.c  |  2 +-
 include/net/nfc/nci_core.h |  4 ++--
 net/nfc/nci/core.c         | 16 ++++++++--------
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 73f51848a693..4d88a617d0e8 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -651,7 +651,7 @@ static int fdp_nci_core_get_config_rsp_packet(struct nci_dev *ndev,
 	return 0;
 }
 
-static struct nci_driver_ops fdp_core_ops[] = {
+static const struct nci_driver_ops fdp_core_ops[] = {
 	{
 		.opcode = NCI_OP_CORE_GET_CONFIG_RSP,
 		.rsp = fdp_nci_core_get_config_rsp_packet,
@@ -662,7 +662,7 @@ static struct nci_driver_ops fdp_core_ops[] = {
 	},
 };
 
-static struct nci_driver_ops fdp_prop_ops[] = {
+static const struct nci_driver_ops fdp_prop_ops[] = {
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROP, NCI_OP_PROP_PATCH_OID),
 		.rsp = fdp_nci_prop_patch_rsp_packet,
diff --git a/drivers/nfc/s3fwrn5/nci.c b/drivers/nfc/s3fwrn5/nci.c
index 819e3474a437..e374e670b36b 100644
--- a/drivers/nfc/s3fwrn5/nci.c
+++ b/drivers/nfc/s3fwrn5/nci.c
@@ -20,7 +20,7 @@ static int s3fwrn5_nci_prop_rsp(struct nci_dev *ndev, struct sk_buff *skb)
 	return 0;
 }
 
-struct nci_driver_ops s3fwrn5_nci_prop_ops[4] = {
+const struct nci_driver_ops s3fwrn5_nci_prop_ops[4] = {
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
 				NCI_PROP_SET_RFREG),
diff --git a/drivers/nfc/s3fwrn5/nci.h b/drivers/nfc/s3fwrn5/nci.h
index 5c22c5315f79..c2d906591e9e 100644
--- a/drivers/nfc/s3fwrn5/nci.h
+++ b/drivers/nfc/s3fwrn5/nci.h
@@ -50,7 +50,7 @@ struct nci_prop_fw_cfg_rsp {
 	__u8 status;
 };
 
-extern struct nci_driver_ops s3fwrn5_nci_prop_ops[4];
+extern const struct nci_driver_ops s3fwrn5_nci_prop_ops[4];
 int s3fwrn5_nci_rf_configure(struct s3fwrn5_info *info, const char *fw_name);
 
 #endif /* __LOCAL_S3FWRN5_NCI_H_ */
diff --git a/drivers/nfc/st-nci/core.c b/drivers/nfc/st-nci/core.c
index f6fce34a77da..72bb51efdf9c 100644
--- a/drivers/nfc/st-nci/core.c
+++ b/drivers/nfc/st-nci/core.c
@@ -86,7 +86,7 @@ static int st_nci_prop_rsp_packet(struct nci_dev *ndev,
 	return 0;
 }
 
-static struct nci_driver_ops st_nci_prop_ops[] = {
+static const struct nci_driver_ops st_nci_prop_ops[] = {
 	{
 		.opcode = nci_opcode_pack(NCI_GID_PROPRIETARY,
 					  ST_NCI_CORE_PROP),
diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 5dae7e2cbc49..e7118e0cc3b1 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -82,10 +82,10 @@ struct nci_ops {
 	void  (*hci_cmd_received)(struct nci_dev *ndev, u8 pipe, u8 cmd,
 				  struct sk_buff *skb);
 
-	struct nci_driver_ops *prop_ops;
+	const struct nci_driver_ops *prop_ops;
 	size_t n_prop_ops;
 
-	struct nci_driver_ops *core_ops;
+	const struct nci_driver_ops *core_ops;
 	size_t n_core_ops;
 };
 
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index a7d26f2791b0..50c625940fa3 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1363,12 +1363,12 @@ int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, const void *payl
 EXPORT_SYMBOL(nci_send_cmd);
 
 /* Proprietary commands API */
-static struct nci_driver_ops *ops_cmd_lookup(struct nci_driver_ops *ops,
-					     size_t n_ops,
-					     __u16 opcode)
+static const struct nci_driver_ops *ops_cmd_lookup(const struct nci_driver_ops *ops,
+						   size_t n_ops,
+						   __u16 opcode)
 {
 	size_t i;
-	struct nci_driver_ops *op;
+	const struct nci_driver_ops *op;
 
 	if (!ops || !n_ops)
 		return NULL;
@@ -1383,10 +1383,10 @@ static struct nci_driver_ops *ops_cmd_lookup(struct nci_driver_ops *ops,
 }
 
 static int nci_op_rsp_packet(struct nci_dev *ndev, __u16 rsp_opcode,
-			     struct sk_buff *skb, struct nci_driver_ops *ops,
+			     struct sk_buff *skb, const struct nci_driver_ops *ops,
 			     size_t n_ops)
 {
-	struct nci_driver_ops *op;
+	const struct nci_driver_ops *op;
 
 	op = ops_cmd_lookup(ops, n_ops, rsp_opcode);
 	if (!op || !op->rsp)
@@ -1396,10 +1396,10 @@ static int nci_op_rsp_packet(struct nci_dev *ndev, __u16 rsp_opcode,
 }
 
 static int nci_op_ntf_packet(struct nci_dev *ndev, __u16 ntf_opcode,
-			     struct sk_buff *skb, struct nci_driver_ops *ops,
+			     struct sk_buff *skb, const struct nci_driver_ops *ops,
 			     size_t n_ops)
 {
-	struct nci_driver_ops *op;
+	const struct nci_driver_ops *op;
 
 	op = ops_cmd_lookup(ops, n_ops, ntf_opcode);
 	if (!op || !op->ntf)
-- 
2.27.0

