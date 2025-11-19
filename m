Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A436C593
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569110; cv=none; b=nbJej+S4BeoUjVr3yOJYnS44fSO2hXrrB2p+LxZn5/GFr+4KBHbDJ/GqkpPz4DViZ5TsZDBSQSCZ8pewv2hMFHyZ6zrbcUcHp1fjdPyj7K9f4YvWU5TVysWEM3u8qpEyfxnA5RQelRimwj0nD9SDs6HL0hO27VtCwLUCIVdrYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569110; c=relaxed/simple;
	bh=TNcEQrNzvvULvrZwY1bi1KT31/DfIBlyOCzRtRN9s5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWe6O+knl+8mRBCYxJ1ZTgehIDjb6e5sphhlbdzDLBeHLy+TpKy/UJTxsphYBl2wgUg2V4StEXDMVX6bHs4pGwQeDDPrec7CN8i/LUaedTeWuz3HOkw1k7KVjzgic2HVJVmtLrrcjOqUCsvfs2Reld2z1Y81n2YOfpSPEsBVi98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYNBGJIJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYNBGJIJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47790b080e4so30470585e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569107; x=1764173907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=hYNBGJIJECxC/TAbaTduMZf/SDNBavclDjlt5/Kw+H2aytvzAxhAfniyGD/E6OHtZq
         HPs0X0c+8tpZBjXHeMNopNuwSH8JV7OD7zzrgAH8KD8q12lqQ0OcW/f8miz7NnXrIMEG
         nFZWWkvkwXMeFWO2Rr6pEaxepn0UvlvIvGkCor1E1xSYE9lpn8YWNJEOzSwa6w1zqrv+
         j0jwYOsKbp9W9y9T6oM9KLDxon0W0x26XEx/bDAnb3cBF6bA1dNzmAk+eTBfowgF0kOw
         5iLfjURiXL5ay818UG9E/sFSc6XAK1rHZesGJBWVcdqc9kL/h7ZLv+smN/bhrpUC9BKD
         lnRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569107; x=1764173907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm65IZSOvcLW22I95NQ1DesGTVpSHNfrfkgnxYh1pRw=;
        b=r3TxReygDIDa9e95sMop/Po40QJbMfP4Jxws7oNQfT6KABQBh2sFcGkaPoHgs7mhPm
         zItp9JTV67ABOH/rWOrWIxhUD5vuqKZTbdpoAvYXhtVG1zzEFRsyUzFNwIBI4clBVhLu
         rm6z7ATm2cW4DUG64tqKLrFrcr5/3bAs7sS91oydKprFQBw9XPQ3NavetI5HnFrI3+2f
         M+YbH2jlXp5YKmzIeyhbGqM0LRq0O+DzX2ZcVTRCXGq9SFd6Ta9U6vF6OvwnXvaStZqS
         0SwojQe5QZ9wLEYjX/ajo7bGkmjLGtEmaSFiG/Ob3TyJpcHnba24++uuiWzh8RRVpmNU
         5QTg==
X-Forwarded-Encrypted: i=1; AJvYcCVbSMf94e0OQXXbvs2LuaUiw6QE1BcsLvIM1+rRqsbqSZpmclAB/larSEKxObIhjlOPfjUOzVdyD0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvwjAvbD3aTzXz+jhGQU74q5X8fJAkgZvO/GZrAXiClfJYA/aI
	FjIKPXxX9OmEt6w5SuOzrWR2qIOHx37xAGXwBaKzziL1yYFffe+XVeEXsNKJZQQZZfjdKs93rli
	HPNqA3f0=
X-Gm-Gg: ASbGncuOr2dHY9+HcmoNm8P/6K2tqofJOdkS4MT8it30aZUc32g4RbZ7vXgkmCJng3Y
	Oms4JKW5awWAf6JBvZaODBN59/t70gCxEwYduWGm9XI3AYwBn7dh7hAvQt9Cx+ziYjixykED2BR
	BE+PLhnOVwYoHGCAUXcl74R2fxcplPsPnnh0XjLqVCpxRV5uMTR7VwVK1KUr8lm8uUkt8I7tftV
	ovFFfvHqz95fvpReAXJAKjI4F53dQEUpYFj84kzm17dK938gfWGB0lD051t3y7mExVS99yYhtqj
	wYsLI27T8fnIhNuoK/FVp9IxuMHCl3tUwFmiT+tgFad8jFADERoo9vjQu/jF8TsSKQ86QIvmBLZ
	o5Ru3LxP1H+QxkYrkZk7Mqr3eHGA5/pWCUIShmD1cQlnpnB4IRrZsgB4OpwFPB8gJPjTyPJV9a1
	COPIM6usfoYKqHnfgztWPT
X-Google-Smtp-Source: AGHT+IFFA2/5WMyi43JL9wYl1E+HXHvpaVVjq0ooJOqK0iATycUimsaSxmDoPtbjIuyl7D1kIpWgmw==
X-Received: by 2002:a05:600c:8b8a:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-47795418dcbmr192758345e9.16.1763569106515;
        Wed, 19 Nov 2025 08:18:26 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:26 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:04 +0000
Subject: [PATCH v6 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-8-740d24a29e51@linaro.org>
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

