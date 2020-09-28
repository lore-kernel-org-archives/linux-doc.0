Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3A4C47420
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB3452080A
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="ScYcOk2g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgI1Kml (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgI1KmE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:42:04 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13314C0613D0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:04 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so603568wmi.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=ScYcOk2gYrPUF+aDftw5XnbeNkA0ruf2onhIh0ABlCuUjDkJDerZAn7q1QXNQ1RNrW
         B48J7+lPhjb4yeERjOnSs3arx8Mrld4olbl9cBlF+e7u8ecfH6qBSVCue/4dr6a6ddQE
         cvWP19IelW8Gwd6omyP5cGFLQ1g7P8VSpQJanly6F+bAbfuto0XFUSVFjX8zffy5XwaQ
         5ent6yYRAXC+tM/uhwc+/7Ya5fSsB4HcC2s5SOr1hiirYTzh+y6CXBgoZDyAkNLdpoP2
         N/xUrI8qDX3nd2aJ9j6OWgBuf1753b7p7OJRE6tLuwIKDccOp7tT28qQOSxWdCyP+9qd
         up9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zg75WLPDLUTD/dO6gE79rZ4YNo3MHudSB6Cl7I/Dq3Q=;
        b=dhpNspZujuBROTLpfKFt73LHYlbnNoetx324dGJwx02P4uTwIkFREp3TrJNgE8UdjT
         EqIFW9p2BlWP/E+P2TqhzDJ+QpCOhtXTSZNxdxV+pQBjjZfR40f1/vP9Sy4ZEcy040gf
         vOc1Y86E+8G+mRI604d6VQfTPXa0+ttg5KNyat4lgGUhKgblkbSXyb0WiXceBHRXiMf+
         v6/oKvk3p14G1XeE1jPciEpkBDdwKdUZnmTG6K0o0mX5Uab5yfc9XqLeF10AD25fbHkv
         WADKEqxd+jt2krDAh2TBdKswPZIxbKBLiXX2yLnlJswd5LsAte4K/AOfKLtBVa8I3lSc
         4xVQ==
X-Gm-Message-State: AOAM530UIexSEmQ3OE4lYnb2UTM6Hqo7Mu3EzGtFH26X8mWbXoLGpzDH
        al7BHUN/A1+/CsUv81zCVjrhxA==
X-Google-Smtp-Source: ABdhPJxnb9lRsJOBi124nd5PEFi5RPTF9+iWsUyLiJLnsQi4cRUlKeW5N7Q2dB1SEdnBlCLzwXmR5g==
X-Received: by 2002:a1c:2903:: with SMTP id p3mr986048wmp.170.1601289722823;
        Mon, 28 Sep 2020 03:42:02 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:02 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 3/9] gpio: mockup: drop unneeded includes
Date:   Mon, 28 Sep 2020 12:41:49 +0200
Message-Id: <20200928104155.7385-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This module doesn't need gpio/consumer.h - it's a provider. It also
doesn't use any symbols from init.h so let's remove both includes.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 1652897fdf90..c5092773afd8 100644
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

