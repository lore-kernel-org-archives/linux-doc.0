Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F22C47425
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 10:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AD562158C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 10:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="2LoGJ8ys"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgI2KKi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728112AbgI2KKY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 06:10:24 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44B7C0613D2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:23 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z1so4721337wrt.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WG5zf7DvZQOhoUaWAWxCAUvO9e/SXwl5eObguJAORVY=;
        b=2LoGJ8yszSO9fl3T0PyqgH5dQ/VJ+zpmH4mLhSSOEMQK5TeNrtVPQRzwzwbxBkLW7J
         HJUWKvpWCJj9zS6PkVb+20w6Q4GjxJeofFRLj9JTpJ+6j4p7Rq+f2rJ3iUuvd2LKevCN
         4Wa4fZW3rgK2yChkdxN9KQTiKP6V5TMMXPRlsriVCdf/8QmKVv+TmrOlce/fhyHUw8Ez
         2RhHJGWzIQ9l+UL03A1/fgLBP3h/NrXbxlFehKRAXxqjZzxJWNIARUNNX8qPorlSgFRN
         3NPNv2oAxGkhBoOsoQJLpDLfYp6tLL3qmvt4dfQqd46c4XNfQImFOj2mps2kgUA5wT8K
         z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WG5zf7DvZQOhoUaWAWxCAUvO9e/SXwl5eObguJAORVY=;
        b=k2jgNEOc6QXVKfTdaYjinigNkM2LawHzxIQEQHum0XSbZqsRgjep4aLQwx/+ymzRhO
         ddrNdtk21nmEe7r4UYC/TBaqIIConvMCs6/2W7JqmHxQep3ZbfgIYHHAjvwFsa+nCNJ8
         jep+GB8VZZcnFXo82qrzIfEuwWF2JmIgxZI7fuGU1o9319h9r/Jm8j5iJ6IrMClJTtjd
         jnCokN4sc/N8HU+MZfFZ1Nsx8O54II9ftAcUEN8cgGFN90XpNVKgRX4LNQfoSzP6Mhw8
         nXvaNkwh9KimV6Qf2f+5Ys5jHPFpH3tvNOv/e7W0Q9xXpOXsayN9LRil2r0vkzOTYUPc
         YlLg==
X-Gm-Message-State: AOAM530Zvqp9yLJccVAcElgsa+Mud1InNSeEii6mca0hMIlEjNx8ry0e
        lNwNyJN4k4hs8uDHtY/CrSrnkA==
X-Google-Smtp-Source: ABdhPJw8O3X676rw4vniTLN5qe+I8t/BMSRgbYRyw4A3jOc7H2ziiWxoZPkP827QAfX/q+YnEUdbhQ==
X-Received: by 2002:a5d:554c:: with SMTP id g12mr3411577wrw.294.1601374222677;
        Tue, 29 Sep 2020 03:10:22 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:22 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 07/10] gpio: mockup: increase the number of supported device properties
Date:   Tue, 29 Sep 2020 12:10:01 +0200
Message-Id: <20200929101004.20288-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The driver actually supports 4 properties but we only ever set up up to
three. This will change however in upcoming patches so increase the
number of really (as in: the number the property array can hold)
supported properties to 4.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index de778b52f355..856ba5da1e8c 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -29,8 +29,8 @@
  * of GPIO lines.
  */
 #define GPIO_MOCKUP_MAX_RANGES	(GPIO_MOCKUP_MAX_GC * 2)
-/* Maximum of three properties + the sentinel. */
-#define GPIO_MOCKUP_MAX_PROP	4
+/* Maximum of four properties + the sentinel. */
+#define GPIO_MOCKUP_MAX_PROP	5
 
 /*
  * struct gpio_pin_status - structure describing a GPIO status
-- 
2.26.1

