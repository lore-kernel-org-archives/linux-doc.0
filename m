Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E3D365A09
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569108; cv=none; b=sucV4Ss9uK+MVmap738kj0C2S19XMoZXbAIM95VAkIE1FtToVU89VBDcExQvKfO3E8X7A8AXlVlsEZMkw81fbXnfu7S0IZLuIWf+xfDqAQq0Mf7LdTcl/lkjVoz+jJbZw/TObT5yEN6e0+FsthjnZ9p3s1ZnQW/NsfUrXJwFmGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569108; c=relaxed/simple;
	bh=y0uH2JIsR1ckKfT5XvBYCwc/pjH6dlHjIQGHKnw4WtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OkgBfzI3yYxUUk092mHLN12q+3C/cVFLLKTSP3zuNOAkACToXte7lkFeYJRyPWNcAbOy2UoL47RZaenPBvsS1t6m/0hUM+1gZTLTdSZsk0YBXiI2QL0eCRVzQu775UcYNP9WaftQIgP2wj+pdQsmDDNLYLbYXWY+vUUpKt/Z1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YODsY75K; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YODsY75K"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so37187435e9.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569103; x=1764173903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJnX1IssBDUYwxbPMQpT21RQj6R52sfQCZ+gQVVjaes=;
        b=YODsY75K5zP2S95alPsqWdFJwU6Io4NGPA0G4uQOq9pf3CrtvoTXSRZJtWnyk3MYPD
         Cz4TrVnO7gHBMwHThbiiSwntLmohXsSwlBWhN/Ba2ojNBXoB7HM5fgo/wnzynBLB3FQN
         8yWxc98z1qFwqRKYG7dImDj5RHXDzS4Rp1N4V/PuOD+w5j+0/n0MtTy8yiAGFCB5XY8l
         DaYF5Y5XoyYlj4VRGID34LDHUp3/AyJSNdbc4zb8KnM3IZrshAKZvR3cHsqOixsSXxJS
         l8OtIKbTTj72VNKMkNTEN2yvp3Tey6vSCt/sFeQ+Pp6VWpJ+y0I/O7i9xtaU7H5EADdG
         4G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569103; x=1764173903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJnX1IssBDUYwxbPMQpT21RQj6R52sfQCZ+gQVVjaes=;
        b=YfvNurzQRA7+MhSEGtEoXFIWpeeFc1VceTruVf/Diwqdu63B34qOX1I42bNejbRtoT
         2X1R7Ss951iviu4vy6q1B1qkQbpnRH0Zu7T2Pz93zl5PckKr9GOPK9JaRrV5FKzHrs5f
         divOCdQxop1PW6ngj0vEDgRAwngJbjbK2ZpURUvpjZs/wg5/91SQHMNUT9084teRors8
         PARrNhkz/3AJCOvsqoTUFtoqwlr7w2tbnh9kzUvEPU/xQ5V9/NoX0AC1s6bNSjLdzqf2
         xy2G/nWz7n38fnzeGaDw165G/60+J3reulDwnNEWKGVJLdBzrB+eoMD7jB9EUSiY0AWg
         qovQ==
X-Forwarded-Encrypted: i=1; AJvYcCUztLKnCyJxzKC1DwoKPJuLiGfhVfntSubx6m/YPooKe9xb0qNb3D+/9S8oy/HhZFdeEJ4HidI/hW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSguc/BFUCt4qU0Io4waZMhWzpOpfkIxSvioKZVxXJaF/3+70+
	og6KJamOxuydhOt0pfhUN74HICEVj0JoitGbO1oHORgX6Ww6m4pLKISCatIdieKgF2U=
X-Gm-Gg: ASbGncs46Rgkl2qSYNZkD883Xt0cvyYZ0cauyeD3hDtxrGg/lI2BugR/W7w7vqunODV
	F70fvi7XBVkTv+dXGGVju73zYEfNZWMfZkhiQvguAYZIgZCbshqKyZ6wmb5rURicA1HcaZQb90e
	K19wl2rs30sCUIZWRZ2x4iqOSE5e0JHua7f1+2i9j3s4iSNXl1CqsnnZAbFui2Im6Op6InmQ6HF
	PRqisuY0qPycw8gyyEYdm72ESFZu8Qlnhgbqn2rGb4C1XESzFT73AyWvKjek4rY+v3rDw0cr6fh
	lLeRPGJOoRIhghzyZ1K/y41M/pjd1KPhQp4LmQ29giF70Ttpnkk6skEmlQriWvOpRNwSdvHw7TI
	k/zCQiZoMRdZkrBHlRztYcZMqr3nL/ZGxdZ8XWHQ8u7WPDtljvoDXDTmmDYQUetuzjFpZS7zsKk
	bQhesaYxkHDQJLt6rAsqg0nz7/lltUPkY=
