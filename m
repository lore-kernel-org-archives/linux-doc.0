Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5EE077DF86
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 07:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754793AbeFNHhZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 03:37:25 -0400
Received: from mail-lf0-f67.google.com ([209.85.215.67]:45789 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752748AbeFNHhR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 03:37:17 -0400
Received: by mail-lf0-f67.google.com with SMTP id n3-v6so7813245lfe.12
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fdzBwfiddhsxHhTDFLri8ZLLuudlxJt46EpHoD2hZtA=;
        b=V7711F+KQV3zJofRXuox9Z/KBRiI37VZvifxCQkqrWzU3bpXL8MsnCgaCMn86bUGHw
         EgERB7992eqNTThnHuJsqNoQdTnIYBERyGuG0b//aWliHRsca6MvVsZJju3+9pLniIZG
         RQC1vix44bd3G/bcyzlZhdlqbHoNYxQ9wZZ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fdzBwfiddhsxHhTDFLri8ZLLuudlxJt46EpHoD2hZtA=;
        b=X+ndwsc2Pm20wYVWD17KmFSwHu3RkHAplu4mkrT++s9fl7qS77+3Im8BuW2FHIqn+W
         /InAnoXVs9iqAzhrqIHOXthUMqNaDNk41GTz4SljPHw5w0qnGDDeRSX/jEbhBBCwBtdV
         bYVl7HvsUjOZ3/vNMC8nv4/7JZUmmvCBn2PozVj4bSpxuNf+SdqdKorekY/BxqHcgf//
         nA+/aJ/tVrAlA+m8eBW97ihRSODJloxgWw6JEA31h25/fY8Xz0WUK2W1MnmHTiMBRyGq
         Y5FzbE06PN+TwULGeNs85wSww510FjXdtbtjQF6a5hm4y+N2i/FfDROztAllWyhu3Tio
         vqWQ==
X-Gm-Message-State: APt69E2CkR1Vd5vyNgTdULRvDR0IK1tB5lTOsYFERDzIY86dRjJxgfec
        RxoOzMPkm3Jp/CThB47IO/H9xw==
X-Google-Smtp-Source: ADUXVKK1m1xJJsbbnnZ2L750Ackbruqwuq+uomihLMQKhtoNUm2JaVD6fEDkuu4djIsEvIpJzNfKvQ==
X-Received: by 2002:a2e:99c7:: with SMTP id l7-v6mr957123ljj.148.1528961836448;
        Thu, 14 Jun 2018 00:37:16 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id a195-v6sm957597lfe.44.2018.06.14.00.37.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 00:37:15 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Thu, 14 Jun 2018 10:36:49 +0300
Message-Id: <20180614073650.29659-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
References: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
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
index 3623c2994ddf..b2dfa7053b40 100644
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
