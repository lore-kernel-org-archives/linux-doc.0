Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 392C87DD29
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfJOVUy (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37779 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbfJOVUy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:54 -0400
Received: by mail-wm1-f67.google.com with SMTP id f22so522745wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1/nDamY0vcX3mI7xTMQncxC0g153aasRB+pWD3LOkGg=;
        b=TaLFgxGU6jVMwelP5mURDjGBxzXtchTb23/HSjCJYtTlzeBmJ+juEnP00kaLhqirfA
         /a7Q6LMlt1AEKDjB4/wEw1kfV0tdz8YbXqkdB6whLnkpAod6YOvz64ceYZfYzCUnaUtJ
         jaWvDqW+We1YUnji8YRrVLyO4cdXdYn9hLtWNy8Qdbe3F5mH6TFzfu3I2DrEoBBFrXce
         CP0JU310tM7d4b3R/3FGd09iWc5Q93Cdr/qaKS2wXA6U8wWxe5iK5cDw9N48G2rjRK03
         r/dU+RYCgxG3GnMmiT2d+RkXF4+qVl8yZAqgrHQcF9rMrMkBmtiOolPHyxgyrLgGV47D
         YIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1/nDamY0vcX3mI7xTMQncxC0g153aasRB+pWD3LOkGg=;
        b=BNn4i/aSg+UgJ6YCPuZ0UhSpGovjEVEoJIa4pwLr7t/Xtdyn8h+Oyv8rIjxZjBxWHD
         mvlS66N85fUxBOLqbk4rU0LhVLjcA+GOobemtj4tOP5YcPKGYT0KroeSD1G3FsXyRIQT
         JxaGbXE+6qM/oDGqxsZQXs8jbum4ii+sPmLJQKXA83svN6Ay87zC9IJVYrlpsfN0cqDP
         cfFPJcYgnMX/HBTbpdk/MRhR885zNp654NeQRj943HBVGxUVmH7qbApesefpeXPgZaL+
         /DrrojiYc2pUc2JQcYpj3nEBXMCXyzNiYUUxL9sg5EFAJSeI3qzSvbU4ibRkgyC+JKsw
         IEwQ==
X-Gm-Message-State: APjAAAVncVI9OfwV9gDFqVkY36mKFlGpDNo+EG7GAciqegYz+hSXzBGH
        LcbABgClEuq1hDbDBKUaHjrsbQ==
X-Google-Smtp-Source: APXvYqwEUxH5hHScjclAUc0I0+HFns+TpSn6XeAN1cUcRGj342cZJkUiCCw3wYm6utihcH46SCGX7Q==
X-Received: by 2002:a1c:7c13:: with SMTP id x19mr388646wmc.80.1571174452543;
        Tue, 15 Oct 2019 14:20:52 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:52 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com,
        stable <stable@vger.kernel.org>
Subject: [PATCH v3 02/11] coresight: etm4x: Fix input validation for sysfs.
Date:   Tue, 15 Oct 2019 22:19:55 +0100
Message-Id: <20191015212004.24748-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A number of issues are fixed relating to sysfs input validation:-

1) bb_ctrl_store() - incorrect compare of bit select field to absolute
value. Reworked per ETMv4 specification.
2) seq_event_store() - incorrect mask value - register has two
event values.
3) cyc_threshold_store() - must mask with max before checking min
otherwise wrapped values can set illegal value below min.
4) res_ctrl_store() - update to mask off all res0 bits.

Reviewed-by: Leo Yan <leo.yan@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
Fixes: a77de2637c9eb ("coresight: etm4x: moving sysFS entries to a dedicated file")
Cc: stable <stable@vger.kernel.org> # 4.9+
---
 .../coresight/coresight-etm4x-sysfs.c         | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index b6984be0c515..cc8156318018 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -652,10 +652,13 @@ static ssize_t cyc_threshold_store(struct device *dev,
 
 	if (kstrtoul(buf, 16, &val))
 		return -EINVAL;
+
+	/* mask off max threshold before checking min value */
+	val &= ETM_CYC_THRESHOLD_MASK;
 	if (val < drvdata->ccitmin)
 		return -EINVAL;
 
-	config->ccctlr = val & ETM_CYC_THRESHOLD_MASK;
+	config->ccctlr = val;
 	return size;
 }
 static DEVICE_ATTR_RW(cyc_threshold);
@@ -686,14 +689,16 @@ static ssize_t bb_ctrl_store(struct device *dev,
 		return -EINVAL;
 	if (!drvdata->nr_addr_cmp)
 		return -EINVAL;
+
 	/*
-	 * Bit[7:0] selects which address range comparator is used for
-	 * branch broadcast control.
+	 * Bit[8] controls include(1) / exclude(0), bits[0-7] select
+	 * individual range comparators. If include then at least 1
+	 * range must be selected.
 	 */
-	if (BMVAL(val, 0, 7) > drvdata->nr_addr_cmp)
+	if ((val & BIT(8)) && (BMVAL(val, 0, 7) == 0))
 		return -EINVAL;
 
-	config->bb_ctrl = val;
+	config->bb_ctrl = val & GENMASK(8, 0);
 	return size;
 }
 static DEVICE_ATTR_RW(bb_ctrl);
@@ -1324,8 +1329,8 @@ static ssize_t seq_event_store(struct device *dev,
 
 	spin_lock(&drvdata->spinlock);
 	idx = config->seq_idx;
-	/* RST, bits[7:0] */
-	config->seq_ctrl[idx] = val & 0xFF;
+	/* Seq control has two masks B[15:8] F[7:0] */
+	config->seq_ctrl[idx] = val & 0xFFFF;
 	spin_unlock(&drvdata->spinlock);
 	return size;
 }
@@ -1580,7 +1585,7 @@ static ssize_t res_ctrl_store(struct device *dev,
 	if (idx % 2 != 0)
 		/* PAIRINV, bit[21] */
 		val &= ~BIT(21);
-	config->res_ctrl[idx] = val;
+	config->res_ctrl[idx] = val & GENMASK(21, 0);
 	spin_unlock(&drvdata->spinlock);
 	return size;
 }
-- 
2.17.1

