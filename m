Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 81D077DE70
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfJOVU6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:58 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37783 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfJOVU6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id f22so522843wmc.2
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rDuhlvBwT6uhRxkYGcIkKsWqjq/99jBo0tsPSyIyS1M=;
        b=saIqH2d+hiYz0leLDWU+UOsYxldo9oKXimdPq0hgyllb9sRTvKMMiWYCIKMvNjTvx0
         UuD6Mlko6ETxXOXHxJeKVu8sk7V051KVJtQCEvY7mmD56ZxQX+XV3Ec2Bi+296aEe4NZ
         T/bbut1dKnKc0bTqMoV7Ky0CZW1RTMXdTgW6A8MsyynCt+LTBmD+1LsSX2WEtVGt/8LZ
         GuO591E35WtjZxvJRSqmRpxvAGi2ea/GLf8qV7Tvx0x6+hXpJIkxoci7vJYY+jKRkfPg
         xzzibw8S51kFex9fzjjjG1F/ofnYkbYlIvAtEPVNLfoJ6Jg863nVaoXx0nhaFBIF8x4m
         LX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rDuhlvBwT6uhRxkYGcIkKsWqjq/99jBo0tsPSyIyS1M=;
        b=D7aMs4R/5j7XIDvjzmBmVPrIlk4sxNWI3MUnzdC2yK+HeOhHTY+SJ8P89c5NiqHOCo
         H4wsoM02YnuwcLIRam9RMGBepQl4Fv7ALok8x4I7Ehic+xzlrdpQU0+raCPMwV2g2B9o
         xQBdz0ajnIQPhZqxFqeU6DPHq17kRTUyVUSqwxSAW9TD/aFk2PJdQNdhePedCi57kbB4
         KdLz5tXxPSqHtsQA+F10pzpD6K0Lbec2tmKrGF1MYnINBnR8uxVJWdSrGi8qApeXxFrQ
         Q0+AqAXwVsxQY5ejL2avLDtlUrYxX3iajh9BiL/R6TLdBbjJmKpaXvg1Tn2EHU5Rq0Ao
         JKwA==
X-Gm-Message-State: APjAAAXG2BChBjeBEbzWVPRR1Mv5sYoGOlPy3sgmU+Zs8FaF16aXh6UP
        wRDQYMQTg91k+xR5smb/0TyySA==
X-Google-Smtp-Source: APXvYqzsG0Havf3lVAWtlB+9gFIRq1BAC5ZnbgJMgm9uWjQ7BLw/fiVfBDesO7cFSGEAMf1/LcxEzQ==
X-Received: by 2002:a05:600c:21da:: with SMTP id x26mr381977wmj.152.1571174455434;
        Tue, 15 Oct 2019 14:20:55 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:55 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 05/11] coresight: etm4x: Improve usability of sysfs - include/exclude addr.
Date:   Tue, 15 Oct 2019 22:19:58 +0100
Message-Id: <20191015212004.24748-6-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
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
index 2dbad7162557..d772765dcd29 100644
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

