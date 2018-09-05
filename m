Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 54BB37E39F
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbeIEO1t (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34864 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728413AbeIEO1t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id j26-v6so6991563wre.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kwAPsVdWBm1Q091WBwR60/dHAFNq7NCMXizN9CJmyiI=;
        b=opXuiTiUAMx8qBbfTm8KMECCTPBqzD69mtGO5GL7MNFYB2YTruGUAK+pkiS6jtVDXc
         qKDv6TSXvYiMtLA6ckqMbf1pfSquBQtriLdWhG8Wn0jb2zjJ+MWaftxBYR20BBOxXWXF
         4+/hubyGjI7hXp0M7vqi8WEd2XgBcodu59UaClCVagQUlHB+nRa2F/DwOPPu+XSmgPKf
         qvwNkFAuLg1n3hCJp0+mpz6IbQgBtvL+2Vi2RCIQ2X63wMjDKKokq5qNcsPPUayBJNpe
         A/tf+O6QJOa31+BNViKMjpWWefZV2msJ7wKFSLtkFLfBTmgHCHasI9t8X4zM7WkS/ETY
         W5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kwAPsVdWBm1Q091WBwR60/dHAFNq7NCMXizN9CJmyiI=;
        b=qPpXFokYQF4qIfoi//ja/cxuSgDr6I8WfhCGRLWfZTm/kkew9811OqzR67ciBl/AwO
         7E/I7/D4kfTA6Qc7OHWyp27T97HifhMAmM+wlL5tZ4uzRlAylRwwU33jNekPE1vDHiBp
         9l87+nAyC6NLanOz1W7mjpTgeLhQTkev/k6ZwOa7FHdGY0GCGlyFr7ZAenvp2sudx4FX
         H6I9hUu7I4HN2OOxMZg7/oe1E1f5znZMtzT1j5R3vr4lHBonxwey4kuHdmD19OATXGrc
         eRyf/ob96haaoB241uoX+Ok3aL8lpUyHehRlL0nMKPSSKTdZKKOpkEYd/ADpvliQsgA+
         mMPQ==
X-Gm-Message-State: APzg51ATQRtlmx1KyqSscqxVBbTNDhrodXY6h0GJ/RfPg3dfHHNbDZtC
        eBav+XXf0OEWcRql8pic0aToLw==
X-Google-Smtp-Source: ANB0VdbhU8Ql4CzCyiSXtntJhQ+b74SR9EunOHLxRbT5sNI3JftvDfWLK2qcMx1U+mqpFg/e4Q2sWQ==
X-Received: by 2002:adf:93c2:: with SMTP id 60-v6mr24483331wrp.81.1536141500559;
        Wed, 05 Sep 2018 02:58:20 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:20 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Joachim Eastwood <manabian@gmail.com>,
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
        Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 13/13] nvmem: use SPDX license identifiers
Date:   Wed,  5 Sep 2018 11:57:38 +0200
Message-Id: <20180905095738.26406-14-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
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
index d7c609109cfd..9a4eaedaa5ea 100644
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
index 8a6405febc32..e417e28d6aa2 100644
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
index 07ab1ea73520..02ac0dcb2001 100644
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

