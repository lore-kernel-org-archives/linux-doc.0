Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AFB6F7E3E6
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbeHHR6A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:58:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33842 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727541AbeHHRxk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:40 -0400
Received: by mail-wr1-f68.google.com with SMTP id c13-v6so2424883wrt.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=auDnQ2msgcUIg2cR1NJaWEIgp9qglPcIziHCsh4zH4c=;
        b=i0TceG1lfus+3BKletcKWO3nK/kouvjNQ7m41aqTlvkDGShVKicbJizZHKDcw3Xqt+
         HPr21z1eaCC7xAYrE6QY5AYgYSjdpdncEKSuTuYtGsJMlOxdr1Xs06f0jThoaM5E5FPt
         RDoXE6k+MkI0htttCqe3Z533KoWRVj+IGT1KP/BBWIUee236jV5xzx3s/WuaxDl0jp05
         XCNQAg3Rv3YvBaDXWZKo4rYHxI8zIBvMJI6UUfP5/mVir7hVqVimhQlrXmh2SFn1dkzK
         6WoaZtFaMc8ktSCQafPsfjp+uQWjcGeBBFPjxiDX0PsUVROXEtmgSb5yWl9ElgSrCvZm
         HUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=auDnQ2msgcUIg2cR1NJaWEIgp9qglPcIziHCsh4zH4c=;
        b=B+G0XE3GCLMuD3Sk7Tw0CUp8aV7DY8ROHwTZJxP3/xAlzQTiGPvqiTO47dH9CkZNGu
         CQAs4hG6ztkQLhkTgR78DlYHxQbDSVDPU8Dt3cm5woI21FsaxMG39q+LpCKmzP8TvSW/
         V+XRXzgXUM4WraUZJ3WuOJMzF2XhvZPTAXCi9iGiu6gt1Iu4/NQgwPI3xFo0CsvpU8v9
         XFL3n/puwom+Iy3UY8ivVvCU7bfFHifsjyhsdIvoMASaEO6GyB1wIlANO0MK/yS683yy
         nsrVK+Wz0P22SRQtrDtiUl1I8nA7rgnkWJwqc8RfIEg7xJySi6lQcjFE3sdX2U7hFiB8
         7Xew==
X-Gm-Message-State: AOUpUlENwnL4zBESDHjMIwTmM17uQTuNrqaC917V+w89fKmdOKC6gRzQ
        0KmvDmbtB1ww0FO1U0efmLP4AQ==
X-Google-Smtp-Source: AA+uWPzXSa//8V3H1avfMZTefmddl6h0FyaPd0yH7CY96wAZDwMdcsR62BaE3h96tK/j1eDfbq7FHA==
X-Received: by 2002:adf:eec9:: with SMTP id a9-v6mr2368667wrp.21.1533742409371;
        Wed, 08 Aug 2018 08:33:29 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:28 -0700 (PDT)
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
Subject: [PATCH 02/28] Documentation: nvmem: document lookup entries
Date:   Wed,  8 Aug 2018 17:31:24 +0200
Message-Id: <20180808153150.23444-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
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

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
