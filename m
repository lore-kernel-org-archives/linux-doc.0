Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEDB33D6F1
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960959; cv=none; b=SAdPf2oJOZu0uHAP8oEH53OfX/h8jQrwMhrqLU2tREYiNatwZNdnPPRyqpniThTrKuUh3GtJlFLhAonU+qtBQAMtjITKjb7G6qw1TFgf+9J7Vn8wKNgNIypAuQvyvVK82e2tK4f32h6Vpt/LzW+xEdyzzuELoKqbjc2/wPYZsW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960959; c=relaxed/simple;
	bh=1D6ao/Bm/0EBOm0yR+7qj+Q6nV0W56TWm4eeVFjArZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQrqKZO/RTm4AAUiNDif1vIaIv4SnLhxE1JuO40aac+JN4KWFnT1QJcDww7KbmRdbQWuCiwdS69tvjOpUgxR4aFZTRSNZ70787jtSOoiwLAv/mdGlo6sMO04XLhWj9PVypAF66aJ+ki9S1jRDP8vh6Suef8MHXTqWrddiIl9YZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wy6wRMt4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wy6wRMt4"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b32900c8bso550683f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960956; x=1763565756; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUj0j3n1vb2Wu9GInL+qCS54uhf2SL5HLPcj1zO45w8=;
        b=Wy6wRMt4wyQ0Rg2ay/ZNCnfCZ0lrmTskbgXDkdtRR7gdc4KmTpS92Ty3g8UJHRpkpY
         XXYtJNSRCOaHPYzlLpJ4eXgFWZpU98stod5MpYQfGFTXvMFzhdZ0Nbhx64S0m1jqrDqx
         RuJCgV6Fj2RT71XC8oDdmK+/UUPMvqg06I539pppM9vX0K7M+SmRULo4grf8SGy6CCTl
         UalSaEUb/oe4PPmdbGu7N349ejpi9vsUMmxDAzcsxCdQB/nylWy3NEgp/67yrdeErl3P
         37DKmzwn69l0/1BYpfeNq4yTYAO0w174quaAMIAKjgFsau2FOtQzxNataMqJp+aTGpmp
         h3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960956; x=1763565756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUj0j3n1vb2Wu9GInL+qCS54uhf2SL5HLPcj1zO45w8=;
        b=RTJgHIr/HnHe77u43xabcOLBt40KnjwypaSuXpOm+h+aMNu2yu1V9WulAx4fihHk9Q
         hfQJ/0UIFqV8+q/fo5Vuh+CZlvVA/zWC/XhtCQ0uzhQoOHYMqD1vg2pghiJkWxhKcxwf
         CR7I3ry9sl8i+FsO0MaoMAAFJvEKXNzJ6vruJstuj8vwSX8XgEdRGfUemOuUPdN7SYi4
         yzcBiRPqTCrNqTHMc9AtM0Jyj5deZ0Ue6zU0EKNp+iY7hKYJPQDWXowi7yQixqoxuyjG
         77ks+GDSjZRUd5gVwRqgDMVnwWViwJDfuWoL888cVpc/BZgXFgQNDf5cNab5iITiKl05
         QUTw==
X-Forwarded-Encrypted: i=1; AJvYcCUA3HjlurK+nCwKVtfgFJiElp6bnyL8WLLmSnpvJyY+Ft5sc+WsikcXAjQWpxU6JJ1T9+YAZRDOc2o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyswroe7diXwzEocJoMSmusfs1FfOJ0zMW4q9s1RCQxziULWEtd
	jwfKJ8x0lNFuWCFz8kCSEXQxYhYcu4dGLBVJFYoVQhF4c1VvBB2HpUHxQlMxXHayMJc=
X-Gm-Gg: ASbGncuiWPvG9ES88N+iqJOrjSvPaq37Q5i/75HiNpmjIFzeDE72ZG5GcBhyRZpVS98
	f/ThXC0XuDWvarSCKy8v5oC7gJFc0xGvj1+zfUtdKJu9zQyvS2ivRdWOSShF/jU6bb6QMqdE6/P
	8bupc0NyjOhaFHgtqd6GXfwm+wAsn2R/6s6v+TmwczTGV7ha6P38xCvTSDMt9se/3l3TIyx30xz
	ADySmxNn42aAtcj/UAXctabPpti0WVAv4Idvn8ND0GqIC3PqniQfWz0HDASjyy1tMSkEUUH/PC7
	K8fpTZU+SKdjGCuJXncoaBqjH6L1TAiFySH/lyVXJvSwSh/5PRHhyD82VvB9+BQR6Qj/qSOikiP
	npAlpuVuKPHFF1ZQEDc0OkK3j9MnVsCIWAviYa/VXcw8Q7C0Cf7sM5AHN65q3cZCXePz603SYBK
	KmbeMIRNVezA==
X-Google-Smtp-Source: AGHT+IFlw5Lz/ACVGaZYBTkar+BWPh1yCKM0EeqPcMg7SFjnpxyLc8kUfqQFePDdrWGjsDSOCoDNlg==
X-Received: by 2002:a05:6000:2509:b0:42b:3e20:f1b2 with SMTP id ffacd0b85a97d-42b4bb8b8fcmr2593627f8f.4.1762960956140;
        Wed, 12 Nov 2025 07:22:36 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:35 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:14 +0000
Subject: [PATCH v4 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-8-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
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
index d19e2568a0d1..7272e758aebf 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -80,12 +80,11 @@ static ssize_t format_attr_contextid_show(struct device *dev,
 					  struct device_attribute *attr,
 					  char *page)
 {
-	int pid_fmt = ETM_OPT_CTXTID;
-
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X)
-	pid_fmt = is_kernel_in_hyp_mode() ? ETM_OPT_CTXTID2 : ETM_OPT_CTXTID;
+	if (is_kernel_in_hyp_mode())
+		return contextid2_show(dev, attr, page);
 #endif
-	return sprintf(page, "config:%d\n", pid_fmt);
+	return contextid1_show(dev, attr, page);
 }
 
 static struct device_attribute format_attr_contextid =
@@ -334,7 +333,7 @@ static bool sinks_compatible(struct coresight_device *a,
 static void *etm_setup_aux(struct perf_event *event, void **pages,
 			   int nr_pages, bool overwrite)
 {
-	u32 id, cfg_hash;
+	u32 sink_hash, cfg_hash;
 	int cpu = event->cpu;
 	cpumask_t *mask;
 	struct coresight_device *sink = NULL;
@@ -347,13 +346,12 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
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

