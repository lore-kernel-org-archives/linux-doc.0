Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6AEC7D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Jul 2018 21:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388216AbeGWW37 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Jul 2018 18:29:59 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38857 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388209AbeGWW36 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Jul 2018 18:29:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id a4-v6so1505226lff.5
        for <linux-doc@vger.kernel.org>; Mon, 23 Jul 2018 14:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yBVsh6ID+PsAyzotZUt/Xk6nH1yT1g8qCa+S1iZw298=;
        b=IVwy7TG7ftfrIEfjwsj/F+Zs7DcjFkdRg1aF2AsiZa4KZsvpJDZSPdOcTxk03eWroy
         pb/wrVUTfAhSh4txJ2bPUixtqVFctE+Zpi3bW8eUsKd871JtGej67yrPqafOVaczI1cu
         PuGW6rDhsb7B6byBwmfOaBXQXR4hRoCJq+3Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yBVsh6ID+PsAyzotZUt/Xk6nH1yT1g8qCa+S1iZw298=;
        b=jecRAFF9ryXxdEr/TZFzd5x/hKdB7UAWUEl8QtdxQDxKZRReOFdr0JuR9gU7GrgO87
         s94XfAOLzW8aRtMXibHB2Xd6dvcxADWqJYmDqWJSLu2E5polSj5Pnp9lFUNTuMdXCnt5
         CTDk7yy2JSWL9vo51tw1u0rzSTR3NbRJv9WWUvYlIg4nx7GYBdznH6LVbJSUIPEzZ8Iw
         MpBcGyR8HHSk6Te3w+tZ3aDN15EAuZQtU/BaQVc+r3sQfMLnoe02z8ggNmNPaI76pSyY
         5dYyq1KunB9nFQAkjNaKGyxIrsIKlqRnR/Hf8JcVnV90wDK6gNOxg7WidLYlHpz5daLm
         912Q==
X-Gm-Message-State: AOUpUlGrkYu1HsK0hHT7DsQe7/TNAEqM6EL1p6p/bKj1GKBYGnpBZT73
        5vwFfw80/1vqVbeyPmdXEPvrng==
X-Google-Smtp-Source: AAOMgpfalo0LzRLn7LvteCFTVY+3qn6I3fqTjT1wD/o5S+kNzlxo0TTz0hKOggo4XkMjgDgS0wBwow==
X-Received: by 2002:a19:9fc8:: with SMTP id i191-v6mr7992213lfe.79.1532381210944;
        Mon, 23 Jul 2018 14:26:50 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id q4-v6sm1990435ljh.36.2018.07.23.14.26.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Jul 2018 14:26:50 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     davem@davemloft.net, grygorii.strashko@ti.com
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v5 net-next 2/6] net: ethernet: ti: cpdma: fit rated channels in backward order
Date:   Tue, 24 Jul 2018 00:26:30 +0300
Message-Id: <20180723212634.3219-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180723212634.3219-1-ivan.khoronzhuk@linaro.org>
References: <20180723212634.3219-1-ivan.khoronzhuk@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

According to TRM tx rated channels should be in 7..0 order,
so correct it.

Reviewed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
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
