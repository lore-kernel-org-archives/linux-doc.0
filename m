Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 550F67E424
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389397AbeIUNTB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:19:01 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36538 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeIUNRG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:06 -0400
Received: by mail-wm1-f67.google.com with SMTP id j192-v6so2070020wmj.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=gmEHeYY9IxtEv7acXzK+EsVXEYGbLWE40bwPjEV+sgg=;
        b=l6jgU5P/BpJ7tfErgDdxo+DIvV6gu9MqTS3Nbm+PsliH0m0rSnpXHDG2cflUpFNW/g
         rKrnXWPtAa9y1Ns3jMotD3npuU9EyQvVtSrIxJiSJBm5BLhofb+ezV8ajKXuSiSZnwtG
         G1l+53S3XVKZ0UMippHKLTudbEsycLMD9LcIyAhKE6W/BIHuK5ptkuWHe/YwnHbw7pPQ
         QY5lJ4rkLnb2mrB3cIaSAU+u5bAFLQ7oD9kR16WRRjElHj43GJ4726FBX5m0p8zpnbtQ
         6C15xHkOPLjA4oBk0sAgmE2qOuU1nD2jnEJPkWxR4UFr6zDaonpBgkZhAnc7pcSnstFI
         Pdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=gmEHeYY9IxtEv7acXzK+EsVXEYGbLWE40bwPjEV+sgg=;
        b=Ag55FfxhVyauV+H98WNsK6QoCOQI5DwymmJQjHKYJPGFcCFWAwuuiNRK82oswYxxYN
         2W2kTRFGjmRsw+fmvOJl8zLxOOzs4LKHxIXb5+gz//XvTXMEF9OZkk3J3g5l84OKe+Nl
         FdLK7pNK/3xTRdjhXuDg7abE0L1yF8Hlbhupbt+wBsXhoJzk3POSlayO/C0cF/8dkkod
         l0q99qTf2vQe99YDaQILE6Xx5o6kPGj2n77Pqun2wT3LTMFfGBd6+Sou5pzYjr1ot5xF
         SxYjf7QsZrXWPseGAw8gEHSkoDHqsW/whNylU6lM+cUeSs9INWCXdprbAHBkxpAiLZ2v
         cDoA==
X-Gm-Message-State: ABuFfojCtsm7QKZJ98kY4waR3tgA74PIVdrY8IwJnNEOzDuTedAgYtJD
        wu9O1s7FPfvlvdzQ30l8j3wuRQ==
X-Google-Smtp-Source: ANB0VdalTkxcVlFQ7DvPAfBjMeQqyt3wRVglDERNsjjncaIP2Ywcu0uwymzJl7B2C3jOdWoTGZT00A==
X-Received: by 2002:a1c:e00a:: with SMTP id x10-v6mr5953217wmg.58.1537514970522;
        Fri, 21 Sep 2018 00:29:30 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:30 -0700 (PDT)
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
Subject: [PATCH v5 03/22] nvmem: use list_for_each_entry_safe in nvmem_device_remove_all_cells()
Date:   Fri, 21 Sep 2018 09:29:02 +0200
Message-Id: <20180921072921.19387-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the provided helper for iterating over list entries without having
to use the list_entry() macro.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 72313a1d215f..0e963d83a099 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -308,14 +308,11 @@ static void nvmem_cell_drop(struct nvmem_cell *cell)
 
 static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 {
-	struct nvmem_cell *cell;
-	struct list_head *p, *n;
+	struct nvmem_cell *cell, *p;
 
-	list_for_each_safe(p, n, &nvmem_cells) {
-		cell = list_entry(p, struct nvmem_cell, node);
+	list_for_each_entry_safe(cell, p, &nvmem_cells, node)
 		if (cell->nvmem == nvmem)
 			nvmem_cell_drop(cell);
-	}
 }
 
 static void nvmem_cell_add(struct nvmem_cell *cell)
-- 
2.18.0

