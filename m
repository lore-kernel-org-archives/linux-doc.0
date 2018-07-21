Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4BDB07D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 12:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728209AbeGUMwM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 08:52:12 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42839 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbeGUMwL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jul 2018 08:52:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id f1-v6so11545453ljc.9
        for <linux-doc@vger.kernel.org>; Sat, 21 Jul 2018 04:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1YA/ffmI4lvPW6BD2uhQsoeiW5XV+DX4SZhSwKauGOw=;
        b=TQQ+xuPyV0qwrF/V1dFImuWPHaG+oPPFqLH9G6xdeRnk6knbT+TGup/Q07LJ2AYdS+
         4T9goXTzmz60Jtv97jEx7/937mxahREDDToQR7GDsu1dnjlZNPm4SJbCF7RXk1HQGM3j
         a0htMvw4NikRfNwgZkXp4jZG0Nos6CSfPsKy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1YA/ffmI4lvPW6BD2uhQsoeiW5XV+DX4SZhSwKauGOw=;
        b=fV/Nu3x3AhCyXOELqJwWzkv9EK7Kx+eTrTY1giPWUJ96H2ths6sRfRN4siz56Wk8wu
         R9CQpAXEJckqitxXGl+gGXrtapD71L6h0cxgZ4Hio6miFvJdFGfkmFA9RQ9pl/R/S0zv
         Yf1HOpchJZvmo5JPGmjDtGbU8PIliy1eOal51GO8aadv48sx4guwuzlNdAvCQM6634c/
         wDdNxhb/G5ZTgdVaMg9An6zqlqL1GbTmBGKu89qyU2N9Bhei/QNoXVbRtTyXnXErg9hD
         /nyB0scLzvVUmjv+Jp3RfusqjODIBQnqeDqIW8vx18j7BbV5civGKYakgoe2pnh7wSOc
         A2NA==
X-Gm-Message-State: AOUpUlHrFBgTQhlFPIIV977u3lSQaZoQihZ624uU6VOSixmFxWk3fr/b
        Ky+xY1k0tErSYtjLPIV09CE9Zw==
X-Google-Smtp-Source: AAOMgpevXdI5q1Dkt9JxrcExZFIHBYPkYFPEFa9tQkRokPPiLgbCppNEvvmLmWJCg/2hY1sB2BRYqg==
X-Received: by 2002:a2e:800e:: with SMTP id j14-v6mr4134395ljg.114.1532174380338;
        Sat, 21 Jul 2018 04:59:40 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id 73-v6sm664260lfs.44.2018.07.21.04.59.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Jul 2018 04:59:39 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Sat, 21 Jul 2018 14:59:22 +0300
Message-Id: <20180721115923.1389-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
References: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Need to restore shapers configuration after interface was down/up.
This is needed as appropriate configuration is still replicated in
kernel settings. This only shapers context restore, so vlan
configuration should be restored by user if needed, especially for
devices with one port where vlan frames are sent via ALE.

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
