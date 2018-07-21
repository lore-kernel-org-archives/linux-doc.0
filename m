Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B58FF7D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 12:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbeGUMwF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 08:52:05 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:36515 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727787AbeGUMwF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jul 2018 08:52:05 -0400
Received: by mail-lf1-f65.google.com with SMTP id b22-v6so3474667lfa.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Jul 2018 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cafp2N5/pCFZNE4LiyMSXZb3eQNaxHPcEoMdkA3oO3Y=;
        b=SUm+EKoG+uABvx2ouH3GAwsJB7jH9LxMkOyvxgqxi3AEXJxbPW0sM96HAOwCV7aAc8
         /hB2S+BLCCBiyclUuNIkqrercbJGoosmuDRIQ14mdO2EymaUR/LM9o2QsGFHmYlv9IC7
         NnwMZfweTeZ88FiIK0R/CbIxLTc9aidqd3k3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cafp2N5/pCFZNE4LiyMSXZb3eQNaxHPcEoMdkA3oO3Y=;
        b=bkCaUrMQt4Z/wpD4UmFsyZIxgDtb7rLT3QCogYz8o7E5Y0NIU+ZZno+7gtIP81w1fY
         dIASkRdpXmwSwkVd/NKEPwZgUNwcw9YEWn+FyhY7g7rYnBv+9tq2kVD009vczls5cfhU
         epTgWQvWp8rRXphsc6Wj28SloIY4T+5lM8vfMy5PWjc0QvIXVM5x/7vYSAVCShg5HvDl
         Ge2J7M1c6+HtB9IiEXg8Shr/YBqecG93HYReIBGJ2xQbHWnt0v+vxZ/bloHvZO1egA6h
         fPV8R4MOFWi139D1RqoQjIJ/hwcrhzrYTh7p/nPs9axpJJQSudtT8GhgMRx+Z2MRBnMd
         WPHA==
X-Gm-Message-State: AOUpUlFVQ4A/989oVfvHSKNbrpCGeUIPdzdoMwReArF3Ot6cJ7Murxox
        KSR9ojt8izalrXBlu9bnfaelCg==
X-Google-Smtp-Source: AAOMgpep3OQI8fn3+BW+V72/89C59Exl59NW2h1nzyS5HImnUZszV4A8qXGIWRYVeWjzNYVeH5rzYQ==
X-Received: by 2002:a19:e955:: with SMTP id g82-v6mr3585281lfh.44.1532174374222;
        Sat, 21 Jul 2018 04:59:34 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id 73-v6sm664260lfs.44.2018.07.21.04.59.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Jul 2018 04:59:33 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 1/6] net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
Date:   Sat, 21 Jul 2018 14:59:18 +0300
Message-Id: <20180721115923.1389-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
References: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
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

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/cpsw.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 00761fe59848..4425b537b9dd 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -968,8 +968,8 @@ static int cpsw_tx_mq_poll(struct napi_struct *napi_tx, int budget)
 
 	/* process every unprocessed channel */
 	ch_map = cpdma_ctrl_txchs_state(cpsw->dma);
-	for (ch = 0, num_tx = 0; ch_map; ch_map >>= 1, ch++) {
-		if (!(ch_map & 0x01))
+	for (ch = 0, num_tx = 0; ch_map & 0xff; ch_map <<= 1, ch++) {
+		if (!(ch_map & 0x80))
 			continue;
 
 		txv = &cpsw->txv[ch];
@@ -2432,7 +2432,7 @@ static int cpsw_update_channels_res(struct cpsw_priv *priv, int ch_num, int rx)
 	void (*handler)(void *, int, int);
 	struct netdev_queue *queue;
 	struct cpsw_vector *vec;
-	int ret, *ch;
+	int ret, *ch, vch;
 
 	if (rx) {
 		ch = &cpsw->rx_ch_num;
@@ -2445,7 +2445,8 @@ static int cpsw_update_channels_res(struct cpsw_priv *priv, int ch_num, int rx)
 	}
 
 	while (*ch < ch_num) {
-		vec[*ch].ch = cpdma_chan_create(cpsw->dma, *ch, handler, rx);
+		vch = rx ? *ch : 7 - *ch;
+		vec[*ch].ch = cpdma_chan_create(cpsw->dma, vch, handler, rx);
 		queue = netdev_get_tx_queue(priv->ndev, *ch);
 		queue->tx_maxrate = 0;
 
@@ -2982,7 +2983,7 @@ static int cpsw_probe(struct platform_device *pdev)
 	u32 slave_offset, sliver_offset, slave_size;
 	const struct soc_device_attribute *soc;
 	struct cpsw_common		*cpsw;
-	int ret = 0, i;
+	int ret = 0, i, ch;
 	int irq;
 
 	cpsw = devm_kzalloc(&pdev->dev, sizeof(struct cpsw_common), GFP_KERNEL);
@@ -3157,7 +3158,8 @@ static int cpsw_probe(struct platform_device *pdev)
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
