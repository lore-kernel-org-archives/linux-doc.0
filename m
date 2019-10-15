Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96AC07DE71
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbfJOVU7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34503 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbfJOVU6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id y135so3201584wmc.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DCrRB45TPzffk/SG7GSckRQdVqj6ZXw8oOiajo6TgQI=;
        b=UAVuIDOUvZZyV9kO0gvn+x6GUYOnygxkODoUfALvIsMaw6iKXTdPjrTQ1/2tAq/O+V
         1gI0fI2ihrg8U0u8VsqX9bK7m++OeZO+pOB4s8FbkLSkgh5GetHpRKSuEnkcYvoO6vRv
         QZLjyukx3tERcSOtM/HXqRD1WPjjaSkRE4pKDGKxpLkNftixSK+CeITcMNnCZWHKP/sR
         J25T4HwG8yZeq/mXdvFlXV0aQt/TIeNhid+EFeQXv+3PhmV2hdOGaCJ/ymUvDXk+OmgG
         p2Wx3iSa82S9gQCS5xVVCQl/pjBO3YH1S9Mcch1qDEDGpthT5JAAyg4VPMOmYKvU0tRY
         //Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DCrRB45TPzffk/SG7GSckRQdVqj6ZXw8oOiajo6TgQI=;
        b=AjrsX7xgEWHSzGjZOeWSlCmuA/zt09wDVzyjpRS7mKt+aNzr9ewRRxZW9uWAFMtUsy
         +A6Ed2RDq/Mg2VOxpgyt7fEgYIUkSdB1A0YCkuhxHw3Q06jSuhiwEwTtqlIuG+ifaQkv
         T/MGgjAn2yEmsrtOULX4WOBj7b4Rp3CLJQk5ssFtvYo905BPdHnrWjYNq/vUgjPjmeT9
         Sq8cj5rSXYFUHVjl+x8hgKKKVP2T6aeDTTnOfGLrJAJkmHUekZtQ6p/UdX+pKycLJqmi
         +q3dfC4u33zNWYJk2xKZ1XB+LKJYgr/Qudp02/ze3/ywszUoroV/2EzBJMqrGrLT+axM
         tC5w==
X-Gm-Message-State: APjAAAX6aIkuZnMHJ3SB/nAbUh4OLgrLXuAHvVEsuPFDK1PnF+XlubrR
        72eQYBS9yg18nqKI1Ptnu3/jHA==
X-Google-Smtp-Source: APXvYqy4BIPufvC95A9MJQDTfCl0bC0PyKdCFW22iNvtafhJog5HkDLu3m0vixfc3Ae+wpStOmoTnA==
X-Received: by 2002:a7b:cb95:: with SMTP id m21mr432615wmi.36.1571174456914;
        Tue, 15 Oct 2019 14:20:56 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:56 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 06/11] coresight: etm4x: Improve usability of sysfs - CID and VMID masks.
Date:   Tue, 15 Oct 2019 22:19:59 +0100
Message-Id: <20191015212004.24748-7-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
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
index d772765dcd29..d6fcb9fee97a 100644
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

