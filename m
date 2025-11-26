Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19731D381
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154676; cv=none; b=tb+FWMC1j9cwHAgHHrY41dnWTTnuAW7pdjBe6IPK4GGYkOpzH3KR21a1ZM/L/aszgmEBTLzhjPClTGkM6OSbJqhEi24askJ5iaoVqZnzf9VJQVxwl54oa1tUlN4VWy4VAIqXsFQ4amQ3OV4DjiWr0bC7kcjuxlhpawWQIzd6k/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154676; c=relaxed/simple;
	bh=zhAtZbOFS/+SCTOmEDuRkm71lHxbpzSZO3V+eVr0zZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h4M9yISpLAHtvUs5ktBnVWTOuZZQHPvkJ+B9sebIgxxif9dNKdyq1tC0xfpOZ8lEDXxaqMKuOCw8bPjL6tvBHl0lYSLb+ZNXQIL2jkoqOoq4ynTLDnAJMktM7z135+fRDzHRYRlBNxch3bNdsQUqy9R2t19ufJecPivpUyWTvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gV2sugNO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gV2sugNO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477aa218f20so40416575e9.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154673; x=1764759473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5aXjGQaEIx9QnRUCqph1nXShW3UVlX6C3Ll46vEA/s=;
        b=gV2sugNOywAB1KZcwgXJ9Jwq/BC7K7W7707dvqsq4Fvh9ryqtUd/8kmpsfPBQVop1U
         jQ6/iuDg/zLVBwID9SMxWmsHuDRJUxVO55qOG4I3fJP3ee0HBbZxyt8IHWerc8Yrkuvb
         PFlP31pwwxiiTec93HqWGbf2VJQPvij2bo1HzrLb0Nh42mnxPwEGV2CiFvufOyCIuCq5
         KhBXA3Z2sPDOFCPfhL24ufG9RMBOqPlt4G08kzK1h3K7fmSKM7B4MLAsmxMTIdpT95Mf
         k6SZMpOZvib6gpLp/UO45HSuUEnQ+tE+EiSWY0SQ+4GJkexzGSXFjAQ2DsuBsnn3Oovb
         cW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154673; x=1764759473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5aXjGQaEIx9QnRUCqph1nXShW3UVlX6C3Ll46vEA/s=;
        b=fC7KDSot8pepnMYMKg09zCxcPDUoFBD4TawO4m8pEL4RAROJE8QZmDbPPEM2CG999C
         SqrhMYR+drdohNbbgoes0EwhD2dDxefE1TpgRF1g/OeZJeWTCMnB4pUXcgKVB6xs6+Xk
         48gvsKIPFceq0JwT1J4VnEwqfMVYZbnetPKcGMmpCD+Uws49ssQEc/VsWYrYrXqkVFA9
         Rg86vqv/Kq4mjqlxc1ZQUMURmLSuli8Pgw5QtT2lzj41NHBU+zzOmQSA7CYFsEEyilsf
         /fPOBXX+/ZIYzvOUJNpGDvbDbNhHdNeamj1jN4IYTbLB1rEGhQtgLdojhMoESc8o1O4n
         eLWg==
X-Forwarded-Encrypted: i=1; AJvYcCXQFdjpLFFcxO7rLl4Y9iReZwT5/G2S2DOl8mKF5TV3ymFTy6J8lcDVjver0YMjpYeZG2+LUQ0SnNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLddZ4uSDzYI3WPtPi8arjtYvXtSydmRBuhETvuWdBozDATtWk
	zFs+jgt6RjsBNgq81IiZIdqozQyqcji5czOBuJsoMuPnMSZlUigPXAxMjzSaX4KKA4I=
X-Gm-Gg: ASbGncu6Dujx3jsDDk69OMeq3oyplGnGaMjBi7R0Fm6p6yEMcc8UIwI/M20HwvubZei
	ni9TKovl16x6MgjPp4ZTmF3GeU22b+nEvPrj4qqvQ61zSqtGrUHduJIY/evoh6atiOKJLWXAoMw
	vtjij/W4k2FTZFKEQhhlWWqadEfIus1UptgAlBYUkS6XZcDFb63Vqoh6mj3bw3l1OVuAXAKjBTx
	I9ek5Y2Kaqy5hNhCgljetr9Yaui+PFfZL5GHo0Ax6GhykMxUULuyMvkOeN6kYXTQBakuTX6bo+y
	314TNHpNZqTP3rLqlh4Zq9J0VtSV4iMteLG1fbgvykx8loSu64Vw9GH8ZgF8o8F7pPRPC2zH3hU
	1LPZrumDNlRbIuPIL7uMTfWPivXiGKb7V1ghmV5o+PFrsr6yZOFpR1ZwaZR6H1rqA0znW+N835a
	qsKiMd7l9bqPuFh8xtYIkN
X-Google-Smtp-Source: AGHT+IGR9TSNU0qxbU9T+pWTN/C7ccbsqOSfxUJvTfeKj2/349hgmV74rQwiM9Qy4pMFnvlnbdm6kQ==
X-Received: by 2002:a05:600c:1c88:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-477c0165badmr221349105e9.7.1764154672854;
        Wed, 26 Nov 2025 02:57:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:39 +0000
Subject: [PATCH v7 10/13] coresight: Remove misleading definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-10-7fae5e0e5e16@linaro.org>
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

ETM_OPT_* definitions duplicate the PMU format attributes that have
always been published in sysfs. Hardcoding them here makes it misleading
as to what the 'real' PMU API is and prevents attributes from being
rearranged in the future.

ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
which is not the responsibility of the kernel to do and doesn't scale to
other registers or versions of ETM. It's not an actual software ABI/API
and these definitions here mislead that it is.

Any tools using the first ones would be broken anyway as they won't work
when attributes are moved, so removing them is the right thing to do and
will prompt a fix. Tools using the second ones can trivially redefine
them locally.

Perf also has its own copy of the headers so both of these things can be
fixed up at a later date.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/coresight-pmu.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 89b0ac0014b0..2e179abe472a 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -21,30 +21,6 @@
  */
 #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
 
-/*
- * Below are the definition of bit offsets for perf option, and works as
- * arbitrary values for all ETM versions.
- *
- * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
- * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
- * directly use below macros as config bits.
- */
-#define ETM_OPT_BRANCH_BROADCAST 8
-#define ETM_OPT_CYCACC		12
-#define ETM_OPT_CTXTID		14
-#define ETM_OPT_CTXTID2		15
-#define ETM_OPT_TS		28
-#define ETM_OPT_RETSTK		29
-
-/* ETMv4 CONFIGR programming bits for the ETM OPTs */
-#define ETM4_CFG_BIT_BB         3
-#define ETM4_CFG_BIT_CYCACC	4
-#define ETM4_CFG_BIT_CTXTID	6
-#define ETM4_CFG_BIT_VMID	7
-#define ETM4_CFG_BIT_TS		11
-#define ETM4_CFG_BIT_RETSTK	12
-#define ETM4_CFG_BIT_VMID_OPT	15
-
 /*
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.

-- 
2.34.1

