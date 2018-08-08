Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9BB4C7E417
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbeHHRyP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:54:15 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:44793 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729717AbeHHRyO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:54:14 -0400
Received: by mail-wr1-f44.google.com with SMTP id r16-v6so2383894wrt.11
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yskxlK8HP/dt20rNOu7PQtYqAortOf6F4fEk7Jpuvng=;
        b=0ZP8sK9XBdVSH9MobfykpL+Uw9YJ6GOBO4g0FLbw5rMI0ZV/ywOn8AqHzeM19JM6kK
         ECh4d/wDg7PPGqMse2IUl/Ix+OIGI6Df2mPVv9Rq1pu85PS2f073OpzQUEdfUN1pwYBs
         8Bccw/IWu7MjcYyiO3vh2xF/kUXTvH+to2+/GgNlLsoxVIMFsFJ5wbmyyJMlgzSWeEfK
         7Km5q9GB/uVVPS79AKQhNixxtH6p20awJFiB1NLu3/ySEVYqRK77kFIK83cjFQiBLY02
         zG7QbASRPikl5keWpttElubb+pvL7DgBi3W2iTpENH09QiiHmz4UysXZxWQQp31/OyNJ
         /cmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yskxlK8HP/dt20rNOu7PQtYqAortOf6F4fEk7Jpuvng=;
        b=T7JlsutSbKuk+K1Xmt/a6quT80i6RxhHqzvyGbzC1lASskb13yXBD39MAVmh5s+gsN
         z40+hUePI0LegS7v1FQlcmAxI2vBqMb9dTvG751ankrMsJZukle1OctE+wVcZX/IgpLo
         gJRHmoK8EpP7bwUSrOBVVCzHGSg52H/gnL3qW0e8WIJd33I5TQyOgj7JqWgG+SUs4S8n
         HYaVJ48pjAhcr8WS5K4WjbKQsaQ6Ki3Dq3Vp3CujKzcqjhiwcvZG/xZI30PDMfsTfttC
         PqeBJpXrmfbaP1RVbnIKawQ/YGNo6KkhrlVtyc5rbA6Mvy2zzIK9Nw9HKWd8QwjoSiXL
         pCQQ==
X-Gm-Message-State: AOUpUlGFXDL5gdX/dPAqks6UC8rZwavJzvZ3xFYF5ApxT0B1GVYXHkAj
        JS3THCtCxlkE1ZrYsWOh8ZdMMBcHgdc=
X-Google-Smtp-Source: AA+uWPy+A/xZSF1dc+kNomdE4Pa7ILiTGx4uje/TUWZ5xo23lqnVmFjpWsZ1QNaLe29vABpAtFa72w==
X-Received: by 2002:adf:e887:: with SMTP id d7-v6mr2321857wrm.43.1533742442418;
        Wed, 08 Aug 2018 08:34:02 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.34.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:34:01 -0700 (PDT)
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
Subject: [PATCH 18/28] ARM: davinci: mityomapl138: don't read the MAC address from machine code
Date:   Wed,  8 Aug 2018 17:31:40 +0200
Message-Id: <20180808153150.23444-19-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This is now done by the emac driver using a registered nvmem cell.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/mach-davinci/board-mityomapl138.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/mach-davinci/board-mityomapl138.c b/arch/arm/mach-davinci/board-mityomapl138.c
index b5be51c0451e..5c0a0557a361 100644
--- a/arch/arm/mach-davinci/board-mityomapl138.c
+++ b/arch/arm/mach-davinci/board-mityomapl138.c
@@ -120,7 +120,6 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 {
 	int ret;
 	const char *partnum = NULL;
-	struct davinci_soc_info *soc_info = &davinci_soc_info;
 
 	if (!IS_BUILTIN(CONFIG_NVMEM)) {
 		pr_warn("Factory Config not available without CONFIG_NVMEM\n");
@@ -146,13 +145,6 @@ static void read_factory_config(struct nvmem_device *nvmem, void *context)
 		goto bad_config;
 	}
 
-	pr_info("Found MAC = %pM\n", factory_config.mac);
-	if (is_valid_ether_addr(factory_config.mac))
-		memcpy(soc_info->emac_pdata->mac_addr,
-			factory_config.mac, ETH_ALEN);
-	else
-		pr_warn("Invalid MAC found in factory config block\n");
-
 	partnum = factory_config.partnum;
 	pr_info("Part Number = %s\n", partnum);
 
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
