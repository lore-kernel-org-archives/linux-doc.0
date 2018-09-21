Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3EB257DE7E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 21 Sep 2018 07:31:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389478AbeIUNRN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 21 Sep 2018 09:17:13 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37149 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389459AbeIUNRM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Sep 2018 09:17:12 -0400
Received: by mail-wm1-f67.google.com with SMTP id n11-v6so2050722wmc.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Sep 2018 00:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7pNB/YkN9hno7KdXunbmQOYsXKCGrUI9TMuetzklSpo=;
        b=e+TNNLb3r0E+A+rjJohde9ukPt4XsdbaYNspA8fLg1x7J285Fg2XWo8/NGkqVaCWuv
         MS4ARjZy/MBbOvAHzEG6a5fS8LVda1DzH4Fie857AGtDztGUJEAR1uLLLpSXWNUlJkng
         wRyWNL06Sk9VVgLHPOaXXqsXH5btz959Ke3t0oEGwI4gAx6oi3J/tOdM5IMp6VOWsxOv
         KRX6i324o0q2jozQDph3b/lvJE7ABxysJ385tzC2kzVh+VcuDczjQRP+5pigWYS02xBC
         badCseLVISinBgRzE6gZ1OC/acZbu9osg0x0DwsDbaS2SUEGP106ioIh9ko44DAnJXzB
         M6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7pNB/YkN9hno7KdXunbmQOYsXKCGrUI9TMuetzklSpo=;
        b=SdGCokFfIbXbQE7inJYsa7Uu9EzmBKIgawfqccNLlQArpLBnm5JZJe88UIZS35mTiZ
         UZI29xbNVhrn6QlV1OHEt1LF8dcn5ZC3DNAjpJkQVGvUxmi0Gdca3+8cm3Ts31i70Ic6
         SwvSp/ERnYVs3WQCu6PqMpFbLUfjuyRj5M4MGcSd3Sh0ENIXpeyg/ahluKcBGH2hSYtq
         S6OMiRD+0SUV3zKBRxZRoMLKkqPxooYT7dot092Dx/yeVVDQF0hR2D0qeGjTAQwrbfOI
         ud1Oo+DO5m9gWG9ZUvcvBPzgrqBlBZJTdtPzlwBPP61dFJL1wxaSEYWBafDAdB5XEpq7
         D+4w==
X-Gm-Message-State: APzg51C21dXAaKqLG19nTVeMBc7rP7lTBY4xfUfv8OMNOg8PRHpLkfyr
        yvrrkO545fLrOmGy5CZ4HlPezQ==
X-Google-Smtp-Source: ANB0VdZOPAkkhry5s7XS9BMeBWEjzcYT1eW4RHLwems3GiFvysccgYweRBEimNI439E7/4sYKecSkg==
X-Received: by 2002:a1c:4d09:: with SMTP id o9-v6mr6166328wmh.134.1537514976009;
        Fri, 21 Sep 2018 00:29:36 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
        by smtp.gmail.com with ESMTPSA id d18-v6sm2841597wmb.33.2018.09.21.00.29.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Sep 2018 00:29:35 -0700 (PDT)
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
Subject: [PATCH v5 07/22] nvmem: sunxi_sid: return -ENOMEM if kzalloc() fails
Date:   Fri, 21 Sep 2018 09:29:06 +0200
Message-Id: <20180921072921.19387-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180921072921.19387-1-brgl@bgdev.pl>
References: <20180921072921.19387-1-brgl@bgdev.pl>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The driver currently returns -EINVAL if kzalloc() fails in probe().
Change it to -ENOMEM as it should be.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/nvmem/sunxi_sid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index d020f89248fd..4d0b7e72aa2e 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -187,7 +187,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 
 	randomness = kzalloc(size, GFP_KERNEL);
 	if (!randomness) {
-		ret = -EINVAL;
+		ret = -ENOMEM;
 		goto err_unreg_nvmem;
 	}
 
-- 
2.18.0

