Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B8CF97D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:42:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbeINTz1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:27 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50708 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728343AbeINTzZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id s12-v6so2193243wmc.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=S7jbs5pPQ2x3wKmhl12WP8g1zp9JDwpVIt1QT49EXeR5DLKo2hy3aYJPrmap8/bue3
         w9ldGm6jkuCKD47VfAVUwdnRu4tw+QAo/0nYhqtnUfgsutWPjzs5RpF/M8aSSXiXeA9n
         3nY/g4LSs5XIOgYrvpKap6ONXJuzGMs/aGXx42ZBOXU57gMPeEk3UL7dcFw9arEwS6r0
         Uv3AncCtRfQCoKdt8aiWQZbAylcyKZqRNddTD02zT0HoxMsZGVastn6agIKjmVlKsszX
         tRGR5fg6X4gO1KjhVbUr9Yz9nSiWpRnI329lmZBmxE/XoCfaLvZ5wu8hnqABHuDPdi9S
         aN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=Zjl11419n5M0+Ia6soExJnMwxcRanWjQJ/dl1GY+vOPNvogMoKliutX8+vYNqVj5PJ
         8oODiELNLRx+pIm6j96mgiZS2xA18JbUBCP/2RX/DFtfOSi5tAkx6zfKAbOBrl3Or2mi
         JH/2hGj/9nYfh0PGWKTtSObVIfhV0So+hVyX+OLYl0LSCXhxZ0YxZiXehB2kh3PmpwSp
         nzvt+ZYskNojEAbN3CVvcrjV0prStHw7cUCbvs+WyelCKgPMy5FGKLHqal85qKMrof2I
         FOjxCvPoJlz9C49F4uWzsHipRvQqXNmKiwS+tzTUrXCBeEi9StfGXf2jiM/n4Gk9nbMS
         pRPw==
X-Gm-Message-State: APzg51A9h0PhyFJx1wbYOZrboI5jY5GNSu50yE3vAYgkvkRa/elbHsG+
        m2Qmw+pzqi1drFK69rGOwemX6g==
X-Google-Smtp-Source: ANB0VdbiWxIsIrJKeRP4iH0O3gtnMPpYpzuvzvv/gKbNvuLJuiqaPtjl/n/DkJoHAUaZS7WkLor/xg==
X-Received: by 2002:a1c:b709:: with SMTP id h9-v6mr2482752wmf.130.1536936035500;
        Fri, 14 Sep 2018 07:40:35 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 09/22] nvmem: lpc18xx_eeprom: use devm_nvmem_register()
Date:   Fri, 14 Sep 2018 16:39:58 +0200
Message-Id: <20180914144011.27614-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the managed version of nvmem_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/lpc18xx_eeprom.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvmem/lpc18xx_eeprom.c b/drivers/nvmem/lpc18xx_eeprom.c
index a9534a6e8636..b42dbaddb419 100644
--- a/drivers/nvmem/lpc18xx_eeprom.c
+++ b/drivers/nvmem/lpc18xx_eeprom.c
@@ -236,7 +236,7 @@ static int lpc18xx_eeprom_probe(struct platform_device *pdev)
 	lpc18xx_nvmem_config.dev = dev;
 	lpc18xx_nvmem_config.priv = eeprom;
 
-	eeprom->nvmem = nvmem_register(&lpc18xx_nvmem_config);
+	eeprom->nvmem = devm_nvmem_register(dev, &lpc18xx_nvmem_config);
 	if (IS_ERR(eeprom->nvmem)) {
 		ret = PTR_ERR(eeprom->nvmem);
 		goto err_clk;
@@ -257,10 +257,6 @@ static int lpc18xx_eeprom_remove(struct platform_device *pdev)
 	struct lpc18xx_eeprom_dev *eeprom = platform_get_drvdata(pdev);
 	int ret;
 
-	ret = nvmem_unregister(eeprom->nvmem);
-	if (ret < 0)
-		return ret;
-
 	clk_disable_unprepare(eeprom->clk);
 
 	return 0;
-- 
2.18.0

