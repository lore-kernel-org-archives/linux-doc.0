Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C08867D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 21:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752528AbeERVQD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 17:16:03 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34624 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752211AbeERVPY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 17:15:24 -0400
Received: by mail-lf0-f67.google.com with SMTP id x145-v6so3879258lff.1
        for <linux-doc@vger.kernel.org>; Fri, 18 May 2018 14:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ipc/qNQrKTE3lp0xIgbG2YftOJpAgeq9/oT0QY88PVM=;
        b=cYLg6nVgAizCZaRcHDYMwkNLbvsEl/X3OuHR7MGL8URg4qSyVubNI3Y0DkGjdn+Fzw
         E3Ul2yLZQhINnJ/dIdmQiCrxlhbaFBFtUdck2yNIVLu1AGed2j0Px3K5L580JZ2GiRiJ
         v/oKeeE+LtPsjf38SVUjT9EPCnlOfSp/y+1lc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ipc/qNQrKTE3lp0xIgbG2YftOJpAgeq9/oT0QY88PVM=;
        b=G6jwm4O6KbZKgIuMUt0jje8/ZgGOITzqh4jtT48Zbh5Y9wUt9y+y5JvFaMkkLV4rQL
         +7StZzoLs2Ukemx7iyLgKPjXJ0lUDelDAfE1XdTmJjZq636NYn3zKrjQ/y76nNeA74cp
         7b+IQ5eZbwEaOpHi7j+Lyudq5w3xGGAyrY8F1X8PWhU8aGGNgXZ7zQ5PiMgMwf3OA6SE
         CT8FCHZn10cYTuxEAGyKZmVkENZXXDSKOBacA7VUrRCSvC+U2NpOOJDdBveB5Nj0bsdM
         RrmaEnOdtq4uUicQu37vO6iO8rMnfGj6md8jWouzoFdkAbIj9Chjxc1Dswl6b8F+e4N3
         Q9sg==
X-Gm-Message-State: ALKqPweFFpUoF+Hj0o81iMvkCCiNy3XN8paH6Fq/OSNLcxUtTFBJimPa
        DWOQkBfX9p2XJ7BYG4xP9e1HNA==
X-Google-Smtp-Source: AB8JxZqxvYZRX/YrgORhMORoWm62w59rwA1C1IdcnxUUtYqyRhnYWiqyf/z/QsW7Bfr16eA5WsPZGg==
X-Received: by 2002:a19:e10c:: with SMTP id y12-v6mr19149717lfg.9.1526678122503;
        Fri, 18 May 2018 14:15:22 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g20-v6sm2045991lfk.39.2018.05.18.14.15.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 14:15:21 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [RFC PATCH 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Sat, 19 May 2018 00:15:09 +0300
Message-Id: <20180518211510.13341-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
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
index c7710b0e1c17..c3e88be36c1b 100644
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
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
