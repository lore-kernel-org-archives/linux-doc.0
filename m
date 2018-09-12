Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4695A7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728103AbeILMz1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:27 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37275 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbeILMz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id u12-v6so921913wrr.4
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=Fs1KPfuLGjhmN40UmU9tXCVjtd1Ypky/hXlcNhvJ4ZdsktmUGrwqy0BvQGNAHLkpDq
         PaA2Av+KU93GeJiQ8wuWtHdIMDW+Iu2zVIJ5R4OtD8jVebJUjPs/+3C4zeORQ0eXq2Oj
         wpJMZPM2UfWJLxOg7vBlDy6iNcCPpJwRSoqLiS4cMxuKEWqNij06Fht4kChaGdMBykkp
         0rP/HJcEpcDum+pVMKYhRCCWvvpkmwucyEImPUkjvI93uQZTPxycOcbEP/lNC6K9t42Y
         gYFEb4MolHlGGzHSFeUDEVTENO9c6G4BWPCrkifFmwc2T145IOeI4KKHtvlgqbuk0aW6
         YcbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=YmaWyTnYam+Bvoem+vJxGEWw2UtTh3CeumE0XGuzgUaPhUhUcscdMXN91XyvnHjoLn
         uUp4Ixep9oVqLztjdhiMO2OKEisr0cB0B2yft6paSwe59MvQH4FYa7ceSvuNplPHJzNj
         Ffl916jCcIe312uUKT2C6bX4jVaJ+Jq+uzpsOm9W44FPjWwatni0TICvVjGFX7WEsq0A
         ydP+hnm+AQ9DpEg1DbFZI9+lf64JwTvvNKuhTFrHuMr53K1QR7C1GKwho3/syioLkPzi
         KsC7dhXZMomO6ZDH/99nKdncXJXFgGbY82lBkcVv/j0RbeFor/wxGBoABxeamundvrpy
         7r3g==
X-Gm-Message-State: APzg51BiJt7YHtECw5mG4eyfKBMx1odOLG+eIiQUR4QM0mWj6yIUeZVR
        4IFEF8cHjEZDvjHZPFbTcdTVJQ==
X-Google-Smtp-Source: ANB0Vdb0/pWaejo7JU4HxGj4loHJp95Ch+j4mzZMVwskZMBXfAsV3ywMBMXsUym/S6Acj1i9yt/xkg==
X-Received: by 2002:a5d:55ca:: with SMTP id i10-v6mr531380wrw.38.1536738727672;
        Wed, 12 Sep 2018 00:52:07 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.52.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:52:07 -0700 (PDT)
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
Subject: [PATCH v3 15/21] Documentation: nvmem: document cell tables and lookup entries
Date:   Wed, 12 Sep 2018 09:51:23 +0200
Message-Id: <20180912075129.25185-16-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
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

