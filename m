Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD38230D14
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154673; cv=none; b=tpg+uK9uUOtGfTFhEkMkaKW3EieEZfsg2KiwOR8SSk4+oWyrwjTsK+v9vrrpXQwuEukxOe9UCx7seQQFemwDREFCNxiXVk5Wv2smqRkLu4QLNYpTnWN08QDasWu0DoAAIct8cC9eqoZlLS8YdhUquvHCU0NX3CDnApACzCY1sbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154673; c=relaxed/simple;
	bh=TNcEQrNzvvULvrZwY1bi1KT31/DfIBlyOCzRtRN9s5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S2GFr8o+pLASLOAqZa3OD3w+Txnh/ps6NGmJ2muM4X+jJybsrS+CGuNVBtuS3oGb6JyP7QlKG4H5IfUbYTF9rk+A8H5H1DMF/aLSZQMnyWJqxE2WRWhKMuFP7OyHmiba2gT5NjUfX1uM1oxl4d7ADTGLU8HlFndM36vBPFyyrew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OkyK9M7L; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OkyK9M7L"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso43376845e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154670; x=1764759470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=OkyK9M7L6IOvvT6J+v0UGLo0uuw5r0xC08qh3dKepdFl4dbEJWPcKzVGNcaZaEcUSj
         Nib1ZduXnzxXdaJrP51FuHvUvAKJE0n9ms2Uy2nygxVlCwToVUKYfoCYXVIuLAH7XVg5
         F6THHDBwFgo+BJUhstFIqTfKVXINubo54iRnLcSqdU6dEZRu6tTX5R28YDN39Noe+IGm
         yTScUbKMP7PnYPwTRIiotTqxVD785GrICFhl12G6aGQUefAmkk+LslGgJLgqeHN9/l4v
         JVwfW5z/mA859QMKrvfCXMQfr90jnMQ0Kl+dE8R7e6KsUvL+SVyEg/7qvVmmOYVlwWNQ
         SogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154670; x=1764759470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=fSP4WRC1QdYg17epU38gU+trQDhdZvR7rW3Hxp+FuzjJ+Gcq4HccSvZK2eGrHaJbSJ
         S0sFIjvQ8N1+2pAjgtOmLNkh3P3UdC5jyKED7M6bqrwnqoEqEajqDP1aKifBkQZaAwUp
         EGuhnm2xHW/x+4JLZJuhXZ7G6vrCr+82lKur//F37CYxAX9ZyDoFQqVvP3B8ZG7Y6uZs
         ethgAmnY3H6/OTYnQGsyxSAifSkSwEyCCeIiFNo6PHBN/6NR9/vp3UEenrQ6pzeTo+e2
         N74aZb005xVT5cQMCCthJlud5Jt2Z25hQiwvyJDI81lWa9lFOxfaKKiCqJoQIFCbIcfw
         TX0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJF3NSZawmsLDklpZLTQmXttnDnNhK2ehyz6Y+j6+p0LAaQvm9CBaIy7rLmY3/JCC8cD/VsBnCQ5g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JNSWoAbVqKJekXBfR4gn6Uw+rcKZ0L77Id3Xw5YaAPmqTIyW
	7cLJq1KWs3Owd7hLO2zb1OwoGLla/o96IT4d7dZRV8SA/WkdhRgRmJkTdEFyBd18PCs=
X-Gm-Gg: ASbGncsWGBFE4+shkZxkJdZZnsr9dWScXs5lwd2hxQGIPu8vyLeqBRZi7fm2JXjJbJU
	x5KvpZW6kG6grg+8LoQyekOCg21cl1w4ci7y/+8da0dEV6WY8jWPsC+yCbepGqhDJ5O+sis5rD/
	II++JLmhUjQAOtwqhNQLti7nBbzqmBETFrLj8Ydx+DolAW9+22Nu+BX/jD7L7w6eji5xpDbSwxy
	bf6TAq8wkgCY/H1V/LGBsZAJ6DfkdaIwymdiyRqHua1P3SFhBi63zVwxcqJbRkZSqiRlFWphE98
	KO1zbMzvo7vAj2UOLnDKyEViJ0HwDg/dzfvTtOAmee00iufnhhMYFOmCkCsTVFAGXNjiLr7x+wB
	DQ/o3lzhBLU4NE0r8GzzUp0w4e8shCuTlX/g7R1CAuVYDBRRoHGYpEcbSttFV2S14Fqwc80NjR2
	Sd9XaiBcaTf6paSZguUYgH
X-Google-Smtp-Source: AGHT+IGJ2v0yxKZrimXOs4gdJGwyABW10H3d7x7EO5UfBg1Qo/N3VaSJ69gFaHjyPQmsOrFh8yPBvA==
X-Received: by 2002:a05:600c:3541:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-477c0162dfamr184534115e9.1.1764154670166;
        Wed, 26 Nov 2025 02:57:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:37 +0000
Subject: [PATCH v7 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-8-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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

