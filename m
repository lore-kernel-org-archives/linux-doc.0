Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8CC7E7E41E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389562AbeIUNSG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:18:06 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45411 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389576AbeIUNRY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id 20-v6so11782659wrb.12
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=nrl0ZmzFXKV1C2dHT2G+p10w+heILcFor2W+NM5qN7CgCgjv1OsLYmDDtjR5/haaJl
         +c//cpqEP8jAIsCY29Fulgr0VzOmKLAbgR77mGFiBb17oMQgwSExDg7KgUDudPC6bEY5
         s134IalH1vMybPrCDZgOWCUjqgmzslGKYEYIeFcy11EiSypauYgMuVD3Zt92UYwDhpwj
         xc8GchyYlZALU7ukamoDf9namr6cIrQz2IH4MP/TrKpLNF5EscTcKZOeAPTfIPZJysKf
         47xg1UgHQe0zj1jCnk3CoeOWSW6+RW20Od1tdK+wPeqCS7R5vaYnksm9Gw/AlDY7MV4t
         fGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rjARCe3NpsJLpu+gwm8Y4x+0pJknacrTsP46NqsklWs=;
        b=WBP7xKZ0KOLOfccI+JwxDXgdXVPfpjRjHNK+mM5O29tBLdWlA+ddq5iQzN4OQ4lg71
         tBlLPgdF8qFgoKUxcTo75XL0hJgRUjuk/+6TSNXHEJ27fdUrfT74SRSLpAHiggYCjTHV
         nQRDZOBQdiLZRdcP7v8jDWvKlCdqq3uQaQsjue7R8NSv3nz+mrN5kbUVzsTpFeNzKm2H
         aZle2++9Z2o1Fqy/QotSLNuTYsGEbTGrGqsQ5Im0w7o5em51s2+hYMfnZBWvkxYT/S1f
         o68uFW6gZY/x50u5dOgzn3IKZXXY41+JkTAsRB1PLJbja2iTBI+IjAOZRqUgq+1CPiYt
         Darw==
X-Gm-Message-State: APzg51DC3JJ8sv5+LEG+nXaUNZWNyFKczVB+mZkpRgilweJ/lTnYMg5M
        4TStX94PCWeeMFLauZ4f/ACbpA==
X-Google-Smtp-Source: ANB0Vdav5OfRgQsR3mjSOueeXCMx0dNd3X2ZogTEP48htDbmJ1HVY310M6PUYAoafiOD1j+qUSLcHw==
X-Received: by 2002:adf:f984:: with SMTP id f4-v6mr37339731wrr.105.1537514988246;
        Fri, 21 Sep 2018 00:29:48 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:47 -0700 (PDT)
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
Subject: [PATCH v5 16/22] Documentation: nvmem: document cell tables and lookup entries
Date:   Fri, 21 Sep 2018 09:29:15 +0200
Message-Id: <20180921072921.19387-17-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
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

