Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34E71C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D45760E90
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhGXVJZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:09:25 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:58638
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230312AbhGXVJU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:09:20 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 16ACB3F245
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163391;
        bh=ydfFaHKHi19ltLLH8d1w1IAXq4hz0eleT+vI32JJiWk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=leM0wxQ2r7FPy/IBWitd7f2svw6xPL/mONdJUG+skUR6tFlnPyj95r51X0Aw12xGa
         jHWxXrcqLk5zstjOCt1nTb3dUHoT5F6M2IscayF9wT6028Wyr8c770efx5EmpJ2bpa
         HS7pzFDKarHF+AOcBz5l/UzxwzZ8geVNgwSwPtnHNGg2ChZyNQRO2YKwDeLKmMIYG4
         qV9/h/psR3ySyybUa9pBwiiJqU0EpATR8p+K9HaRccbs/Om+fwDoHfVkRbAib4foR+
         MHFAS5mdbRnd6q1uoaJQsXZZEK5E5aZuAssP8zDtei12UFLPkWBJ2Cc+RsTeAiHRod
         E5XgymLxayACA==
Received: by mail-ed1-f72.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so2816360edu.1
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ydfFaHKHi19ltLLH8d1w1IAXq4hz0eleT+vI32JJiWk=;
        b=MHs1QjTGq9D8BU8FCnKmD4sEpXBbOQ9AUv0Y3nEhHUpHqiWvnAJybs0xI9OdpgcEoH
         kf1PK86TstTr5zh9iDHt05EuQec0FupeVpzpOlkSIdackviPfZeqCxt2SUEGyQZPU9pH
         9M/A6sXZkI3gzGnr4Qeshm8NxB4lyVzJy4Asp/wXgMY35YjNlB/0eBNILWVFCjJHbkhO
         NOAu52VqEpJPIoikzdZedKFVQ+TsF6OyYi6A+cmjWUGnIkKQ4LTbSEo6gx+ZFIQSu0lc
         eWBAEp4DiKrOTyj2Euh0I5qF1V0g0jp25ejm8gJEz/vVXnNbNKoTJjiMtJu+6WNjDwgj
         i8cA==
X-Gm-Message-State: AOAM5306rAweI2sUVlxkQi25jEqIXQc6sJqwWqYwlkW7ZMGl+FYF3Puv
        1HQdGuRFNqkxO8XmpBbkDCbPt8o4fuHumRTisSHp8rB0vJlSJjm6SuWZXgH1RRNkAy/kRGUMEkl
        tvtq2Txv3q7lCPCgG5kDb2iHiFLstZwqK1iQfLQ==
X-Received: by 2002:a05:6402:2319:: with SMTP id l25mr7064705eda.383.1627163390852;
        Sat, 24 Jul 2021 14:49:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVmroArzmZZewaThv5NERtSr6DdqGjVj6PwhmXYk16ol5TEWO2j+oQ71hzjvO1anxFeNOqpw==
X-Received: by 2002:a05:6402:2319:: with SMTP id l25mr7064689eda.383.1627163390689;
        Sat, 24 Jul 2021 14:49:50 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id s10sm12821908ejc.39.2021.07.24.14.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:49:50 -0700 (PDT)
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
Subject: [PATCH 08/12] nfc: constify nfc_hci_gate
Date:   Sat, 24 Jul 2021 23:49:24 +0200
Message-Id: <20210724214928.122096-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Neither the core nor the drivers modify the passed pointer to struct
nfc_hci_gate, so make it a pointer to const for correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/nfc/microread/microread.c | 2 +-
 drivers/nfc/pn544/pn544.c         | 2 +-
 drivers/nfc/st21nfca/core.c       | 2 +-
 net/nfc/hci/core.c                | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nfc/microread/microread.c b/drivers/nfc/microread/microread.c
index a5d5c3ec65f9..151a0631ec72 100644
--- a/drivers/nfc/microread/microread.c
+++ b/drivers/nfc/microread/microread.c
@@ -131,7 +131,7 @@
 #define MICROREAD_ELT_ID_SE2 0x04
 #define MICROREAD_ELT_ID_SE3 0x05
 
-static struct nfc_hci_gate microread_gates[] = {
+static const struct nfc_hci_gate microread_gates[] = {
 	{MICROREAD_GATE_ID_ADM, MICROREAD_PIPE_ID_ADMIN},
 	{MICROREAD_GATE_ID_LOOPBACK, MICROREAD_PIPE_ID_HDS_LOOPBACK},
 	{MICROREAD_GATE_ID_IDT, MICROREAD_PIPE_ID_HDS_IDT},
diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index 23faa46bb486..f4d09ebba5c8 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -86,7 +86,7 @@ enum pn544_state {
 #define PN544_HCI_CMD_ATTREQUEST		0x12
 #define PN544_HCI_CMD_CONTINUE_ACTIVATION	0x13
 
-static struct nfc_hci_gate pn544_gates[] = {
+static const struct nfc_hci_gate pn544_gates[] = {
 	{NFC_HCI_ADMIN_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_LOOPBACK_GATE, NFC_HCI_INVALID_PIPE},
 	{NFC_HCI_ID_MGMT_GATE, NFC_HCI_INVALID_PIPE},
diff --git a/drivers/nfc/st21nfca/core.c b/drivers/nfc/st21nfca/core.c
index 583c36d4ff67..675f8a342869 100644
--- a/drivers/nfc/st21nfca/core.c
+++ b/drivers/nfc/st21nfca/core.c
@@ -72,7 +72,7 @@
 
 static DECLARE_BITMAP(dev_mask, ST21NFCA_NUM_DEVICES);
 
-static struct nfc_hci_gate st21nfca_gates[] = {
+static const struct nfc_hci_gate st21nfca_gates[] = {
 	{NFC_HCI_ADMIN_GATE, NFC_HCI_ADMIN_PIPE},
 	{NFC_HCI_LINK_MGMT_GATE, NFC_HCI_LINK_MGMT_PIPE},
 	{ST21NFCA_DEVICE_MGNT_GATE, ST21NFCA_DEVICE_MGNT_PIPE},
diff --git a/net/nfc/hci/core.c b/net/nfc/hci/core.c
index 3481941be70b..e37d30302b06 100644
--- a/net/nfc/hci/core.c
+++ b/net/nfc/hci/core.c
@@ -447,7 +447,7 @@ static void nfc_hci_cmd_timeout(struct timer_list *t)
 }
 
 static int hci_dev_connect_gates(struct nfc_hci_dev *hdev, u8 gate_count,
-				 struct nfc_hci_gate *gates)
+				 const struct nfc_hci_gate *gates)
 {
 	int r;
 	while (gate_count--) {
-- 
2.27.0

