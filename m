Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 98B437D90F
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 Oct 2019 08:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388579AbfJVInf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 Oct 2019 04:43:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52539 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388573AbfJVIne (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Oct 2019 04:43:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id r19so16202422wmh.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2019 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jXNXj1e2zC7QQcAuycavLZxRUf6xfVt6rz1LoeDud/w=;
        b=2QCyA3PXiPUyeYFfuokAvpJI+PvkjVpE4UOc0GXfQNWQLPRIJ0QiOrQS0JzYXAd+n3
         Szn91AoIXkU1TUwFXYX0ApUs9c5lC5Y5TGYRD81OltYhvuecZU7li+rSgVDjbcAnQ9wq
         WDqai+Etz77UZ+acGmURkx9RBtZ6h5KdcahbnB2TyEfltA8mCNAFgHETKBRTRNIG9xy8
         GdlzdG76F+YGV7UVe4OPMrUqElEx17hrl8Yv5dIC5ZavP8i2kjUZrBlwH3DSvF/24Dmp
         bHOtuWOpcUGSPaVQ3cpAWkjb87PLohAZ5qbXRVxeE1FpXwe5mOf9bHcgEjua7PJi2nd1
         0Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jXNXj1e2zC7QQcAuycavLZxRUf6xfVt6rz1LoeDud/w=;
        b=V8poO7ZaqsABDbpVXQ9R0kIx+rpW40D/qEYkalV21GZhtUf/cW03K2mIioxGzWiZep
         Irx2PMhySWNDpIe9LjT5tqB/fG10ArtemsUGVq0uDFsn9Nl3Im7ago87dciMr4+2z3Kw
         EpcBHjdNmhVuekdeyjUlfRSpOMA+3voiY7Lknyb+bBXQ9/0zpDBYHCugRuCqGpedsflu
         ppLQkXUkGnO5RIagpWllLzrkuRgXj01pZQ9OxCO6QtnY5qz+U7bi+UmKwD0kln916MUG
         mwyTBebWQAi6985WkqVpUC8U+KUUy3jYroqTJ53wf/MuvPLTuCz6zecTsI19LdZC5jhw
         AwWA==
X-Gm-Message-State: APjAAAV7XardERtkQKqVEuzshLZkx7esQ4v7958UzJXq8oWqneoY1haE
        FEdjkk1I+ZZoV/03UPW4z0Z+Lw==
X-Google-Smtp-Source: APXvYqxrmktides0gIu13c3NuG/KSYgp4SuGdxhZ/o9zHotYMfXm0eCSV6Q2f87+20WxPanjVJ0Q0w==
X-Received: by 2002:a1c:dc83:: with SMTP id t125mr1994370wmg.50.1571733811370;
        Tue, 22 Oct 2019 01:43:31 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id q25sm477231wra.3.2019.10.22.01.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 01:43:30 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [RESEND PATCH v3 8/8] gpio: tegra186: use devm_platform_ioremap_resource_byname()
Date:   Tue, 22 Oct 2019 10:43:18 +0200
Message-Id: <20191022084318.22256-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022084318.22256-1-brgl@bgdev.pl>
References: <20191022084318.22256-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpio-tegra186.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index a9058fda187e..ef40fbe923cf 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -407,7 +407,6 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 	unsigned int i, j, offset;
 	struct gpio_irq_chip *irq;
 	struct tegra_gpio *gpio;
-	struct resource *res;
 	char **names;
 	int err;
 
@@ -417,8 +416,7 @@ static int tegra186_gpio_probe(struct platform_device *pdev)
 
 	gpio->soc = of_device_get_match_data(&pdev->dev);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpio");
-	gpio->base = devm_ioremap_resource(&pdev->dev, res);
+	gpio->base = devm_platform_ioremap_resource_byname(pdev, "gpio");
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
 
-- 
2.23.0

