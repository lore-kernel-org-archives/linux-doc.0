Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239E0C43603
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 21:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 002C8652AB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Mar 2021 21:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhCIVAQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Mar 2021 16:00:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbhCIU7o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Mar 2021 15:59:44 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 195A1C06174A
        for <linux-doc@vger.kernel.org>; Tue,  9 Mar 2021 12:59:44 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id l11so15127080wrp.7
        for <linux-doc@vger.kernel.org>; Tue, 09 Mar 2021 12:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRcQM8tGux3x7pZPyJ5Bh3crA9EoJU0QA79n6uNLXsw=;
        b=JEIr7MzgVjowzE3jZS6cPEuxs1huAVh+37B6Dnn8Qt/EsLhOPNtKPLdo0eT7KxY3N9
         up2fYPcf6Wm10n1iUfSQkRZ5JORwGuN0dz8Mm2zQvtU95L51lnjDfXBYSQlLPXWoBiIb
         /j7rhSmDyPQMv2+X3cJD5cRK/CbCXVOdf9mFNsd69VqDFSmejX46Yc0xpaNNJYSVtOYq
         37XEbKE7tvlvVhQvg5Vb46gdN0Lc+YZ2S6SvY+z97T0RY+2LUfKoUIw2L1Xw3aJsmDS1
         /cPYWpPnFvdmPJ6RRuLxritrcB/WesTCLqgQJARsgD6NKKucjl0oyhoc7DPcQxx0bZV1
         eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRcQM8tGux3x7pZPyJ5Bh3crA9EoJU0QA79n6uNLXsw=;
        b=ARt/YZK6CHzlwweiN7HAFwS6DpZEoaztjJKj43Q1ohXYt/fI2DEwRY6f3qv/wC1ds8
         umrfq7N5uzT+2mPN7Q18hIF8BKi7f9E5M68pBNwG3x6A6GZKfjTsWjb9X2Ue5zJUDHPE
         Yt+eNOJZyGDQL9VKZ3snNIRKAWzn18OyC2peq5NhQdcOiudMzcddsuCNgGu6O2SlOUBd
         njPIM7Y5/sj+i0Gn6PV4LrvG3pna/1nIlAncCaiIS/3S891B7tVT38RX8ktWpqLhXXE0
         /LbOnQ2MXY1DKTPpLVLnRIdqqqBxS+ASWSztI2BZPwbG9QCZViXaVvCLUTQS3z34csdB
         blrA==
X-Gm-Message-State: AOAM5327hgE6yFcUFiasEzxBgGM4N9DGd3lLkHpJ3GqjaBLMSYcUHHLx
        xFKLl8uK0Y+0lAYDgETwHXpQ/A==
X-Google-Smtp-Source: ABdhPJyDUIB1ftt6yBR6TdQrSSGxAos9/V5NM3LQJFJN5aA6rDyqHDsHJwyiaP5nTSToc8SIUOfHuA==
X-Received: by 2002:a05:6000:250:: with SMTP id m16mr30912015wrz.325.1615323582914;
        Tue, 09 Mar 2021 12:59:42 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:42 -0800 (PST)
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 10/11] selftests: gpio: add a helper for reading GPIO line names
Date:   Tue,  9 Mar 2021 21:59:20 +0100
Message-Id: <20210309205921.15992-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a simple program that allows to read GPIO line names from the
character device. This will be used in gpio-sim selftests.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
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

