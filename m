Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 26B757DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:52:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbeILMzI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:08 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52555 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbeILMzH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:07 -0400
Received: by mail-wm0-f66.google.com with SMTP id y139-v6so1242733wmc.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LlD+NifSVaE3IfYdeYyWcCIMEiVmFR39vy4y8WN8rv8=;
        b=OJ1gcqKUTo9i439LzMcwsF6etRJBBp4US94hluDxZHEXDWwFhKCv4ZcQD7q20Ed16D
         ZWAfiAxGseknKWlw5zkrsDQBcwZ1rwPQuBjc047bnELgiOFUO0EOhmwmQIvcSxTvPBEB
         szAnPmGwQO0YBKF/xFGJdEpuKXM3S9nLsrzjjWnHujj1+nRAingIb/97B+dXF8zwV//k
         kmA2b7Y/pWm7Fj9XDOP4ey8U/3FJOdpMAcllYBvuUBW7+9MMQATrU4H4EuShkWTbJzAO
         dZvZuTuE+lYJWU2KZnDIoKxr1u7Re/bB85lpgwsDRUhJWEd8JtCA2Pit9ZJTI79co3H9
         0bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LlD+NifSVaE3IfYdeYyWcCIMEiVmFR39vy4y8WN8rv8=;
        b=J4TgNmiJP0CsIbLmyRMV1wahIO1BZiyISccYvZdcr4mRKQKWYqPmjqDuToN0kA74g1
         +xHS6vkXe/PIft5soKMMO/W+zSsCViGKQ/FZSZDi0e04Qtr/NF75SYlzMcDHKjo1ggBc
         wwhJPz6psZvFATDY8PAJLPtrhITzKJvKz9/9MkBgcWbRfgro6AsJqybVxzqmneQ9wBdB
         bYxzwdGFQCBuHZfqyM3Q6mArReB8pwX9MXKtfGbvF9E5DPUspjPjFosqC/ocaWYcLGWN
         fmz0Dw3FGFB6Qfp5W79jtzYeloy1SlRDJeVQMIzdrICZkwvo+aLgSho8Ibq2dSj2hFwh
         a/WA==
X-Gm-Message-State: APzg51DXWiF/DHapClPUa6rN4asjZWjI+NSEjUleJ7o33TRMAsVXDHPz
        oe+m7/vARj6SbJJsv9sO+ZoWOw==
X-Google-Smtp-Source: ANB0VdYzXxZCwxoeF0Ng8W5MFFsYuUnxyL1JI3gJ+sW6XcEdvJoNMGndDT5TueCa37rM6Xxt8S9FhQ==
X-Received: by 2002:a1c:1a48:: with SMTP id a69-v6mr711877wma.43.1536738707218;
        Wed, 12 Sep 2018 00:51:47 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:46 -0700 (PDT)
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
Subject: [PATCH v3 04/21] nvmem: remove a stray newline
Date:   Wed, 12 Sep 2018 09:51:12 +0200
Message-Id: <20180912075129.25185-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

There are two empty lines between devm_nvmem_unregister() and
__nvmem_device_get(). Remove one.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b69005367908..b469f700c699 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -613,7 +613,6 @@ int devm_nvmem_unregister(struct device *dev, struct nvmem_device *nvmem)
 }
 EXPORT_SYMBOL(devm_nvmem_unregister);
 
-
 static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 					       struct nvmem_cell **cellp,
 					       const char *cell_id)
-- 
2.18.0

