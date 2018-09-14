Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D93497DE59
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbeINTzU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:20 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41873 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728211AbeINTzU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:20 -0400
Received: by mail-wr1-f65.google.com with SMTP id z96-v6so10882205wrb.8
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=5hy1cImwFLaoJYAZMstJrgaN4xDvjcz+dii9EY6OQ8c=;
        b=o0XNS9YSB3E+o5w9WuKdMh6H+ShF1Ispq2AgrjESnp0laXJjmFH4P+biT9tNq51vGf
         1vKcEPm5C22/lPn5wyIZyOI8MoTSW6BASGR4E/rolX2DW5RS30NCEurmZ0QZ7tOb+L3o
         33Q8ghK9hbaLP8ts2Rf85sF5zrv+5nnY0ZxoCQ0SMXPnS4BX9+88L9W6mPGi+Vhj1+Og
         WNz49MqJyZ02TctMIO6WUnyY/id50Zd1N9Syc1f6dkXLyft1U8M2jjOU5emImD0ragQH
         ZkiUJ8sAk9pdtbV4Wi3gosezr/8VgiUOZW+zzuGXhPBTuJJs3r6pru4gClvJyZ0Q3rXe
         /+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=5hy1cImwFLaoJYAZMstJrgaN4xDvjcz+dii9EY6OQ8c=;
        b=Hjwti98E6+293klK8kum+d/IF3dMffs16mnot/eoCo0ei58zbTt6Du/wXTnl0s5Rwv
         tt+GBA/ZRCeOvVCzqHKYvopZsx4ZKysiDhH+O6zO3ABRSQnfRX++kum9OHwfyX7GU96W
         PaGiWz7mW4Y9s2KXeWu6o8tmrdCN4Co8Pjk0A9p8ktwUSnWKqfofDHgU7ouWLE49EDM9
         1ICOcyAQJzFX3MafH5lrNkUUD9wtAW94U4Q/4oFGSKdMwIgUEebxIRY4gUDmZybQCmKc
         GC1VmLReXRACSHplvJtuZ/RrnRtE1swRVQ+fhm/eN07kP3xAE/wDA5Lmf5YCMEWhNjqN
         2oHQ==
X-Gm-Message-State: APzg51B9T0BFehpm5mW1cgoMa6SZKdbekhSZZXaq75avklBYLaw9QODN
        Wh06/dpbo/TaHDZc/wIerQ66Zw==
X-Google-Smtp-Source: ANB0VdZhDkcM2z7bM3oRujFanuSA4xLtl50xZNt7TIdAgbgPyQbpDPu3slIPOgPa541xQJ+mQXRZVg==
X-Received: by 2002:adf:9f13:: with SMTP id l19-v6mr10382180wrf.206.1536936030348;
        Fri, 14 Sep 2018 07:40:30 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:29 -0700 (PDT)
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
Subject: [PATCH v4 05/22] nvmem: check the return value of nvmem_add_cells()
Date:   Fri, 14 Sep 2018 16:39:54 +0200
Message-Id: <20180914144011.27614-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This function can fail so check its return value in nvmem_register()
and act accordingly.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index b469f700c699..ffed8fa16936 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -512,11 +512,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 			goto err_device_del;
 	}
 
-	if (config->cells)
-		nvmem_add_cells(nvmem, config->cells, config->ncells);
+	if (config->cells) {
+		rval = nvmem_add_cells(nvmem, config->cells, config->ncells);
+		if (rval)
+			goto err_teardown_compat;
+	}
 
 	return nvmem;
 
+err_teardown_compat:
+	if (config->compat)
+		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 err_device_del:
 	device_del(&nvmem->dev);
 err_put_device:
-- 
2.18.0

