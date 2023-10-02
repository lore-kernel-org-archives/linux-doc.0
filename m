Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22C3E784A4
	for <linux-doc@archiver.kernel.org>; Mon,  2 Oct 2023 08:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235821AbjJBIMz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 2 Oct 2023 04:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbjJBIMy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Oct 2023 04:12:54 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D2ABF
        for <linux-doc@vger.kernel.org>; Mon,  2 Oct 2023 01:12:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5046bf37ec1so15633457e87.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Oct 2023 01:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696234368; x=1696839168; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EGUYisSFuCVSXERDSMArhOminCdOTb9Vp2WMHo/RH4E=;
        b=Dbt5BXt0HtfZftTC8007MeLuDQT6jbYUD87C3GiVicYIDFZLpbtFRJY7WV9TYsV7+K
         vHhwUxm8plxE+g5CCahu1sFVHCWqvUb4d46KiNe0CSSwE/+28lzlgsq00IN1KcBx9yD+
         eJvDYCEzv+GOR5PzD2FtRCxJLyEO2cXaYCwQ7M0J/qzuKjtwktr0jJ1V+G64A8jflPlg
         Ze0Oeyh3YFNlS6FtlN527VEtxE9ZZHzbkHPgMgs/5PL0fPXf0/mGpjX5N/dYLclpzZ5h
         lwxMuTOxFvjLP1ACEAt9XCRthl8bnXQXRxK5wDqzrQj8O6YMIVVRDzFLNLChyyxJKrhg
         sSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696234368; x=1696839168;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGUYisSFuCVSXERDSMArhOminCdOTb9Vp2WMHo/RH4E=;
        b=FSAzFV/A6E/JgrNsjC+80RcMG5i5TNB4vvObprqpWAeRbySoCkwc1jgVwHWPrtRI+Q
         LFkdKw4O6007e5RxilVtAWPdEGhgC0c273LelBkGVAdINhNGpJQmo9rLDQV4ciPitGgr
         l8YxKg6ILeVvpxzqTLPp6Nj+gPYEJbOftOqdbahTl6mBnb3kFV9cVZC/xpxOSnIu9bML
         ZlXk/wZFEM5H4bQbs4aSfFMCtYOm/j4fBBW7P3sabyPmMKlmWhKei6I5wLjw66m3teT9
         0NGCbAZ4Z0YYhMm1+apYiZVwYCYejXIFkPN8A1HF8vlCiiBazLN1K705OZU/PVXS60pX
         4gWw==
X-Gm-Message-State: AOJu0YyxJ7kqnHnl+6TzSLDHPSeAwjwrgdExpVWN05eXKfQW/aFKPOt6
        Dsm/0z3hBLiHasrNw2AsamBpHGGta74Z3fsftmE=
X-Google-Smtp-Source: AGHT+IFQnoc+9y60VYcF0TtnMOhJ9Clrfj/YiZsM8pd6waG3N+pD7MO20yEf9ouUtM9wNySw+AZBfw==
X-Received: by 2002:a19:c504:0:b0:503:8fa:da21 with SMTP id w4-20020a19c504000000b0050308fada21mr9021707lfe.43.1696234368515;
        Mon, 02 Oct 2023 01:12:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id r7-20020a19ac47000000b004fb7359ab83sm4631451lfc.80.2023.10.02.01.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 01:12:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 02 Oct 2023 10:12:47 +0200
Subject: [PATCH] gpio: Further document optional GPIOLIB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-gpiodoc-v1-1-a8ec8376bbf1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH57GmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDAwMj3fSCzPyU/GTd5DRLE2MDMxPDJEtDJaDqgqLUtMwKsEnRsbW1AEq
 EgStZAAAA
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Optional GPIOLIB as in not depended on or selected by a driver
should NOT use any *_optional() calls, this becomes paradoxical.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/driver-api/gpio/consumer.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/driver-api/gpio/consumer.rst
index de6fc79ad6f0..3e588b9d678c 100644
--- a/Documentation/driver-api/gpio/consumer.rst
+++ b/Documentation/driver-api/gpio/consumer.rst
@@ -29,6 +29,10 @@ warnings. These stubs are used for two use cases:
   will use it under other compile-time configurations. In this case the
   consumer must make sure not to call into these functions, or the user will
   be met with console warnings that may be perceived as intimidating.
+  Combining truly optional GPIOLIB usage with calls to
+  ``[devm_]gpiod_get_optional()`` is a *bad idea*, and will result in weird
+  error messages. Use the ordinary getter functions with optional GPIOLIB:
+  some open coding of error handling should be expected when you do this.
 
 All the functions that work with the descriptor-based GPIO interface are
 prefixed with ``gpiod_``. The ``gpio_`` prefix is used for the legacy

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20231002-gpiodoc-cf9430641b91

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

