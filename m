Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC8957D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728498AbeINTzi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:38 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46319 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728479AbeINTzh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id a108-v6so10861538wrc.13
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ujFzkuZMMLmXfVfLF2lfmeu9c3YEpE3NecX6O1UeHlg=;
        b=OAompkBlzUe6jIx8tDFhyLc+feF0D6RjhKt+SaoxIJlxgpk1iyFjqtoJrUq/CWKfaV
         xRFWEjUczPc76/xwEWzOU2cPz9x4VL3jZjZi8fVBAIBrtaq5aWIItbfHlZyr1QgOl6e6
         GzSxM/E+QUzAjr/DjI2KcRysFXWs0Y3iGVXAzCtTtD51qEbWVT6YyCnQacaupwI0EV4m
         dzveXvWdNCVn/Yi08U+GefqGndeEkjHqTT5dZEYDOv+wwRvD0Z74Xbeq2TNDbH8Rcrkf
         3NvCgNzaxbQ0BQluKsRjX98CoOwrWrxfDlcQ3eoKRwDDU0Tr4dC4coAtTHGyUgMuaWdA
         VVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ujFzkuZMMLmXfVfLF2lfmeu9c3YEpE3NecX6O1UeHlg=;
        b=U3YLVSOjO8JI4LQ/PQjFYh2mENU0Cu52/SSEmqBg3vYvZKrfQTKv5wK7d+SIHOOnoj
         wIs+VdtrQOwosuW6fQvhmJQ9uRbsI0YiD5fs6SQf7dDgZpt3ni7OaVwRGi8Zd+nJdwf2
         pCmEBZ591BMX3Jk1aFNrHgI3EitN3Np6PJYinukGvkol2FzfELrFQuIIB85TxdSKbc9n
         kzx6XClkd+fqeVUPhKg6QKoG1C12hOcvJGwrEQZn1I+/aeUtuXXkHXW6d6KEKFbBMyt7
         dkDOZj0+xxfWUr2naykhrL4eAxD4iSo6BXhNLdtO0nYd3GVNUwBvWpHaJnvPiZ95z/L1
         0VxQ==
X-Gm-Message-State: APzg51C1ta7mA9mAUZJ3xdzCw07vuBwzluwQqnY9/a56EDrXhmWdrZLg
        s6aH51BZoEyl0mC56GGU56/dwA==
X-Google-Smtp-Source: ANB0VdYfKVXK35963rQ3LpNlbAOqtyE1CvvdkM3Q9+pE6Hz4KU0cHlPfk8BBh5Yz3U0lQXahzwcgXw==
X-Received: by 2002:adf:9b9b:: with SMTP id d27-v6mr10131493wrc.240.1536936047662;
        Fri, 14 Sep 2018 07:40:47 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>, Alban Bedel <albeu@free.fr>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 18/22] nvmem: use SPDX license identifiers
Date:   Fri, 14 Sep 2018 16:40:07 +0200
Message-Id: <20180914144011.27614-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use SPDX license identiefiers to core nvmem files and remove GPL 2.0
license boilerplate.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c           | 10 +---------
 include/linux/nvmem-consumer.h |  5 +----
 include/linux/nvmem-provider.h |  5 +----
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index da441019b609..ea05219e60b4 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1,17 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * nvmem framework core.
  *
  * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  * Copyright (C) 2013 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 and
- * only version 2 as published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
  */
 
 #include <linux/device.h>
diff --git a/include/linux/nvmem-consumer.h b/include/linux/nvmem-consumer.h
index 0326b52e906b..d18caae2f7ac 100644
--- a/include/linux/nvmem-consumer.h
+++ b/include/linux/nvmem-consumer.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * nvmem framework consumer.
  *
  * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  * Copyright (C) 2013 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #ifndef _LINUX_NVMEM_CONSUMER_H
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 5c9f205cac8f..8ae012f6545a 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * nvmem framework provider.
  *
  * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  * Copyright (C) 2013 Maxime Ripard <maxime.ripard@free-electrons.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #ifndef _LINUX_NVMEM_PROVIDER_H
-- 
2.18.0

