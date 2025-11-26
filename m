Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5E8301473
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154667; cv=none; b=oRRM5OzGCy7pDFojN+Beu/kvqBBWOa6DFF43boV6xN0OCrLY6ih4cNva8Z74iWc20Z0W110iG29yE2kS38nVKnzeqlJaqZQ0ligDJ7MeSD5A9MsKtopI7ihNOaK6Cm8U4DuYnABiSBK/aPyAJLAiK3zuWbIjlHJGsxCoKJvT75s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154667; c=relaxed/simple;
	bh=17jMP5BXtLnUallPdavwL3MYV4FkLZYfFbmfg88Z2tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nUvR4YbW+ab1WOcRnXvqi33kbt0uTABcrhpgs+IT71LquSAAe+DL+ZIM7AjhcnkPF3KKZ7J5iAgFrYUUtM6Ml7nAGxdq7Mifa5nwu8egkqi7L+o72r+q3LtJ52Ojptei/sg2r6Wqsst/ECQQlSe83sN9dAgCJn4HWTDFgW4poL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zCc5C6FI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCc5C6FI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47778b23f64so36222145e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154664; x=1764759464; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=zCc5C6FIIJ/v8ZHvc9Uc4Ip6PhPq9z5j+YWVGnn98HOqo0qO/neoBk9jLP4n35d7QX
         luCQwle9iFENrRKNB9rTlQCaeoDOmdzg4kyXjQzDTUQt3nafTfhRXfSnPUQKlacr/Lk3
         PJOtqasx11A9ZB2/PIQbFDeUgR4i2W2yEX2Hu7yfzGX2A4toSjpqKlbFWw5d38/D2f76
         rQndkgxrUcz+hkLNRH+2R0eCT+CaFcGx6wEq4VOMYPje3eSkPNspDsmbC4R1jVvQaU2z
         tSJUVAF7nFVS4/B8YndgxcVVmYVN44aAJ4DbTZ/GYiAcU3xN/MiWELZkCt+Ud2nvplz7
         0Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154664; x=1764759464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v1jmfj5dStPh0E5zFa2d+xJLlooTKEzGROAwu7cggvA=;
        b=ZcZ97nqd69h8FHW3U61z1fMPLz1lreL4bk69f42C9IRzBM8p4QlS56X+PNnb2VxVNz
         Ai5Zc0kX8YTVVOp3aK/cqWbK6c/82CrppjKJfXIiHCpjsqdecScGnIFocp85jWqGUDjD
         vLriWrgzXpcEh4ThgJs+ZcVi1AY8eWmujw7sQBzqGAXs/nkTOqAbog4jtEf4aTFZSVwl
         PXc+zPJzxKqyd5yZUqO1zh7MbfDFHb6V08vxEaIpb1OxF9sp8wvIlbaTu8GHAdEcEqiv
         ncHvtIhP9vjGqE8GWO7yFBd+kPutz4Uqce4A9ONn7OukYgtM+GDpWfFwGz4Z8xAG8Blp
         OuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUB8LCT4f8QCR+Q0c5Kcd7cKdtF872IVBHYrpnKUTZjwdUe5gS9Ik2liZxQ15O8+0v+Sm72MwFc6jY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlvyDXRo4LL6bj6h4UaPe6YPRTUO2kFLaIrGuxSOyu0gA6R9sQ
	gVnDHxy0M9GbyFg6fD5HR8coIzyY+Ztj3L1nbrODbMaY8lVLpr/uD1UUqpuXPga34Aw=
X-Gm-Gg: ASbGncv2rBPMfIB6hEJ4Nc6gaFQB2e5qmj7Wt0GfgLlQRahytg7VDLyRft6Jzf1JYZJ
	Uy52lBB5balzwonyMS0pV6XmDZB+whCzIvCT1vmYxjOK4xN3mOG7H8sKX7H84e5ghq7xSBNGMeY
	zAPxR+MUwy3AVNGQQ2mNaFvJ6GLdgIu0akkmXjEt+sCs3KDMjC4fNLvV6uYE9bn0ZBJ1w0Pc06D
	2f9IspL117Nc0uI8oIOUH8/vkaRP7IJWvYURTlZsTgSmm5PHEND+0FnSHy2Fcp73mUOvFKv6rpX
	T0FhncPQnir5bBspOcG8HobDOKWOqf/JyC56keLAWcBd+VxCHgBry470BmIWVxwamc0xmjPZU49
	G9rvSKZNTe7nHiEpgvlFv/aDh2PKxI5OHxaPimgUIUKjgqG0VP7p4GC12LoG2RnW1bPEKLtsiP6
	Y0kdEbtdUOJRO2/oAc8mYI
X-Google-Smtp-Source: AGHT+IH2Dz4/STj3d7ezVk3tlaHON/FWp+B+Izg1b3VZb+Q3ynleHjsb/oSUVp5AOHtWtqMGcn67OQ==
X-Received: by 2002:a05:600c:4451:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-477c111bab4mr190578555e9.13.1764154663638;
        Wed, 26 Nov 2025 02:57:43 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:43 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:31 +0000
Subject: [PATCH v7 02/13] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-2-7fae5e0e5e16@linaro.org>
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 0287d19ce12e..d178d79d9827 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1016,27 +1016,27 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				skip_power_up;
-	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

