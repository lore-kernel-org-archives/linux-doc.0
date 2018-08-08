Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AAE177E416
	for <lwn-linux-doc@archive.lwn.net>; Wed,  8 Aug 2018 15:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728011AbeHHRxt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 8 Aug 2018 13:53:49 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34554 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728012AbeHHRxr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Aug 2018 13:53:47 -0400
Received: by mail-wm0-f66.google.com with SMTP id l2-v6so957776wme.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Aug 2018 08:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DW0C9V3JvjZMYtKc8VK2o7U2J9FYgSOIQQygiNDbrgo=;
        b=AcuLJY17W5Clw2yPL5HLD6Zj836DwoaBCJaGP+qN0/Y43HV50mrYYtYYqk2g0jc5dI
         wd6kpW8QSnFeZCA+aTIDvicCoF/3c9f1s8FlRMEhisMjdBLYNAx95XuE0Os2yGdjIaI3
         +SCJ70xWZUGUsGafHrxPQjv4OaFwaD2CElfJhalZ7uds3s8VdEfbm/Ppl8w0xUc9G/m9
         tB0sdr/1VtZs+OShiP45q9K0juxDsN9SLMKZBOYHkYKCBt90SdbENcs2DIl+r+Iz2vg+
         p4skoT8ny2aLmTgtM/kuyX8zj0UHZBvtyh/N+/pcdzAOu8GGShyguIP5OHLOwI3bblhH
         NiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DW0C9V3JvjZMYtKc8VK2o7U2J9FYgSOIQQygiNDbrgo=;
        b=L5ff67+1tFqDIV3OwEEIW5mKTlcW/L6sBg3Mq0m1ElXG2/HaNPhUn1MfzE50jlvyRl
         eGTdElLIxTwyDvIpIGr/GsB7IrLbPqPJn4OYVtYMXqD8tdjL6WBG7ubXu8L/fPM2S5ti
         e1fg1/e8M5Q2w8Px1hnxTevi6IWSB0OfrAfwHb1Z8/ZgqtuHqSFveEj+Y01HvKYSxmdQ
         dpLcTmWwJUfv0ZD9d907u1axzuowl0/et6UqdSZdKv77Gk3mNyMtiwZzIz+SecbJ1VBI
         8roTeQpo/MO6qOOnFuuc7xrIGMVr4Vgb7zAs58O+EVNS2Y1ruVWR+bcvByi5JAAASUzy
         k+AQ==
X-Gm-Message-State: AOUpUlEZH+sBPvHqTTAbEybuFe7Af4p2U8fv/ST6tpTBWSuaG4l/9q3F
        LPg9RdvZep5Sbn1Vr7JohNZwpg==
X-Google-Smtp-Source: AA+uWPxd1LO/WvVi1GIoWBanTKcpOlXMsLtYBnwvackLfen0yF3M6D0EYdVb2dOx9LyK7QBoUTIHag==
X-Received: by 2002:a1c:8587:: with SMTP id h129-v6mr2050951wmd.105.1533742416039;
        Wed, 08 Aug 2018 08:33:36 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id s2-v6sm5240915wrw.52.2018.08.08.08.33.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Aug 2018 08:33:35 -0700 (PDT)
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
Subject: [PATCH 05/28] nvmem: remove the name field from struct nvmem_device
Date:   Wed,  8 Aug 2018 17:31:27 +0200
Message-Id: <20180808153150.23444-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180808153150.23444-1-brgl@bgdev.pl>
References: <20180808153150.23444-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field is never set and is only used in a single error message.
Remove the field and use nvmem_device_name() instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b040370292a7..6c825ce866b6 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -26,7 +26,6 @@
 #include <linux/slab.h>
 
 struct nvmem_device {
-	const char		*name;
 	struct module		*owner;
 	struct device		dev;
 	int			stride;
@@ -712,7 +711,7 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 	if (!try_module_get(nvmem->owner)) {
 		dev_err(&nvmem->dev,
 			"could not increase module refcount for cell %s\n",
-			nvmem->name);
+			nvmem_device_name(nvmem));
 
 		mutex_lock(&nvmem_mutex);
 		nvmem->users--;
-- 
2.18.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
