Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C7557D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfH2OiP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:38:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51034 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbfH2OiP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so4016529wml.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wvm5jhfZdBAjiVI0fMQa3wyfT8pVsOoRMdM2UQ5EVAc=;
        b=Gn5aTJaW0lhbDQWyYFqDBkrdNnFy2pGrPIg9uFcSU0QDrKLANwjVThGZPuAKLE95y6
         PXgyzsxKFqZzbh35PUrCyLRVoJ6/TM5gO3zvjyXoIGe2F+a44h45x4ntyUH2R9K/8cer
         BeLiukfqMO5AwUsbhhH+vawbOADQgyod20IzadiyA9ufUf4775gkItruHuFcBiZ+BFVO
         OfDktx/jfQqMWmlIB0pvioN4mmJ2KnMbs3Z4fCMXu7cQr+0MgZ6j1tz2YEHxpUare8iy
         RpQ8bZzMq7EY7hZuuUVYJ0ULMsjbZIwfeG16WX1G2RrY2rGVkY5CnetDJwPeb1Lms6T5
         VNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wvm5jhfZdBAjiVI0fMQa3wyfT8pVsOoRMdM2UQ5EVAc=;
        b=H70hkWmcjuUZ0XAxKsNEjLqsdxlmBCJloMrrL9H6VaSP5NZKoE1XEzq9e1TUd0E7AR
         /DPmHEFy0axpiBZn0DDSq96DBXsd0M4EGtVxAzd/WyQqac2hMdutS/FP0bHm6QE2wblz
         ZLtwr2ddsHDDltolBHm66MuxBeTAE+l2/cT8aA8Q6cjTFmv9CCSfJtaCYi59lrcuGBJl
         Ame1JbkM0YcufDzrkFne+CpPttRVTtNvsPXzBs+e8yWhKhVT+v2hjYei5q1vyNw6sJnr
         0cAGUdVO1Kf8+dzBWk16wgisWfHVv/slHl9g0N+9ddSLbjA+sQREJ9vuY1blMftLwvZa
         mz/A==
X-Gm-Message-State: APjAAAX57ZPBE30wDdlto4YJ+w3v3LpqWbtB/yeDEtW3O76pXKHMBTu5
        7L0xg1i1m+2oMupiqCMJGxtNig==
X-Google-Smtp-Source: APXvYqyIGe38MXQx8iatCV54dE9UCR5qWcasMJ6961l0x1sY1UGN6+ZmbFEIsoWLeRqF7iEbp26wzA==
X-Received: by 2002:a7b:cbce:: with SMTP id n14mr11150614wmi.47.1567089493399;
        Thu, 29 Aug 2019 07:38:13 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:12 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Alban Bedel <albeu@free.fr>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 9/9] misc: sram: use devm_platform_ioremap_resource_wc()
Date:   Thu, 29 Aug 2019 16:37:42 +0200
Message-Id: <20190829143742.24726-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829143742.24726-1-brgl@bgdev.pl>
References: <20190829143742.24726-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the new devm_platform_ioremap_resource_wc() helper instead of
devm_ioremap_wc() combinded with a call to platform_get_resource().
Also use devm_platform_ioremap_resource() where applicable.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/sram.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/misc/sram.c b/drivers/misc/sram.c
index f30448bf3a63..6c1a23cb3e8c 100644
--- a/drivers/misc/sram.c
+++ b/drivers/misc/sram.c
@@ -340,8 +340,6 @@ static const struct of_device_id sram_dt_ids[] = {
 static int sram_probe(struct platform_device *pdev)
 {
 	struct sram_dev *sram;
-	struct resource *res;
-	size_t size;
 	int ret;
 	int (*init_func)(void);
 
@@ -351,25 +349,14 @@ static int sram_probe(struct platform_device *pdev)
 
 	sram->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(sram->dev, "found no memory resource\n");
-		return -EINVAL;
-	}
-
-	size = resource_size(res);
-
-	if (!devm_request_mem_region(sram->dev, res->start, size, pdev->name)) {
-		dev_err(sram->dev, "could not request region for resource\n");
-		return -EBUSY;
-	}
-
 	if (of_property_read_bool(pdev->dev.of_node, "no-memory-wc"))
-		sram->virt_base = devm_ioremap(sram->dev, res->start, size);
+		sram->virt_base = devm_platform_ioremap_resource(pdev, 0);
 	else
-		sram->virt_base = devm_ioremap_wc(sram->dev, res->start, size);
-	if (!sram->virt_base)
-		return -ENOMEM;
+		sram->virt_base = devm_platform_ioremap_resource_wc(pdev, 0);
+	if (IS_ERR(sram->virt_base)) {
+		dev_err(&pdev->dev, "could not map SRAM registers\n");
+		return PTR_ERR(sram->virt_base);
+	}
 
 	sram->pool = devm_gen_pool_create(sram->dev, ilog2(SRAM_GRANULARITY),
 					  NUMA_NO_NODE, NULL);
@@ -382,7 +369,8 @@ static int sram_probe(struct platform_device *pdev)
 	else
 		clk_prepare_enable(sram->clk);
 
-	ret = sram_reserve_regions(sram, res);
+	ret = sram_reserve_regions(sram,
+			platform_get_resource(pdev, IORESOURCE_MEM, 0));
 	if (ret)
 		goto err_disable_clk;
 
-- 
2.21.0

