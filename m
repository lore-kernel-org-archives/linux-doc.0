Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7B72D8791
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103113; cv=none; b=XDxZv0CR5W7zFC7kwcqlTMrPgNlOswbJjy2iH/rU9My5Z5aesuuBYd1/RLaBWE9uF+34SWc/zgO9z3qzmTimeVEsLEzKXVG7r2/gSM74o0nDHcYYaFQo2TXSJeT9EQi3NWYUtARNfjNpyglDTE/gzYtfoH7RWnbl3yJaSWBvuyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103113; c=relaxed/simple;
	bh=ajsH4sm5qIk98uVqstoVul55QamJ8yj95QFZdJtL4io=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZF99VDrk0bs8kwvW7HlsUEnJLunidN6bfIirR8L9sfsDNvDHmVI2HQETUVHxAjG/j5nXoIGvxAh9Gfpe3M6PcPDEAtoRwpdSaqA02IU3yqLTd/RSrMTyOYtJEUBDvXzkJcF3mDgCWRm1nj0BIVtVJQ6uY/pAnTCfipVKQfSU5UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Btk3rW9a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Btk3rW9a"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4561607166aso32864335e9.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103110; x=1753707910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fgBaXSS6eoL+tzDWl4vbvLMipClDtwiPdRYN3wg5eT8=;
        b=Btk3rW9aWAfCrwcaormqPLZRNf7IPkm8nNVxe7f/iDXNQkO3zjgd14W/Dn0KxScFBt
         T5Wc1drdZDdPTrk2pmiIM19klMSm3KQY44ZcJTVXiPyoYJ4JN6YshoBxgDy5AyhX7kp3
         B+4ZkBl6n+K/Qwh2JaW5YAQUEn76Vvaa+9kXLcn2IZJX+YpU4VwuoRAEF7NvbwE//XOI
         TmYmbN3gTfSaFKk9fC1e08wExe8+9YN1bSBJpqIQ/aXO8AS676J7XTKYbjWi68bdg01a
         MXzJYkZZUIDOc1wXKpjW4QiDmZWhdA/OnY1zb+zyyyXq4K5FDN5iiCPTnqY5Bc64+s8t
         mLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103110; x=1753707910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgBaXSS6eoL+tzDWl4vbvLMipClDtwiPdRYN3wg5eT8=;
        b=Hmd65fjXM97XNIT8noYOs94Vwr7jhVTJVc6MDZ4jWYcJDmhmdqco+C1O0tF9FZvij9
         XRp4BIH1PkUztnO1WYZBlCeGZKoogqDK/HJ1+QaXBbBqUKRdTKMFTRGv4bFvY/cg15tV
         19SnH1RvHHUIxJ4n+W5jZrA6LHsnSuOwn7GgHEu3AKcXOAKkayDfvelJen3YKuuWgV9E
         GFoE1OhkvajIMvmVD3rPoX5FUsw/wXL4L8Mo+cwlCb0mHNolSEgSiZITsOJVbB1I8VLY
         nfbL73Mm0+ujE3j3z/iZ70kmIvuJKUs91ZjXipjcyetlSyGw5u5SceUHjCvVkQAvKL/H
         J8Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXzaccZTAB0+VF4rTxH8R252c1NBvJ6ThPXgEm5CAVadobNzeoBtSwcRrzAAtKeJw/t9EQJ7+pCaKE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1WkzzZILI8gBe0Ftq5wLEu5SFxdKuwzs1afWWlrxYOUl6WVxw
	WUu9liizXPltf3e/6km91XPlfHGrpoa/TQEZPJ/KfCrq+GUmVUOlQtU5rD7ppOPuPgw=
X-Gm-Gg: ASbGncsQFUBLfYsDHS1W+hCDz+kejEf5DaZK1nzufWFXam9RCytM5P9Tbui+rhM4tXl
	koO7vCbDHx43H3WM3zDU2fxvVxgvn5rNhTByUX66j4DlypovXrx0/tMLAkhkxSZO9TS70nFGyWz
	96QsJR3ubSQHER78kmzRnjnnokxcEigPZg0EBpgl3qLYlz4i8NljVkxRO1m6hza+9y9DRKIjN5Q
	a0XmvSpLIergfla+orqO3+fd8ecMfJ5sEcc4Lrld/1+pIjwyoLfoG0bTrUd05dL7PhSO3s5EYbF
	OKjS4pVrPyxhCJ+jnUvuNljOC22sG5GbWWUCkPsTNRKgKY8IQ4Y64YNrGMB7X2ErdZwiWeUhlc/
	F29WVgdDbf5SHSWSXcVrytydbKN5w6JI=
X-Google-Smtp-Source: AGHT+IHW55CRAG6BTroVDQBsZVUrLOllfWSe7q6H/nJVZXgEqWqhx0CeR+WIH7uAuxzefIuhCImklQ==
X-Received: by 2002:a05:6000:4704:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3b60dd6aa5amr15956756f8f.17.1753103110115;
        Mon, 21 Jul 2025 06:05:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:04:55 +0100
Subject: [PATCH v5 01/12] arm64: sysreg: Add new PMSFCR_EL1 fields and
 PMSDSFR_EL1 register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-1-a7bc533485a1@linaro.org>
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
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Add new fields and register that are introduced for the features
FEAT_SPE_EFT (extended filtering) and FEAT_SPE_FDS (data source
filtering).

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf6874298..2e897d8a4040 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2859,11 +2859,20 @@ Field	0	RND
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

-- 
2.34.1

