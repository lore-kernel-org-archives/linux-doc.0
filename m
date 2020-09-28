Return-Path: <SRS0=F/ae=DF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4396C47420
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A41E621548
	for <linux-doc@archiver.kernel.org>; Mon, 28 Sep 2020 10:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="vNIfUXVV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgI1Km1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Sep 2020 06:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726614AbgI1KmJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 06:42:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F308C0613DC
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id a9so641805wmm.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 03:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1YXp6sKFkcXTnpolw457jZq5A6kI2Z1eojr6/yOZQYQ=;
        b=vNIfUXVVyoXDF3umKSsKVBddWePCozTPG5ZzyeBjzZ34nAwMZRiRo7CkupgjKqL2lP
         4GmsanTd8x1Eb9jZCwA1h1QNEjvcKquIVW9e9ZV0kiubuGvQch5daq3cvyC6A05BhxRc
         fZEUyRAk6HOGKS8KL3OVg48iz39XiuLbNpqnnnoXce3L6VERVqiGirah6zqCoMmnY5Lq
         nl/IjL7CHR7HANLCBLKwy651j3igv0QrU+4xRIQjArVe8cPkQR3t1cEZoNagi3mOISBp
         a5nd8W4jaH+uHWghljLqX16U/CE7Wl4adi4SydwTKJH3xNZ8Q4fFA7X8NaodN4OESkuS
         CAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1YXp6sKFkcXTnpolw457jZq5A6kI2Z1eojr6/yOZQYQ=;
        b=HRtUE17XPQ/lfsrrRpfDmu4wyQmnLYHsoWmInynxlUe9DgCKwkidQcmxF3ntJl7Irw
         CYME55HCFtQc/E+8U2U+js/Ix/1Smd0yR9PGwtMnr/Nn47lzdmKm9bKnhpSR26yV9Ijj
         kqv7ZGBTh/3pdrConFm6vmoNC6vWaeDl399gvPcFYJlfKbyR5gtZLngCSyM3o0PpH2q6
         ywWPr/8aokicrbpHA+yeiS3qiD0ceS8rLUbOYdYTno1gv3BILrpAQb6wVR/4RL738G3R
         3H+pOLLYEm0qfBzx7TegunIj5vbMObw2cSqrEgD0kwvis8WbRjIDxq5yq1X3wsxg/o/W
         +YrQ==
X-Gm-Message-State: AOAM533xtFeW2NFlF996xfUjJL09HjUOD5wl1NAl2qgdbzptVaAiDcBP
        5bAATvNkyNF+9FZzY0x6T3+isLmfnL6gZw==
X-Google-Smtp-Source: ABdhPJwm/5yfZIU5/UeaMe5AmGIJAnRbOKvN85ev4Jzz8RSD5ORDHUPuI/APLpFiCoNGFVCGbbEvCg==
X-Received: by 2002:a05:600c:21c4:: with SMTP id x4mr958052wmj.107.1601289726952;
        Mon, 28 Sep 2020 03:42:06 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id f14sm939258wrt.53.2020.09.28.03.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 03:42:05 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 6/9] gpio: mockup: remove unneeded return statement
Date:   Mon, 28 Sep 2020 12:41:52 +0200
Message-Id: <20200928104155.7385-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200928104155.7385-1-brgl@bgdev.pl>
References: <20200928104155.7385-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's a return; at the end of a void function. This is not needed so
remove it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-mockup.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c2b2f7d5ff34..de778b52f355 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -372,8 +372,6 @@ static void gpio_mockup_debugfs_setup(struct device *dev,
 		debugfs_create_file(name, 0200, chip->dbg_dir, priv,
 				    &gpio_mockup_debugfs_ops);
 	}
-
-	return;
 }
 
 static int gpio_mockup_name_lines(struct device *dev,
-- 
2.26.1

