Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56992EACE7
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 09:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163570; cv=none; b=joLF/zyhhbckMykf8BuKhNrSGoSaqehFuJk4v6ppeWY/KUQOe1BbaY8XTXxV8WjKc1r1Ivld9Zgqh9fU14Tcnsh3IxY0lL1YVW0LgCntmpwuNVk/Gr3YABnkpB7WPNcbWZZkshWqGAfJnnfGI24DOTMqPbH+KLskvin33S5p9/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163570; c=relaxed/simple;
	bh=UsFp0sErRCl0MxQtdMcp7ORp6c6Qv9zuPqmFhcaNxF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R46bvNT0OCuljOewC/r2ejW7ga/c4344NNbreYttosb7Yw1KXxXuZs4QemEjRGOJbTILlrHJ/Ag4P6V/yrkhPpt1QXZwz5+VD5VTSyYtwVHTwnTcC/nSHm6KliUfM626IjtCjd+10MKnIuR4wrxGSiXbB7ikd8wiNNBhIlpTFT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSEkrnGN; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSEkrnGN"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45a1b05a59fso4808405e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 02:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163567; x=1755768367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGZcvUVCZS8QsvENr66yrxXLduHaz342cTv3n2jzGu0=;
        b=VSEkrnGN49aRP8cwWfmBNS2KfXVemu9PRYgYjG/BbtnK3Geaeb++Y6AL7yDZ6Rrfrg
         wbgQGVGE/PgRowlOjeRl8ONSBQUiDvsn5JeBCIhwN4aPAjgXhXsyWVw/TjY39ExoIsNg
         L35tyQN0DykOwpc9HyVB4bkeY9NS1mh/TeDreW5eLkXQsDmOyIxMcBTeeEs168DZ2y+q
         nza6o80s1iDLTvqZPr9d970rCl+5guEdvlh7P2Q9TWmi/Uj2tzcvGi2djaxICB2oDvz2
         oD5fk1Dk6VT5F+68p9oin87JMxrBtT0e8G+1RelrZi5ms0EJT6dEQ/ECHCrab26B0l7o
         qPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163567; x=1755768367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGZcvUVCZS8QsvENr66yrxXLduHaz342cTv3n2jzGu0=;
        b=Q6lAP3G2Zt8h86Cp+euegWDvBbyInj58p4A+hq3vav9w+1lhbJracHcu2PtK6zMi1i
         xSAPxkCY5eWF1vupsEtHSD0Jz6CZtf/+k1jASAVM1i0bii3zLS+r7hNOd9YyU2yytM7X
         TJD4zxgbfl9Z/t+4QdRPf74z14xTr9izGjugFxyJg7OWAdxpnX55VYthtjH2yPv2Yyba
         bHaeBk1bVM7Hj+oHfICtYbnHDNPLsimIQl+SxQ//goAqZ5fSaJOb2mWVxgAl2aoLHICB
         oE3KfzE9lrodWVjBAEMwIy32t1aZtx5ilPvMb0j5krLiPXM1c9jDRSArWKxlKQwwWTZ7
         0LRg==
X-Forwarded-Encrypted: i=1; AJvYcCX8VD5xZvJyNWo4TXYxz1gGuBzwviKk6vWOYRUiRjqZCsvsRSKvCDAS7kBq+bh8PfiUqK8VYBZku14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrDmzDhBhMDngWYv+tqUkjJWhUpbnjA9qa+vzsMO8mlG9XYe9U
	kXbi/4pca/2Ndkx1ImsoileNkENk2fA8wErspPDcf+ORWQAn3C99Kqm6hXo1xjhcRkw=
X-Gm-Gg: ASbGncvyM0wyiLuz/48k6i8ImL2Ez2YW2FJ7QiapDy9+Qmy265bkWPvixmUT8PsE5R7
	Kr1oIy44qAKjQnZb8B1sHvErfHw5FKvYMIUPYifYjDzNrLf4YLCTvRtUb/WviqV/q7V0OmMalWs
	rUfY3m0n4mupZjuxEBIjOqrZWyd4o8KGYIRavnMphvEouxvGZnATdyPrhNdSfTV4yewa2OF3F7b
	KIKyaxVgSQD+9IMJazuEAVG40zMTCiXMnYpSk8u60n/qhUXF4i7T7OnpU0u5vukhhFEQPEhkdKv
	cfDWeu58CPOueMoQXuMtEwGXJkMtSG7xN/NkNqkUgy7mreplL1hADa72n7ISp7fuAETPZYdT+mq
	MQQMYO3BpOeXOViHXFtTnfj/b7xmpgh8=
X-Google-Smtp-Source: AGHT+IEOkVLtv4LKb277h/Y6u80yjiTAO7bDjmFHcIn9yFqBWPJOT++6KQmTGEGyq1SqLmRRRDPzJA==
X-Received: by 2002:a05:600c:470d:b0:456:214f:f78d with SMTP id 5b1f17b1804b1-45a1b65f96cmr14249085e9.22.1755163566832;
        Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:29 +0100
Subject: [PATCH v7 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-7-6a743f7fa259@linaro.org>
References: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
In-Reply-To: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
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

Tested-by: Leo Yan <leo.yan@arm.com>
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

