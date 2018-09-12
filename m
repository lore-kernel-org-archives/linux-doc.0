Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C8A687D57F
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:53:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbeILMzD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:03 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38980 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbeILMzD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:03 -0400
Received: by mail-wr1-f68.google.com with SMTP id s14-v6so917777wrw.6
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=To/SQLBCgeq0lnY/26X7cnEpcdLcDIuj/UXMlG3uaxI=;
        b=U5e4qxYZDq0sIHyWyZrFlnqVXVUPZTGpquDb26zZzLQdaJfq6Iw0UB2wJPzxl/BTy6
         Fm2TOQabJk7wq7hk/whzNBenH4c8wybwsil1+pcqhCTVxVJVcp8VXblX5+iBl19NAobi
         MQmiK9eThd1W3wIOePjJ81//0CDPIuOU2Qix+mljM87cUfTSrYOUNEw6hkdUEz0UuijI
         lYiDG858c3/og51eoo+4l5WrI4GcdPMFTL900W01TLcO/uUwTG1MFrOsHk/fgeD+wEv5
         /1etGhftAfq9sGHn0572rgOeyL4yFcyvQkMdZ+3geRc6XHEnqniwO1Q/wk0zbnrLgcAu
         f4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=To/SQLBCgeq0lnY/26X7cnEpcdLcDIuj/UXMlG3uaxI=;
        b=LrqRB1gZzKpNJrLP/SLjyQF7Op+tGsIEh1UZtu2KzS4N7ck92saN0I0dnE1wMeXXEN
         SGSili2RWcB6oOwejxn6ib4EIVEFLx+hbn+Bq5AFVSwI0w39W3oHucxnq+OAQh9g1UF5
         PqG5gk+o123Dwf/1gUi+IyUEMG9v6cDi9IpiRWPAsl0VOzFnWnp7b5TCHyYCmlqD1y9V
         D2fr6k/UM2yLwNVrsKEZu8GufGwJhnkBZTkJfvhDLS28FQ1DN5NuJV8HlM8NLTmH0vo+
         A44XFjuzBlOZGaVk1ovDZ3q5ZUeR134ff9qYF49IMpbzavggSYG2BmJ4Q69QUv0BW3uZ
         nFHA==
X-Gm-Message-State: APzg51AbV+56PMb/pHz1lh2780HmwoJrrnuSeFRFb/HyvaXxGaMA5GEf
        xGcvahVPQZDZSotimcQjm+uN2Dbc1sM=
X-Google-Smtp-Source: ANB0VdarJ0J0MvgBUorYHhtJphzZzqcXqTMzumPQBhHlJDxLQ35awmtqkI4Bzje4oHRh7PPtDzc5DA==
X-Received: by 2002:a5d:55ca:: with SMTP id i10-v6mr530270wrw.38.1536738703451;
        Wed, 12 Sep 2018 00:51:43 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.51.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:51:42 -0700 (PDT)
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
Subject: [PATCH v3 02/21] nvmem: remove the name field from struct nvmem_device
Date:   Wed, 12 Sep 2018 09:51:10 +0200
Message-Id: <20180912075129.25185-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field is never set and is only used in a single error message.
Remove the field and use nvmem_dev_name() instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index d96348ae0f37..8987da0f7456 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -26,7 +26,6 @@
 #include <linux/slab.h>
 
 struct nvmem_device {
-	const char		*name;
 	struct module		*owner;
 	struct device		dev;
 	int			stride;
@@ -652,7 +651,7 @@ static struct nvmem_device *__nvmem_device_get(struct device_node *np,
 	if (!try_module_get(nvmem->owner)) {
 		dev_err(&nvmem->dev,
 			"could not increase module refcount for cell %s\n",
-			nvmem->name);
+			nvmem_dev_name(nvmem));
 
 		mutex_lock(&nvmem_mutex);
 		nvmem->users--;
-- 
2.18.0

