Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3B6CC7D910
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfH2Vdh (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:37 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40871 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfH2Vdg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:36 -0400
Received: by mail-wm1-f66.google.com with SMTP id t9so5257462wmi.5
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OgUwq8PV39ZIG0VU/e8yOPix/100+rTX8d/plHmGxFg=;
        b=cQhGJXf16IBUwr71hYviFfVm8lqflyPRdPBx6NLDs0G/fBHcMpePmerVdrkmHd5rgc
         dRxD6gXUA76nsVq5Ba0ZxzNAmTZr/k/rfd48mfVjZodhMemRYOE5wOIInBQZZIfUlFTg
         Ax/L/TC/gTzPlbq5OxCho1ertwvEB8D95iJ4qSpnVGMvXSjfyAYyXhdQxTFRsyQKpsjK
         ezPNm28Pycd71q17+7/bpzJCL2yavrk4IxVD8bPtEjx38egAxjOGQ/TUcYVJd4LBR9rl
         x7qbFkqStyo7/VnbKLaLST51MH7KtQWaq3qscHsm1UvPYtwyYOOr6I+7okMk/2UZuf9i
         SHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OgUwq8PV39ZIG0VU/e8yOPix/100+rTX8d/plHmGxFg=;
        b=BgX0OQRH+TxJWLj+SO9SjPbKMJ8QxSUmINoE/j0tsPyUiMAl6/Tl+WO0s78C7Hrscr
         ZEPp2m8VpWoDxVlcw32uNwWNNSt+d81c/i7pP/OICyeQjYdGpvCqAGBN1soSnde2PXGd
         X6Q2MkMVK8rrcOXOEqep1fV0BZepER/lf3qS45xsNik5lUqSWU9+uKupa0OouMdhavNH
         M8ZUBeeINGbx8iEvT0MJtTz62u+NGiD5jk7xYcv5ZlGS0W/BRZ9J1bc8hEu3aJWg+iUS
         uaF0tazoHbo7f9iMbYaKQmEFLe2hkpBbAaqTGKg6PbZcrJlM5TzIH2KpYcTv24RwxqUG
         hNiA==
X-Gm-Message-State: APjAAAVSNvZZm4Tg9s4C8jL9e/2OGNUl3pKos7OQsLQL8K5oLYH0PvaX
        lf2Q0tNS8yJ0WwvieSJGwgtPDA==
X-Google-Smtp-Source: APXvYqy0WPe0LjUXiF5vXxBgpNIqHB5KJOh0XO7JJtnOCE/rNTUHtJhcFQfsgOf7XPv103GfsLCF1Q==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr219988wmb.107.1567114414957;
        Thu, 29 Aug 2019 14:33:34 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:34 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 05/11] coresight: etm4x: Improve usability of sysfs - include/exclude addr.
Date:   Thu, 29 Aug 2019 22:33:15 +0100
Message-Id: <20190829213321.4092-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Setting include / exclude on a range had to be done by setting
the bit in 'mode' before setting the range. However, setting this
bit also had the effect of altering the current range as well.

Changed to only set include / exclude setting of a range at the point of
setting that range. Either use a 3rd input parameter as the include exclude
value, or if not present use the current value of 'mode'. Do not change
current range when 'mode' changes.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 11730a194951..e4a9ce76ed33 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -297,8 +297,6 @@ static ssize_t mode_store(struct device *dev,
 
 	spin_lock(&drvdata->spinlock);
 	config->mode = val & ETMv4_MODE_ALL;
-	etm4_set_mode_exclude(drvdata,
-			      config->mode & ETM_MODE_EXCLUDE ? true : false);
 
 	if (drvdata->instrp0 == true) {
 		/* start by clearing instruction P0 field */
@@ -972,8 +970,12 @@ static ssize_t addr_range_store(struct device *dev,
 	unsigned long val1, val2;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
+	int elements, exclude;
 
-	if (sscanf(buf, "%lx %lx", &val1, &val2) != 2)
+	elements = sscanf(buf, "%lx %lx %x", &val1, &val2, &exclude);
+
+	/*  exclude is optional, but need at least two parameter */
+	if (elements < 2)
 		return -EINVAL;
 	/* lower address comparator cannot have a higher address value */
 	if (val1 > val2)
@@ -1001,9 +1003,11 @@ static ssize_t addr_range_store(struct device *dev,
 	/*
 	 * Program include or exclude control bits for vinst or vdata
 	 * whenever we change addr comparators to ETM_ADDR_TYPE_RANGE
+	 * use supplied value, or default to bit set in 'mode'
 	 */
-	etm4_set_mode_exclude(drvdata,
-			      config->mode & ETM_MODE_EXCLUDE ? true : false);
+	if (elements != 3)
+		exclude = config->mode & ETM_MODE_EXCLUDE;
+	etm4_set_mode_exclude(drvdata, exclude ? true : false);
 
 	spin_unlock(&drvdata->spinlock);
 	return size;
-- 
2.17.1

