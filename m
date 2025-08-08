Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC8274FF7
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652237; cv=none; b=UYqPslBGBmPbWZaNr4rhB8DyrGwecPQkcr6k7HTA3UuiyHyBFka/0yRtMLNoL6lAiZ+ETC4D2zJeUuT5f1KBrRj8cWbFBt8AjYVqbUvS34JdqzRdjDAxqhIxPenblq9Pris8JLQMrDcDYY8/JWSFvVGqnVCddOOrmSKeCF8Fh48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652237; c=relaxed/simple;
	bh=+2GYlOZHwCZ0lRFJU17Kz/6XYFxNBVKE33Il+Q5Ltpo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CHrDBrc3b0+4B2MHGyyyuNNtruZYBj4rUERtfqeycMsnMbwy7Oet3uzTr5avKvj4Opb2pll3OI0YhAmWXSu2zwvAqzcrEOSppTOzi2tSan2eBeTlo5qU5h8uGlCqcLPz5a1sn+x99f7416sXXI35EshzQpKvnt5UipnOXTpPGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e/Gs44vQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e/Gs44vQ"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b780bdda21so1512903f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652234; x=1755257034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tCkPGBMU9cuxNuxHQvLapYjmFGObKhPk55g8w7OjRxY=;
        b=e/Gs44vQS6XqDUlpse74/TptHOfjxJxFtj2RcxZmdmXKFiJRK55dsddDwgQiJzhkuT
         znEsLZFnlXrgSsGF6HEBUWS8/DR1k3y0eA97HLXElduQxWBMS46X/J+D4B9MjmA2lbIH
         wlr81QJj4nUjy0AKmvHRmK30Fwa471gprd4fZPIYH2MBCHIqUucy/yqoirr7+SZ+EBjF
         91dSxhjXI8h2wX6A5g/mqJzYhMleeUidLu9weuDEQ5fJYB8dZeK4IDdIGmM23wjy1a+t
         P769y3srJpmZU0Met5M6M1YiUU4ZmHSgJXcDeAtNXfErMeulfqOvjsIYCfgBfFNMJ082
         FwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652234; x=1755257034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCkPGBMU9cuxNuxHQvLapYjmFGObKhPk55g8w7OjRxY=;
        b=ZaW8v7Gqz+3tP3rxu15ZX/Sh4rP/SfvIZCSJDinCyzLhsJaSwPjrH8eUPxTdM2pm4V
         nyBk2OYsih5LYqWFCEuR2ERWjDNNGOLkb+chHJcRJufG6BhOsYD0+J62RM/O2z/UPVMC
         PvHw8Aw9Rj+bwshutCYE3ojkARr8CPbk1b4uRguY2UUmGpuunB/CLpjMoFnAkYL2PCaI
         xfQIA0yWx/uBmKPlfxmthpQkP5jbeQmBI/Rwaue4hNrC//2r3mL7HLVLTSuOkxRuyf6y
         OxiyBzRtZHL3NFBJ+hAWB9CUPP88BYkwvkayohJhQDUWjQppDFWP6afLXfEcjhTbP7Ta
         8qSw==
X-Forwarded-Encrypted: i=1; AJvYcCVqL2Hix29WcvHlDvJqsHe1+3cm2R4DYMrmehWiN4XPu1Emh/J+AZIutMUwUgNRUfC5KSUky9xj8x4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU8c3+H3V3oYpOVEYnrclg0BZnj9rGPiP+02m/NXXeqa0K4DrF
	xbSUSaT+F4r7FNP26riV1eoCKr4sYQwv8esK2Banb+LUnp2b8QcachAMzKrQim7o4eM=
X-Gm-Gg: ASbGncs6VpO53oydrQjnGOoBqwhkgTkfm6Pr4CR1dHNrlPRDPXhBaKkxqsVfOx4rZKO
	PxzwjnhJiImJVUiOQ8ZLtH7uKezecnNoG/S59Bc2aADzyOupL5zZqqjsY/Dm44HmtzqA6jT+Zbg
	TjgmqjIBIF3rjoFlB/qdzCsW69P+FbzDnKp1EUwZqqVYNJih3Mii1MjO0g/8naCM3PwwxgGyN6E
	cIGRR3tgOuTfgt2fqym2yypHwmQ+2+zeWkDxzQ3A2XoK6K2c6LXTblR1YAjzz3riGtyZE1jrhBv
	6SHw1msYK0sMpMTepBEb9C+wnqJrPn3XhvkX8WTWvgm0OC3Je6cslyO5wchtyNy6fCIIyoLMH6n
	tJ86WUtmUHXSmK3+Okjt88gHx5GGpsI0=
X-Google-Smtp-Source: AGHT+IHbD1rxZ+hael7UI+V4nWIH1JBGIhGROdLFUhD8+vK/+XpzNrjCzw2lcwqBQ5oIfEeaFLVqCQ==
X-Received: by 2002:a05:6000:288b:b0:3b5:f0aa:b1e5 with SMTP id ffacd0b85a97d-3b900b4dac6mr1921081f8f.19.1754652233967;
        Fri, 08 Aug 2025 04:23:53 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:53 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:04 +0100
Subject: [PATCH v6 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-7-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

SPE data source filtering (SPE_FEAT_FDS) adds a new register
PMSDSFR_EL1, add the trap configs for it. PMSNEVFR_EL1 was also missing
its VNCR offset so add it along with PMSDSFR_EL1.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/vncr_mapping.h | 2 ++
 arch/arm64/kvm/emulate-nested.c       | 1 +
 arch/arm64/kvm/sys_regs.c             | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/include/asm/vncr_mapping.h b/arch/arm64/include/asm/vncr_mapping.h
index f6ec500ad3fa..c2485a862e69 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -94,6 +94,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 90cb4b7ae0ff..aeaba7813275 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1185,6 +1185,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..d1a55cf589b7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3083,6 +3083,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

