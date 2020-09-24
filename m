Return-Path: <SRS0=A0dr=DB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F071FC4727D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:39:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B874A2220D
	for <linux-doc@archiver.kernel.org>; Thu, 24 Sep 2020 11:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="YV/LuNUt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgIXLjD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Sep 2020 07:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727536AbgIXLiz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Sep 2020 07:38:55 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67253C0613D5
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so3442572wrn.6
        for <linux-doc@vger.kernel.org>; Thu, 24 Sep 2020 04:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n2JY4y6G63c9t0dZmNJwSFHTZrY4FxV2DVKIqjOIpiI=;
        b=YV/LuNUt0fhJH2foObHfKzWfOfdhPYcWnA1rrHzNF/tpNmRW20GHjlxS9Gwp/xAlTg
         GtejR+sGat1PNHMYNwBwuUwPX7lPEF6VRJcTjcRX1EgW8oogvtvGe+McNgDqL7A7tgvQ
         /GHwQqTkVIEGPGPSh+K8Mct+6HMQYxZXfQIBDyvrYbAyQT/Y29j599IfFQQnV3tCK9z0
         6Y2/Fhua2YmuIJLElVQ2ZRQaawki/ftrrJr7QkjCcylejdP8rbDd5TAfEpk5wRfYrto6
         KKV24Uz+GUsAMMMhf6+xt02kgmPK8GYI6nE58n7h9ZH4VzhgML9PkDwnrRaYYA5SByxW
         lIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n2JY4y6G63c9t0dZmNJwSFHTZrY4FxV2DVKIqjOIpiI=;
        b=PYbR/aY+22Xpi+NbM7kiHwZZz/bHpG+z2wn7OM6U8OlbtRySSVU24vPxLLITGHAF8n
         G7ZE7AUrBmDqhd3f2u067JjjT5KkvcKg4xGZAhkt0h3XG7y4brnpsblmwp3rGaBOHg9z
         +zN6O+UVHXqvSV09lUpXqHo39hgD0wxhPrv8vh3K4bHMINqropoj0Yr4pZXrJ3Iw0VV0
         3XZVdqOC1Dhqlc1Vb79a9WQyIFCHSf2S8W2nNYC3fYZCqz8WUZvT/2VOC7lAAmrQesj6
         vtGL1nUrqbnntulN13rQUCpbVti6NHaA1GHnZtUgc9dTINhpVeDZ6l97iqTYtTuzKo/M
         uX5A==
X-Gm-Message-State: AOAM531JNfArfuM/fEd52gfqfw+YD1FZEPdT7x5NmJeVNH2aVRhrUdHD
        ALMuf/IZiKtfXLtolRw4aE7yiQ==
X-Google-Smtp-Source: ABdhPJxszIv5I6KqPwDcF9d4YVnuB60mUO54pGcBuSosO21bSkVQUUse+B0FadjwGM2oScQAdjMkHQ==
X-Received: by 2002:adf:a29a:: with SMTP id s26mr4657115wra.197.1600947534010;
        Thu, 24 Sep 2020 04:38:54 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id y207sm3390133wmc.17.2020.09.24.04.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 04:38:53 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 5/9] gpio: mockup: use pr_fmt()
Date:   Thu, 24 Sep 2020 13:38:38 +0200
Message-Id: <20200924113842.11670-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200924113842.11670-1-brgl@bgdev.pl>
References: <20200924113842.11670-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We don't need a custom logging helper. Let's use the standard pr_fmt()
macro which allows us to use all pr_*() routines with custom format.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 90a1d6c2775f..c2b2f7d5ff34 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -7,6 +7,8 @@
  * Copyright (C) 2017 Bartosz Golaszewski <brgl@bgdev.pl>
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
 #include <linux/debugfs.h>
 #include <linux/gpio/driver.h>
 #include <linux/interrupt.h>
@@ -30,8 +32,6 @@
 /* Maximum of three properties + the sentinel. */
 #define GPIO_MOCKUP_MAX_PROP	4
 
-#define gpio_mockup_err(...)	pr_err(KBUILD_MODNAME ": " __VA_ARGS__)
-
 /*
  * struct gpio_pin_status - structure describing a GPIO status
  * @dir:       Configures direction of gpio as "in" or "out"
@@ -548,7 +548,7 @@ static int __init gpio_mockup_init(void)
 
 	err = platform_driver_register(&gpio_mockup_driver);
 	if (err) {
-		gpio_mockup_err("error registering platform driver\n");
+		pr_err("error registering platform driver\n");
 		debugfs_remove_recursive(gpio_mockup_dbg_dir);
 		return err;
 	}
@@ -577,7 +577,7 @@ static int __init gpio_mockup_init(void)
 
 		pdev = platform_device_register_full(&pdevinfo);
 		if (IS_ERR(pdev)) {
-			gpio_mockup_err("error registering device");
+			pr_err("error registering device");
 			platform_driver_unregister(&gpio_mockup_driver);
 			gpio_mockup_unregister_pdevs();
 			debugfs_remove_recursive(gpio_mockup_dbg_dir);
-- 
2.26.1

