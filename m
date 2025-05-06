Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366A27C17B
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531762; cv=none; b=IKN8Q7YfoM0Agt0XvYLml2KLv4G3m5/L5SOtSrsP28xVorGZLrElJffPRyDyGlOWJfndzrRfUWH+8lzTacqCTsv3UMqngAJ46XCTbgw77gYgi+O9cM8dbxN+Nf66gecwAnSUphPC7y0m9X9ANuIdmBnHWG/Mh4tV96ftNAlfwWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531762; c=relaxed/simple;
	bh=f5noS+6MFnNZ5/918HPeH3J2Z+Rlodkc5p0XHS41WVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R+vWxL/iP8xRyUfQGk7Mj3WH0X1KtpPXZ80zDPzpsNx3jqC/LLgpouZZmICRyljmZyNNl13px1l9V4rJiR0V45nUwa8steipmEHtmrYkAisUUb3zfvpHIYDN61xH+J9PTU/qRVngO3bGFCX6JIIgsHD5KVHPAbVET6BX3IDYmYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Eprj4Yt/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Eprj4Yt/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so3606613f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531759; x=1747136559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=Eprj4Yt/Cfv4Ot7IzxplxAPFDJahdZrUbGk4djJOK9s8tWj/hMD5LeZ3hhQJ8JJEeT
         3lKyx83sjEd45LT/kbQRCUt9wjzph3lpfoyqBZS70Y/eti4lbVYaha3jJQFSjyOWbi2y
         LtNYyDu9tZ9UrLNxm8b1aowiMFDeFNRl6XFndRAqN2rh14h3pHQQ9p+A7DoDzAtqYnd+
         Ak+FJuNr2kqSo6VHsrKdDAIRz3W+/vimLJZHy7+avKaa94+EoIJDKEB8k85F6E4SQT0S
         nflqNwjAgn+G9yy+2WMzoeNTSFGWQOi87oD0iKE1nrfmDnaZY8L3oH20QptjhT8xH9J3
         K5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531759; x=1747136559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMCZkyRZidUrNwX5Cx9PhWIRQc02z6irI9+xxc34niE=;
        b=tZlGM5djEHKPg3ErwAKAX9h2ZnDlv+f2lRVKy/5ab3K/DD3E1RpUSNKEYikJo2gbzK
         K9Q5SY28ERxLPQupOYNVli0Yn751rIH//uLz1Of0Z8c4MkYoLA8d2j1qwnVpuK4z5Hbl
         fdWNAKgbHaVdVKjfDV/HTfKiE6f13f7twHaU74pz/uUKQVFBrGHPI3iBXimFEmA/1wCz
         rokzpwvv2TZJDfq0dwCOzyCFKn3ZAUdiJp5Zb8Zzo2qjeyw6NNPnivmB09DDcCcR5b1M
         l2DFCintJ42SWoLUSsgg3frcJTzfw9RwtKQnmKDR1pzM918kXzZA83vLtGjrJwNJOK/R
         ozQA==
X-Forwarded-Encrypted: i=1; AJvYcCUBasSV9tiIg21h7OOTZZP9Nte15mz/XcwC7bEHIcFKsmzsvjqrGv0110XVPEZ8/CZrjfsYezSxF8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJzgtr2Aq9p//Ijyi2jFTtGAmpvpSVYy0jWMhQCDRJgBnbal85
	t0+fYe2Kw6WdoJz8svpnEWFwidYNjuuTWsIv5HxIg2+1WIFoaNsBKhS4rEfFG5A=
X-Gm-Gg: ASbGncsVCwtoPrt6mWWXa7mdtqMePO0X1zk+TUYi0yA9sCvrpZNBig2Ebnj1J+los2F
	NJEouk1J7wXDqZvmhZ+3NWbrGe8Upd+W8fdOCIqFgPFf90EyLWk0apiV5fWxFFNCK5bZOPW+Ukd
	7Ra1ULu6Zx/aEVr2PQc/l4pUqZGmelMeenebPF2182GgNnQZittr8aKJdrc8UR3wNjq4I4NlKqT
	Qm/X8rkbvKoja4QNn3BUMaf7tj8MkeaO/GXbc8E8eRaa4qLTV6mz0Vew8nV/daYUuiwkEZ84wFJ
	rX0W2dL1loncboHzsXRiUKxNG25h8su7drwLbACsHoFuU/s=
X-Google-Smtp-Source: AGHT+IEqsmZ/YIUi8UcU8BFnJER1OGJ/WDZQZct9hbwqvalINWwYx3zLaSDOzEHLPrVfQzLWtlkByQ==
X-Received: by 2002:a05:6000:1787:b0:39e:cbe3:881 with SMTP id ffacd0b85a97d-3a0ac0cb3afmr1864442f8f.12.1746531759068;
        Tue, 06 May 2025 04:42:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:37 +0100
Subject: [PATCH 05/10] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-5-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/kvm/emulate-nested.c | 1 +
 arch/arm64/kvm/sys_regs.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f9..05d3e6b93ae9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1169,6 +1169,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 005ad28f7306..bda6195d7586 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2950,6 +2950,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

