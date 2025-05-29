Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6DA290083
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 11:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518404; cv=none; b=fK1/yUtwOf/46PCatoaeIkxdYY/DhzvBOwLynlq95V9rXchAZk1b4XIZJxjQDt1YfWEwDOdFJjgUkikCljhlOmcxIvbKuWzWDt7rAzLOoATnRniQPvKFimkebnCH8wucYGivP/ZNLc9hTQuVeoUF256sQPIJATXMFHyVMgRt+/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518404; c=relaxed/simple;
	bh=luGNkoeE8UlMJRKbxQ1WFt67Ydxa/TXTNRQ7E6/zPH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KJXui71sd5ykeyIcipRgJRNAu8X1WTxAIIq2HRlUbgEtMLvul0RhXO2SLUlB1wncJG/6iq+J1/nKD84bpf489RTJf8fiYoc535DfxHguGPh8p06nJrk/J9hkLEegd1LoyH+H5UpUwgXfnDezMT3dPJqYUdw1FmLd/9x8y1PmCFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rjFHV2j4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rjFHV2j4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442fda876a6so7476745e9.0
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518401; x=1749123201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=rjFHV2j4uVy3MQgfdfvTMCHm8VuLc588kKmVuvvKKi+z8wC/D6yf+icdyojhvpQEeV
         PCulage6GBERJhvl3c9ujwirVDKsLHf1yyN4tn8y3sljY1wsYbuEOR7I33qkWBqcF6ll
         wxApjPpuRLgjdhHLKn2M+N9I04vmo9ajjDWTiUcFoVxUepCR5yVkwQU+PiK3hC8hwu9B
         9Rcvi7eRaZwfN+J7y1w3T/3Rcs31sKoulU+hxLAZ/30xd9symOF/+kOwYkIyR8Vs6L69
         SPNgBJb4TRYn6oItDc1Rjep+qL+1BEYFNq47lkh3A6ff+cLf2JrxDayNTYOzAC5RD+MW
         iUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518401; x=1749123201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtNy8TV2Q7tdQ7rYLolUVZZNcwM6dcUvbileCfs7vIE=;
        b=Gu0eYtZ7jTgLeIZq4QNUfNJCtebXp1iEbHdDchXsyZ1r509wZpW3y2TP+S5K80Y7vN
         YbEGif8+MxLwh5o7afB1J7graIkotjd1+38U4PLoTY27CKDAYvjfCVxweGQEU20tZhQN
         0eFlpTBIH44EdG0swOn2D6GRygwvvN18J888DHvYHew1ADBYGqyOH8EbORKNYwg4BCiq
         JFWp5gtIKEgk7M79VXW/vuHwRrRVqOnxXNbS33fqCNSsEf84UQ9RzXb5RRcJLx+B+i0l
         8xRktQFs06QKzVVZ3DgZ2TdE06MWQmrtto1CA6D+YyMMlOvU7eKhapePtM/gyTlj3zlX
         zgMg==
X-Forwarded-Encrypted: i=1; AJvYcCUlmWWiN9q5/9Z54tlHGKP1DFhnUgqburFWoijMSRopr6QyCFmA3jVun9C5AaGL1y2/6fHC+ph9L5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl2yBfEWQhEWbi5ulPFKCaUTXtI0oboUw0oqjCzl05K+7Gz8us
	ISPOmmWyNeY1G745Xc9E6Gtg9L/0ZC1Ey3VFrQwDmdrTFF2AEXrO2I9dMdfYWZpBTfc=
X-Gm-Gg: ASbGnctcj1eIIrBYAMvwiPn4c9yd4lJsVmlkLnHjsdCckt8v8EmvIK6UDjeKCo8fzae
	JzRhS5HSTQG7YK/eb2B8wpYsbxx6ssei0PaGPt+PlNqr7ObeOWyoLsFolog93BgiZyBOxhJvvK+
	7HZQnSxegrm5HnRHXCu6x7hVf+epBA4MkiBhmwMgGQgRjexxAGF/ePlpBVn8k0Aij5f8YNrfJvB
	gXCMglwfSCjCSurNDojtPxHSVbuP/Q0HJQ8KYkrjjf54rQpMOZXFvsvdEeR8b7Qg3Xlpq5f1dgP
	T8cPGyeCXGq/xOYIj59W91q+7AzsZNkcA1UEUfo5S6N+shJS7gHsxzqafKAV
X-Google-Smtp-Source: AGHT+IHrXdHKaLMm+1yIpS3FqW954SUKKGaokrQq0Fw7uhbVyrwkEnNO9Y6DJeAGvxM0rmC8BWFyjw==
X-Received: by 2002:a05:600c:8411:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-44c91fbb039mr231750785e9.15.1748518401174;
        Thu, 29 May 2025 04:33:21 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:20 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:30 +0100
Subject: [PATCH v2 09/11] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-9-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

To pickup config4 changes.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/include/uapi/linux/perf_event.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index 78a362b80027..0d0ed85ad8cb 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -382,6 +382,7 @@ enum perf_event_read_format {
 #define PERF_ATTR_SIZE_VER6			120	/* Add: aux_sample_size */
 #define PERF_ATTR_SIZE_VER7			128	/* Add: sig_data */
 #define PERF_ATTR_SIZE_VER8			136	/* Add: config3 */
+#define PERF_ATTR_SIZE_VER9			144	/* add: config4 */
 
 /*
  * 'struct perf_event_attr' contains various attributes that define
@@ -543,6 +544,7 @@ struct perf_event_attr {
 	__u64	sig_data;
 
 	__u64	config3; /* extension of config2 */
+	__u64	config4; /* extension of config3 */
 };
 
 /*

-- 
2.34.1

