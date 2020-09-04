Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD74C43461
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F53E2074D
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ZEDEcIxO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgIDPuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 11:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgIDPqr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:46:47 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9CBC061245
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id z4so7213494wrr.4
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=21luy6X7MDo33702JiSjX8+ptN78cMUdDvCAknmXlNw=;
        b=ZEDEcIxOclm9rkbYpejxrNIf2E5BaNtltbEx7kL2MmvTjXkaO6NcxogFQaPWUTVU90
         RQCLCwd/0LeBvBHib8CSLZ6t0N3QMb9pIjEGew+/3FUx7nmAv9U1jw1QGsifrgj7RZz/
         BvxCb7fT6vR8yVfjeZ1cK4bgxVds+FqqAq0SqwC1YeYbevfwSlBCI23wJCoMB61VVWI+
         OMMY4pKIa6QlNrAheHEoiU+ozpVA1RJj07hzk4oeA+31wZzEmN0aoQgAip9RFc0XjC7l
         wZbRPvzHN5/YFjUV8Y9Q9UX0mrRaDx5MfQwrYwVOKbAIytZjQyAsHR3o/g0JEjUNHJNG
         x79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=21luy6X7MDo33702JiSjX8+ptN78cMUdDvCAknmXlNw=;
        b=EXjaSXpr42NtCeaCEhHM+MA/MgTgS1ffQg4h2YyoHeHSsgLbesOVKkUxMWx5SrRQ4H
         XBiEbbZqJ6C8hH8hYM8XkTZpPTvOTyx1b1n58OIVOmOfct/cOZHmraj/a/LA4MsEU5qU
         LPPL4Nk80VQ+gQyuW7ehzoQ/wstC8LrwykB2rwpyOTp3C/0Ikjx1dQV9IZwa4jL5qf9s
         HPQOVjTGEY9w5dPCP3+s3rXycmQUUCjjKkottWbMGMy25pOtB/CvEwpXgZea0O1T3q2/
         TWbPW5DZayfL8qR9jninyP20Xqce1ketNOzB2fH3WTf1x+9JsyHo+Lbu3smXLrrovjHa
         PQYg==
X-Gm-Message-State: AOAM532OpjTo5gonihIN52kcqptP1ktr5t3r0bBoVjCGepIRVYFzEdBb
        XDPnPFfiIeTuqUMAf8r9E3iDnQ==
X-Google-Smtp-Source: ABdhPJwCyK6EASQNgZuAXwqjHkJs+DAdmBTT0auSRhh6ETOzmG9L8g4BM5hkjVixy9irlGFHNaRE7A==
X-Received: by 2002:adf:e8ce:: with SMTP id k14mr8773344wrn.394.1599234399347;
        Fri, 04 Sep 2020 08:46:39 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:38 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 07/23] gpio: mockup: drop unneeded includes
Date:   Fri,  4 Sep 2020 17:45:31 +0200
Message-Id: <20200904154547.3836-8-brgl@bgdev.pl>
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

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index bc345185db26..349782cdb4d7 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -8,9 +8,7 @@
  */
 
 #include <linux/debugfs.h>
-#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irq_sim.h>
-- 
2.26.1

