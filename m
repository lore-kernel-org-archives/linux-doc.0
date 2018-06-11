Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 230E47D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 11 Jun 2018 13:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932904AbeFKNbE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 11 Jun 2018 09:31:04 -0400
Received: from mail-lf0-f68.google.com ([209.85.215.68]:40255 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754221AbeFKNbA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 Jun 2018 09:31:00 -0400
Received: by mail-lf0-f68.google.com with SMTP id q11-v6so30558631lfc.7
        for <linux-doc@vger.kernel.org>; Mon, 11 Jun 2018 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lDdZ+12ye4H9JsUdu5+2AMHnLkdkF7ofjKyzEJiIn2U=;
        b=hu84LKHy75/wLhFShXTYOjz0+SniVId4gbnyRZqiEad/oW5UIJ0F4N3k1W1I1Vjhni
         wem/FGQmtc46tuPLhMCbWoTGhp2EQah59mgKS7o7FF6gPxoA+X4EuBk1WVR1wyfXFMIa
         hJR8r3MbZySYsolK5ghcneJBgNZWeegwFkkxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lDdZ+12ye4H9JsUdu5+2AMHnLkdkF7ofjKyzEJiIn2U=;
        b=M4A1FqJgprKYYGU/4rbyGAq7tIdK96EYKCU5acoDQZa+r67D2Y3gBDF3ZLydYSHoCP
         0Rqo5O+5bK3sYrsk/5o0akULz3X+kJi8mDuQdwBc6sMR5Ay2pVh0ONGBE+6fxxyYfedl
         +DIY5tth092Gd2FWsQSPLYSVCb8jQhxI7cYJ4AXWZQAIttX/IeqpU+PGvTxfHBk8bhX9
         FTE3+/uEcqLUGZjSUidN9FWGU40fmEzGVo1hQt2v1ErDj0+VhEJpvoJCM+XZUWhCuET4
         p9RbwmQ1HoJ3Nnr3GsMFaZ52WfvyI48yhEb1SQNvzZU3HRpStRnXrPz8V7633yUo9yHZ
         rljQ==
X-Gm-Message-State: APt69E0BmVNmgZvIQF3xddyjPMcOgsOj1bP5qgJUr5RCBdUX4RNPu8dr
        FlaV2EO1nGl5UwNc+ZtRbx218Q==
X-Google-Smtp-Source: ADUXVKKPcPhqXPtK987Je+vAohmTXdz1Jo+gG4EoJvae+vh74fJmF54L9NTFKnngjtY1ap/8RKZ72w==
X-Received: by 2002:a2e:1188:: with SMTP id 8-v6mr12288206ljr.38.1528723859491;
        Mon, 11 Jun 2018 06:30:59 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id u24-v6sm2617712ljj.96.2018.06.11.06.30.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jun 2018 06:30:58 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next 2/6] net: ethernet: ti: cpdma: fit rated channels in backward order
Date:   Mon, 11 Jun 2018 16:30:43 +0300
Message-Id: <20180611133047.4818-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
References: <20180611133047.4818-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

According to TRM tx rated channels should be in 7..0 order,
so correct it.

Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
 drivers/net/ethernet/ti/davinci_cpdma.c | 31 ++++++++++++-------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_cpdma.c b/drivers/net/ethernet/ti/davinci_cpdma.c
index cdbddf16dd29..19bb63902997 100644
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
