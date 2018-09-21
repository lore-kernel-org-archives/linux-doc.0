Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 891727D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389513AbeIUNRP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:15 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40929 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389458AbeIUNRP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:15 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207-v6so2019684wme.5
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=i231+IxAyqeewuI6FRJLxRAlLAAwSFCHtXsWp5PlllpgdCAX9yYhJOYRtYLwrw3Zbm
         i5S3lQF6GbryZORNYmAMDXk/2rdksU1fxf/YEEcC4/j7TH5vd1a+PmF6jGDFDQBZ+cAs
         xcUZKD2FUBr8lzTBPV/4oEDgS34u8LkHCYqNIAtZWsKQNA2xpB+3WHWxb9p/DoCw7fKR
         4CGbbhD+qvNfpBIZYPZqKBIvCp+BkL9iTTpGTOjnvZLuxgRENfQX0IxBBhgN6i1W6yiI
         uHAouoz3llf4otVEbJHgUZRiONiJgzP+1o41X5q7ZDnjXNWjfPDnxKvGoTYLQtxfHMno
         MrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1PFkzde7HIbembuPSuldz/+wF0MJkUfGiNxQy31YmBk=;
        b=DU8+rkgv6nEoOS6T2AXZFmYKjQ1AgvodaILrJuqghK7RCtfB+KXIzevTT1AcmKYlVf
         Yhyvko/XwnrpLPYdidtjhr45zNcB8JrHhOlctltojp05jeIl/6Gkv1bqo2/9RFOLs05+
         +xCrKXhyXS9mQ7S1PwW4OuG4lY+EyrC+4FJbs79zsBugDiPUmcl5ql2F/fWzxminmakD
         bHPvu63yE71pfXPARUxs6SAohMKBHDP7Xm/j9DAyYdwOZrcH4WRDI8+LJoZfTzZlykKp
         pTWjAvcC9zwGbM4ZgS3+7EKloBGIN1CYSFe5nduTPzNdGWRQqL2cGuZowgNXwqjMMumP
         7flQ==
X-Gm-Message-State: APzg51CreK91Zy0ag02w3tj6uirT2mIBiFC2dFHsGYD6wpZ8ipGoWfye
        AoZxm1PfJZg+MLZFzD5E0wTceA==
X-Google-Smtp-Source: ANB0VdaaLH/AaEF1wpclJhrCO36R7z9db1y8MZkKgRfgocLQ07rqwvgauUQ8+ijJCPn1w0aFzQyG5A==
X-Received: by 2002:a1c:6386:: with SMTP id x128-v6mr5762292wmb.104.1537514978651;
        Fri, 21 Sep 2018 00:29:38 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:38 -0700 (PDT)
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
Subject: [PATCH v5 09/22] nvmem: lpc18xx_eeprom: use devm_nvmem_register()
Date:   Fri, 21 Sep 2018 09:29:08 +0200
Message-Id: <20180921072921.19387-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
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

