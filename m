Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D8697D584
	for <lwn-linux-doc@archive.lwn.net>; Fri, 14 Sep 2018 14:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728371AbeINTz1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 14 Sep 2018 15:55:27 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53101 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbeINTz0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Sep 2018 15:55:26 -0400
Received: by mail-wm1-f67.google.com with SMTP id y139-v6so2174621wmc.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Sep 2018 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=enYwgS0Z/OX0ykxo6KT1YIz+qVBOPAuLng+TvhpgC2Q=;
        b=J0tuqWp78z/kLE8iKSFZ9qTLtR9ffUNnaPhG8bhPBRUa+c3nJcxft2O95gA8Ihugen
         uC23jq4mGvPuJh0uI9e7tpfFNEgQyw5Xrtgg/MhnZpx2S38tc+aVx991nB8a182v3yz3
         uoC5rZp9NGqGMzU1EWu7zxLKgpLotfVIXdPk/yJVEr0iRyBJvKCsR+KUVNFXA5Nd9UtX
         q5sqR6oge4AoM3HjIo8YIWP642CRNNLBdKkFW+1ctOnug5huoJpjmSa1yWdU0BIBbLEy
         SzUR0rpnR5lKp++KfieuQyrgtvORNpNayzO5VPERvyprWFbLl6WmaD7w/iYilKsjDWEu
         b3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=enYwgS0Z/OX0ykxo6KT1YIz+qVBOPAuLng+TvhpgC2Q=;
        b=JpuKKcTQ9N4i6o1Sxvi8UdUGwNcUKxizJHgbq+/M7tm2UHYBloqfP5xfYUGPT83pVi
         qnviupBBny5HbE4rNPg/GwLumtTXZ8xYqL9NyO1wb7h4rANm8zZ83YNgi6Yqj4/fbZcK
         2X1Hwzb4CsDqG2KfZyVx4U36BephgP6GfAL/XZOaJO7ARUs7Pfhx5hY9FaZ1b21Ihr8V
         Omaw79t551yanOM1ZADaQf8ZxcsP/5Y2D1EFlG9GvO9vLGtUcA0t78vg/0wesj14z8b5
         noJE8nf1vS7IgeiFCVO3UbDVCgXittZ/Z4Dfi4l3yxmvA3hZNcY0qWpsxCOaFmMea2nf
         YTfA==
X-Gm-Message-State: APzg51DjdnT+xR7hWfRSpvovdvp4Cym1019cueDAMz0y84yCDVe2c4UE
        zwkJznUjCyOPmTWRT9SBH1hoPA==
X-Google-Smtp-Source: ANB0VdYSJoaq9YUkUfMrwDJmJ+UhshpcMNt1XhFoxdx3nGoTVcq/P5Nnu19eUdKBLyJ3Bp9dxiWEdQ==
X-Received: by 2002:a1c:1745:: with SMTP id 66-v6mr2530682wmx.38.1536936036782;
        Fri, 14 Sep 2018 07:40:36 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id v46-v6sm10313526wrc.63.2018.09.14.07.40.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Sep 2018 07:40:36 -0700 (PDT)
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
Subject: [PATCH v4 10/22] nvmem: mxs-ocotp: use devm_nvmem_register()
Date:   Fri, 14 Sep 2018 16:39:59 +0200
Message-Id: <20180914144011.27614-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180914144011.27614-1-brgl@bgdev.pl>
References: <20180914144011.27614-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Use the resource managed variant of nvmem_register();

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/mxs-ocotp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/mxs-ocotp.c b/drivers/nvmem/mxs-ocotp.c
index 7018e2ef5714..53122f59c4b2 100644
--- a/drivers/nvmem/mxs-ocotp.c
+++ b/drivers/nvmem/mxs-ocotp.c
@@ -177,7 +177,7 @@ static int mxs_ocotp_probe(struct platform_device *pdev)
 	ocotp_config.size = data->size;
 	ocotp_config.priv = otp;
 	ocotp_config.dev = dev;
-	otp->nvmem = nvmem_register(&ocotp_config);
+	otp->nvmem = devm_nvmem_register(dev, &ocotp_config);
 	if (IS_ERR(otp->nvmem)) {
 		ret = PTR_ERR(otp->nvmem);
 		goto err_clk;
@@ -199,7 +199,7 @@ static int mxs_ocotp_remove(struct platform_device *pdev)
 
 	clk_unprepare(otp->clk);
 
-	return nvmem_unregister(otp->nvmem);
+	return 0;
 }
 
 static struct platform_driver mxs_ocotp_driver = {
-- 
2.18.0

