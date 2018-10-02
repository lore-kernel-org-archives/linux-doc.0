Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9DA087D082
	for <lwn-linux-doc@archive.lwn.net>; Tue,  2 Oct 2018 09:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbeJBQZG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Oct 2018 12:25:06 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39762 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726207AbeJBQZG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Oct 2018 12:25:06 -0400
Received: by mail-wr1-f67.google.com with SMTP id 61-v6so656507wrb.6
        for <linux-doc@vger.kernel.org>; Tue, 02 Oct 2018 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3jZM2zRxZov3RiYJJND5l9o9GvRdVPeg8Domw0sixQ=;
        b=rdv7BvnHz8eN8fvqCehuj2i61008VQhDgwsFte0rmXuwF4XjOBndwGkgD915PwUulq
         Py+qaQbXLcBFT1H8ujLvfpIGCjq91U5NvKmDIjKy6YNCyT1eZtCbVp5cGw7OiClk/SSh
         42JhDXElxUZ9RfMGFi4gEc1p5l1rCT1heo3eEH4Dr7y5nMOIuzfp+R1vi41Kcmh7tzsL
         yIFrWWFmV5SWhEV9FF1yZA3irU2gYJhOe1R3IJE8EAhkGN5qc+AxvbxoxmruGoktgrNm
         ChVdvOX3eu5ka3qfMC6xTV4cYHmVUJl7g/1LoozLCnwGac7RR1ISwQyPWHHX8MOqjucP
         YbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3jZM2zRxZov3RiYJJND5l9o9GvRdVPeg8Domw0sixQ=;
        b=gPZGtgYuwNqPlEygUvws8Yu1pGfhTwKxtVmmd5oAIHKeQrnQIHhBtPs4NxTQv6OBUq
         oDiTmLhSyMFFHcIpV3k3zW9XZgJUriYpaIiqMFm7aRR6SmraUoqjw+sfWEjVP6FuJIHY
         wc0QWs3xhMoywzbL5+j1+rNKOKyQCSoSMhxGi64d9RRZBfFH78CvssHFyERqV00exFRn
         w7fjcKAt2ia4/Zc2SJcNHRUz6PxRPHee9HtCXgo4us/MkeY71HHV9/h/EnOeEVxQepOQ
         KHX/0W19QI1tEfpEVZGzgicSSNGyakV2r0xE8cOb2EDeAQ4vlOqX0ZXKqRuPHUz9fE5f
         1IUg==
X-Gm-Message-State: ABuFfogQ/jZXFHJqvoTeg8AwlAEUDN2ABiWuNVdNx7dzO+8DlAU7Eyou
        h9OaV6XDxPiU9pfRRVBd4luHwWBx0+s=
X-Google-Smtp-Source: ACcGV62jIN8Ly1/AfBCWyCVlRXJsTUr0dIBMhUhhs65Yxv+Rpg09qePIuNNWr7cCxX4A0Kr6HQ0oOw==
X-Received: by 2002:adf:dcc7:: with SMTP id x7-v6mr6148953wrm.21.1538473362270;
        Tue, 02 Oct 2018 02:42:42 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:217b:7d7b:52aa:bc53])
        by smtp.gmail.com with ESMTPSA id t24-v6sm4036840wra.5.2018.10.02.02.42.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Oct 2018 02:42:41 -0700 (PDT)
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
        Chen-Yu Tsai <wens@csie.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] nvmem: fix nvmem_cell_get_from_lookup()
Date:   Tue,  2 Oct 2018 11:42:38 +0200
Message-Id: <20181002094238.17571-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We check if the pointer returned by __nvmem_device_get() is not NULL
while we should actually check if it is not IS_ERR(nvmem). Fix it.

While we're at it: fix the next error path where we should assign an
error value to cell before returning.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index ad1227df1984..f49474e1ad49 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -952,9 +952,9 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 		    (strcmp(lookup->con_id, con_id) == 0)) {
 			/* This is the right entry. */
 			nvmem = __nvmem_device_get(NULL, lookup->nvmem_name);
-			if (!nvmem) {
+			if (IS_ERR(nvmem)) {
 				/* Provider may not be registered yet. */
-				cell = ERR_PTR(-EPROBE_DEFER);
+				cell = ERR_CAST(nvmem);
 				goto out;
 			}
 
@@ -962,6 +962,7 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 						       lookup->cell_name);
 			if (!cell) {
 				__nvmem_device_put(nvmem);
+				cell = ERR_PTR(-ENOENT);
 				goto out;
 			}
 		}
-- 
2.19.0

