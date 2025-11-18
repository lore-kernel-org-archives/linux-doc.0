Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E133A5E62
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483305; cv=none; b=bOOVRhWxSDokP489J14kSOJxOiHO/piN9mhiPYu9xIPmkjzggHHns37jIaTfiQLaCbYbu6tAeJtQ1YpV+iChkK+5cxSLEnn7B15ho4AFEp7tkwpl7LVaEcV7pQfRSXIZoOFipg+WLQQwSVk/MTKFazG5sllEXcRnROavHjNznkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483305; c=relaxed/simple;
	bh=dzP9hXvjEFYTJ+sYEH3OS9fqnJEZYSr9lDuXso7NVaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZk9FXjkKTGTXBaFIn2aeqVERlsbLglnZjDDl1qXgPPyjYcTaXwNEnNeIAHnvv6U8UGAlT2jRdGkF35nVI0qvui98kaRpIjtnmJtF8blF1ED6lAjpFQ8MjNRDypp03Iia++sknuY7f992/hNnXNAo3twklYNBrh33sIrOrG6QIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6SIGZVQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6SIGZVQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26952725e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483302; x=1764088102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9PmA5gGpR/tWp7wz6WLiRdtF8z1fVXXlKYB4lN3jNM=;
        b=s6SIGZVQ6ET2YQ244cAn/t/dKNMZXalrQef//gQMJ+9tuyhisGohw1xf76rRHdQUG9
         IcMGiWfIN2Dq/r1PDwdQQm0T8VWcbt8B3LQ4npcuD1mtQViwUqvPRDMtEduKHWvFbbfZ
         3yWul+N1oxc/ZmJg+BReE7wIBMvw0+6bNh6Cyy5szRyfKgFeIO0zswHzecDVle/CHtjm
         hTWIswpoM49DIMicoFTmzZTUBWn7f0m2nHSyqmJKNmtEVc9r+ChXN0eQwR9c0hxPy+yD
         BBPVB1QlL7i1sSUHKQsqtYxsMdo12pFiY7yKIvoZqvjPxI3YyO+lOD6XCXrOZVmOGbRd
         4D6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483302; x=1764088102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9PmA5gGpR/tWp7wz6WLiRdtF8z1fVXXlKYB4lN3jNM=;
        b=lhq6cA8UIv8OsGy9Uw6rK4VOLWWvcW/vX6X465Df4/KO/8jOqFzJyJb984B9i6Hnss
         lf3CSdtdq5dFhTFMbs0lvP0VxL0/puXJk2kucXCt/B6wKPT3S0Z9Awp/i4sBFM9ZqdPM
         GRN20aBbvre6ke1pcgMTIhQIljtaUXdLJtRyGp0OXe/szuQL/yrmAR7Q9XG2BOOBtUzn
         Q70t83k26U8kEGLa733kercTbKMgV9kHvUkLnwPNfbPodW4nOLSFNs4FL/16JwpV13OJ
         HYgf4u5deyCOFi8LFk9AAVczwQHCj6Vid4jSw0GxqLzoUN3Ev+16bj8izjfUxA1In/K8
         tgfA==
X-Forwarded-Encrypted: i=1; AJvYcCUyEl0Bfj0LFhKP3ASR9eKPOujDY0RGOvKAC9QeWVizf9h06caw900k/7bzJGu/ea0wSif1AQoSz4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuuJfJsIRjZXYK6df4PlyfNgnnivPDs03WIrc78W/2ZbOd7ob
	vqyFVAiYkqHh67mORmQCRGwVbKfonqexT+sNDogHw79E7JiMMo+4CPRBfB37KbcYFGs=
X-Gm-Gg: ASbGncvek4EaiJsCcpen4Jz+3ci2WOhMAs5dMGdwh7RpaQuHTij50llXGgOeByYYKaz
	rfZ5VydyIbdaut7HlbDjcYzM69Phwj06HEf8hUqTPskOL1Qf6hw8LKDMQ+zNj8ZurA6YQIUwhHw
	VhlEVR9uoOSfqlk0OqL1mu5/+5xNBIl6Rs4GAeXxDz+I1HLLwLBBk331R8rQRcUt/vk6WR0Msvq
	QxMTbABdsAYIpoZtCZN2k4hWK60d+pIoF+6osd8ZOxODi+lk+Lf4CCNhuZoQBeEUs9ZqrI1UIC9
	uVHoYwD+0yPc4Ir+PaoToz/k9qglmTbM5/FI8J6HekcY2CN1a28MlWTesLJBPSKDX2sjVmMrzaG
	+nvOeY7x7QdKy9ViUy6JF7MsRjzLHLnLYixce19MfQA9ncuxbG+cRsMFMyTZBRkrW+05TqE7Qs9
	cUETbzJkle1iSxXYzrMRSgv2EoQug0C6U=
X-Google-Smtp-Source: AGHT+IFBsfyqI4nfvni5vPvJYY1wHrZ3i9XROTrpO6sjMJMIe4fE7Y8UeZdT+PEXWHCYRfnXU1kcgA==
X-Received: by 2002:a05:600c:4685:b0:477:7a1a:4b82 with SMTP id 5b1f17b1804b1-4778fe5fb4amr166705645e9.8.1763483302373;
        Tue, 18 Nov 2025 08:28:22 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:21 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:58 +0000
Subject: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

The "config:" string construction in format_attr_contextid_show() can be
removed because it either showed the existing context1 or context2
formats which have already been generated, so can be called themselves.

The other conversions are straightforward replacements.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 26 +++++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index 28f1bfc4579f..1b9ae832a576 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -80,12 +80,19 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
+	/*
+	 * is_kernel_in_hyp_mode() isn't defined in arm32 so avoid calling it
+	 * even though is_visible() prevents this function from being called.
+	 */
+#if IS_ENABLED(CONFIG_ARM64)
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
 
-#if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
+	return contextid1_show(dev, attr, page);
+#else
+	WARN_ONCE(1, "ETM contextid not supported on arm32\n");
+	return 0;
 #endif
-	return sprintf(page, "config:%d\n", pid_fmt);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -337,7 +344,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -350,13 +357,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
 	INIT_WORK(&event_data->work, free_event_data);
 
 	/* First get the selected sink from user space. */
-	if (event->attr.config2 & GENMASK_ULL(31, 0)) {
-		id = (u32)event->attr.config2;
-		sink = user_sink = coresight_get_sink_by_id(id);
-	}
+	sink_hash = ATTR_CFG_GET_FLD(&event->attr, sinkid);
+	if (sink_hash)
+		sink = user_sink = coresight_get_sink_by_id(sink_hash);
 
 	/* check if user wants a coresight configuration selected */
-	cfg_hash = (u32)((event->attr.config2 & GENMASK_ULL(63, 32)) >> 32);
+	cfg_hash = ATTR_CFG_GET_FLD(&event->attr, configid);
 	if (cfg_hash) {
 		if (cscfg_activate_config(cfg_hash))
 			goto err;

-- 
2.34.1

