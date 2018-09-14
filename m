Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD4FF7DE6F
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbeINTzS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53088 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728065AbeINTzR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:17 -0400
Received: by mail-wm1-f68.google.com with SMTP id y139-v6so2174163wmc.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j5VzygIMcTmrTIR1xvM1gLa6GSilUZBltKq95M6HHPU=;
        b=NuUWQ0egq5rhjpw96ov2rRI14N6D+0MsBMpOYkRNZtSP5snOGM0p0hOHaB5O6RxBMH
         UnChgkAplDVWzwWnmdYoiUN/Oe7vq2SPZTD7/8GHCfvrGE654PuT8T6nYE7PljvqAknR
         FqmA2v39WYp7tPjBST6OL7uuk0Rxk2tqjOiQ3xFbriEEfYepT/ZJJrE0h4+Ov5KX1RdE
         KeLnkxgAPMzY5Fwt/Dqx1EAIY/MbTMIkhutJmW3japw7DI5c+W+X7KE1Xc6pZPOPm1LH
         diS9rHT5V1shii+T12U/vdn2MmgQDFLMBGqGeekoYvZBWXPz59o0ERbhGGUEbdsUuuoF
         qhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j5VzygIMcTmrTIR1xvM1gLa6GSilUZBltKq95M6HHPU=;
        b=NeoxTK/FCZZ7m+7mAHe5EGt3CbycABZwCWRDM+YaSwXOnT6uD/ntSd9mXR1jgt+7Ue
         4X14gbvz9uP2iW+byfBUKg2uDkIED5lohMf2vurFRcepi7La9d9MJ1zcUExrDkmrLrXo
         sndwrYYlVJBHO4Vl35N7ifWT8skjw5lcHnvNMntxXLVQUjo62mveb3kY3WPzvyzhQ0vx
         o+8B7LQ10sX/qmkyHqIT7yWhX7192wTs366xwxdiUoz58c5LYoDEZX9HK8VfB/HNckOy
         qLM/DV9iFQTJgxXknMCR1kuHzcatzWr2DMwSLFcEuBvNu+43+cxvcmP9lQ3QKaYMEkWD
         oEZw==
X-Gm-Message-State: APzg51Cau//98pFi9fk0HTdHZTvcPLkCoJRNwuqk7EBbOSZVIS1+DEom
        jzURr024ypB3c3kMwAdD5Jjgnw==
X-Google-Smtp-Source: ANB0VdZlclLE5F7JZ+fJ/2PhQs9vzg3y/gJAwDStgrA06ANeyynHGGfYQpupAayEc+5lWmP4KuUM4w==
X-Received: by 2002:a1c:c501:: with SMTP id v1-v6mr2681386wmf.115.1536936027782;
        Fri, 14 Sep 2018 07:40:27 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:27 -0700 (PDT)
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
Subject: [PATCH v4 03/22] nvmem: use list_for_each_entry_safe in nvmem_device_remove_all_cells()
Date:   Fri, 14 Sep 2018 16:39:52 +0200
Message-Id: <20180914144011.27614-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
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
index 8987da0f7456..b69005367908 100644
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

