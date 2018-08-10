Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIMWL_WL_MED autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B34DB7DE70
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 08:10:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727516AbeHJKi4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 06:38:56 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35075 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbeHJKeV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 06:34:21 -0400
Received: by mail-wr1-f65.google.com with SMTP id g1-v6so7485422wru.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 01:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=auDnQ2msgcUIg2cR1NJaWEIgp9qglPcIziHCsh4zH4c=;
        b=hyVrD2uPCuDfG/SIVDF3sBQ3x5jPiEIiYfLhv4zCCwnLblKSqKqaAzB+653FJmrvzf
         0e7bBYw1HAepWkf2U4LVpYgUjfZrKoVVh4FsuGcBMtiS+/SWcQle/y6aNI/rL+0drHQg
         jcV8QsqKTyRZoOsyt22VpaW9vTwkAFYZTn1EnN/IUhBp0W1GI+T7fDyIzwF8CX0/JejB
         qn+I0si68PVnhgSRuSUiRLU6KdgC6+/mrYiJiPtsG7TV+4jK228jLAs+oFZgJk5AfIKU
         lxIvEZrz9jOSA4FcAwwpvSafLhEQSuDJiaUTmMC9+byu6RvzOqCz0+7HA0qUPdS3cEax
         mGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=auDnQ2msgcUIg2cR1NJaWEIgp9qglPcIziHCsh4zH4c=;
        b=dgtrMtfVCEooWK07Cp+4Nw4N34QI6SLlr8aMx2lWEhA2YWSX7gr7i1Tf9NxIl7+0u0
         ceWToGIa83DONs5+Enob+eZJ9j80uL0Lq7omr4C15LYeB4SWjkP7pOP8SuBPZIH0H3nM
         zDgkkCrcdNVFBf9C2j/YtjRkYuX9D8feLBQann1uhr484L/ZmDf78WTZooDzGR8UlVuv
         dka/0+GT4RtEnyF1YGzr2Xz05fzSNkW9mi8wEa8+T67HbVwMt22uOZpXxmQhCddJnthY
         L3fwtekElytbmtxVxRcziufp3n1CsVJ5g7WjRS7puuBK4LmeJ+OagzXUGl4OeqO+aB1o
         LQGg==
X-Gm-Message-State: AOUpUlH8Zp/0ryRbiYLvcAYbh2pEQOA6QWDT8ApFoTuSUIOaiM6v6pcD
        XM+xT4MzBmGeZkWaGpxNGMkyPA==
X-Google-Smtp-Source: AA+uWPymFzn6I/ZI2lEGyhAt132NMNyj5wgE/WcirkCrpDDb/X28TuLJrG8472LzrmsGj41RTdm2uw==
X-Received: by 2002:adf:c78e:: with SMTP id l14-v6mr3521076wrg.230.1533888335767;
        Fri, 10 Aug 2018 01:05:35 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id h7-v6sm9546405wrs.8.2018.08.10.01.05.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 01:05:35 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jonathan Corbet <corbet@lwn.net>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        "David S . Miller" <davem@davemloft.net>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Naren <naren.kernel@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>,
        Sven Van Asbroeck <svendev@arcx.com>,
        Paolo Abeni <pabeni@redhat.com>, Alban Bedel <albeu@free.fr>,
        Rob Herring <robh@kernel.org>,
        David Lechner <david@lechnology.com>,
        Andrew Lunn <andrew@lunn.ch>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 02/29] Documentation: nvmem: document lookup entries
Date:   Fri, 10 Aug 2018 10:04:59 +0200
Message-Id: <20180810080526.27207-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180810080526.27207-1-brgl@bgdev.pl>
References: <20180810080526.27207-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Describe the usage of nvmem cell lookup tables.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/nvmem/nvmem.txt | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/nvmem/nvmem.txt b/Documentation/nvmem/nvmem.txt
index 8d8d8f58f96f..9d5e3ca2b4f3 100644
--- a/Documentation/nvmem/nvmem.txt
+++ b/Documentation/nvmem/nvmem.txt
@@ -58,6 +58,34 @@ static int qfprom_probe(struct platform_device *pdev)
 It is mandatory that the NVMEM provider has a regmap associated with its
 struct device. Failure to do would return error code from nvmem_register().
 
+Additionally it is possible to create nvmem cell lookup entries and register
+them with the nvmem framework from machine code as shown in the example below:
+
+static struct nvmem_cell_lookup foobar_lookup = {
+	.info = {
+		.name = "mac-address",
+		.offset = 0xd000,
+		.bytes = ERH_ALEN,
+	},
+	.nvmem_name = "foobar",
+};
+
+static void foobar_register(void)
+{
+	...
+	nvmem_add_lookup_table(&foobar_lookup, 1);
+	...
+}
+
+A lookup entry table can be later removed if needed:
+
+static void foobar_fini(void)
+{
+	...
+	nvmem_del_lookup_table(&foobar_lookup, 1);
+	...
+}
+
 NVMEM Consumers
 +++++++++++++++
 
-- 
2.18.0

