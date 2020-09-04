Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA85C2BB84
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:48:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1980C206E7
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 15:48:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DVTGoZ9/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbgIDPsk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 11:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727066AbgIDPrN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 11:47:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86FA0C06121B
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 08:46:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c19so7778306wmd.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2020 08:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fqNzmK12nk8xdy0PepsxrcJPk3kdW/zWD0as5Np++IA=;
        b=DVTGoZ9/IcG51yNk5wt6AIfbpjjgClmzQ/sB+JyYMzA1scB60f3klAUXpqyjXur7cU
         ceecqoA7dym9XyBOoc0KJdnwhnHizDo3L+PRneh2SVhNd3RWGVlxNWp4fb0qHEB16MUY
         UZZ981+PbDw/shKPxNe44u2DhQhUUonkKpnwrrBH3up1tBSsARpNhbqB1KQ0qdn4YGQv
         XVsC4P/nVvaAO/z3RO/B93144s06ZfVD1aZ6utVH8mAT1UxThVC9fl3XLywTHrk2F3Pb
         WRQ2oVF2yJ8i9/JXYBH6uosFBiLxHCTqBSgossd5IqX6hMJ4D3zpFtL5ugLmJe9Q8xrE
         2QvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fqNzmK12nk8xdy0PepsxrcJPk3kdW/zWD0as5Np++IA=;
        b=kyacrC1nWau8/7TWgt0VGXmEgaAhwKqtD6qxp43r+WIDKljKQ/EAm5S6mdfb3M1GLq
         DxAQzjl27xP0DQi7jj/CyRaYcg81tKJ4BcqamZmRyy8w06Y05aEq4OdckEAPU58usaEW
         Qn+5Jp3f8L8LiBtC+XsRIN4pqyocxmei958ye9bpAwK5Lik+fMmiRme5EOtBH1a34f2I
         BRLE55Q/rL+HKvYijm5GjLNH7ddCHT2XDOEZZAfVS5g11iG2wCMUMnwu6zt8J83Ipk10
         CVBOBQYuEB9A09NuKiud6jy97cEfzolHE86pdHewYcskgCCT1TAvoz51/gh3CPBpElIQ
         NWmQ==
X-Gm-Message-State: AOAM5329TPNO7pGGW8aizbTdvs0TfozhmM5Ag3GItxxevdHMjEUpKClW
        xjYKnYZzawf2jFbrr6tJc1Kc3w==
X-Google-Smtp-Source: ABdhPJxttLkSDVoDRXzlpcTjTpigx62xH5t4We6CkvNvgq/knQn3QcMipzht5x/6b+Rm8h9SpKU0dQ==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr7915668wma.87.1599234411169;
        Fri, 04 Sep 2020 08:46:51 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id q4sm11983375wru.65.2020.09.04.08.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:46:50 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 17/23] gpio: mockup: rename and move around debugfs callbacks
Date:   Fri,  4 Sep 2020 17:45:41 +0200
Message-Id: <20200904154547.3836-18-brgl@bgdev.pl>
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

We will soon introduce new debugfs attributes for dynamically created
chips. We'll reuse the gpio_mockup_debugfs_open() helper for them but
the relevant write callbacks will of course be different.

Let's rename gpio_mockup_debugfs_write() to
gpio_mockup_debugfs_pull_write() to avoid confusion with new write
callbacks and move gpio_mockup_debugfs_open() higher up in the code to
separate it from the pull/value attribute which will no longer be the
only user.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index eb94ddac5fee..29fbf007ab26 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -262,9 +262,14 @@ static void gpio_mockup_free(struct gpio_chip *gc, unsigned int offset)
 	__gpio_mockup_set(chip, offset, chip->lines[offset].pull);
 }
 
-static ssize_t gpio_mockup_debugfs_read(struct file *file,
-					char __user *usr_buf,
-					size_t size, loff_t *ppos)
+static int gpio_mockup_debugfs_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, NULL, inode->i_private);
+}
+
+static ssize_t gpio_mockup_debugfs_value_read(struct file *file,
+					      char __user *usr_buf,
+					      size_t size, loff_t *ppos)
 {
 	struct gpio_mockup_dbgfs_private *priv;
 	struct gpio_mockup_chip *chip;
@@ -287,9 +292,9 @@ static ssize_t gpio_mockup_debugfs_read(struct file *file,
 	return simple_read_from_buffer(usr_buf, size, ppos, buf, cnt);
 }
 
-static ssize_t gpio_mockup_debugfs_write(struct file *file,
-					 const char __user *usr_buf,
-					 size_t size, loff_t *ppos)
+static ssize_t gpio_mockup_debugfs_pull_write(struct file *file,
+					      const char __user *usr_buf,
+					      size_t size, loff_t *ppos)
 {
 	struct gpio_mockup_dbgfs_private *priv;
 	int rv, val;
@@ -313,11 +318,6 @@ static ssize_t gpio_mockup_debugfs_write(struct file *file,
 	return size;
 }
 
-static int gpio_mockup_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, NULL, inode->i_private);
-}
-
 /*
  * Each mockup chip is represented by a directory named after the chip's device
  * name under /sys/kernel/debug/gpio-mockup/. Each line is represented by
@@ -342,8 +342,8 @@ static int gpio_mockup_debugfs_open(struct inode *inode, struct file *file)
 static const struct file_operations gpio_mockup_debugfs_ops = {
 	.owner = THIS_MODULE,
 	.open = gpio_mockup_debugfs_open,
-	.read = gpio_mockup_debugfs_read,
-	.write = gpio_mockup_debugfs_write,
+	.read = gpio_mockup_debugfs_value_read,
+	.write = gpio_mockup_debugfs_pull_write,
 	.llseek = no_llseek,
 	.release = single_release,
 };
-- 
2.26.1

