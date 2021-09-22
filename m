Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8116FC43219
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 08:48:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AD246136F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Sep 2021 08:48:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbhIVIti (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Sep 2021 04:49:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234036AbhIVItd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Sep 2021 04:49:33 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289E7C061768
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 01:48:02 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q11so4440791wrr.9
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 01:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=xcCAjLlHc4lLWrXnkSBsD6Ah7eLhCNEg1NdbWM73Weh4Vd+V8+m9Gm4wpo6GMRMBCs
         OmmuvDiUj0a6Piffmts5xyCncVkV1igNldsutKmAHfZvwfiGXbXHZ9cwGKkyDMet86Fv
         26dshxvClHustwUx6WLu0tcLNL5xazhU+s31j/GkzC5tQjMt2R5OLlhoYn4GmqlLW51N
         7bI+qVmF92vKYXX9gM3EaGn8R7zrGC32Djx86SoBwj7mklZ5I8/FEXk0NPsYZTpH5Wqh
         sevtZ9gvYrf8dwTLQcfswwpLdb/ZAERTWbpDVChzMM7wXxSBjjCkZGOLR/ABNGLaoLhC
         CHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XGPFAB413i4NSgL53tMC4PneOe4C16/1HV5Loq6Wys=;
        b=L1yGgTOgQKoHc5yT2WzIXKB/uP/+A/r4PSQAnJbbd7fKtR2tc8P/aiLte99TeFlZ9p
         +D3mfwOY9u9f6Maz4CrksluMGJt+EKcVzj48Ti5TTojfkBfwy5SlHYaoEt9CnBWWiVMj
         1UbK0iXGrQI/ArWrpjFhP0CVbuviJI1BeDqihDnc9UWZF9wKEppaJMWrcGMZyEI4AWBH
         eqdlbL7RQWi6jSdQtCwDhhXMD3DPZHDEytZ/E1rpVGsyDgo0G+WnT7RNvD+os7JWRBQN
         Su/vTWxLeabFe+1mSIcOcnJak3Tn20cIyYgsm2tZXMLDByrLRIZGo4c2Khe9T8sYtuge
         lnUw==
X-Gm-Message-State: AOAM5336Gv50OqQ0GKOWoKOZm+VFrbruXoqZaOAZ7h5ObOah6sA7Hzee
        6+wcvj2XCtDoUurZSBtKoxArMg==
X-Google-Smtp-Source: ABdhPJwg6+gYWLnXXAfq+tj/sHm52RJ+E/bmS9iBmWMfE2bt2mHbZbhi0N9XHiohinZsi180WD5qbw==
X-Received: by 2002:adf:e102:: with SMTP id t2mr1005464wrz.430.1632300480805;
        Wed, 22 Sep 2021 01:48:00 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id v10sm1591048wri.29.2021.09.22.01.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 01:48:00 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v6 7/8] selftests: gpio: add a helper for reading GPIO line names
Date:   Wed, 22 Sep 2021 10:47:32 +0200
Message-Id: <20210922084733.5547-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210922084733.5547-1-brgl@bgdev.pl>
References: <20210922084733.5547-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add a simple program that allows to read GPIO line names from the
character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 tools/testing/selftests/gpio/.gitignore       |  1 +
 tools/testing/selftests/gpio/Makefile         |  2 +-
 tools/testing/selftests/gpio/gpio-line-name.c | 55 +++++++++++++++++++
 3 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/gpio/gpio-line-name.c

diff --git a/tools/testing/selftests/gpio/.gitignore b/tools/testing/selftests/gpio/.gitignore
index 4ea4f58dab1a..ededb077a3a6 100644
--- a/tools/testing/selftests/gpio/.gitignore
+++ b/tools/testing/selftests/gpio/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 gpio-mockup-cdev
 gpio-chip-info
+gpio-line-name
diff --git a/tools/testing/selftests/gpio/Makefile b/tools/testing/selftests/gpio/Makefile
index 84b48547f94c..d7d8f1985d99 100644
--- a/tools/testing/selftests/gpio/Makefile
+++ b/tools/testing/selftests/gpio/Makefile
@@ -2,6 +2,6 @@
 
 TEST_PROGS := gpio-mockup.sh
 TEST_FILES := gpio-mockup-sysfs.sh
-TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info
+TEST_GEN_PROGS_EXTENDED := gpio-mockup-cdev gpio-chip-info gpio-line-name
 
 include ../lib.mk
diff --git a/tools/testing/selftests/gpio/gpio-line-name.c b/tools/testing/selftests/gpio/gpio-line-name.c
new file mode 100644
index 000000000000..a52e75bc37ba
--- /dev/null
+++ b/tools/testing/selftests/gpio/gpio-line-name.c
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO character device helper for reading line names.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#include <fcntl.h>
+#include <linux/gpio.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <sys/types.h>
+
+static void print_usage(void)
+{
+	printf("usage:\n");
+	printf("  gpio-line-name <chip path> <line offset>\n");
+}
+
+int main(int argc, char **argv)
+{
+	struct gpio_v2_line_info info;
+	int fd, ret;
+	char *endp;
+
+	if (argc != 3) {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	fd = open(argv[1], O_RDWR);
+	if (fd < 0) {
+		perror("unable to open the GPIO chip");
+		return EXIT_FAILURE;
+	}
+
+	memset(&info, 0, sizeof(info));
+	info.offset = strtoul(argv[2], &endp, 10);
+	if (*endp != '\0') {
+		print_usage();
+		return EXIT_FAILURE;
+	}
+
+	ret = ioctl(fd, GPIO_V2_GET_LINEINFO_IOCTL, &info);
+	if (ret) {
+		perror("line info ioctl failed");
+		return EXIT_FAILURE;
+	}
+
+	printf("%s\n", info.name);
+
+	return EXIT_SUCCESS;
+}
-- 
2.30.1

