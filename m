Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12DED7E3DF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 22:29:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388204AbeHGAk6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 20:40:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:45369 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387889AbeHGAk5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 20:40:57 -0400
Received: by mail-lf1-f68.google.com with SMTP id j143-v6so10188048lfj.12;
        Mon, 06 Aug 2018 15:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UZjTLX7QnQr/t1695VcV1KTsYiUTLZK2WnrZPxW0nQ0=;
        b=f4TupVyGulWb3GeTA5wNIXDgA28jrcBpoND1Ko4n43chjDMerygFxt+GgpBmhCWCEh
         K/A8/d6es6eXkmxlKoHfZjx30fvveGPjnB182ekcFQetalYPOaF4T9hu0nUk85K7igRD
         pFaf34gyE0Zk2i1ShroXnPSN5wopTGpVpI1c/n9zik+LN0rqjfs7uR3Gro5ITP9UccJk
         gxvw9AxP+3OeRFlgDcpoSvLkaHLUAWI/ABqKHR/WspP52lLK5uBZn4q3a4MufOHAaCYx
         pZWK2+kUNIZ1qoXXJfb7/ohkBoX7If/OVQRjuGQrfmXfv5c61AbP5/BLb6/0Yc4wYlwU
         kEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UZjTLX7QnQr/t1695VcV1KTsYiUTLZK2WnrZPxW0nQ0=;
        b=Jqvi0lJmOaw9wwXyL5s6YI8thPaE609XO1MbjkhBSqG3Z3bI50y4vXx0bBgZUiLVmt
         T2LDfqv54dop88CTQtQuNtAjGEi59CA4Iyr7hbtgl0Gr0TXz55b56+dozqHvgSaeKjqK
         DG+1GNJeecByF0mlSRvC3YiMEBdJJDLCAyemMp86oJqDAWv+tCDavpPRoXyNyyKsCQeE
         qQn1bLHmqMM6v6pwBagIlXsuO3omc9SdM+7v9izBYtLTGIuTRZSgJ8KN4kXAYQUZhkuo
         +eLVRjI2FAsLiyv3f9dkZkrwQomW1h4lR4PbT/403TWxDW1BpMeuR42VPtQzQ+Spe/aF
         7Cyw==
X-Gm-Message-State: AOUpUlH8ulOhm8PMKoyMAmlFCnh8XYZHTz5aauMgUGZgSuVZ0GosOYj6
        438obxVcwm5+iqAFeNt7bgQ=
X-Google-Smtp-Source: AAOMgpdOVignCZnEeCBAFO3oZT9ssWE7eymuQTN++pgaa4W5/B4vcnak1+wEbM2FXkRJkCqWvtg9Vw==
X-Received: by 2002:a19:5a56:: with SMTP id o83-v6mr11909803lfb.50.1533594584634;
        Mon, 06 Aug 2018 15:29:44 -0700 (PDT)
Received: from z50.lan (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id o4-v6sm2438561ljc.67.2018.08.06.15.29.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Aug 2018 15:29:44 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [RFC PATCH v2 12/12] gpiolib: Add fast processing path to bitmap API functions
Date:   Tue,  7 Aug 2018 00:29:18 +0200
Message-Id: <20180806222918.12644-13-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20180806222918.12644-1-jmkrzyszt@gmail.com>
References: <20180718235710.18242-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-1-jmkrzyszt@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Certain GPIO descriptor arrays returned by gpio_get_array() may contain
information on a single GPIO chip driving array member pins in hardware
order.  In such cases, bitmaps of values can be passed directly to the
chip callback functions without wasting time on iterations.

Add respective code to gpiod_get/set_array_bitmap_complex() functions.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 Documentation/driver-api/gpio/consumer.rst |  6 ++++++
 drivers/gpio/gpiolib.c                     | 14 ++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index bec4eab3b87c..b82f134dc352 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -409,6 +409,12 @@ descriptor arrays, only those of type struct gpio_descs returned by
 gpiod_get_array() and its variants.  Supported array size is limited to the size
 of the bitmap, i.e., sizeof(unsigned long).
 
+If the .chip member of the array structure, filled in by gpiod_get_array() in
+certain circumstances, contains a valid GPIO chip descriptor, the raw variants
+of the functions can take fast processing paths, passing bitmap arguments
+directly to the chip callback functions.  That allows for utilization of GPIO
+banks as data I/O ports without much loss of performance.
+
 
 GPIOs mapped to IRQs
 --------------------
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5b541364dee0..bf95f2964bc5 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2846,6 +2846,12 @@ int gpiod_get_array_bitmap_complex(bool raw, bool can_sleep,
 	if (array->ndescs > sizeof(*bits))
 		return -EINVAL;
 
+	if (raw && !IS_ERR_OR_NULL(array->chip)) {
+		unsigned long mask = (1ULL << array->ndescs) - 1;
+
+		return gpio_chip_get_multiple(array->chip, &mask, bits);
+	}
+
 	i = gpiod_get_array_value_complex(raw, can_sleep, array->ndescs,
 					  array->desc, value_array);
 	if (i)
@@ -3156,6 +3162,14 @@ int gpiod_set_array_bitmap_complex(bool raw, bool can_sleep,
 	if (array->ndescs > sizeof(*bits))
 		return -EINVAL;
 
+	if (raw && !IS_ERR_OR_NULL(array->chip)) {
+		unsigned long mask = (1ULL << array->ndescs) - 1;
+
+		gpio_chip_set_multiple(array->chip, &mask, bits);
+
+		return 0;
+	}
+
 	for (i = 0; i < array->ndescs; i++)
 		value_array[i] = test_bit(i, bits);
 
-- 
2.16.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
