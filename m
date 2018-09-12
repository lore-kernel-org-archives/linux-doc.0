Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 760297D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbeILMzF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:05 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33423 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbeILMzE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:04 -0400
Received: by mail-wm0-f65.google.com with SMTP id r1-v6so9729016wmh.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j5VzygIMcTmrTIR1xvM1gLa6GSilUZBltKq95M6HHPU=;
        b=xfyQEbeSSIOhQjPm2M8xq5IuxCUW5ZE+jrYMUGwP3JswQrO0gUeb/Jv2OpMJbnaKTr
         Z1sdPfWiFUDlfwsZjKmewnL7Q7QXkcUX2Hwv8tOrA0WWcEw+ou7nnkMxzZROeoXlSNoM
         ByaUpxUgEM1kfKM27VGv9yQclzOIs8AObHcJkiQES1Wwd9q0rM4AIFMsq4yoskYLmyeQ
         qWmXU5SfV3WRBLfl/zkMNw/Y8FxrLPFsaadkB06Pbvpw5Szb7SCff+5RaNVfzH0cI4Ek
         HxqFrYTteZ3hrXLDfdADqmu0NjWfF/gP9lIPPLqLtiqzOA5Kc2Ph6GrZYWv5oov2a1aQ
         mCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j5VzygIMcTmrTIR1xvM1gLa6GSilUZBltKq95M6HHPU=;
        b=Kqg69g6YfGaMLVsKJSFuJG3nD0FisoHbPCbPgA6VQ6v61VBXorV6Suc8IBjYUlwQGM
         FvpxSDNWnT7yuVakaMQBvSYvDCsUModCtzAu0+vIU1wkHrJ/0IN8rSDJdFtp0H/4+r+L
         KfwEK54GtBBj7Z/KVw5DMFCFxDFSMSaN/FxG+QvdKyrwJFB9gY3OoSp+dXfgt/rsiReU
         MYI5u1pbx55w7thufhNCEm6R66BUNbWdff4FBXX1ZY6M6hXembZAJNQRPiv8zGOo5vSf
         qyyOmRgnPOK1+3mYUsb7O/+FfTfQIQB/ee/HqONPXYgzfErutcsgDW+CWeXdpWpVpZbA
         aR2w==
X-Gm-Message-State: APzg51A/pE/twEnW6DgBX9XsKlL1wYU4WG0UEQlHcHkU/C/4V+1+m00S
        5or8lcQPB6hWvVkh9Hg+wzkl4A==
X-Google-Smtp-Source: ANB0Vda8BtBT8qIYWfYEgPeRr6DolxslojMdC1lgwV8UoYlyVe/XBQO0mNTIUzrRxo+dGlXRhXcrUQ==
X-Received: by 2002:a1c:bb85:: with SMTP id l127-v6mr696892wmf.156.1536738705210;
        Wed, 12 Sep 2018 00:51:45 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:44 -0700 (PDT)
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
Subject: [PATCH v3 03/21] nvmem: use list_for_each_entry_safe in nvmem_device_remove_all_cells()
Date:   Wed, 12 Sep 2018 09:51:11 +0200
Message-Id: <20180912075129.25185-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
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

