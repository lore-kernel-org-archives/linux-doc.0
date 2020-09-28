Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9622DC47420
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5496121775
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="M3VrScx8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgI1KmK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgI1KmJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:42:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42292C0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so603797wmi.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yQHFpzhsra7eF21NOHukB6Qo7UOtUhx3yAmCZtWq61g=;
        b=M3VrScx83cIf9TdOKfJkxcCgoTVUURV9fTusoQNJllZ20fwAhw3fNXK4nS/dMeO5Kt
         UChDVYnj1tvBAYpAby1GSsojzjdMQPXJFfLuxQvlvMgHrPm+OsNHB0Lm3aIdeLEdLohG
         5LEZxvesQ3CgzaXepH2auWfMCGsI/YT0Dz3RewkJ6CiWBiXSl6pm5hyjj4XpGewnZw9n
         mkh+RLTVuhDswiB5ZI+UbeCxV7Rx7h/5SogblQf93ngEg1g7mek7jY5HqZQtS9gJVLqk
         eo6K4TosxmroAKtjKWfEQVlnwvA6KFnfgOevU3RLvKvdrOvDdMIXJ6cuLUY6Oxdyc1vj
         wyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yQHFpzhsra7eF21NOHukB6Qo7UOtUhx3yAmCZtWq61g=;
        b=rZcqTYRIED0QruvRL0jCXRZhmN2FT9l+w2u3MzZPZegrQtxOG5f4XInEETJ8p+s0ww
         JgyuNIO9EdnH448qbGw0AdJFe5KbMkGPHrYpskBcGCKZoO0X7j36nAeSPaEqusw8UcVo
         d1bTcmrbfxlcGc4d5g6Sk2SgDBplZq0iYDFECFE5YPB0eV3F0kw9EEg37ShtpMnmGHe+
         I/2tkc8MLrqWFXa9VcHPkjKioUBES+rWBmHdfU6gitD3+AtfIY/U8AwExYwnbFGcRQWk
         ht6sopTTd5TarloJho+mkLvK4OIifinFtLdEEXuSTEZI92wWsaA40U6C+OssLre0EvKM
         KuVQ==
X-Gm-Message-State: AOAM532tbpt43YWIVRIoZcnimRxWUcBITcM715F1XgU5+tPARoJCmtP9
        QnQmnWs7CMyrn4QiVvG7i/BwTA==
X-Google-Smtp-Source: ABdhPJxVepUhAI8N3bF13gdj8iuq8j8s9/oL2DEa7gPgNU4kvF9NdFEPiFQ1qOG770JvQDJgdWh6mQ==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr930864wmj.19.1601289727965;
        Mon, 28 Sep 2020 03:42:07 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:07 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 7/9] gpio: mockup: pass the chip label as device property
Date:   Mon, 28 Sep 2020 12:41:53 +0200
Message-Id: <20200928104155.7385-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While we do check the "chip-name" property in probe(), we never actually
use it. Let's pass the chip label to the driver using device properties
as we'll want to allow users to define their own once dynamically
created chips are supported.

The property is renamed to "chip-label" to not cause any confusion with
the actual chip name which is of the form: "gpiochipX".

If the "chip-label" property is missing, let's do what most devices in
drivers/gpio/ do and use dev_name().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index de778b52f355..5b2686f9e07d 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -429,21 +429,14 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	if (rv)
 		return rv;
 
-	rv = device_property_read_string(dev, "chip-name", &name);
+	rv = device_property_read_string(dev, "chip-label", &name);
 	if (rv)
-		name = NULL;
+		name = dev_name(dev);
 
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
-	if (!name) {
-		name = devm_kasprintf(dev, GFP_KERNEL,
-				      "%s-%c", pdev->name, pdev->id + 'A');
-		if (!name)
-			return -ENOMEM;
-	}
-
 	mutex_init(&chip->lock);
 
 	gc = &chip->gc;
@@ -523,6 +516,7 @@ static int __init gpio_mockup_init(void)
 	int i, prop, num_chips, err = 0, base;
 	struct platform_device_info pdevinfo;
 	struct platform_device *pdev;
+	char chip_label[32];
 	u16 ngpio;
 
 	if ((gpio_mockup_num_ranges < 2) ||
@@ -556,6 +550,11 @@ static int __init gpio_mockup_init(void)
 		memset(&pdevinfo, 0, sizeof(pdevinfo));
 		prop = 0;
 
+		snprintf(chip_label, sizeof(chip_label),
+			 "gpio-mockup-%c", i + 'A');
+		properties[prop++] = PROPERTY_ENTRY_STRING("chip-label",
+							   chip_label);
+
 		base = gpio_mockup_range_base(i);
 		if (base >= 0)
 			properties[prop++] = PROPERTY_ENTRY_U32("gpio-base",
-- 
2.26.1

