Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 06AFA7E3E0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Sep 2018 07:52:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbeILMzh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Sep 2018 08:55:37 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41495 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728208AbeILMzh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Sep 2018 08:55:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id z96-v6so915289wrb.8
        for <linux-doc@vger.kernel.org>; Wed, 12 Sep 2018 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dAHd6MEwqXVGzwWm3SfLFdQRcyv3zBIXXYtbxX6zPOs=;
        b=XaWZU6ad83b8KhhFlV4kIuhwjf9l8fQ9CD79b3i8E/N71O/s5PrxgbCP+WRUK/lh7a
         oHixyJ0EmcVKFcl5AuF7DJ+YttTAiEwyME+XEc27jeHuQTFOO/DPTddm/qQ5i/3iFhee
         vkHvLekaeXU+WzRfWS3G2ky8LKh5TY8Lv6jvt9kq7fvrsz+mDbvqRtbHU6JbvVbM7Llq
         N6glSjbiNb84KETKKb2zv04n2Dek6NPXzZD+IlBhydI3OifZYSQB5iU2D7cu5Qinw7aR
         w2BRWl5uH8uyDR22XOHGKcgi3PLexnRxGtt8jyzLWFn+/xaWTzhv12ADW/+m62PjLbuZ
         qsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dAHd6MEwqXVGzwWm3SfLFdQRcyv3zBIXXYtbxX6zPOs=;
        b=TV3P3Oysrvs7J0XT26iR2lERCIMOQTQ7CF32KXMnBa20iuvnc9BMXfNZ6sdrmaMXAX
         8qeJZN8KIY83hbzvlAGBo9Lx73LIczcGtyP9oUI33mU9UZ2qnFsSdEwMulzw9D3QRNtk
         kU+8P+qgD0urrLQ0WrI1fCtWZlX4udHMUY1nzMXbj+qVdRI9rdiCSa7tb3kmsoIsmg7E
         nGAxuPrYSjlphUFMe4O4DWLroxxNBs2kTwskPIIg16odqv9zWSNUY5kwpHOC6w3Un53X
         u9SeTQ2/pdrhzyAuMT4eERa0muJPYAfjB+Re10W28ZtJ83k1qRNLosgtOcg4mFq00BEp
         AUeQ==
X-Gm-Message-State: APzg51Dlj2xs+YCctoKnV2UsSk4fRKNw8LkK7XIhYl2hi2B2euLDmG8W
        0ueH2Y8yW7Oi8BEQCsy/FMpiog==
X-Google-Smtp-Source: ANB0VdYPOfHEh0p5hqqrJFe3PqNbdLOAQRydlahUEvxdCASABxV459to2tOuooXLz5xv03xmEp6cRA==
X-Received: by 2002:adf:959a:: with SMTP id p26-v6mr493599wrp.202.1536738737336;
        Wed, 12 Sep 2018 00:52:17 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-MAR-1-609-89.w90-118.abo.wanadoo.fr. [90.118.185.89])
        by smtp.gmail.com with ESMTPSA id l7-v6sm169341wrt.67.2018.09.12.00.52.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Sep 2018 00:52:16 -0700 (PDT)
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
Subject: [PATCH v3 20/21] nvmem: fix commenting style
Date:   Wed, 12 Sep 2018 09:51:28 +0200
Message-Id: <20180912075129.25185-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180912075129.25185-1-brgl@bgdev.pl>
References: <20180912075129.25185-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Remove a redundant '*/' as pointed out by checkpatch.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index f4930f605d4f..bc14ffd87ca3 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1374,7 +1374,7 @@ EXPORT_SYMBOL_GPL(nvmem_device_cell_read);
  * @buf: buffer to be written to cell.
  *
  * Return: length of bytes written or negative error code on failure.
- * */
+ */
 int nvmem_device_cell_write(struct nvmem_device *nvmem,
 			    struct nvmem_cell_info *info, void *buf)
 {
@@ -1430,7 +1430,7 @@ EXPORT_SYMBOL_GPL(nvmem_device_read);
  * @buf: buffer to be written.
  *
  * Return: length of bytes written or negative error code on failure.
- * */
+ */
 int nvmem_device_write(struct nvmem_device *nvmem,
 		       unsigned int offset,
 		       size_t bytes, void *buf)
-- 
2.18.0

