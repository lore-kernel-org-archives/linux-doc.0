Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A8DD7D043
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 May 2018 21:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752562AbeERVQc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 May 2018 17:16:32 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:45627 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752075AbeERVPU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 May 2018 17:15:20 -0400
Received: by mail-lf0-f65.google.com with SMTP id w202-v6so15856586lff.12
        for <linux-doc@vger.kernel.org>; Fri, 18 May 2018 14:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=evqVlSgwE0Mq3D3CWJiiP/nrSl0JupLCAxkyhHdkCDo=;
        b=WoT3uFz2l1Ig2Hb8nuOBRLmj+prhEM/N7QtBaCTrE5h7DdyLImWJ8EN8BXQgLgBb6z
         IT9DeRR169jNdTgTTXJXK5rPyxtBId3D3aFbxk4pojtlBMphio0VEX6mcsHNIFZkeNvc
         Lja90ER3Tx+Eez7UWmVAIjFJcO6I+qfm9+bBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=evqVlSgwE0Mq3D3CWJiiP/nrSl0JupLCAxkyhHdkCDo=;
        b=mc8wJAU4J5Ptsek0WM3Bj09dEr7JQhra7b8VpLQZN74JxjlFTwQnF+Ei7qlZxVcZFn
         5skYrEVKKynbgAHmzQfzmjQVyGOd6nCxYg1pguRuIKMG5lOI17DyZB6mB5vKI32c0iwA
         DoysI2P34l5qQuVDVcMPJIYkwuboUYaGcwjaLnQoM1MJXQ1rLEmrBL0Y3ITBdWsA35mt
         gqTKsLERm0ZgIDVPlKMCnHLPYPr9h8KDHpMbkC8Xj/IHW7Hw/8MrwNYjMFI/Lc7JMchu
         yMpK/PZS4BYEB8r9UEgq02QusPgdIsS6Eru34PoMcDvx+wd2HWk5yay1rL8k8631QPv4
         /6LQ==
X-Gm-Message-State: ALKqPwcmCkX0P5hAtV0gKOR1z+N6ALTHRz4P8go5kXdroOHF2TUyAoiM
        o8txq4CE6opXTLi55w8rtEAAOw==
X-Google-Smtp-Source: AB8JxZp3kRmfbeeLsZcY4p/VEAxU7uk2U6XZKlXQYw962tlodg2j8BA9h2ZIUY1D01p6tTASoHEwDQ==
X-Received: by 2002:a2e:2a45:: with SMTP id q66-v6mr6617173ljq.40.1526678118623;
        Fri, 18 May 2018 14:15:18 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id g20-v6sm2045991lfk.39.2018.05.18.14.15.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 May 2018 14:15:18 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [RFC PATCH 2/6] net: ethernet: ti: cpdma: fit rated channels in backward order
Date:   Sat, 19 May 2018 00:15:06 +0300
Message-Id: <20180518211510.13341-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
References: <20180518211510.13341-1-ivan.khoronzhuk@linaro.org>
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
index 31ae04117f0a..37fbdc668cc7 100644
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
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
