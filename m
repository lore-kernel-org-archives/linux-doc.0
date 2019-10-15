Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0CD87DE79
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbfJOVVB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:21:01 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40494 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727343AbfJOVVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:21:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id o28so2909354wro.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Oct 2019 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=alLGJNyVbZt7KtVg3svRAQohavR/n2a/uHVAjbCo+ys=;
        b=Il5KPxhsnxm+Ix6dhPSpK8HRTsKtqHrGi6vQ9B32L+KB5lI2iQM7q2rX5lNgxBZOAj
         sTxK+FQXLWS8NNlBwBSn2RemW7KmzzP1SIi23IUKkgFUD4Vz5NFVSXqfM40bHG9ywp5L
         1UdLhA1cG/g+DPMwAKB1ZdZiCkVE9ijj5PhrTvqxwIFwENPVwLWdyyyDopnzsG+7FAPC
         8ncZ4P27r9qnPSa7VKYt8jgJAt7qsd9kZ3j4cffLY4gOhhMKB0K+26uuZdq75L2mRUfZ
         0HKO3jeMkq0nV0bMOSB2oj7T3jVoZAtLIFeM4gsp6lGEuMBX4zChruTqJykbO6VtrV/Q
         zvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=alLGJNyVbZt7KtVg3svRAQohavR/n2a/uHVAjbCo+ys=;
        b=U1bYlPM10DUa1NF12e8Of+9kbHKTuxJfkYUUrjP8hrdp2mo7n3Uva4sup/S6zPe4rM
         o7/ce36z/kp/rRyHSq5PJ04520GunJ1jdR4kB4+JIPEz7KCbkwNfepXLaJtpBVwuuYZA
         2ZOnJQ+vyr6c3JCj395ctOc32D16Hb+PSlS8nsgX6tGRYl1QjzuNJNQw9PvGxVmq76xQ
         F/D+yZ6FL7Tqx/4HrqJrP/B35uaNT752b4IU5DiG+zcRDLRrSdAXICS/ETSeKOAFzLPQ
         lDCx1K1Q7ekFXdBekp8ZvM9MvthkFwWruY3UUjVJVIH2ErpuFuP6hUbq4fe+ZDccZR04
         QgXQ==
X-Gm-Message-State: APjAAAWx+ANVZqv3sLKPiILxBSXGx02us07tfqmYYFj8XlEBmEuECByU
        6nhh6TZW8ZpPQu1QlXqR7cMfGw==
X-Google-Smtp-Source: APXvYqzkHH8ZWehVkIFHGRN8tgNXwkkU2U/LLCNdx5ni4mo3xTpD80O35029jqeWSB380+7UDX4RGw==
X-Received: by 2002:a05:6000:1252:: with SMTP id j18mr3244847wrx.23.1571174457936;
        Tue, 15 Oct 2019 14:20:57 -0700 (PDT)
Received: from linaro.org ([2a00:23c5:6815:3901:39d2:21a2:678a:9501])
        by smtp.gmail.com with ESMTPSA id g185sm517649wme.10.2019.10.15.14.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2019 14:20:57 -0700 (PDT)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Cc:     mathieu.poirier@linaro.org, corbet@lwn.net,
        gregkh@linuxfoundation.org, suzuki.poulose@arm.com
Subject: [PATCH v3 07/11] coresight: etm4x: Add view comparator settings API to sysfs.
Date:   Tue, 15 Oct 2019 22:20:00 +0100
Message-Id: <20191015212004.24748-8-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191015212004.24748-1-mike.leach@linaro.org>
References: <20191015212004.24748-1-mike.leach@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently it is not possible to view the current settings of a given
address comparator without knowing what type it is set to. For example, if
a comparator is set as an addr_start comparator, attempting to read
addr_stop for the same index will result in an error.

addr_cmp_view is added to allow the user to see the current settings of
the indexed address comparator without resorting to trial and error when
the set type is not known.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Leo Yan <leo.yan@linaro.org>
Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-etm4x-sysfs.c         | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index d6fcb9fee97a..ca1a54411225 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1275,6 +1275,57 @@ static ssize_t addr_exlevel_s_ns_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(addr_exlevel_s_ns);
 
+static const char * const addr_type_names[] = {
+	"unused",
+	"single",
+	"range",
+	"start",
+	"stop"
+};
+
+static ssize_t addr_cmp_view_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	u8 idx, addr_type;
+	unsigned long addr_v, addr_v2, addr_ctrl;
+	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct etmv4_config *config = &drvdata->config;
+	int size = 0;
+	bool exclude = false;
+
+	spin_lock(&drvdata->spinlock);
+	idx = config->addr_idx;
+	addr_v = config->addr_val[idx];
+	addr_ctrl = config->addr_acc[idx];
+	addr_type = config->addr_type[idx];
+	if (addr_type == ETM_ADDR_TYPE_RANGE) {
+		if (idx & 0x1) {
+			idx -= 1;
+			addr_v2 = addr_v;
+			addr_v = config->addr_val[idx];
+		} else {
+			addr_v2 = config->addr_val[idx + 1];
+		}
+		exclude = config->viiectlr & BIT(idx / 2 + 16);
+	}
+	spin_unlock(&drvdata->spinlock);
+	if (addr_type) {
+		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] %s %#lx", idx,
+				 addr_type_names[addr_type], addr_v);
+		if (addr_type == ETM_ADDR_TYPE_RANGE) {
+			size += scnprintf(buf + size, PAGE_SIZE - size,
+					  " %#lx %s", addr_v2,
+					  exclude ? "exclude" : "include");
+		}
+		size += scnprintf(buf + size, PAGE_SIZE - size,
+				  " ctrl(%#lx)\n", addr_ctrl);
+	} else {
+		size = scnprintf(buf, PAGE_SIZE, "addr_cmp[%i] unused\n", idx);
+	}
+	return size;
+}
+static DEVICE_ATTR_RO(addr_cmp_view);
+
 static ssize_t vinst_pe_cmp_start_stop_show(struct device *dev,
 					    struct device_attribute *attr,
 					    char *buf)
@@ -2120,6 +2171,7 @@ static struct attribute *coresight_etmv4_attrs[] = {
 	&dev_attr_addr_ctxtype.attr,
 	&dev_attr_addr_context.attr,
 	&dev_attr_addr_exlevel_s_ns.attr,
+	&dev_attr_addr_cmp_view.attr,
 	&dev_attr_vinst_pe_cmp_start_stop.attr,
 	&dev_attr_seq_idx.attr,
 	&dev_attr_seq_state.attr,
-- 
2.17.1

