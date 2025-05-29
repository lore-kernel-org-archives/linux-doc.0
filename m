Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FDC28EA63
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748518394; cv=none; b=RK7C6A0Psh5yn+t+xo1aFLWEM+Gcbn1qCMb8feZA0Gzr63EUycgBq4TkuZWLv/riIe7OmRUrmh7YBjOIS15+bru1W3vd18jWCsBq74iTV9AH/yBHkYd9UXnuRWDQ1wxzwA/bZT6VexI0FOYbyExZpZjihEddHM7np7FpDYHiPzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748518394; c=relaxed/simple;
	bh=FgznNT9Brk72b5Sn5qJ9KzEFbrY6vz/wN6krkmPDC2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ipfw1SCa55uYnMRx10PGh9zdW7Ktcai5C2IbLw73yEzppy5+eQmJDAcWJYNWjYq/osCYfz+3o+h3Hhm4Ui5X2kDxpB93K4l19vmr3nP1j6jBueiFn5QwCyLtt+ySz7y7Oqpkb6AC43XrfsaCFPAm22uXyk18KM+pcB1vnvoX8Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMKltMEt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMKltMEt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4508287895dso10355435e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518391; x=1749123191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ao7OlEh12lpRfhENXnzwKUwXbWabkHGccxknuUI7tI=;
        b=xMKltMEtu0lSPEIL439ZzVVo4pKDAOv0mcHdUvseqlQJcj9fnf3b/vKoScqHbXPs+X
         K1T2d94UD+3GGzS0f3L04srJgJkqKtzE6hgEmUbYYwb46pcW2r44PeZdQGqEeBObLkeV
         TSX1lK3EtbEclFHsrfdJotDAnBNB19mRQLRIgSLkbzQdLZYfg9YJtWRNvKVK1QFRIwA3
         4drN9FUCsP+PLbGhx9am1XRi3lT5+jfk+dvgpdylDlfGA9ivvz2vTvOukc7BTfWilKpP
         jzOz1ferOk6dBmixWk1ZAg+nXD06V5pH9ic9IkBg4znx5cmmeyfGMaRXK1XCbqHgTJBu
         Y7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518391; x=1749123191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Ao7OlEh12lpRfhENXnzwKUwXbWabkHGccxknuUI7tI=;
        b=QcyCg7VcJOSB49PxhTidigzqOV2sExT3H9vzEzuYiu2uKaFvoID5KcTifu1tgv6Y1O
         Xkp/RfkeFEc6+++AbyPcnb7f1lT7m3xTVgcqIg83GJ6yH0C7af/OvtXwL/+Gh5sc5t/v
         wvnSIcbcwe/5uUW+8dKAc/epmyjFc6Yqk07b32euMYQ/MvgnuoW/0uQn6qShVUd7fVJD
         EMQ3grHDp5ysHBQ0RcfrfIrgxaA4uBex4JQmO0Hx8wcQGAlewGqm8D2HZ2e0EO5F+IGf
         7enYNFGrQYPWS9NlDJQK7FbeMkBCZVQ7+JuZlhlLzJ+7oOdQiQl62iC/VHisgN8HkAyS
         M24A==
X-Forwarded-Encrypted: i=1; AJvYcCWVFsS3tgT45dMUxmvG29kqAkwEYqtmabtWUJRL9nhzeW5AcvpyOm3rIvLEjYKVX6GSEG9Wc5SGihI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5l1VrGKbEnZH5jNuCq6Sk/DOc4Sjnc+T0+IAaDrddwUlRVhIL
	Ffh0WNoYDeXpH2sJiUjW1Xw9AhksZaDpf645xYuRf0EqczScoXtNzxiLLAT025aoTwM=
X-Gm-Gg: ASbGncug7YiJVHHeECRBtsc2Cplu6o9gjyBEbgFYeYK5vb/b5fb/YmKmOCWKEwKadbQ
	wdvUlgQ4UkYOXYD1bb0VKW0FXdlKh0vWD+DXnD8HhrYhxBTAB6qA/gd8ujruKk4e/HfpUpTYLSQ
	uSHeQodm6u3l6a1iibrmpFmfs3XJWaX9igvh64u/WCyRqyKyLYZFNIgtqVjo1kgQqAM51ilPdsD
	WUhccTu2mXMClQoMcyc33oboXuLMVPtAOqgT4YLw/aUWVJ4B7QfWnPR6Poqkj52S7nNjxUnXcE5
	u/QIYysHba+Xv67oaYGpo8l9+byiQhz7qSleTfMESgplcWfZ5tKM7aHMJS3S
X-Google-Smtp-Source: AGHT+IGCVcVUkYf0t9hJfA1IEOCLHRWCcVLSmCqfshXf0Ly5nAMyifnx2BqS+BSK2ezf753KYr0JOA==
X-Received: by 2002:a05:6000:2dc5:b0:3a4:db4a:3004 with SMTP id ffacd0b85a97d-3a4eedb8ab6mr2607351f8f.22.1748518391182;
        Thu, 29 May 2025 04:33:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:23 +0100
Subject: [PATCH v2 02/11] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-2-a01a9baad06a@linaro.org>
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

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e7a8423500f7..e2cadf224f7e 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2205,11 +2205,20 @@ Field	0	RND
 EndSysreg
 
 Sysreg	PMSFCR_EL1	3	0	9	9	4
-Res0	63:19
+Res0	63:53
+Field	52	SIMDm
+Field	51	FPm
+Field	50	STm
+Field	49	LDm
+Field	48	Bm
+Res0	47:21
+Field	20	SIMD
+Field	19	FP
 Field	18	ST
 Field	17	LD
 Field	16	B
-Res0	15:4
+Res0	15:5
+Field	4	FDS
 Field	3	FnE
 Field	2	FL
 Field	1	FT
@@ -2311,6 +2320,10 @@ Field	16	COLL
 Field	15:0	MSS
 EndSysreg
 
+Sysreg	PMSDSFR_EL1	3	0	9	10	4
+Field	63:0	S
+EndSysreg
+
 Sysreg	PMBIDR_EL1	3	0	9	10	7
 Res0	63:12
 Enum	11:8	EA

-- 
2.34.1