X-Google-Smtp-Source: AGHT+IERG1RqFDP/vomohLBpJJq4UxABCONp2aW0eCI+GJF8HXVx2/qdo6JpRsSGCuMFRUh2amzmJA==
X-Received: by 2002:a05:600c:3105:b0:477:569c:34e9 with SMTP id 5b1f17b1804b1-4778fe95ff8mr203233935e9.23.1763569102729;
        Wed, 19 Nov 2025 08:18:22 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:22 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:00 +0000
Subject: [PATCH v6 04/13] coresight: Hide unused ETMv3 format attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-4-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

ETMv3 only has a few attributes, and setting unused ones results in an
error, so hide them to begin with.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 37 +++++++++++++-----------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 17afa0f4cdee..3805282b97e8 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -50,27 +50,23 @@ struct etm_ctxt {
 static DEFINE_PER_CPU(struct etm_ctxt, etm_ctxt);
 static DEFINE_PER_CPU(struct coresight_device *, csdev_src);
 
-/*
- * The PMU formats were orignally for ETMv3.5/PTM's ETMCR 'config';
- * now take them as general formats and apply on all ETMs.
- */
-PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
 PMU_FORMAT_ATTR(cycacc,		"config:" __stringify(ETM_OPT_CYCACC));
-/* contextid1 enables tracing CONTEXTIDR_EL1 for ETMv4 */
-PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
-/* contextid2 enables tracing CONTEXTIDR_EL2 for ETMv4 */
-PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 PMU_FORMAT_ATTR(timestamp,	"config:" __stringify(ETM_OPT_TS));
 PMU_FORMAT_ATTR(retstack,	"config:" __stringify(ETM_OPT_RETSTK));
+PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
+
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+PMU_FORMAT_ATTR(branch_broadcast, "config:"__stringify(ETM_OPT_BRANCH_BROADCAST));
+/* contextid1 enables tracing CONTEXTIDR_EL1*/
+PMU_FORMAT_ATTR(contextid1,	"config:" __stringify(ETM_OPT_CTXTID));
+/* contextid2 enables tracing CONTEXTIDR_EL2*/
+PMU_FORMAT_ATTR(contextid2,	"config:" __stringify(ETM_OPT_CTXTID2));
 /* preset - if sink ID is used as a configuration selector */
 PMU_FORMAT_ATTR(preset,		"config:0-3");
-/* Sink ID - same for all ETMs */
-PMU_FORMAT_ATTR(sinkid,		"config2:0-31");
 /* config ID - set if a system configuration is selected */
 PMU_FORMAT_ATTR(configid,	"config2:32-63");
 PMU_FORMAT_ATTR(cc_threshold,	"config3:0-11");
 
-
 /*
  * contextid always traces the "PID".  The PID is in CONTEXTIDR_EL1
  * when the kernel is running at EL1; when the kernel is at EL2,
@@ -82,27 +78,34 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 {
 	int pid_fmt = ETM_OPT_CTXTID;
 
-#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
 	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-#endif
 	return sprintf(page, "config:%d\n", pid_fmt);
 }
 
 static struct device_attribute format_attr_contextid =
 	__ATTR(contextid, 0444, format_attr_contextid_show, NULL);
+#endif
 
+/*
+ * ETMv3 only uses the first 3 attributes for programming itself (see
+ * ETM3X_SUPPORTED_OPTIONS). Sink ID is also supported for selecting a
+ * sink in both, but not used for configuring the ETM. The remaining
+ * attributes are ETMv4 specific.
+ */
 static struct attribute *etm_config_formats_attr[] = {
 	&format_attr_cycacc.attr,
-	&format_attr_contextid.attr,
-	&format_attr_contextid1.attr,
-	&format_attr_contextid2.attr,
 	&format_attr_timestamp.attr,
 	&format_attr_retstack.attr,
 	&format_attr_sinkid.attr,
+#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
+	&format_attr_contextid.attr,
+	&format_attr_contextid1.attr,
+	&format_attr_contextid2.attr,
 	&format_attr_preset.attr,
 	&format_attr_configid.attr,
 	&format_attr_branch_broadcast.attr,
 	&format_attr_cc_threshold.attr,
+#endif
 	NULL,
 };
 

-- 
2.34.1

