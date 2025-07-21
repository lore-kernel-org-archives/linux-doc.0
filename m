Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A02DCF4C
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103126; cv=none; b=c4ZCRWappcXtMy0diBoqRuJgN9ipFzWKaroNYivmfNmesKYZX+3osFqWbusi6BxXI9belGlmDSN4DC5Py8uOBWqUAD6eEBJL2fXH20bU+AwDDUsi83d/ptGgYj0TSk9srnyuqBBwX3jBLFbQu30HlheDrRrNxGDdbUUGC7IVvAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103126; c=relaxed/simple;
	bh=b/ttJae4xiEHONrSB61gWYPCVcnCnqIpQyNKL5V/Pqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbKow2esvs8DdvIFBBA4PjTMVYT0lWGA8KYZXI1EkiepERs5u7GJ2rPsk7hLZG36uDml/TgYLGymCnRkLoa5ledOwgsRTYIzF6zf2WKcTVQvLCurEh4Ki2JYzp6nWwN2RtbzFm+ZJfEImJ0Hqobve5WKTui8huJ3tqam1emvFu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qQlpmKsX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qQlpmKsX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2760394f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103123; x=1753707923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=qQlpmKsXEdRSk8zdwhOzInSekKeRUG4mdTqXX703NVvJQK+LBUT6sqlqeBWkABHvK4
         100Pwf8M6jwhq9YXV/v0vMn5LZ/xPlhDCQExu/RXIe99YZLCZw4DqabDDyhUPEl3vbXl
         psNxeu9xi4S0+VShYCXUo2bBNsRjcdSX29y3zaamf/3Rf6zVfEarmBp65g2tpBwf8mVn
         lclNVBKJ8p9TZnkOtEzIMf4MUZl3iQDPb4ULTp0DrqgUWiOgW3s9K8NgIlx+5Toi7VG5
         XWI0Dq18LMJTLmrF4zOMjoe6Iu3JI1lFtjouwFJ24DJ3Ys30ez+Y654XqVF4u3QJhyca
         0rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103123; x=1753707923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGtpCZfgBTuGsyBPIkbeq53HmntuKbontBvcg3TVESk=;
        b=K6hkniF7R9+TV72p0oAnSa2HLV8WtclJZic4crgx32srG/usyBlOOzmWukPRyrNKxC
         mQuRGVK7rQyD+V3dgqPoeNkV/QynZAaD+R/SrqoE6wSmJYgzyuS+fveFCulG6CtbwJq+
         V2AcmUaxChPWvOwxFrbt7kqfE4iKDtfkOFqNJehQ0C8eLUGm0gFYBtWkekmJt+E9b68N
         yIwksto4+16d67did4TIOGjVNMLAxEw38rjRalJzfOECwkzrhVgzQ+bLLkwzyI5h6xtV
         fnyuQa/xrfxVPav7LBtOx1uo68GN5hwDeiqNUT8E9ExqG07Hm4RvAhb04PrBeHwe41i7
         LNDg==
X-Forwarded-Encrypted: i=1; AJvYcCUZsq3uhpcXKY344TYZq2MCVG5JSqUHHk7PfAAg+pkUramLnkW1Mqju5IbtedRHMAzgGEXoPH5jhs0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWP9Cyn/BUvIQDBwbUQMF1DCe+rpzq6jwGJmb+QJ5WDA1f4PMk
	2hpZKZr+C+h52WRQmFwGF80VRcVaKKrm3lSMUoE5aS+j8nQYujh69qovW77UOqQshvI=
X-Gm-Gg: ASbGncsg4bybGmss1D+SAukWFBOFLIBNQ76x95o5aR7JvQ6PE1iOKvQj5fkPQRZF5yU
	OJeUPClTxgB5qXk12vkgjgsVlbq30kJHqks4GFNlvd4dzl2f5oyC9gUsXBeJ2tCcY/6T67VhEvo
	+fB1+9NfHu0d2Jwn3oSAHrQtdoV3VR7xsdif56H0ZeqqTz4MbCG0FxH/kUounfgTDKK+ZQ1EGOH
	3gwA8dIfHEIm2WCa2Zje/VpUdXBLpjWhrbbwqEejH0hopWM5yTCgY9LQZuSh5J02U39O6FZNj+A
	VpMpDl20rKwxnD6yeHOLQEE83rzOWYWnzFn4oI1r2kd5kcgozJHZxvHrR0ykhVOICGcvWhtvseh
	OR2/ttQx1xVGdpTBYLEW/afsa8mqfZTc=
X-Google-Smtp-Source: AGHT+IF6B+UvXtx0IYpruCvoBGXj7r+Qm/RbuQTzDQMBKY6Xx1qYG8QQ00o/M8y4LjQhDqQ1Ad7BQg==
X-Received: by 2002:a05:6000:25c4:b0:3b5:f151:207f with SMTP id ffacd0b85a97d-3b613aa23a2mr14510920f8f.3.1753103123024;
        Mon, 21 Jul 2025 06:05:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:04 +0100
Subject: [PATCH v5 10/12] tools headers UAPI: Sync linux/perf_event.h with
 the kernel sources
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-10-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

To pickup config4 changes.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
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

