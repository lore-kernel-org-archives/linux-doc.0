Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0475DC4320A
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5B0460E0C
	for <linux-doc@archiver.kernel.org>; Sat, 24 Jul 2021 21:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhGXVHo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Jul 2021 17:07:44 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:58392
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229510AbhGXVHm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Jul 2021 17:07:42 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 048093F357
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 21:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627163292;
        bh=ov7yn4H0ornXwxrX1ZBFt/XnbBsClxe6Xsh+B5h5Cag=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=NFT2TH5RHKxhKepVn8mxasVuGoioV6G5GdrCDWRpMvtVsxoMwrWQAT40LILtXmcfn
         hrCsgF+2nsQz5OTtP+3tBFksJEnOXWM0LEiK2GtuP95r2xDWPVijfVjFWEQGJFT3my
         5eB4goXWcs9yhveCmSqbwJnHzJZxE6uBggH8ZxvmccY2TP+3i65DzhLZMNTkEQ0fHl
         ORqK7BJOz5zLcyv8bpqpaj7A083ZXCl8sPu/LAA2pplSECvAufF+v2vOULa7gr8+eY
         sFjpk8A/5wGKZq8/t4g+x8sNVXH+cvuuDxhKLKW77jjjoWshGjhlAH1QSRk+nISbQO
         Kltl1xzJJ/OzA==
Received: by mail-ed1-f69.google.com with SMTP id b13-20020a056402278db029039c013d5b80so2803300ede.7
        for <linux-doc@vger.kernel.org>; Sat, 24 Jul 2021 14:48:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ov7yn4H0ornXwxrX1ZBFt/XnbBsClxe6Xsh+B5h5Cag=;
        b=Z/pVq6TeHYYYBfiz0dzYbaUAF68hB+yvzvCIosxyro9KREOTqU+gxlU8ifAzkziy4d
         nRuody4WMmjFaSPdmXuWYtG4CxzD1KjHKonrWeIj760cGApnisaxMvUgRXeyqkwYg+38
         r3CTOrTqvU54Y89JuUHV5/5yi8u6hXIKKYv8J0eQHAxw+ZmzKyi4a2sWw0mIdsNXq0UI
         yn4QSHC+vCJOZTRp5BbqfepBA1cx3rlqDrK/mDjub5lQR78/zA0d3eGA+dKfbto1AgJ2
         p0sD6GncayEB3XacjtmzDxoxHFJxbFFcJpoy1JmiRORjs/W6CcnVXmvU6G4w1tw2Y59d
         xUkQ==
X-Gm-Message-State: AOAM531RFbQtDYAV8CUgVVoi9P+ZQy97Y9lgOY1xRZs/Uha8xiyKTVyg
        fp0NzqJGD+gFzQ7SNXN25B7EoftyirmmkhgIydIrOxvAEEH784sXEsOEieXdoqVrOUVJgDKRaIY
        pgEziTIyt5VePc1uyK49xe7OLyDhZroxy3MTUgQ==
X-Received: by 2002:a17:906:5e4c:: with SMTP id b12mr10085425eju.230.1627163288267;
        Sat, 24 Jul 2021 14:48:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4DjgiuYIHPq50fWezEY5ArO3iNlytrDP/udlFADjFqzzpxgUDWdNRebg5J3N9yopeTwgO0Q==
X-Received: by 2002:a17:906:5e4c:: with SMTP id b12mr10085415eju.230.1627163288139;
        Sat, 24 Jul 2021 14:48:08 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id j5sm8383005edv.10.2021.07.24.14.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 14:48:07 -0700 (PDT)
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
Subject: [PATCH 01/12] nfc: constify payload argument in nci_send_cmd()
Date:   Sat, 24 Jul 2021 23:47:32 +0200
Message-Id: <20210724214743.121884-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
References: <20210724214743.121884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The nci_send_cmd() payload argument is passed directly to skb_put_data()
which already accepts a pointer to const, so make it const as well for
correctness and safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/net/nfc/nci_core.h | 2 +-
 net/nfc/nci/core.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/net/nfc/nci_core.h b/include/net/nfc/nci_core.h
index 1df0f8074c9d..bf573eca07ca 100644
--- a/include/net/nfc/nci_core.h
+++ b/include/net/nfc/nci_core.h
@@ -360,7 +360,7 @@ int nci_core_rsp_packet(struct nci_dev *ndev, __u16 opcode,
 int nci_core_ntf_packet(struct nci_dev *ndev, __u16 opcode,
 			struct sk_buff *skb);
 void nci_rx_data_packet(struct nci_dev *ndev, struct sk_buff *skb);
-int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload);
+int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, const void *payload);
 int nci_send_data(struct nci_dev *ndev, __u8 conn_id, struct sk_buff *skb);
 int nci_conn_max_data_pkt_payload_size(struct nci_dev *ndev, __u8 conn_id);
 void nci_data_exchange_complete(struct nci_dev *ndev, struct sk_buff *skb,
diff --git a/net/nfc/nci/core.c b/net/nfc/nci/core.c
index da7fe9db1b00..09967b836361 100644
--- a/net/nfc/nci/core.c
+++ b/net/nfc/nci/core.c
@@ -1332,7 +1332,7 @@ int nci_send_frame(struct nci_dev *ndev, struct sk_buff *skb)
 EXPORT_SYMBOL(nci_send_frame);
 
 /* Send NCI command */
-int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, void *payload)
+int nci_send_cmd(struct nci_dev *ndev, __u16 opcode, __u8 plen, const void *payload)
 {
 	struct nci_ctrl_hdr *hdr;
 	struct sk_buff *skb;
-- 
2.27.0

