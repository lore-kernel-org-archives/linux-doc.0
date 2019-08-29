Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5AD4B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726245AbfH2Vdi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33886 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfH2Vdh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id s18so4921175wrn.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8LXQM9F9gVyH/d7euMv5jJ52783FmwhtSnblpFZBMA8=;
        b=Nvusx6VwpGAACE0gmeUw/7najPohn7VZCFilIhl52UIXX78owxbPhlTLoizwZmLz/N
         Bq7xI4r+m4dj+s2jPW3VzvwH+OLBE6z4NM+1v9oNRppVBD7FT9hhb2U+IFT+3rnURDfb
         rYJVf1vkogJAc7wKkruLtdYR6dfBkzJr8zgiYqE81NMGihHzBqKid+eeZiMBbwoLisWS
         js9OPuD24JRQRpX+2JTMdo1DGHHT8bTMBDuADER3Rr7JpwdZofEEuYyz8HMhFpr30JOA
         Rgl6DpHNnueq5yKBaPGXurmzNHxNH8pnEd3JsU4DjrkPNaMfOzOxzos7iM2tJx38SAJB
         VsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8LXQM9F9gVyH/d7euMv5jJ52783FmwhtSnblpFZBMA8=;
        b=uYt8eRVfvIBb2LtvxpEOtI5KdRI1tQ7Jvv81F9SkIebhWrGl93TrcQykhpb2Ay9gmY
         VJBTErl9Jcv58UOtJ4gFv6FHbNQ59L62wK5k8qQJ+Irs0GG0ci5dEu1GLhsVq+GOed4y
         cky+u3qMvbR5xZL5NJwu9mIyLgngevQmWD/OKKe6oDUWkqyM+v8EjJCBRufQMP5pykio
         ljdrbEG9mwuD1hvzplJqKPIT8Rf4icQAYuK/XDQa9kyk8canKuriPuaJe9rAEoWQzDsc
         ptTKlnkyzkhX/iVbSQNaSB158cQSxiLRWOpV9n648PX6hHOVVBkQgcqDJEZiZ6uduk7e
         zjUw==
X-Gm-Message-State: APjAAAU2YeZ8AZlyTSbHpb16VbUjNiD7I1HSBoTaOJPzKALYfGHar5CE
        EcM/B5Jd5uY2XFLD3+a/G6e2VA==
X-Google-Smtp-Source: APXvYqwEjT44/GOc6WMzs6WjS5qtYwAFA2602XbCSajPmTqOG49K15Uuyydmzc5BsE29aWpkS6rySw==
X-Received: by 2002:a5d:4206:: with SMTP id n6mr14314673wrq.110.1567114415964;
        Thu, 29 Aug 2019 14:33:35 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:35 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 06/11] coresight: etm4x: Improve usability of sysfs - CID and VMID masks.
Date:   Thu, 29 Aug 2019 22:33:16 +0100
Message-Id: <20190829213321.4092-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Context ID and VM ID masks required 2 value inputs, even when the
second value is ignored as insufficient CID / VMID comparators are
implemented.

Permit a single value to be used if that is sufficient to cover all
implemented comparators.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index e4a9ce76ed33..171d3c580968 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1794,6 +1794,7 @@ static ssize_t ctxid_masks_store(struct device *dev,
 	unsigned long val1, val2, mask;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
+	int nr_inputs;
 
 	/*
 	 * Don't use contextID tracing if coming from a PID namespace.  See
@@ -1809,7 +1810,9 @@ static ssize_t ctxid_masks_store(struct device *dev,
 	 */
 	if (!drvdata->ctxid_size || !drvdata->numcidc)
 		return -EINVAL;
-	if (sscanf(buf, "%lx %lx", &val1, &val2) != 2)
+	/* one mask if <= 4 comparators, two for up to 8 */
+	nr_inputs = sscanf(buf, "%lx %lx", &val1, &val2);
+	if ((drvdata->numcidc > 4) && (nr_inputs != 2))
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
@@ -1983,6 +1986,7 @@ static ssize_t vmid_masks_store(struct device *dev,
 	unsigned long val1, val2, mask;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etmv4_config *config = &drvdata->config;
+	int nr_inputs;
 
 	/*
 	 * only implemented when vmid tracing is enabled, i.e. at least one
@@ -1990,7 +1994,9 @@ static ssize_t vmid_masks_store(struct device *dev,
 	 */
 	if (!drvdata->vmid_size || !drvdata->numvmidc)
 		return -EINVAL;
-	if (sscanf(buf, "%lx %lx", &val1, &val2) != 2)
+	/* one mask if <= 4 comparators, two for up to 8 */
+	nr_inputs = sscanf(buf, "%lx %lx", &val1, &val2);
+	if ((drvdata->numvmidc > 4) && (nr_inputs != 2))
 		return -EINVAL;
 
 	spin_lock(&drvdata->spinlock);
-- 
2.17.1

