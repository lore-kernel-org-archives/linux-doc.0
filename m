Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A19C43461
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:49:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D1E32074D
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="uPvmch86"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbgIDPtx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 11:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbgIDPqx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:46:53 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0DDC0611E0
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:43 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l9so6513065wme.3
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j/oJst/31Ve7sN2p8SCKacvVyyAcOuKLg7HZEv9T1Bg=;
        b=uPvmch86FehCHUzRin+H5CXUohTvqZcGHApZczW8eq9lu/MJzFf9k2ReFbXCNCKyKp
         QAnbVmcbSwdGJkgvs9p8KOl0pQFjMwybe/CpY7Hh8XOol4HEQj390odpGv/D8NzqLzMQ
         AvpKvNqhVW5l5nuN1vqDrYMGBJRpIjjleROe9WsZdIidLQSeFxFz28InaQK6FDuGaHh5
         abODV06AGHy0/63WGITnhu2uh99JLKd0WdxfAiAeP2mKsEWCMrGiumxY/dt5qdEeKyOV
         cuO2DAPfpRJIBrUcEDpHpmxvfKAlccqkdA/9Vos4EFtb0JOtN0HxFexJBPe9MvVF5WWw
         hEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/oJst/31Ve7sN2p8SCKacvVyyAcOuKLg7HZEv9T1Bg=;
        b=afAHY6h+JZ35Np7pFNPYllm3Iiul9+C01+k2OkXIvavcPx8sLNeiRO0pVcsHK16CFe
         tRDJQgn+sTFPYSrGcBUlE3AGxiUn8tAx3xFl2WFM84n8FG74l0wWaOdFmJKHqY2o7LZJ
         JK1tXqSuuNzw5yV2NaI5ckbKJGRgU8hjMqusvE+UqPROGaBsYhBf7Zglojib/6/0YGKB
         rDBTBwly6ccS4hGplJB/hkB144XHyATWP74I/DWxsqBfuhuoe4VxYseLSui0UtR+Vawy
         0OBnR+NMUThDHg+EIU+RaLAyW/q/0Yxe7Ur1SV5x+Sla5M5zcv2jUCCqeWgp5oFkKoBl
         mPRQ==
X-Gm-Message-State: AOAM531TMQ47OM/tzMYPJL6Y5ufIE7jJHy/cDnlKxOeFtpf5FPZfDU+z
        1S2g6Bqqc+T/2a/VS0UPcM9D44/jI0eK4A==
X-Google-Smtp-Source: ABdhPJxeZd3+cr0IB9roZ5GLjIlStXJyf7rbMppNX/92diAh72W08u+6KqmM8T0vs4cn4upk6ZXE0Q==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr7896110wmh.115.1599234402232;
        Fri, 04 Sep 2020 08:46:42 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:41 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 09/23] gpio: mockup: use KBUILD_MODNAME
Date:   Fri,  4 Sep 2020 17:45:33 +0200
Message-Id: <20200904154547.3836-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200904154547.3836-1-brgl@bgdev.pl>
References: <20200904154547.3836-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Drop the definition for the driver name. Let's use KBUILD_MODNAME for
the log format and use the "gpio-mockup" value directly in the only
place where it's relevant: in the name of the device.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 73cd51459c2a..78c97f7b6893 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -22,9 +22,8 @@
 #include "gpiolib.h"
 
 #undef pr_fmt
-#define pr_fmt(fmt)		GPIO_MOCKUP_NAME ": " fmt
+#define pr_fmt(fmt)		KBUILD_MODNAME ": " fmt
 
-#define GPIO_MOCKUP_NAME	"gpio-mockup"
 #define GPIO_MOCKUP_MAX_GC	10
 /*
  * We're storing two values per chip: the GPIO base and the number
@@ -501,7 +500,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 
 static struct platform_driver gpio_mockup_driver = {
 	.driver = {
-		.name = GPIO_MOCKUP_NAME,
+		.name = "gpio-mockup",
 	},
 	.probe = gpio_mockup_probe,
 };
@@ -572,7 +571,7 @@ static int __init gpio_mockup_init(void)
 			properties[prop++] = PROPERTY_ENTRY_BOOL(
 						"named-gpio-lines");
 
-		pdevinfo.name = GPIO_MOCKUP_NAME;
+		pdevinfo.name = "gpio-mockup";
 		pdevinfo.id = i;
 		pdevinfo.properties = properties;
 
-- 
2.26.1

