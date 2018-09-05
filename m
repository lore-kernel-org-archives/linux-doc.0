Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3FB1E7E0C1
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Sep 2018 09:58:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbeIEO1s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Sep 2018 10:27:48 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37256 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728411AbeIEO1s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Sep 2018 10:27:48 -0400
Received: by mail-wm0-f68.google.com with SMTP id n11-v6so7034304wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Sep 2018 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u/vGnWPAfFIzYEkGzNSLnF1qQXU18MToxRtfXu+i8Lw=;
        b=AFOtynpeAfIILSknYGLsIURIbLtuFfq7vbabvPnCn/wydhZu/7W8BGrhhByinYP73M
         C8VRgtcJpZpKXlVbJdXTS2qmVbsiAal52V9xvIE+cd+5Ktc8pvjvHpA+/KOYzUTjoTUY
         eVVGdrSLj3WbqnGU626M6qDY2KcPJI38TQnECU8SFaO/GRqgc7iCXLqEz9qcefveH7FG
         V06HKBeWJbIIZWUcMyS2OoyiUkG1r0BcvlMluWq6T4EzjbxXDL+RwdqamI9mVmyus6CJ
         94hLZdJX5rFYPNivyAetTVBjAaoAoCXHJJzIdBrlJ52LaB9ULjq0Y+cVmgsuwCirsNWf
         M/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u/vGnWPAfFIzYEkGzNSLnF1qQXU18MToxRtfXu+i8Lw=;
        b=RQcW+aQLkl6TTzBbtlO4eXiFBDGmeFBWn4WG5S4fLxdb0+wyxoYJh1oGBe3kRNhVxJ
         dL2THU3ZeZvpJl68bfA7+xIWYc6BctrzM4/zwO9JXRNAfW3QxrwJ6bap7YraavURfh5V
         ol+XXYeCy0Dx3dEy3/lOOPy9L9j6lDkG6+swHtW93ijtUypVwcsokv3BY/i4ipVrowPF
         wp88WmDpxxuxgAHa0heQjFYxNroaiKYMcthFHCpmB8DEBYyvR2+PqtMcSxUFfMeHkFV8
         3NrakuzKJC7OM4QNVJ1k+Wrb1fGFL5b+m1eSQjlOKLuqDVkp6lpipvBu2iPzXwpMI0ZN
         9Ngg==
X-Gm-Message-State: APzg51ByYs9Dy8TvdxXXMXY1UxLMj2bIvwaAq8Hw7836PZOnsVB6/JoZ
        QWrmmg/XwIa5A3xHkcuZ5omkqQ==
X-Google-Smtp-Source: ANB0VdZnBRihRCUqGRhDnjcFvDA/f1NOvLLwGgdrDnG1x7QUnHU8iyXAaA0VSm+maGLf1Y5zdQ/Umg==
X-Received: by 2002:a1c:578a:: with SMTP id l132-v6mr5296997wmb.16.1536141499343;
        Wed, 05 Sep 2018 02:58:19 -0700 (PDT)
Received: from brgl-bgdev.baylibre.local (AStLambert-681-1-33-235.w90-86.abo.wanadoo.fr. [90.86.152.235])
        by smtp.gmail.com with ESMTPSA id l12-v6sm2127815wrv.29.2018.09.05.02.58.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Sep 2018 02:58:18 -0700 (PDT)
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
Subject: [PATCH 12/13] Documentation: nvmem: document cell tables and lookup entries
Date:   Wed,  5 Sep 2018 11:57:37 +0200
Message-Id: <20180905095738.26406-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905095738.26406-1-brgl@bgdev.pl>
References: <20180905095738.26406-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Document the new nvmem kernel APIs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/nvmem/nvmem.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/nvmem/nvmem.txt b/Documentation/nvmem/nvmem.txt
index 8d8d8f58f96f..2cb01cdf87c8 100644
--- a/Documentation/nvmem/nvmem.txt
+++ b/Documentation/nvmem/nvmem.txt
@@ -58,6 +58,36 @@ static int qfprom_probe(struct platform_device *pdev)
 It is mandatory that the NVMEM provider has a regmap associated with its
 struct device. Failure to do would return error code from nvmem_register().
 
+Users of board files can define and register nvmem cells using the
+nvmem_cell_table struct:
+
+static struct nvmem_cell_info foo_nvmem_cells[] = {
+	{
+		.name		= "mac-address",
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
+	.dev_id			= "foo_mac.0",
+	.cell_id		= "mac-address",
+};
+
+nvmem_add_cell_lookups(&foo_nvmem_lookup, 1);
+
 NVMEM Consumers
 +++++++++++++++
 
-- 
2.18.0

