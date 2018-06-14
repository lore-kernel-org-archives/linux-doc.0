Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 246FA7DF86
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 07:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754760AbeFNHkQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 03:40:16 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35062 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754647AbeFNHhN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jun 2018 03:37:13 -0400
Received: by mail-lf0-f66.google.com with SMTP id i15-v6so7846751lfc.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Jun 2018 00:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=lDdZ+12ye4H9JsUdu5+2AMHnLkdkF7ofjKyzEJiIn2U=;
        b=STRoQbpGiVgjPT1GFPT8LaMG0ruDuuCw0VBV4Coh39xI3GKkKIsAeS/kUUpGT/HuVA
         qiTuldAkOf0PFPN52qaTFUmTjAEWZGr/Ri2Jias/VMMQLUuyKihkHzRpfZb+PsAzekkU
         FaGuJ82/9+e6qwBqRzqtFyxkr06+VpFlnNudU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=lDdZ+12ye4H9JsUdu5+2AMHnLkdkF7ofjKyzEJiIn2U=;
        b=dEGArhbOt/w84lW85t4GdlA0Pm5j/4m1TMHj90QOfxuHBhDShcteFKH4bW/+mxV0uO
         935rQn3+H42jjjsaGadq5d7AetLA2CfhdmRqfctEjw0xLs03rHDVVFWptqpaiY7wEODX
         D+eVpaHI003TrBxe+mVn1rM7DLHk2kvr0YYz7sM1uh/o+3g8KbxvMagrUeFA1E2IYRKC
         6vspOcJ85hoymxekKQybtT1MGorACWwsCbXbq0qGJbXxjOx2REfrnpfgN47NouTlmjf0
         YSm8huyYVxN6jyzdQXoCg2B54gK06Wr9TCN4Ueh/3/+B7RtPRS+YdLtIz0LxOg7UIYw7
         aoJQ==
X-Gm-Message-State: APt69E3fE62Yv1XVLkiHuoHr3p4xVE5fh3Ho8gidEqCWINP4LzGer87c
        twyCrbcjiEAxZ+IdfuR6/S7CBw==
X-Google-Smtp-Source: ADUXVKIEiHPTNcfVmT7aS/Ei2SEhqsfQqCMPC7w3kQHnRwmfXFajfw9LKHP5xmSvMW231Cq4ZWQlxA==
X-Received: by 2002:a2e:4942:: with SMTP id b2-v6mr948351ljd.138.1528961831590;
        Thu, 14 Jun 2018 00:37:11 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id a195-v6sm957597lfe.44.2018.06.14.00.37.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 00:37:10 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     corbet@lwn.net, akpm@linux-foundation.org, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, vinicius.gomes@intel.com,
        henrik@austad.us, jesus.sanchez-palencia@intel.com,
        ilias.apalodimas@linaro.org, p-varis@ti.com, spatton@ti.com,
        francois.ozog@linaro.org, yogeshs@ti.com, nsekhar@ti.com,
        andrew@lunn.ch, Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v2 net-next 2/6] net: ethernet: ti: cpdma: fit rated channels in backward order
Date:   Thu, 14 Jun 2018 10:36:46 +0300
Message-Id: <20180614073650.29659-3-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
References: <20180614073650.29659-1-ivan.khoronzhuk@linaro.org>
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
