Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B5FBF7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 14:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbfH2Oig (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 10:38:36 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53707 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbfH2OiL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 10:38:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id 10so3983868wmp.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 07:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qlsO4luZGA7xdDBq4p1qMUU3oONF/sHFPT7E7FVYQM0=;
        b=JVWTA4rK9yfsAnkd3/S2TmsnSXoQp9poW2HhblLsu22DFOsV+yqUFeLk2fRTnYl0lC
         u5SIGOt47o5hojZpQvhjh2PHkLq+5PLZAYvyidjM2zQRRpJBCUNXkcGQMREulGvG1rH/
         V991n+oPSv1cCNWA+XxrEMXwmIRz8gaDu8sAnBmby7W4XcugWL7Bd/gJAmH6vBE9SdB4
         NgU1MKfTZ9+pBL6jFkWH3yvbid1FPef5dqdfQA5zi8JKQ8EhfHehDnv38o5d4mFWN5RB
         02yOrR7VTBYCpmBfgl4fObQfg6UnXq8UTOgNfMl7Lv1diu5S7ygDetAcUUBoLFnOii+P
         mZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlsO4luZGA7xdDBq4p1qMUU3oONF/sHFPT7E7FVYQM0=;
        b=ou4HE8GVGAuOvDIbPQwPKwDR0UK5wt2QvMBhbtSrWTAHjIOBiQvPRm9sGgOibZXZUW
         ZCFdU5C1lu41/nUbLrM7ZNbtuq+/KdztYdvXah+fu5/Nb70xhkOED+j6XOqHen3SP7bJ
         JI6ORKq41E2/BC74m2FaaEq8DErSGm1wDe8X4CnTqKNPH6T0jrJKyRw733P96q6prOC5
         p88tGHwmFq8AZ8hsBwEOYVSF8kHl146wr/F99WJMYAhUgyMaH22sZKdA+3e/lOj6OErs
         X1z5TN62vFU/DCNn4CiOohrtCHaAoEUjzwGuFCHmuniRDGQj++auRCXD8asS5nwbhbKi
         SLsA==
X-Gm-Message-State: APjAAAUcGfdAwiGCN+Maa1K6mrk4OXzNVAaD63TCwigjvqGgrl5/uJye
        IB5OE4Zuz/4CiQCqSfJV734FVQ==
X-Google-Smtp-Source: APXvYqwqhVBmVgrfpSIbnESiSa5F2MHb7ql3NpNi0FVVtwKiErBDLaoIJzfK/GhBfhv8sCTxpxQkaQ==
X-Received: by 2002:a1c:750f:: with SMTP id o15mr12108340wmc.131.1567089489097;
        Thu, 29 Aug 2019 07:38:09 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id g15sm3241925wrp.29.2019.08.29.07.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 07:38:08 -0700 (PDT)
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
Subject: [PATCH 5/9] gpio: em: use devm_platform_ioremap_resource_nocache()
Date:   Thu, 29 Aug 2019 16:37:38 +0200
Message-Id: <20190829143742.24726-6-brgl@bgdev.pl>
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

Use the new devm_platform_ioremap_resource_nocache() helper for memory
range mapping instead of devm_ioremap_nocache() combined with a call to
platform_get_resource().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-em.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index a87951293aaa..0f4f5e11278a 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -269,7 +269,7 @@ static void em_gio_irq_domain_remove(void *data)
 static int em_gio_probe(struct platform_device *pdev)
 {
 	struct em_gio_priv *p;
-	struct resource *io[2], *irq[2];
+	struct resource *irq[2];
 	struct gpio_chip *gpio_chip;
 	struct irq_chip *irq_chip;
 	const char *name = dev_name(&pdev->dev);
@@ -284,25 +284,21 @@ static int em_gio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, p);
 	spin_lock_init(&p->sense_lock);
 
-	io[0] = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	io[1] = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	irq[0] = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
 	irq[1] = platform_get_resource(pdev, IORESOURCE_IRQ, 1);
 
-	if (!io[0] || !io[1] || !irq[0] || !irq[1]) {
-		dev_err(&pdev->dev, "missing IRQ or IOMEM\n");
+	if (!irq[0] || !irq[1]) {
+		dev_err(&pdev->dev, "missing IRQ resources\n");
 		return -EINVAL;
 	}
 
-	p->base0 = devm_ioremap_nocache(&pdev->dev, io[0]->start,
-					resource_size(io[0]));
-	if (!p->base0)
-		return -ENOMEM;
+	p->base0 = devm_platform_ioremap_resource_nocache(pdev, 0);
+	if (IS_ERR(p->base0))
+		return PTR_ERR(p->base0);
 
-	p->base1 = devm_ioremap_nocache(&pdev->dev, io[1]->start,
-				   resource_size(io[1]));
-	if (!p->base1)
-		return -ENOMEM;
+	p->base1 = devm_platform_ioremap_resource_nocache(pdev, 1);
+	if (IS_ERR(p->base1))
+		return PTR_ERR(p->base1);
 
 	if (of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios)) {
 		dev_err(&pdev->dev, "Missing ngpios OF property\n");
-- 
2.21.0

