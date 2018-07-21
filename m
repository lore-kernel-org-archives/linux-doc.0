Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 41CBE7D072
	for <lwn-linux-doc@archive.lwn.net>; Sat, 21 Jul 2018 11:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbeGUMwG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 21 Jul 2018 08:52:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39704 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbeGUMwG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jul 2018 08:52:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id a134-v6so3478494lfe.6
        for <linux-doc@vger.kernel.org>; Sat, 21 Jul 2018 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=J0gNx+HMMc7tXkTsJONncvK4d9iP3vDtXPedoLleIHE=;
        b=bWsVoDnyCcM+fPbyUSRxA86ssLvb4p+TrvXBvjbLSRf6x+gnRdEADpWM7h4HhBURXv
         cH6nyQ2DLggqslRXB3arPdAf0GNmb0TRYOzscgVbKbT/R46KOvwqyCHXzQ92qzH2xWvn
         RSxfNPxFFr2ia0Au4YgkbvfL8e28JwbIbL0AQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=J0gNx+HMMc7tXkTsJONncvK4d9iP3vDtXPedoLleIHE=;
        b=T79Do2hufbGEbvqdsJ1RMLb/LUgmp+gCUYdsKjo/pq7sP6GLw8cEGl6fd3wgr3y0Xh
         DQ1r8h9g7Z2UDDJ5Urk8WL1oKqjx2D6Bf/u0RntsNqm29u0RD15sqtC9M6kMfowsIRsj
         02pNW1RlSQl+Vvt5/AaO+L7+/UYqOJQGaSeXI/hGs1oYExaCT6f3dTRzxHOlTSsX+dmU
         WJYekd57F/ePNeFyqlQaGG2Rs+TAgQtaWHjpHE9t1oAAYQyoInUnmsBAiLk0dl3kBYiN
         5jcI7Jz52LyvHC2K2l9yvyxgPs+E0xIna8cEnqwIN3aJqyI5dMduxKdeWN4NKBNYkU2C
         Ik1w==
X-Gm-Message-State: AOUpUlGpMIGg0PNegdLubKZg0WW85xK/a4pl0PgIcv9Eq0Qe/32z15Vo
        47eb3tF3UOeHBCTJ1vBLHqf4rw==
X-Google-Smtp-Source: AAOMgpesw5hgFAkptlq0c+qBKS33IMyjRYtMJUoKCvcIbX2gPG36B8GfIF/JDdbzNr/Fhe/4N7Bryg==
X-Received: by 2002:a19:a111:: with SMTP id k17-v6mr3261804lfe.131.1532174375716;
        Sat, 21 Jul 2018 04:59:35 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id 73-v6sm664260lfs.44.2018.07.21.04.59.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Jul 2018 04:59:35 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v4 net-next 2/6] net: ethernet: ti: cpdma: fit rated channels in backward order
Date:   Sat, 21 Jul 2018 14:59:19 +0300
Message-Id: <20180721115923.1389-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
References: <20180721115923.1389-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

According to TRM tx rated channels should be in 7..0 order,
so correct it.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/davinci_cpdma.c | 31 ++++++++++++-------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index 4f1267477aa4..4236dcdd5634 100644
--- a/drivers/net/ethernet/ti/davinci_cpdma.c
+++ b/drivers/net/ethernet/ti/davinci_cpdma.c
@@ -406,37 +406,36 @@ static int cpdma_chan_fit_rate(struct cpdma_chan *ch, u32 rate,
 	struct cpdma_chan *chan;
 	u32 old_rate = ch->rate;
 	u32 new_rmask = 0;
-	int rlim = 1;
+	int rlim = 0;
 	int i;
 
-	*prio_mode = 0;
 	for (i = tx_chan_num(0); i < tx_chan_num(CPDMA_MAX_CHANNELS); i++) {
 		chan = ctlr->channels[i];
-		if (!chan) {
-			rlim = 0;
+		if (!chan)
 			continue;
-		}
 
 		if (chan == ch)
 			chan->rate = rate;
 
 		if (chan->rate) {
-			if (rlim) {
-				new_rmask |= chan->mask;
-			} else {
-				ch->rate = old_rate;
-				dev_err(ctlr->dev, "Prev channel of %dch is not rate limited\n",
-					chan->chan_num);
-				return -EINVAL;
-			}
-		} else {
-			*prio_mode = 1;
-			rlim = 0;
+			rlim = 1;
+			new_rmask |= chan->mask;
+			continue;
 		}
+
+		if (rlim)
+			goto err;
 	}
 
 	*rmask = new_rmask;
+	*prio_mode = rlim;
 	return 0;
+
+err:
+	ch->rate = old_rate;
+	dev_err(ctlr->dev, "Upper cpdma ch%d is not rate limited\n",
+		chan->chan_num);
+	return -EINVAL;
 }
 
 static u32 cpdma_chan_set_factors(struct cpdma_ctlr *ctlr,
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
