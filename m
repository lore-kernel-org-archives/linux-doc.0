Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9561E7D90F
	for <lwn-linux-doc@archive.lwn.net>; Sun,  6 Oct 2019 05:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbfJFFjt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 6 Oct 2019 01:39:49 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44762 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfJFFjr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Oct 2019 01:39:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id i14so6123106pgt.11
        for <linux-doc@vger.kernel.org>; Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+2cCkacS0/wsdoq+AhwYBV7HAjDIr1+29FN1l6fATg=;
        b=zlR7f3v6X6VUHlmDnEU4rDms8pwdJwwfFhghIIGBJMCzHM+Mj8Y7hUSVAPN0Cb3JOg
         Gm1vfy2oFYliCkbSbasts3bHObYD0QK3/P+QRlH+MLIu6JUPoNPUJX3DII2meRrAWwGr
         YjFpHV0GPS32lYoKZOyL5VPwSibzj5KfsIxaHChxOFonp1xGLXserUJLx0Xkcf6/tvbT
         NMM/+taLAaPaayKF7G4IdbGr711z5zaq516AdwGkTIp4VT57hPZnoPGCcu7WBQv1ZFXG
         qzMnxm4i8bUffPu72P/i3mrXDqUB3N/0jNUtK8frmZxI4vCCOIhbpGhZSJCbx8+SKI3H
         Bwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+2cCkacS0/wsdoq+AhwYBV7HAjDIr1+29FN1l6fATg=;
        b=UGMHUTTfoAx/TTOwcZX0WLOdLBbW1aj/FZaIriULilGRgHNVOE0v1S2WfQLhUdB2E1
         vIlafdIrs8deGrNbuAWkdFKAk4eBiq0zz45QqtQcbjDMXQxWQ2R8V0GN5JuG6/i0NWWR
         YGiITmvwYwucBAU+KEfReWd3xBivzl6yjrauWqMQmc52N3i5bhHmTo11WCX3dtt1CPNS
         wLVIbZiCHefJPidlSCAPsOBatz7Am3h4KRipWvGlnFUFptDWTKV2r9LTqCy2leqgCtPM
         a8ViDXPvE8suzgnnEi7uVRMTPkH5TYPBNrSBC1RmYO+JH5kB/FcK191VjdSfOxdhQPIJ
         LvmQ==
X-Gm-Message-State: APjAAAUVQ3LGsfqfcfwC0dcSaWIAzkexXfyGrQgYmEQL3O/dRFSUOCNH
        D/Cm7rnZARH5NNhloDS0dIWyKg==
X-Google-Smtp-Source: APXvYqxK3lP1b5O5P9pkwJr2DSVKlg5gfYiK+vKbxwea7k+/ZUAKfLagdWTvWlycO53oE5WA3dKsUQ==
X-Received: by 2002:aa7:99da:: with SMTP id v26mr26356523pfi.258.1570340385338;
        Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
Received: from debian-brgl.local (50-255-47-209-static.hfc.comcastbusiness.net. [50.255.47.209])
        by smtp.gmail.com with ESMTPSA id q30sm10019320pja.18.2019.10.05.22.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 22:39:45 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 8/8] gpio: tegra186: use devm_platform_ioremap_resource_byname()
Date:   Sun,  6 Oct 2019 07:39:16 +0200
Message-Id: <20191006053916.8849-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191006053916.8849-1-brgl@bgdev.pl>
References: <20191006053916.8849-1-brgl@bgdev.pl>
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

