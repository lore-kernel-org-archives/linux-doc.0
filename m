Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AEB9C7D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 21:33:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726944AbfH2Vdf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 17:33:35 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34745 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbfH2Vdf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 17:33:35 -0400
Received: by mail-wm1-f68.google.com with SMTP id y135so2958584wmc.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 14:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fur89ambu8asqSKJ83o1wksXejtXLZa5zDho06Du8Wk=;
        b=jxEC2MTnlb5pZQa+aiOZCUHUnA9Cqx6SGXvbA8O6R665H+DBm8mi3HoXHPzYOQY0kw
         99FyErMxjuLQNjwXuxsw43eVSGI2+X3CuEGYUgtYS/WARvUiHGSQDGrEjDuFX6uLT7FR
         pnm/L8Hch/FnLR9Hwn3kfHSwv9npCyPJpOtHN667am68Ec5/KevjwfZ+CwZJRRH4g4m8
         n8flMMnYzpr+cxZWMm/C4bljBmDYs3yqxPjmaZYgm6JfryPRXX7n41oJzRuGOH1gwvyF
         GomML8e1qelCLTt0OGZvNBG9lk4L5GqGOY+u03mckTuZtMEb+mUfnsQYjU/KJSlHn5Uy
         tmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fur89ambu8asqSKJ83o1wksXejtXLZa5zDho06Du8Wk=;
        b=Ve6UOBsLLQUfbna1lpxlFTM7HD43vGuFnu90GmWv5dMciXcDm+Q90lusaCSeIlgDUr
         0Wm8OA1aX6ouwD8bJHWI5tNfEzfyGVZ4tyoLjxK/iUN7BXB/xkQSXGUnDTONyEHgFMki
         m1Cc1mdH1skafo/RP3cJw3f3wX6CwucQcOVLAnDHtCaw1rtVo41N19y21ABtN1n79xbY
         ylnxXqL+72XUghOH+TYSOg7xAJyMY5emBIgoAwmr9r8tBgH7lBugg8vlfvkOG7ELEi9i
         VtqVv+/uYhuJ2840KXeO7fc7iiO6KKEMjR61Dg7oav88pZqzI1aOks7TjhLu7Cfx7Wxe
         lHIA==
X-Gm-Message-State: APjAAAW1fO4ARNJGwcsRwnR24Esk4HnFmKbS8FdAlZlgJ1jvPPLeWWIV
        9Dsag/NO8SfElR9lttNaBdPc4A==
X-Google-Smtp-Source: APXvYqyDlvJS5ipd0Z9JZJ7tBVbuqrlRIBk11+3pGl3pXYiJbtmfVovrJvxYjAxjVwtCVQcTcJXUbg==
X-Received: by 2002:a7b:c244:: with SMTP id b4mr13814780wmj.125.1567114412966;
        Thu, 29 Aug 2019 14:33:32 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:c44b:1415:84d1:2692])
        by smtp.gmail.com with ESMTPSA id o17sm4515711wrx.60.2019.08.29.14.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 14:33:32 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     suzuki.poulose@arm.com, corbet@lwn.net, gregkh@linuxfoundation.org
Subject: [PATCH v2 03/11] coresight: etm4x: Add missing API to set EL match on address filters
Date:   Thu, 29 Aug 2019 22:33:13 +0100
Message-Id: <20190829213321.4092-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829213321.4092-1-mike.leach@linaro.org>
References: <20190829213321.4092-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TRCACATRn registers have match bits for secure and non-secure exception
levels which are not accessible by the sysfs API.
This adds a new sysfs parameter to enable this - addr_exlevel_s_ns.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index cc8156318018..b520f3c1521f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1233,6 +1233,47 @@ static ssize_t addr_context_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(addr_context);
 
+static ssize_t addr_exlevel_s_ns_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	u8 idx;
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->addr_idx;
+	val = BMVAL(config->addr_acc[idx], 14, 8);
+	spin_unlock(&drvdata->spinlock);
+	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
+}
+
+static ssize_t addr_exlevel_s_ns_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t size)
+{
+	u8 idx;
+	unsigned long val;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	if (val & ~0x7F)
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->addr_idx;
+	/* clear Exlevel_ns & Exlevel_s bits[14:12, 11:8] */
+	config->addr_acc[idx] &= ~(GENMASK(14, 8));
+	config->addr_acc[idx] |= (val << 8);
+	spin_unlock(&drvdata->spinlock);
+	return size;
+}
+static DEVICE_ATTR_RW(addr_exlevel_s_ns);
+
 static ssize_t seq_idx_show(struct device *dev,
 			    struct device_attribute *attr,
 			    char *buf)
@@ -2038,6 +2079,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
 	&dev_attr_addr_stop.attr,
 	&dev_attr_addr_ctxtype.attr,
 	&dev_attr_addr_context.attr,
+	&dev_attr_addr_exlevel_s_ns.attr,
 	&dev_attr_seq_idx.attr,
 	&dev_attr_seq_state.attr,
 	&dev_attr_seq_event.attr,
-- 
2.17.1

