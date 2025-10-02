Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71593081DE
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399800; cv=none; b=Ihs7Czqra+KvZdldSOwDggU5O4PlmjhLP/WnITFwq+qUn0DXMq6ve/8zOmcrVXJ847txddpuzWNIK8ElvFqfDwc1Gy25whZ80b0kRXUBNAFuHARDxxW7RovlUrwQ2NjLS653pd7MT08UQab7N/xKF3ogpV0mBW/szalfljVZblY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399800; c=relaxed/simple;
	bh=n/ki5M2njQxahsIARlEQ5/EDGT6nzs4YYtcnD4jhUFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t02+NqT+cgitFvdzT0S7IOxYaoPlf+OuhCaWz6VtqubQFR863//69umQQ8NsThy2XGb38iIfCpVV1DH+GPyX7k1Fb7nHtE+ckFd8f1do71Ze2yh2Hc6dxpUL/cxWrozu3SdONW/75l6HGqP4+qW0EN+3kImC6Y/0n5T3XkJjgyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHagyM1M; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHagyM1M"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee13baf2e1so554389f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399797; x=1760004597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRa7xRBz2y8KpSGnCFzpBD76XugU/yocJFlrtOCXiPE=;
        b=SHagyM1M/JqOExcGbJHGHNzMmcQz+05OMNj1E600FNxTtXNCU3PY2eisyl9+KrvRRh
         Y7mNMiahOi6JPqhqegz8oh1u5z9cZsLlJno3Y8w0oA9SJyj2ENtGuGyVeaz8qCmZ7tt1
         G5Il2irKv6NYJMjJ/iyHJz7ev8hGD0ZvIa0brwV3sk5j5WL5yBgQ7Z1bEwbNHvELI8mK
         XuS1gayC9EmOBj7BjZ53sYU0lrgCCm+GACvUFlQi2wLCP97gsJLVKrVfDy47xWO1IMl6
         WfYYA1A1KX1KS856JIWoiodt7iFrF4H3T64NABf3TC8rnib1I7yP5TnMSyeclstmJ6zV
         Ym7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399797; x=1760004597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRa7xRBz2y8KpSGnCFzpBD76XugU/yocJFlrtOCXiPE=;
        b=j4wyq+t0mpbBbC89X5IfkxJdKaENkh2mzEiogDEi+zo5MEKPGBL0xVF8m9nlLwHNNW
         qlLXqeAIwDF8CreinMI2vl1WTh3GPxzVQBlAdLjl5izLlc5Gm0HrcCKml1m1kuVbJfzS
         fDDrvOUXpSnIyL4FTfuVqmS5czhIQh/cl27oFK2r19QFvKXMKgvlS18ATuguk8WxJ1/c
         qeBGeZtgMMsPVqoSdogrz657OzB5gUz57X7fT7EbjZ6DeyZsgFLPwmbFipMAlVstcJHT
         oHqnsHQaFnHRYycUAYP0NLjMWwaGLCwmlaexvtVCtVsdxxSVukBBf9p4s6+UxaoyDwFg
         dJjg==
X-Forwarded-Encrypted: i=1; AJvYcCWjYnMibQxULT2xqJFeEEMn+puW4WmVq0j2OQtLwrNiF9ohnRhN0FxFT8PQur67D3Y9ZedcFCsV23A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGb2gvyL+C3Qh34WN/dTLaNYBnsE+mpWEehM464QuRInJBzAj
	dHbeED7eP/JgoVqwPqxYB3OQY4Xax4kAy7/EF+eywnvS2GqhiD24mHxNEbLpYwbCvi0=
X-Gm-Gg: ASbGncui2rdP6mShI1Tqd4hKuqsrSFtE+vhzFGLg3CFN3zC0/019e2ew21m2rrXM9/6
	KrIsIwrHiVdjT0jn/NgYRhv/9RK3TxAukA22N1AG2hcomkNYbWxeYBrowR9RHPUV/E7AC2D9Uje
	zXNePUS7ZJOh+PoT6j6uhnP94vJTl4NiP4FKXtaLtbASQ9tJwQEkq+By5YQ+XJsd+s27O/uqEQ1
	uZ6p1eSev4IKCXCxOapC/0ytjXi+ekPsvHIGdEt739UqY+kCN0LOy0zWoW6rUemkxITitvGPZ62
	jib6mGMXl+WTid1cerEWngI07g0PEsppXN8SLkXA2/0c7vlCYMNAeyECBNR0encM6kGU0IBDvMS
	byKy0r10wQ/ZgeD4cOC7fF07lggFKSlNBBxPdUqtt9HcWnTjxdJg2U+cgfyOC
X-Google-Smtp-Source: AGHT+IG4GBS3+OrAu9Dh83TZttIqZGo8QRmCmJgUPzocrKlVSt2VDpydcJ4X+uH+k7EMuUUvSzSyQg==
X-Received: by 2002:a05:6000:4382:b0:3ea:c893:95a7 with SMTP id ffacd0b85a97d-4255780b1b8mr4828795f8f.31.1759399796900;
        Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:30 +0100
Subject: [PATCH v3 2/5] coresight: Repack struct etmv4_drvdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-2-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
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
 drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index eda3a6d2e8e2..813e7208ad17 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1019,29 +1019,30 @@ struct etmv4_drvdata {
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
+	bool				state_needs_restore : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	u64				save_trfcr;
 	struct etmv4_save_state		*save_state;
-	bool				state_needs_restore;
-	bool				skip_power_up;
-	bool				paused;
+
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1

