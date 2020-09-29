Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBC8C4727C
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 10:10:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7A3D20C09
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 10:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="Vlwp5g8n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727954AbgI2KKT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 06:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbgI2KKT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 06:10:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87A8C0613D4
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id s12so4658317wrw.11
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 03:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=Vlwp5g8nq3clh05VTdk4D5/6nGKS3gJzlJ6Qci4WMXVDpaFe8+w3bNqKKyH9PvhJdk
         r8iaxDY20JE2VFOz6Rbwu5mNGhNb9M70UvPINute+KCs8x8ypMcLpzeATeXYQOq9VzIB
         lsUTEPPx/2Eq8OjjBMOWCFSjKGWd3rPNiyqMAwPIbR17ZkMobYn7mroG5P5/6kMOanLz
         +5o1kcZPT5HY55Zr6p4WvjLzaYqZocoapIMFdhc8QYuuwl48MK1Q/+AvCHHImITeUZus
         +qkHUPLnyA355BMsYiV+BzZxEVNwYpNKSj9Vzgcf6Rqz0E6F+J+PNneZRlBvocb5pEFq
         cA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BgQC3n53i35n7GC4c6lOV6W434EKfBGkaRy/2vzORco=;
        b=ZGTymsgylWtXm+QmV2inMGyO6vPTOQ4F5+1jDRYC1iBi7OCErHQ1Or3RFuOGjjCcPI
         RO43q4ydOrc1zQLszESpKZWx3O1T0/PfZpYLsi3Hx3FCxBzG28bnSX9C0XzJz2F9kkKy
         0Ww2fgnOjE7TGH/8OqIGRgNnO6ilJet4E0WV5RgyyuevTLI5fCsAKRCW2gboJ12JUDAv
         N8fG9FOBIErhJGstNTIrARAd3dJMaq9EOZvzw1eli/TVev/T0ebliJDIhFghBXt72oPO
         F+ZBYGnbRXxAVDUbjPa77XxSPPQSzT51CEP5Dpc2q2ivs5O9bqXNsOV772mRiFSlCVoH
         RrNQ==
X-Gm-Message-State: AOAM530szTS02FuaTI4t0VyohqAchz+dQeBUd6NdTO6AD466oeCrigtA
        Xcvk5u0GX1x53j1iC/dy3KsFeg==
X-Google-Smtp-Source: ABdhPJyuFk9oLj8oeKx5P1cDeMQ/VsotouQuatcO5DStHJNiJydDu3sx3SxN+GryFbyn4Eb0Q3HxXw==
X-Received: by 2002:adf:f106:: with SMTP id r6mr3453748wro.106.1601374216544;
        Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-68-189.w109-210.abo.wanadoo.fr. [109.210.51.189])
        by smtp.gmail.com with ESMTPSA id x19sm3380680wmj.48.2020.09.29.03.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 03:10:16 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 02/10] Documentation: gpio: add documentation for gpio-mockup
Date:   Tue, 29 Sep 2020 12:09:56 +0200
Message-Id: <20200929101004.20288-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200929101004.20288-1-brgl@bgdev.pl>
References: <20200929101004.20288-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There's some documentation for gpio-mockup's debugfs interface in the
driver's source but it's not much. Add proper documentation for this
testing module.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../admin-guide/gpio/gpio-mockup.rst          | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-mockup.rst

diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
new file mode 100644
index 000000000000..9fa1618b3adc
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+GPIO Testing Driver
+===================
+
+The GPIO Testing Driver (gpio-mockup) provides a way to create simulated GPIO
+chips for testing purposes. The lines exposed by these chips can be accessed
+using the standard GPIO character device interface as well as manipulated
+using the dedicated debugfs directory structure.
+
+Creating simulated chips using module params
+--------------------------------------------
+
+When loading the gpio-mockup driver a number of parameters can be passed to the
+module.
+
+    gpio_mockup_ranges
+
+        This parameter takes an argument in the form of an array of integer
+        pairs. Each pair defines the base GPIO number (if any) and the number
+        of lines exposed by the chip. If the base GPIO is -1, the gpiolib
+        will assign it automatically.
+
+        Example: gpio_mockup_ranges=-1,8,-1,16,405,4
+
+        The line above creates three chips. The first one will expose 8 lines,
+        the second 16 and the third 4. The base GPIO for the third chip is set
+        to 405 while for two first chips it will be assigned automatically.
+
+    gpio_named_lines
+
+        This parameter doesn't take any arguments. It lets the driver know that
+        GPIO lines exposed by it should be named.
+
+        The name format is: gpio-mockup-X-Y where X is mockup chip's ID
+        and Y is the line offset.
+
+Manipulating simulated lines
+----------------------------
+
+Each mockup chip creates its own subdirectory in /sys/kernel/debug/gpio-mockup/.
+The directory is named after the chip's label. A symlink is also created, named
+after the chip's name, which points to the label directory.
+
+Inside each subdirectory, there's a separate attribute for each GPIO line. The
+name of the attribute represents the line's offset in the chip.
+
+Reading from a line attribute returns the current value. Writing to it (0 or 1)
+changes the configuration of the simulated pull-up/pull-down resistor
+(1 - pull-up, 0 - pull-down).
-- 
2.26.1

