Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A65307DF86
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 07:40:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754821AbeFNHki (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 03:40:38 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:43146 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754609AbeFNHhL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 03:37:11 -0400
Received: by mail-lf0-f68.google.com with SMTP id n15-v6so7817564lfn.10
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 00:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j3jIepUwDw2xc+pgExVeFYswjqlQIgEI3e1Xbicq7EM=;
        b=WCY8GY/OeAWDmjl+LuTZek/xIP13o7zPX81zm3bgC5AYZ3I/7nM0a2nrxcl9T8oqpd
         SpWgH9GFCPF+Li4ff1Eofz2FSAuD4/iCEU6U0/HvQEK9VxSgLbEIU89SdazFhRLYLCwx
         GESwzpJOwLqjY2vklT2asaX7MZe5eY88F1snA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j3jIepUwDw2xc+pgExVeFYswjqlQIgEI3e1Xbicq7EM=;
        b=BGU2Gf/Gx9BEt1pESwpF6YzdBNWLIC3gXmsZcbCTpveSlYRGXx1hU+zPP0DXL3Jz8r
         O8xdBQZ7MGOObStthmkP7GV2PXUwL7frie0vpoDAvTHl+EIjIKf5CcQ+UoAax+DTWlRS
         xnh/bO3s1J/WU1kej/aYw8lP2muJup8LfVUieFSvnVeVPCRMxr01Pd80lNjIqKiCqMuT
         9NmsH3I9SSa7iUjo8vaqY/TPh0q8SmWpNCsudAVKM2pqs0OyMPP79oRjMgWM2VsQ1QGq
         seYvyJOQqeiDfhMONBgMdrmj6P6+7KoCWvFFmLyoASZDyNLT+YaulNMm1iMg1EIa/kgf
         u+mA==
X-Gm-Message-State: APt69E3vdvWJukzcoF/rAo1LTmsbYK+R3M9T104hcYkomj0JDESLkijK
        VAhp69nmhro6G0TO3pFArmoa+w==
X-Google-Smtp-Source: ADUXVKJS3p9VpZ010k0nPf6+3Py3xlJ8+KgcQq19U/StnRWL65362nD+qU93utuZAIsu+eOBjSy4uw==
X-Received: by 2002:a2e:5047:: with SMTP id v7-v6mr963704ljd.122.1528961830002;
        Thu, 14 Jun 2018 00:37:10 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id a195-v6sm957597lfe.44.2018.06.14.00.37.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 00:37:09 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 1/6] net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
Date:   Thu, 14 Jun 2018 10:36:45 +0300
Message-Id: <20180614073650.29659-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
References: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
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
