Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EA99B7E3E6
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389642AbeIUNRb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36617 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389625AbeIUNRb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id e1-v6so11813871wrt.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bgOE1ULQMMWfipJCdPWyqE18ogCrSsaTmNT0nDozskM=;
        b=Ew56mpX8JcOajDhnDoagv/zlPqozRf+XrJ7N0l26sBl5oTPCI/MRRAv8L+Yc9Gi0rJ
         AdhfJ7P+LOg/jSP6kr0c6Nr4PQ7xyXwxbxySUEDMc3/gbaqh1sm+yVhIbA8305jfZIFt
         JboGV8DC6SpjEDLrmPOPWFF8py5Ah6lEkSAb7qv7HXYZ4cLNQdsTnSJ+ia2FEnWK9Aui
         1/8Kt+R9bCBgk4ZPi9cJePjVfjLLE6yNw+hZ2Md+N8iQZsPg4zRV3VC1H9zD4PEJK+Gl
         jVujRpuC2btIZW501e/wg3E1GRHvquINxteekYP4eky718I+A6PiqWfExp1PUxDzYnng
         kFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bgOE1ULQMMWfipJCdPWyqE18ogCrSsaTmNT0nDozskM=;
        b=VjGRb1EyI10hHUcKHY6mRbmOmOokBb9hmQfTVAh0CFoAKZl5ATGo6tkaQaLtzjbHXy
         gTbIEhT9Vd4DX8IawCdjgm3eyfsFkqkdobfgnfjnjcVpmBq8QXXxLk2bRhx+zYFTSbgQ
         op+SQ7fATOeFWQene8abh8YMB+apqqgf+yiuxJkFz1WNraQ7A0g2REOi+y12jTdQHj1O
         7VIRmeX31qCDAlmU7o4Gq1V/fkDbf+cayK9Gazg53T6NQPaCDl7GoVmrcZGBzicdU4b3
         JXLxnZ0+rx2GcnQiyTW/SNGDL6a8aFmaxhvr4mb48SjkA2bkYQTLuxADXgJeXnpNG+N9
         nmew==
X-Gm-Message-State: APzg51D6fhB9Ud3imX/wXbr+ML84FXOse/+UNB0lG1GKp0JUd7jRxObB
        tqh0A8sBwFrRTsCM2d1frV/zPg==
X-Google-Smtp-Source: ANB0Vdbr5FjcvHNfz971aTXuZ+68jEtvCpG6PCBzVT8r8JmKfHIqtFLjatCFHAB3ncQJfzkEtwjXVA==
X-Received: by 2002:a5d:68c9:: with SMTP id p9-v6mr36816891wrw.108.1537514995004;
        Fri, 21 Sep 2018 00:29:55 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:54 -0700 (PDT)
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
Subject: [PATCH v5 21/22] nvmem: fix commenting style
Date:   Fri, 21 Sep 2018 09:29:20 +0200
Message-Id: <20180921072921.19387-22-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
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
index ff21402fbd7d..e44a1860a2b3 100644
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

