Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 580DE7DE57
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfJOVUz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:20:55 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41614 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfJOVUz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:20:55 -0400
Received: by mail-wr1-f65.google.com with SMTP id p4so9663204wrm.8
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S3UAHvYOfzaEuKOyFm5bIC6hR9X0XbyeBd523nH5LjI=;
        b=xcD5Ld1HPwUSEVIVpOpCpXkrJCxGgE0dzmg8piQwSelX0dhdTPrJmP9RPfDEKFHtOZ
         DxaSlUo2Uf5MnFv3cq1KcjYEQts+YXvhsyn1sZMD8ijkfC+t2EhF7Ha/xSJ6FinS9Nfj
         NqaduGkLueoeY2dbeTcNl/M/usynHnzlPxo2fRrZOqHC+lCI2i+Kq+CAUpKeERK8r0Sh
         lRluCKn4Wm9aRv+1QpYKaG9o+sx1RB34xNh0AGMnzeDvqWyqFRRhrxuTHvzNqVPhopkD
         km5zbIiICHfL5yCQJU9MpJLj64IJVTXpywzRcZzkS0aovrAKBx/ZxLXK90KQR96SZGL+
         ZGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S3UAHvYOfzaEuKOyFm5bIC6hR9X0XbyeBd523nH5LjI=;
        b=Kgn7A7YQ/1WQoWlcoOnX4JSKdesMaWr/8AX9mew7tOyw9QKRD0pWU+rIkCHQ+79KhI
         MkmDIuO2P36HehHRYkCtXanbocIxFtEsZS4hdVDZxQEapWpLIIBkXaawa1EnTnFg9V8a
         sMJLBAfidILyByUtU+IKV+3pobA9rwcfD9JOFcn2xvgZxC0CCxKwrn/uP6qT2akWLaVb
         LrV1/VVBDwvEE9iX+ujwuiw6U2pxT66EKh0iVf83fL0CvxEsiYmaddzyJZRPDjdgSDul
         mQTZcSZ/1gzCk4US3rnj1lkaBVjY/YJjfAj8q+8AWu/5qlf9d9R92FQ/7KB3edvplnn1
         nnww==
X-Gm-Message-State: APjAAAWZvr1qpdTqkRFjMn46wfBjnePmpXdMxSJxjrSWRgZrdxuhwZyy
        3G6tVzQeMWPFlQmhXAx/iG0/Bw==
X-Google-Smtp-Source: APXvYqyzczWIc0NWBtEJtC3oudlkwG9WnR9D8/zcSa7AAMvPP2xM3ZOa49CggmwNX4G9OF3hlwisiQ==
X-Received: by 2002:a5d:5386:: with SMTP id d6mr31586944wrv.155.1571174453471;
        Tue, 15 Oct 2019 14:20:53 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:53 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 03/11] coresight: etm4x: Add missing API to set EL match on address filters
Date:   Tue, 15 Oct 2019 22:19:56 +0100
Message-Id: <20191015212004.24748-4-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TRCACATRn registers have match bits for secure and non-secure exception
levels which are not accessible by the sysfs API.
This adds a new sysfs parameter to enable this - addr_exlevel_s_ns.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index cc8156318018..45fa7743eea4 100644
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
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val & ~((GENMASK(14, 8) >> 8))
+		return -EINVAL;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->addr_idx;
+	/* clear Exlevel_ns & Exlevel_s bits[14:12, 11:8], bit[15] is res0 */
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

