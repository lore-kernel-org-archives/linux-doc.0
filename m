Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F28DD7E3A9
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389496AbeIUNRT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53635 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389511AbeIUNRQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id b19-v6so1946958wme.3
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=enYwgS0Z/OX0ykxo6KT1YIz+qVBOPAuLng+TvhpgC2Q=;
        b=ax9QBPqEHiCyAwwF9/F83G6RkY/zwF0zAVw4bJMCA1u1VBs4Vy6ldq+YfmdcLOfzO+
         otZHdHSQo7uKd68dRs9RAOWOR7hV3GfJZ/mwv4p7GArn5WVEicO5U886Tt5k1XQk7IaY
         4e1AmPKXXzgcwKBnbyvkevLCKKG/0J3hNSMG3wQMN+1GpLYdQ1A2iPSjKD4lF9/WlO3y
         qV5Es+vp7uDcxclX5NZeDbY7v9ZHHqd33JWiHlxpPKramRuVO98kBj2Fw+tRWoJwoUly
         /3Ukifj1mwgxhNuGmDv1NnPN++uzZeqaG7JzgXJfHFBKEuM3NmM4ds8lybkuar27m/Xe
         cd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=enYwgS0Z/OX0ykxo6KT1YIz+qVBOPAuLng+TvhpgC2Q=;
        b=cwDU+x91vElEXQ7b4xbr2qnp9UAGKhqoXGGnjG4/XotLAfogGKgAj5iPCcRyJbGX06
         oGapdA72njearQwebB0FREzyCNnn4QGRE4puYLfgZNOok9/iI5DaNhbHYk3WuY8HSeSr
         WKmp7GASuUBZnaxe5AO1fYEoC2WHe3afSITrj5FK3REkjg8ydZ5QlQfRHzplM/o7lAHa
         QbpP85aKmZxtsjKlR9lGjpbx8csQRTdzFGFObKC+sW/XA858sQWv4tno9Qz7+Rvf4TU+
         t545LNEIwpqa0tfwbamFNO4esVctIWOt2PNEicC4JllF4PL+oWyR9+VBPdxBt06rtHtt
         QtMQ==
X-Gm-Message-State: APzg51Dynt9NUGl4Qf6l3s5Lti8A08o6tjnUfSR/Jfn6grTNF2433Ayx
        H2sKEA4BOk1nwh5nco2/mZzehOBTymw=
X-Google-Smtp-Source: ANB0VdYVG3Hut091dxcPYAon/AW+q0CXTIGK9gN4AZuJZ11+Ckt6Rc5TXLYEijShq/9FbJTyefoz8g==
X-Received: by 2002:a1c:88a:: with SMTP id 132-v6mr6142987wmi.9.1537514979956;
        Fri, 21 Sep 2018 00:29:39 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:39 -0700 (PDT)
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
Subject: [PATCH v5 10/22] nvmem: mxs-ocotp: use devm_nvmem_register()
Date:   Fri, 21 Sep 2018 09:29:09 +0200
Message-Id: <20180921072921.19387-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
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

