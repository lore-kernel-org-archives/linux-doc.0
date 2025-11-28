Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A03A32861F
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330960; cv=none; b=u+QZ+qldYtP7LbfCcJH63XhV7wWBB41APqgMX8xECG1ug/xjOBU4R0cpTRRNPFm7cXfa+pIoWoYNCVFl/jZWgB4ZQpPxax0kWHk1+huWBv5xutCo7oniVjBkctmGCXJAp5BsKOE5wGPE4frOy8OjgzkERpyzIqxkW/UdAtDbBhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330960; c=relaxed/simple;
	bh=wjiYRFIXVdtgR1KDlT5xFBdpOzPUbttF0b46AgrWpGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNKcfCcW6prjIeufjVV5VyubY42EKolLq+Zywulmbakg+A0InL7OfsCMJrqqPXzUv6+90Sofp11QlOaQoz84jJG56E5h+N47J9OwoXC/NNFu2QuHVsu1n79XG7/CzVbQgw1c5jjeiYw6ufweb0n6jLdskBSvb4tDbWptTMpIVl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZiSIOiuN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZiSIOiuN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso10460615e9.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330957; x=1764935757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0/Qi3NjbL8DWJLM+DALCaaRy9n0Hkgp5CNeZqwH6+M=;
        b=ZiSIOiuN/+WQyGptWSOWmf5GkGagpm2mgEa1qT55VbePMeObw+a2xdHiv+huZ66px6
         63mCFeaTYK5yjf2R5FRiwzC7LWLbzxduk69aZsST2uXJI4aVFLTkOJcAcFbYsg+zaI1a
         p/A63R3clHXp7wR2TxoiC8wL1RGikq9+4Rztf0mjoxtiVeGvgfMfhdGq6f43Myin06TK
         yDXLzcAa/Un1BXDQN43FXVgC/veSt2I6Vi/zHJxqca6VTxoY+JiKU9V9X4t1Felyw1va
         keIEv+SkKnja9o3Gmc5Skp7kVg6A5zrEmDHUBUfKKWPMo05NwPV1FiPT7SEAY9XcgKUb
         VZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330957; x=1764935757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K0/Qi3NjbL8DWJLM+DALCaaRy9n0Hkgp5CNeZqwH6+M=;
        b=UF1mxAGG4EoJzVwVYhXk0s0sAMho0Ol0OMrAtHl3clI92V1iJwFNCpIaxVBQ/qfbMI
         L1sEBgkfdzrxJ0dBjKFGqIWpn4zEfzRvK++jbaJq7eSDaTwJHOyP38wyKT+7r6fyNIl7
         747vDArLgN4tK1Vp+fCSALxKzzFTiacbT6WKWWEa8bao8avo7wmPxRSAC1hBySXB5g/C
         fpTcItIr2J4k/BomsTu/YcSHDsnL0O22gAiM+69vJKHVem1mhZWg9RWRtFfwMFspEF/E
         qlzZC7TTDaigmp+T9KyTqaQqokRaohCNK5Z49EXzdDhYZMdTN7ZRwdLEvEM0KefdoOCq
         wrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0hmf3xNmMpr6kZ0uHzV4rY4RjtDSIvwhVLA13YXxvRP5/n3flL8iOa+ecoRUvSXL68z1UmvC3NQo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoQd4r1/+iwq0u25dYrx6djJRt72maM6Ntm465dLe+8A990C8J
	cOi3xhHHShVvOWb1cdG1sT74Wb6AGm4PMLpWM7hVDY/STpGn0hE9B/nuoSlg0igjcs8=
X-Gm-Gg: ASbGncvDdGbCtRBz5KMpwyS2qzKMuxv4ixBEIB3PZ1eZ2T3YKfQWlPDixBlkkMrJHnQ
	8jp86toR6ylOCf0HFVWaZjBMyz1i6oTuSsFx3Go9W+N6/E4HPP9FPiMCn23LXu4fopShCL0kRaS
	DP+UjNDyGYoBQ2DYZygtmztPJ35b8yeArPdEaqwnpqC8B2ThkpgkIzvPcwyWU7l8CMGYnAQjonp
	k93Utiwqvl31ieKV9kXdQbCaknSkaB06O4ziON4ak/wen6esXX9LsA5JiXYSCxLHrvOvn2MNWqK
	OunHsgTk4DtdLmO+6zvoCvX127Exl4ETzGFySQcjmyQjMfL5Pz7QQlUVgVnvOSJ/9HrjbuK9loW
	e1njOemIqVNEicxxvW+g37qVuLIjFlbITtoEddifG9MKoR9T+2HS9IWQTFsMA2YSzNq6lJYF2V4
	h6UtqS1jqho2lVy0+QBPLl
X-Google-Smtp-Source: AGHT+IHV6cR5WG+cHm605aoGAD0fWpVavwZ5XX95yWGTIYMZtBRLmiZN7jZIjMp/OqRBrFXTsFoylQ==
X-Received: by 2002:a05:600c:3b05:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-477c00e7900mr301950305e9.0.1764330956965;
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:56 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:20 +0000
Subject: [PATCH v8 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-8-4d319764cc58@linaro.org>
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

The "config:" string construction in format_attr_contextid_show() can be
removed because it either showed the existing context1 or context2
formats which have already been generated, so can be called themselves.

The other conversions are straightforward replacements.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index bf4b105e0f41..3c8a6f795094 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -77,10 +77,9 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
-
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
-	return sprintf(page, "config:%d\n", pid_fmt);
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
+	return contextid1_show(dev, attr, page);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -319,7 +318,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -332,13 +331,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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

