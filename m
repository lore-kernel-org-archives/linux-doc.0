Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 138B87D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 21:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752277AbeERVRh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 17:17:37 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40108 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751815AbeERVPS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 17:15:18 -0400
Received: by mail-lf0-f68.google.com with SMTP id u140-v6so3615193lff.7
        for <linux-doc@vger.kernel.org>; Fri, 18 May 2018 14:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LG3vbTOt3H4eqZw84rnHtarB8hn9NN2ZT3db1ZaLe8w=;
        b=Iq7ekSlXrcMHEzYWVyaU9iPWUbLNPrEUrtbvOJCsxayInBm2lXxPRpWAwwCTLlMXgN
         IQ0gjTZGCESBk4pHQNlKhT9tvm2h48Auu9j6++UdwTLyu0yad8vWEE7I5ByR+MI9EW0+
         W6rrMtaxOndSFeTKv49+doRfXkafjQImYY3x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LG3vbTOt3H4eqZw84rnHtarB8hn9NN2ZT3db1ZaLe8w=;
        b=k8fiiW6hVasZJ6hd/VJR5WW+fOEYcC//zvHrD4i9U8CRsHWnkjfpzJV9Jdd3PdoaWg
         Rqzo/DLJkNc/kmqRTuXMDWWBk9rCgVBOmnIlJS99AedsiyKQw58JxthUK4w7Lnu+/vbw
         Kv3/h/My7Pm/R2GMnaWi1fFICUfosDQZ31eIQnhLxp8xGEdtxBxVcTe6GK+ccfwjz42V
         zzeMkRlNEjgNTad1SVuQb74f/9uDxOC/d7RrZUwoBK/T3OguUxip+t9h7yOvN1sbWkeK
         4AqpwPh9DHD630yfVK87TktBKKP+aq5o4H+VDav5jfgMmff7scd24HopC5e8QEGi5VTa
         L8SA==
X-Gm-Message-State: ALKqPwcLg4PB+DtC3x88AsnQ7fci73L68WrhoPPXx1SHrEhlL0JIJAhS
        xF5vZeLrHeK4WZiUZHGqzVtoErmoW4w=
X-Google-Smtp-Source: AB8JxZqthlIr1sM+E3tkKBczzULGFwbIjm0taB0h+ZcqLNrUxjSK8SyMEDZOX6+veF1E8FJ82XTlCw==
X-Received: by 2002:a2e:4d5d:: with SMTP id a90-v6mr6918962ljb.86.1526678117391;
        Fri, 18 May 2018 14:15:17 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g20-v6sm2045991lfk.39.2018.05.18.14.15.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 14:15:16 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [RFC PATCH 1/6] net: ethernet: ti: cpsw: use cpdma channels in backward order for txq
Date:   Sat, 19 May 2018 00:15:05 +0300
Message-Id: <20180518211510.13341-2-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
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
index a7285dddfd29..9bd615da04d3 100644
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
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
