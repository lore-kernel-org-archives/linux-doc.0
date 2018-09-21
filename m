Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4E31F7E417
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389235AbeIUNRj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:39 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:32920 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389623AbeIUNRc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id r1-v6so3414128wmh.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BVLbSgd1wb/HwG+kDXFY/KlS+ziWt1RndHQUeQC7kyc=;
        b=a7QRAMB9IE3DmEB5wR9u0Mt99su5XgEX/eTSBxVzD+M+bK06knYXrB2nIVT2TrxduA
         cUZpYJT/MtPZGgRFdqhS3VLRfcRcvCIu8rOeBVci9f34nd0gNHLtOhCv0hvmNRxim+Zs
         N1F0OitgHNVVuJXUKYn41+enR47CZXFOfhNSjl+WQCYpUcfM2G3PjZg8P3cKNxx0N0nH
         cUVKQ7HE1bHexVouHgE7NLJHxco3s/lw1oBFde6xCYO9/sx9sefjGHBUwhSpHRid3KpO
         XiNuNrgJvpBL2FO/qX52yNNrM76OxCcgHsUwLRQygt9FnT5HABpcyNgjomN7GnCg7VR/
         x5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BVLbSgd1wb/HwG+kDXFY/KlS+ziWt1RndHQUeQC7kyc=;
        b=dSODNB9fi7Em2x9I0Y41l7SHZjxd8RzNORNKutk3JHXQhsFXZLgBHTMBxDEv5c+BhM
         d+/JydbTd2cDn8AQFb7PzGXbPHozhg1x3CK/SpxV0gNIG6LGSa1lDFvMRkeRj6J5rFJ6
         ABW4fl1Fma8r1PD2UnEICQMqRAUMZNhYuBcZC+ySyO+JFcvE0co7HXF2DETopBG42s/T
         Xn38HdWhIM5hVWVdR0082DRymVCsjucHzyIPnQ9D2UpeZSFi7NZ11G6X+9bOmj+mBoka
         Vn8apCXC0t4rB0n2twGEbe8MmWxhQYbTiCdgkmMxrdjMSuVj5g2P43wuDkIin4RTTZsd
         dFtg==
X-Gm-Message-State: ABuFfoiaBSZ41liUyOco2AhmBIOdcfGZdQckBD9PvySaJgjHUduVw+4f
        yr34VD+L5YQ97hrSt2+XZT+XPA==
X-Google-Smtp-Source: ANB0Vdb9HGryc4tNeEoea1LbGzQw/ODvtG/TZj55AVd1yReHsffG/W5gOhQeQ/w4gT8U+wTGGaLr3A==
X-Received: by 2002:a1c:e00a:: with SMTP id x10-v6mr5954422wmg.58.1537514996394;
        Fri, 21 Sep 2018 00:29:56 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:55 -0700 (PDT)
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
Subject: [PATCH v5 22/22] nvmem: use octal permissions instead of constants
Date:   Fri, 21 Sep 2018 09:29:21 +0200
Message-Id: <20180921072921.19387-23-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Checkpatch emits a warning when using symbolic permissions. Use octal
permissions instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index e44a1860a2b3..ad1227df1984 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -154,7 +154,7 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 static struct bin_attribute bin_attr_rw_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IWUSR | S_IRUGO,
+		.mode	= 0644,
 	},
 	.read	= bin_attr_nvmem_read,
 	.write	= bin_attr_nvmem_write,
@@ -178,7 +178,7 @@ static const struct attribute_group *nvmem_rw_dev_groups[] = {
 static struct bin_attribute bin_attr_ro_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IRUGO,
+		.mode	= 0444,
 	},
 	.read	= bin_attr_nvmem_read,
 };
@@ -201,7 +201,7 @@ static const struct attribute_group *nvmem_ro_dev_groups[] = {
 static struct bin_attribute bin_attr_rw_root_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IWUSR | S_IRUSR,
+		.mode	= 0600,
 	},
 	.read	= bin_attr_nvmem_read,
 	.write	= bin_attr_nvmem_write,
@@ -225,7 +225,7 @@ static const struct attribute_group *nvmem_rw_root_dev_groups[] = {
 static struct bin_attribute bin_attr_ro_root_nvmem = {
 	.attr	= {
 		.name	= "nvmem",
-		.mode	= S_IRUSR,
+		.mode	= 0400,
 	},
 	.read	= bin_attr_nvmem_read,
 };
-- 
2.18.0

