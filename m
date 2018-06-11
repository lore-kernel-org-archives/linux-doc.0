Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 62F1F7DF8C
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Jun 2018 13:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933217AbeFKNbo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Jun 2018 09:31:44 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40269 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754246AbeFKNbF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jun 2018 09:31:05 -0400
Received: by mail-lf0-f65.google.com with SMTP id q11-v6so30559071lfc.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Jun 2018 06:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/4SX3+u2Y2cLjVWm/+4v5rftrI/D8hB/irhmVjaL3vQ=;
        b=Rr8ZJvuX9dLblZAl1GxZSNyM06LGWgpo6EgwPoIPn4W+//NijV442OnAxjN8IYfaqx
         zyIZ19JbLZVRISyVfHVYWFsdePY3M5wfZjPNFSCnH22AH60PGdJrnzfgi2RgsbjTdIJ4
         uwF26OdZR+bqUAvR99d1jTSJ0qU6Yut+NikUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/4SX3+u2Y2cLjVWm/+4v5rftrI/D8hB/irhmVjaL3vQ=;
        b=VyATPwCtMybJ6QfJBBvbEofeKe61BXJBlJKh27fusWx6eLsGfizYq3hEnRWq6oeWwA
         G2GtwZ2I4JvXDEbjgQMW5ro+3btfJWVAriQBNNQF1dVp1efWlmslktb3cjfDcgx3Jvi4
         KkS8MSASLI+RW/2ACE5bdxYfI9SCe0zvg4zByaBeOe0PFLmWxmV7M2/GPu+wC3UgEhJh
         EusbYLkgOIG0g93oj45hUq5gaD48KhRjBB0X2N/eSvqRCEgQpSQc3lnLKjqtrwFqM5lz
         3tpezgOok6pM0px2ErK/QTjrxaeT0SKkRaDtmC65jMVc8A22xEaie0HXJp2krcTquYkn
         6ffA==
X-Gm-Message-State: APt69E2ROp6uP01GOXPRjg/44A+tGbmWU2EKysaTUm01uWD7/pGMtLz4
        qvvDcNidhRr9UROnsPjpSk74yg==
X-Google-Smtp-Source: ADUXVKKPmNF6f4FWxdp5sidAfYcM5AGq4O5JyuHpISSIgbaSn5PrVqiRGb3eIQDC7cwjGV+k4h9prw==
X-Received: by 2002:a2e:6548:: with SMTP id z69-v6mr9352311ljb.116.1528723864156;
        Mon, 11 Jun 2018 06:31:04 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id u24-v6sm2617712ljj.96.2018.06.11.06.31.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jun 2018 06:31:03 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next 5/6] net: ethernet: ti: cpsw: restore shaper configuration while down/up
Date:   Mon, 11 Jun 2018 16:30:46 +0300
Message-Id: <20180611133047.4818-6-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
References: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
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
index 87a5586c5ea5..f39d2662c5ab 100644
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
