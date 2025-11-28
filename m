Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5B32572D
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330958; cv=none; b=Wtl1hSXcvN1W4dJ9y6/F8dyjnnbQTmpOpftG9U+brqPQJ6ChhRH4t3A/0mAqUWm0FeHQrkp0nv+m0wCuuqO5xVH8O3ylcuKJp4xYPB62HDHnjMOR0SQ3HOVsYL9uehGnRQ7AyovisNLyC72npnmQiKzm40Fb1H3KinoaK5ltgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330958; c=relaxed/simple;
	bh=my4t4Zpp3sJgeh5MjovHvwT3pYLLhzF0nierX1jtTJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiYPcA3IfWwqZs9dR0roIgWCyuvE5s8LFa5NWMNmfWYM0Y92fR+fZYU1QhJ5o2NYBL/CjUm6t5D01WWsZE5GHbrrynqUCB/WhkyG8jTad8rCvE56OLzGzqj5jaqGMd38abl/6uh4krjT3AelTpQQ6o1rDKOkYT8br0WG4yT6BQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XTMDHbPx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XTMDHbPx"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47118259fd8so15247145e9.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330953; x=1764935753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P6NKswHRt2B1T1Lth0kajA34+egQTqFsQQ3qShHJFKE=;
        b=XTMDHbPxS9snz/aIgff75/Qeo4eFx7pff1azBWSGZhYceSoA2oFnHf8601Qst/Ve80
         jHwGDzBzboLyhJWbA13Z+twiWeYhbc6OJE7927kCEknFlEFucYs45Rc2fYudsQDGuTjn
         10MFdWHrIe/XuclbfUenbSZkG6Spy6ki/wg1u1KZXJlCUiSto76X4odSjeASudf8SFY/
         MYMELVYIyrqF+9rB3m1ps3q5JBClbim3wdAcWGkbBn3oJxYvRJQDqkTVEzSyNHTn0ZEt
         LhnwKfJ9dtqhB2nv5zYPCFwda1HbR+P3wFBo2UO0F50FiE9PJ85jJbM3LezlZagNbed+
         7VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330953; x=1764935753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P6NKswHRt2B1T1Lth0kajA34+egQTqFsQQ3qShHJFKE=;
        b=kl2BsLx2MzSxNfoMaUq1r5pHmFFP5pbkeVndUacPnbQED2BfoAA3iP//ULMacW+89o
         UqHUeOJvuaRuJNs4SoBy0E9C6NJDU7SZ8XHq6i/OuxZJNc5H4zY17OVP4RQ3F7sE6HJD
         mxDYNMV8oNa0DXLzvDZYxlHsy/tWmfb9Krlz0QnrpWFW6Af08BeIb/9YlPjgvqkJGUY+
         n5Cvfzlik1S5OmtyOLAGUkrqUp+yyk+lWL3r20u+iwvUXRfI5/UYZl6vqf0BgAQQP2Yv
         d19/ek3/emYJ6QeW7Il1xQev/oBey+ecx21ZWXT7epa3uM5sxJUMVURlJiH2inMTgBiL
         z7uA==
X-Forwarded-Encrypted: i=1; AJvYcCV2P0nqscuMN1NafSvBYghSn/OirgfBQnA+thxV/FfIvktGdhl9z19TAUrQr7Em4bqX7+VuP5vEU84=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywf5d2xUg80jL70SgrNhIl61A0rJZVrV/xS5u1wneOI2hX0tfE
	1DXD2fuBqlJArVlsxvum/kVfcyMU/OxpR4uGhbtfSn3sR3YPbBXPM32OlXQA0EX09E6p/RkIjV+
	fQ2C3
X-Gm-Gg: ASbGncsryye38XiRJ64H93IFQt/xFctbWTbrKU4Wxr8Dd4MsxkSzXzPR2sPxLU5WJEk
	y2R47lQ/F3WJJQ9LjjURdiCOnJ2A7kiEtKQqNT3+LTvT9wGFJgkfEwS3BbWA4hgH6/zlcrRSaaB
	/FOGqKT8tw/MR2oQTvPICRpR8NfHjFdxg3tUScRgyTwHCuB+GPgerey7KrxlIzd7W23g6Q/iOjg
	cDm0BqooeCCwhslYcGUs9X4n4JFtnSlvu/tq9LLnhu4QSgxg9T4GkssEJoj2E+fUuehgYGeBs1z
	HpgiW7iWysxLMA1g3sl/qJyzpU5goUkr6wWjUokD3p9nHt3NYr9i4T28ykjT3PNwyF1b2Yb+38Q
	of2QDsQKij7Er6hDMJBeyy4UF7yHeatuumckoJPD4X/ZmmYuVqwPZRoQxpkwzPSluIOIqo4bQrk
	unVAccSwJM1FV811qGXwzG
X-Google-Smtp-Source: AGHT+IGG6SyR+Pc3XkdqQLhR9KbEorBs/XuSc16Qz/v7snsfS3YnRvRgeWVwY1cYlOPb/CmMrFBsjg==
X-Received: by 2002:a05:600c:4f46:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47904ac44c0mr158757575e9.2.1764330953033;
        Fri, 28 Nov 2025 03:55:53 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:16 +0000
Subject: [PATCH v8 04/13] coresight: Hide unused ETMv3 format attributes
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-4-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
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

