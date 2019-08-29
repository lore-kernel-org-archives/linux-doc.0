Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 15ADF7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH2Vde (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:32901 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbfH2Vde (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:34 -0400
Received: by mail-wm1-f68.google.com with SMTP id r17so5046476wme.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N1TqRswcqSvZ5erDhouj03SDeobVAzrfX323hD5EYXI=;
        b=K/7UKiWHz1k6RkeQzIm7opknsl5WpOP/rCobGZC6LaEFNQkNHK341C2eTf+drzAVbb
         5sfOgg7RlgfeQMlpj20T6IkYAq76ESBe+mU0QdIrtSgyweHAg1OR1xzo3tAvFxbL/1I5
         FeWhLGL8WjL6QAxRSfwVpkx4jeZGec+m70rc6c/70qfkYlscXwW2x8qe5PQT2hHY16uu
         CxsYE/Rty/91flDhJXPCl4FQXzB0DD/oI4U5smX44rH0RHSlVasYOzfoBzpF/kmy9/ud
         wL/Naxmemw8+vZMHz4BZyYNSBK1FSvjpnenVYKlp6wxpoiZu0F+OWxxuh97UNnFoZA38
         1ZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N1TqRswcqSvZ5erDhouj03SDeobVAzrfX323hD5EYXI=;
        b=IiY3pFoJYh/58jrmNOqMRY/xocDxv9RIdjDbPqUBbpRdjfhbOQ+pCQztCEYgyo4u+Y
         udqJoJ6ebxHBb39jIH9IW3K7w4SbfmqYaAGNNQCCarnwqI5acXe7xKjPJpway5DG2paf
         SXcz7HPycPWVNlOJNm0FO2w2Yq5gBueMvdiv37/XqenK8ysMhNoz/VFBRZa0WKQ+Xhu1
         FlL0Xw56tQ3afxRqiNimIjf38TCtTybtmwPhKUCEThlpGC+9ZkSI41IjJOjc1TQP0MjF
         pjNQdR6d0G2vUotikR4m5vgoCtFq5z9Db5uJY/tI90BjOpo7QnTEFfHrbSHhoRMkliKv
         JWmg==
X-Gm-Message-State: APjAAAVAVS2zTCZavxdZuhB0/7+YALrkwLM6Z/4Bz0Qe5AF17Ufl7PHh
        4ByqU+IVSdoBQ4jM1ioCdcPEHw==
X-Google-Smtp-Source: APXvYqxwwdtEdgjgoNICjbi8NlDMo+mLNPNJ7zWNPWZyupgBfays25bs6+GW7Gfg9dGMRfAC5qgTvw==
X-Received: by 2002:a7b:c1c1:: with SMTP id a1mr7157052wmj.31.1567114412039;
        Thu, 29 Aug 2019 14:33:32 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:31 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 02/11] coresight: etm4x: Fix input validation for sysfs.
Date:   Thu, 29 Aug 2019 22:33:12 +0100
Message-Id: <20190829213321.4092-3-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
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

