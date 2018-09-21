Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5385C7E0C1
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389497AbeIUNRO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:14 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34468 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389476AbeIUNRN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:13 -0400
Received: by mail-wm1-f65.google.com with SMTP id j25-v6so3424575wmc.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=M9taBHuR1Z2o6Tp/6FUEDxrf8r9YUt6RGonYwMvTT5A=;
        b=oCugQ6gwXvRsc2UIC+RG8MmONx3NUkjg4a/p0bGHG9TO/wdlEITqtJcK9Hf2hTGR8T
         uCo+rUvHzCpgb2AMs3g158285BvcIYIQgMoY3XIN912fAmqyn5oCHFhakNwfnDeK9VRR
         x7LHqwzjGm07f/UKA4Gnm24/3d6iQ1gUfQaM0qKWTnEiLH8FcCXqicnl1o/znySoL2tx
         Z8orQBxVbK9Rr8AlwCRLpR+xB/dziBlIcW2aZgibwBihaO80z0IhmuWmI3bKdbWkPSZU
         qpLbHvyKpCh0PwAp/RGouihpu60UwmgcwIIBZi3zhzAjmbCgzGRM2KQMVONI5VR7TnIR
         gA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=M9taBHuR1Z2o6Tp/6FUEDxrf8r9YUt6RGonYwMvTT5A=;
        b=pzX6KWhAZS2b9NQihyeMkDb1twjM6upJ5PXhEoJxo13Lt6dfsIoyCOUHO4b0ZsFEpB
         jlSwHtzsVQZngq5MjdiuhRezRi5VbWtbC/L2MWmVcfScgEd30HUDtTzJDDVTCAwhM9yt
         SlwjdvIyG53xjJZVIMBPAZdLbxTv1Vq5MyD/P+21+obxrkmzqd52RSxWPdGMHAfS9XIE
         2r0EQLFXSI6fupYvEdDHpgDu3CiN3qX8OPdzwlyxCdQIvdReyqzmhwZSYunhL7NEb886
         iMnIRGNteISa2uw+AH9f5gtY6EAXJOw43xuNLh9OZpsOVJfUXPZYpFN3tfX2FSJtMKzt
         1Q3g==
X-Gm-Message-State: APzg51Ct4nv4t9XUllhRZLJg9/0riqnRxbiJZDH54nYVxhJDuBNs+PDt
        6tOtDj4l5vazXxovmf37XehBXw==
X-Google-Smtp-Source: ANB0VdZcGTpFp6UI558LMYBQU6ptf92xWFRytC5PU27p0YcZqQ+G9hvBW1PA29Jub+7tlVOJKqSXEg==
X-Received: by 2002:a1c:5f82:: with SMTP id t124-v6mr5955726wmb.14.1537514977318;
        Fri, 21 Sep 2018 00:29:37 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:36 -0700 (PDT)
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
Subject: [PATCH v5 08/22] nvmem: sunxi_sid: use devm_nvmem_register()
Date:   Fri, 21 Sep 2018 09:29:07 +0200
Message-Id: <20180921072921.19387-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the resource managed variant of nvmem_register().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/sunxi_sid.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index 4d0b7e72aa2e..1310f8af37f8 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -181,15 +181,13 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	else
 		econfig.reg_read = sunxi_sid_read;
 	econfig.priv = sid;
-	nvmem = nvmem_register(&econfig);
+	nvmem = devm_nvmem_register(dev, &econfig);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
 	randomness = kzalloc(size, GFP_KERNEL);
-	if (!randomness) {
-		ret = -ENOMEM;
-		goto err_unreg_nvmem;
-	}
+	if (!randomness)
+		return -ENOMEM;
 
 	for (i = 0; i < size; i++)
 		econfig.reg_read(sid, i, &randomness[i], 1);
@@ -200,17 +198,6 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, nvmem);
 
 	return 0;
-
-err_unreg_nvmem:
-	nvmem_unregister(nvmem);
-	return ret;
-}
-
-static int sunxi_sid_remove(struct platform_device *pdev)
-{
-	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
-
-	return nvmem_unregister(nvmem);
 }
 
 static const struct sunxi_sid_cfg sun4i_a10_cfg = {
@@ -243,7 +230,6 @@ MODULE_DEVICE_TABLE(of, sunxi_sid_of_match);
 
 static struct platform_driver sunxi_sid_driver = {
 	.probe = sunxi_sid_probe,
-	.remove = sunxi_sid_remove,
 	.driver = {
 		.name = "eeprom-sunxi-sid",
 		.of_match_table = sunxi_sid_of_match,
-- 
2.18.0

