Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 228F77D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728859AbeIGOtG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 10:49:06 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:40504 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728805AbeIGOsv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Sep 2018 10:48:51 -0400
Received: by mail-wm0-f68.google.com with SMTP id 207-v6so13972556wme.5
        for <linux-doc@vger.kernel.org>; Fri, 07 Sep 2018 03:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=JGD+vdczikrboApyovvWow0pnAnzkJz0ImUB1OKO7J6WzuO1DV32poJqARyVCHAT4W
         9oJqnM42O2El0bVSTuFljdRfZZIjvgQmi+/hWuOUHYNv3wru2eluY4AmvJf6Jk1jdoTO
         m5Al/MYjbFknubjNUyjfSiW8IcaR5CKY1lWcAtc7UVUHVYFKUPR2A7zqJ3JKDHVB/pQZ
         i1+Cj4KCQLvusrX6PWxX/2YjqTAZilzQHWTmysLBMTnUDvBZdXOw+/NfjgRwEBoMFIUr
         T0KZAFPvSYxLE8hOYpryEJgbAWSG57sqr2etvyjPsj+lg+QngzHPPeV0q28GKHgJuBjw
         8uWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=WSk3QBz+gtn2gEBId6WPcNO7SctWXyWblqAn7gFmq2l8P1w13mQKhrqs5NMm1cT6X9
         jeYEWI7vye11pekmxqYdIhKi10FdV3gCGp+99eUe55GhROhP1P1dXE0UiENTBJE7fsLt
         EOm27nDB3sGvZX6iJV6hjJ7tfLZ4IQjCytyFQNK4b+RWMoVGSE+Nt5QwsCk1D7Kyg8mg
         zAY8KzTr1TrXRd/cSWwxBMh+cV2WgfU6Sr/mWgiBfuqs8RJtuEXHPnkb0FxLEzwEgioi
         yZpWNT4q93s9lNWQ6Gs2vwi9A0QgHRFkrePhEQaX4pj6JOLVBHYFvEWBIO/L8198xYkj
         uWxg==
X-Gm-Message-State: APzg51C8wkX9wl210A18RGZ8qhFDxf4lULuQtomeFfuFCXOFqIzTMt+P
        wRR6/64wARG5w9zxhW5EXRnJGA==
X-Google-Smtp-Source: ANB0VdaeWAYzfcGsVF/mkA53G39QTZNQ9p4L/aP28vkS4LM/gh08yPlu9mL8Ht3+wc7ew+p2LpA12g==
X-Received: by 2002:a1c:7f93:: with SMTP id a141-v6mr4825953wmd.45.1536314916701;
        Fri, 07 Sep 2018 03:08:36 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-83-232.w90-86.abo.wanadoo.fr. [90.86.25.232])
        by smtp.gmail.com with ESMTPSA id 72-v6sm6631619wrb.48.2018.09.07.03.08.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Sep 2018 03:08:36 -0700 (PDT)
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
Subject: [PATCH v2 14/16] Documentation: nvmem: document cell tables and lookup entries
Date:   Fri,  7 Sep 2018 12:07:48 +0200
Message-Id: <20180907100750.14564-15-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180907100750.14564-1-brgl@bgdev.pl>
References: <20180907100750.14564-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Document the new nvmem kernel APIs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/nvmem/nvmem.txt | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/nvmem/nvmem.txt b/Documentation/nvmem/nvmem.txt
index 8d8d8f58f96f..fc2fe4b18655 100644
--- a/Documentation/nvmem/nvmem.txt
+++ b/Documentation/nvmem/nvmem.txt
@@ -58,6 +58,37 @@ static int qfprom_probe(struct platform_device *pdev)
 It is mandatory that the NVMEM provider has a regmap associated with its
 struct device. Failure to do would return error code from nvmem_register().
 
+Users of board files can define and register nvmem cells using the
+nvmem_cell_table struct:
+
+static struct nvmem_cell_info foo_nvmem_cells[] = {
+	{
+		.name		= "macaddr",
+		.offset		= 0x7f00,
+		.bytes		= ETH_ALEN,
+	}
+};
+
+static struct nvmem_cell_table foo_nvmem_cell_table = {
+	.nvmem_name		= "i2c-eeprom",
+	.cells			= foo_nvmem_cells,
+	.ncells			= ARRAY_SIZE(foo_nvmem_cells),
+};
+
+nvmem_add_cell_table(&foo_nvmem_cell_table);
+
+Additionally it is possible to create nvmem cell lookup entries and register
+them with the nvmem framework from machine code as shown in the example below:
+
+static struct nvmem_cell_lookup foo_nvmem_lookup = {
+	.nvmem_name		= "i2c-eeprom",
+	.cell_name		= "macaddr",
+	.dev_id			= "foo_mac.0",
+	.con_id			= "mac-address",
+};
+
+nvmem_add_cell_lookups(&foo_nvmem_lookup, 1);
+
 NVMEM Consumers
 +++++++++++++++
 
-- 
2.18.0

