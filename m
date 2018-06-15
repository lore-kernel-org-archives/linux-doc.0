Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C1CA27D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 18:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756385AbeFOSN1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 14:13:27 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:37795 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756399AbeFOSNY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jun 2018 14:13:24 -0400
Received: by mail-lf0-f66.google.com with SMTP id g21-v6so15907623lfb.4
        for <linux-doc@vger.kernel.org>; Fri, 15 Jun 2018 11:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GKXqXY+mjPmPRZE5GHzSuesu2isoExZkPaVff6/WwVU=;
        b=UX5bzRbrSFHzSSL7MNjOYQWYl/I6RelZFDs35q5ITBMJOEq0AtCC2swpueD6v//HXh
         dhA3ZG+9dVflC0S+jUqPxhp4s1UFvQnkU4QVDfyDzxW7m1zILwLAfrxHAVPssYMCUrvf
         mH0qtP12fb/aqUmFiKJwFtZoMEvtaboVHfMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GKXqXY+mjPmPRZE5GHzSuesu2isoExZkPaVff6/WwVU=;
        b=HE2cJBCNeunYDHbZ9f6YiV0Tk+q6iIe4fEYvHE5c6L+l6oNVbwmNmbA+9D5Y7Lujbo
         3t8M3uHlCxzAOrkHmPOsnwEPDraUQOt+s3cMRwuSQ/3DZfikAL0Scd8uHJKZGoNp8l/r
         5LKqzLUHxzYduas3Cl6O9aKYZ3/oKYcNZA9tUNil4VPf83kiUn/OMTgFe9vX5xHJlAMN
         VHXiB700fdWw7cY9C0SEY7JbmwzBiBm4KXhWtV+zI0EimtTf6IBpGvmGQ7brSrrHV3Nu
         9K+0PFL9b96aIUL/0NrnyFDw4PqV5Ymq2tpsgptBX5789/jwW3+Z+Lf1UCksP7GQsKfs
         MROQ==
X-Gm-Message-State: APt69E2dSLn3gOOSFmPvNdfvTYWINOEGmZVruPGx88T1jV8rUyf2gpon
        4nTqgEQr7iNV/uZVHQO0XA94Zw==
X-Google-Smtp-Source: ADUXVKJvYVcN4fsB18YjngiiCe05wJ/CzpGv5A+FUL6IahfSH+6FqZElNyaYsZO2Ya2ayBmdjMC5hw==
X-Received: by 2002:a19:274e:: with SMTP id n75-v6mr1779216lfn.14.1529086402548;
        Fri, 15 Jun 2018 11:13:22 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id h4-v6sm1543260ljc.8.2018.06.15.11.13.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jun 2018 11:13:21 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v3 net-next 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Fri, 15 Jun 2018 21:13:09 +0300
Message-Id: <20180615181310.10437-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180615181310.10437-1-ivan.khoronzhuk@linaro.org>
References: <20180615181310.10437-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Need to restore shapers configuration after interface was down/up.
This is needed as appropriate configuration is still replicated in
kernel settings. This only shapers context restore, so vlan
configuration should be restored by user if needed, especially for
devices with one port where vlan frames are sent via ALE.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 19573627a9bb..e745b4a519dd 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1807,6 +1807,51 @@ static int cpsw_set_cbs(struct net_device *ndev,
 	return ret;
 }
 
+static void cpsw_cbs_resume(struct cpsw_slave *slave, struct cpsw_priv *priv)
+{
+	int fifo, bw;
+
+	for (fifo = CPSW_FIFO_SHAPERS_NUM; fifo > 0; fifo--) {
+		bw = priv->fifo_bw[fifo];
+		if (!bw)
+			continue;
+
+		cpsw_set_fifo_rlimit(priv, fifo, bw);
+	}
+}
+
+static void cpsw_mqprio_resume(struct cpsw_slave *slave, struct cpsw_priv *priv)
+{
+	struct cpsw_common *cpsw = priv->cpsw;
+	u32 tx_prio_map = 0;
+	int i, tc, fifo;
+	u32 tx_prio_rg;
+
+	if (!priv->mqprio_hw)
+		return;
+
+	for (i = 0; i < 8; i++) {
+		tc = netdev_get_prio_tc_map(priv->ndev, i);
+		fifo = CPSW_FIFO_SHAPERS_NUM - tc;
+		tx_prio_map |= fifo << (4 * i);
+	}
+
+	tx_prio_rg = cpsw->version == CPSW_VERSION_1 ?
+		     CPSW1_TX_PRI_MAP : CPSW2_TX_PRI_MAP;
+
+	slave_write(slave, tx_prio_map, tx_prio_rg);
+}
+
+/* restore resources after port reset */
+static void cpsw_restore(struct cpsw_priv *priv)
+{
+	/* restore MQPRIO offload */
+	for_each_slave(priv, cpsw_mqprio_resume, priv);
+
+	/* restore CBS offload */
+	for_each_slave(priv, cpsw_cbs_resume, priv);
+}
+
 static int cpsw_ndo_open(struct net_device *ndev)
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
@@ -1886,6 +1931,8 @@ static int cpsw_ndo_open(struct net_device *ndev)
 
 	}
 
+	cpsw_restore(priv);
+
 	/* Enable Interrupt pacing if configured */
 	if (cpsw->coal_intvl != 0) {
 		struct ethtool_coalesce coal;
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
