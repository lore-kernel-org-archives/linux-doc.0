Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 57B4C7D085
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 21:27:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388309AbeGWWaE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 18:30:04 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:38338 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388238AbeGWWaD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jul 2018 18:30:03 -0400
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so1776032ljc.5
        for <linux-doc@vger.kernel.org>; Mon, 23 Jul 2018 14:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d1Za27wcuN7sHeOL/0KokiwCWrvu5jc334Ssx7ln6cQ=;
        b=VxLGjWVmg52DX/Z2bx/9MzKKF/eQFkgY/odRP6QZDV0aE0SyupBBBa34pdIf71ozlq
         XLgWvoh5sAd+QjroInR5X0xexI1lCZtoXeTASrdFOXtRVg0VR8Z2on0rrscn0ADmDfeH
         i5kB8ztBxosNweVWp/XJBpQMQXMw+6c85t6b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d1Za27wcuN7sHeOL/0KokiwCWrvu5jc334Ssx7ln6cQ=;
        b=DtHK9fkPOitkTv6BatKV/ZDJO3mVVQW6WN5hw7UPDTDcDY63hvTZTyzZ8BBST649aL
         ogFu1Ohvcue14DVbc2fwbPLaYxhg0FWquGiXaPhld87ALueIyyd0FadXQVR9jDWl7bFa
         UmEiFS+7rsV5MDzd4l988g9JvuWqlg5VRu0s/tMMmtej+Ohos1ZSkYMxJOMVCB3SKJz+
         BP59pOjMzqYFt33EsCrUG6kQz9VA+9kwTU8LCYj2T3Wqkee2q0hZV3FgShk0qi7MEN+a
         oEeHn/bHqJQBqpPH/WZwa9N7Ni9AhFT6XfxlunIeTuYtOe6AA5XQ0DiR3cvdwbuPhyYm
         eugg==
X-Gm-Message-State: AOUpUlEWZd/V5Er31FTtkx6GRl+ISAJ8AHwr2ynzqlJUnFpBSphUYCm1
        swFlb5rpEKPO4Bm5mwvzyB4TgQ==
X-Google-Smtp-Source: AAOMgpffoQ/Vjzh/l7nIWypo2LRWegoYlJ9e2gf/12ML6qOZGguEGS1MZeHYjzNsE8s4ZieB4fkyTg==
X-Received: by 2002:a2e:1004:: with SMTP id j4-v6mr10458738lje.2.1532381215695;
        Mon, 23 Jul 2018 14:26:55 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id q4-v6sm1990435ljh.36.2018.07.23.14.26.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jul 2018 14:26:54 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Tue, 24 Jul 2018 00:26:33 +0300
Message-Id: <20180723212634.3219-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723212634.3219-1-ivan.khoronzhuk@linaro.org>
References: <20180723212634.3219-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Need to restore shapers configuration after interface was down/up.
This is needed as appropriate configuration is still replicated in
kernel settings. This only shapers context restore, so vlan
configuration should be restored by user if needed, especially for
devices with one port where vlan frames are sent via ALE.

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 449dc7f1e5f8..171abcfb6184 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -1808,6 +1808,51 @@ static int cpsw_set_cbs(struct net_device *ndev,
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
@@ -1887,6 +1932,8 @@ static int cpsw_ndo_open(struct net_device *ndev)
 
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
