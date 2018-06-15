Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 464FD7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 18:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756477AbeFOSPb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 14:15:31 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44059 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756300AbeFOSNR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jun 2018 14:13:17 -0400
Received: by mail-lf0-f66.google.com with SMTP id p23-v6so4189458lfh.11
        for <linux-doc@vger.kernel.org>; Fri, 15 Jun 2018 11:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j3jIepUwDw2xc+pgExVeFYswjqlQIgEI3e1Xbicq7EM=;
        b=MB6nTE7aJ3eJJTiSH6BDy3JK8a4ovz4lxXEQP7zZnX3rhojCabrb37HXiMoqRRVdkT
         pqacbX0SZpNdNN7hH6xHv3kpPFwbJIihGIoXkjDUM9RiHqMzs4ityas8Fl1234aVJ3ZP
         x5jzSDsGuaTrhSKeiciCXeuQKGhQChQgJbOS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j3jIepUwDw2xc+pgExVeFYswjqlQIgEI3e1Xbicq7EM=;
        b=bvvoF19CfMJpMHjiBKDnU63iNy+XnNtiGELzuajSU+HJG5k//cwCdzxot++7jsYiCS
         ex9mybYiVJmVWmIw/CIksXDPbxUX24TxUyEGHkQJUiF6g+/0vH1NBNRpAJ/NYeuWLIGK
         p8BGs+NAOgHsXp/ZmaALQap4kMmFYP3FpHAOXhuUPBdaSGGP+ZN1PKQL1XNvaauG3OIw
         Noup5lALbFe4s4S7mNk5g3OxNxyL9Qc66/doWUZxvj99/8Bt3XIAxne/xXAouXdqNY8Z
         VOepLVRmBGGspXsJrUfBsAjIWa5G+b87yyba5vCS2ydVfV4WXRJ0pu2+jE6WlNMniFIt
         IyGw==
X-Gm-Message-State: APt69E2G17dvldu0OkZf7dh5R2Hk8TfLYauigplMUUJf+5vxodUPXQIS
        LaU7FutBHBkZH4sfHQ+28gB3tg==
X-Google-Smtp-Source: ADUXVKKkYgf6LrW5EFIzd4TVmANqUWwHUCfQKvmfonDly+FlwvCFESN1ymCniyrVnLt6j0z7n408xA==
X-Received: by 2002:a19:ef11:: with SMTP id n17-v6mr1947708lfh.66.1529086396162;
        Fri, 15 Jun 2018 11:13:16 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id h4-v6sm1543260ljc.8.2018.06.15.11.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Jun 2018 11:13:15 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v3 net-next 1/6] net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
Date:   Fri, 15 Jun 2018 21:13:05 +0300
Message-Id: <20180615181310.10437-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180615181310.10437-1-ivan.khoronzhuk@linaro.org>
References: <20180615181310.10437-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The cpdma channel highest priority is from hi to lo number.
The driver has limited number of descriptors that are shared between
number of cpdma channels. Number of queues can be tuned with ethtool,
that allows to not spend descriptors on not needed cpdma channels.
In AVB usually only 2 tx queues can be enough with rate limitation.
The rate limitation can be used only for hi priority queues. Thus, to
use only 2 queues the 8 has to be created. It's wasteful.

So, in order to allow using only needed number of rate limited
tx queues, save resources, and be able to set rate limitation for
them, let assign tx cpdma channels in backward order to queues.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 534596ce00d3..406537d74ec1 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -967,8 +967,8 @@ static int cpsw_tx_mq_poll(struct napi_struct *napi_tx, int budget)
 
 	/* process every unprocessed channel */
 	ch_map = cpdma_ctrl_txchs_state(cpsw->dma);
-	for (ch = 0, num_tx = 0; ch_map; ch_map >>= 1, ch++) {
-		if (!(ch_map & 0x01))
+	for (ch = 0, num_tx = 0; ch_map & 0xff; ch_map <<= 1, ch++) {
+		if (!(ch_map & 0x80))
 			continue;
 
 		txv = &cpsw->txv[ch];
@@ -2431,7 +2431,7 @@ static int cpsw_update_channels_res(struct cpsw_priv *priv, int ch_num, int rx)
 	void (*handler)(void *, int, int);
 	struct netdev_queue *queue;
 	struct cpsw_vector *vec;
-	int ret, *ch;
+	int ret, *ch, vch;
 
 	if (rx) {
 		ch = &cpsw->rx_ch_num;
@@ -2444,7 +2444,8 @@ static int cpsw_update_channels_res(struct cpsw_priv *priv, int ch_num, int rx)
 	}
 
 	while (*ch < ch_num) {
-		vec[*ch].ch = cpdma_chan_create(cpsw->dma, *ch, handler, rx);
+		vch = rx ? *ch : 7 - *ch;
+		vec[*ch].ch = cpdma_chan_create(cpsw->dma, vch, handler, rx);
 		queue = netdev_get_tx_queue(priv->ndev, *ch);
 		queue->tx_maxrate = 0;
 
@@ -2980,7 +2981,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	u32 slave_offset, sliver_offset, slave_size;
 	const struct soc_device_attribute *soc;
 	struct cpsw_common		*cpsw;
-	int ret = 0, i;
+	int ret = 0, i, ch;
 	int irq;
 
 	cpsw = devm_kzalloc(&pdev->dev, sizeof(struct cpsw_common), GFP_KERNEL);
@@ -3155,7 +3156,8 @@ static int cpsw_probe(struct platform_device *pdev)
 	if (soc)
 		cpsw->quirk_irq = 1;
 
-	cpsw->txv[0].ch = cpdma_chan_create(cpsw->dma, 0, cpsw_tx_handler, 0);
+	ch = cpsw->quirk_irq ? 0 : 7;
+	cpsw->txv[0].ch = cpdma_chan_create(cpsw->dma, ch, cpsw_tx_handler, 0);
 	if (IS_ERR(cpsw->txv[0].ch)) {
 		dev_err(priv->dev, "error initializing tx dma channel\n");
 		ret = PTR_ERR(cpsw->txv[0].ch);
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
