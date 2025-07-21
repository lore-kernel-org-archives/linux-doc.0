Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1942DAFA3
	for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753103122; cv=none; b=ITXnGjEu7J6cYKwwkvN8oZEOGYNFc3fL+N6C7aS3hCmuhzNLIFzz/c95bTk4ZMmqzPOv1nLDoTFEGiAX9rCAFpc5OLYQQJTP7PF7toaVYgPKn5pJjs414AlU1ZVsRHFSLbXgY3pGO94Hr1xatzRTm2XZ6QayoRs7HL/3Xv2TZyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753103122; c=relaxed/simple;
	bh=+SpNfvIdNfTZltOmSX39gMGmWG5o7oWGDEW8UKH3C24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ll7AUhQllVWYgny50EZ7UVE+jKF6l365FC7mgYjwr0nwj4LNEvhecQE56D1VGIZ3qSkR4Ov7ibucPgqq0MMdRS3+qLZxxLLvPXTEm35vC+0C6OYmLCGaIhAs3kqPlSQFWkgTPy0rbSpC0wmfytELV32xw6aLXbNh2sfcCFxcIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Edu2Cc9k; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Edu2Cc9k"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4555f89b236so42724505e9.1
        for <linux-doc@vger.kernel.org>; Mon, 21 Jul 2025 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103119; x=1753707919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ3PtlOR0m4xvI+xrlOA19tnjKSe6qe5HMQ0ewIzj6Q=;
        b=Edu2Cc9kv/9b5WwwT8A1LTpX0gEVjM9HPg2En43YpX8sfpMfkbkOSyAG8ogBH/U52/
         h/DCsPdWqhbvIvowiy4LNqoatjmLiaeno0T4YoznL0vcnAM4Cl8vfCzpZP75gkYITcrN
         fM8rgSTQ57jfQnmOO0LL9J3a6QL3c/6p0a/ZoJTPFGUjBMCkV04RITMZtC/jM11YGUWe
         HyJIj37PruTxHUSCW+6QS6XLuJ5EF66HXCQv1a6Yf9WM4UujD7+4gc7v/LbL2RygHN0B
         4vyaHACbm30C04Cl9qxYvLWTeYhZknOnrDgLYaUL+FOJ2/g/5f1+x7Xof090m5cvI4pp
         o1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103119; x=1753707919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aZ3PtlOR0m4xvI+xrlOA19tnjKSe6qe5HMQ0ewIzj6Q=;
        b=ZBSUK7SKzyflGk24iydyGiKcAXVElpR8zMc22J4fttGjFDchFXSrDw+jEArgjO5NwE
         QwbqHEftguH/2C8p7zqQFl7LEVgmS7hmSu7gin2s+DZ9fS6do4KBzcs6wpyxg0oVQMPg
         i07tF3WMV/PMw89NrBmJjAqHoawJAPN5SF6hZhVwDoVz6gWQBlAexSqWQS3/KCzHTOgy
         u/EUHAxZnGizbOyaXkt0/2FS/BwVDXWm787k5vMG5JOLbgelPW5o6KbBsAoOuzf6dyFE
         vPcLEQhJdQVuiTkB6Khk1+iV7dToA2j5n7z0nGV1pdXLq7lazQGwLYSXg2kkA4uzHZwD
         wwqg==
X-Forwarded-Encrypted: i=1; AJvYcCWDwET3F+sUeXfi/wU/XWefwhx/qPWVAcddeZqJFEGdwTT1kFmekMIDH8ktnz8ue7Up1hlTYzVkzz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLVFdcKrA7jT2WudTudHPR5b9crl0Os3N4/p8UfZ/fy7HcJfCE
	SZJ3Soe8t4D7dZ10HjegpwYN81Vb8XW3BwF7YSF71pzrcfDBDhVdCV9HaqHGRel4+LE=
X-Gm-Gg: ASbGncuofC+jTOrOb4dFurlm2AWeZKDv9CEmBBAVNiVfpUkS9l4yCb3UxSBIUv5gomt
	hryaq+ReHy7b16f5dBvc5+O8MGwryuOOya1tlsuRu81C6mnNdK2mtvL9Y7QnppESuIjW1mo2uR4
	SS2btZ7LyD48SoUIlE4/4aToE+D3lHv6sKZSJueUaYSsECLsr6tBMJFATSRun2XkaTzSWbBxCOo
	shBy9IOleCXDv7CQEL5zzTWvlgSpih89rT7/hUT2sausBp1jNd1RIdmN1us53k6yDk1odmvHsoY
	6PqcoMixPdv0S2Bwmg/d5fopOMHeCiTx3VYYZYnaWyVn0ZSbYDqNwYDmPgnI1c25gwxofWT33XM
	cwGpohkT4Q1H8soGC6JBks3WuJi6TFws=
X-Google-Smtp-Source: AGHT+IH9bw7cU8ns9QQ3mV/+eJ2qDxTwHmxGZEX7vgJMgWIg3L3lpoWH95LxFXy5NofnFtzmG3M36A==
X-Received: by 2002:a05:600c:3589:b0:456:1d34:97a with SMTP id 5b1f17b1804b1-456357faf96mr152094745e9.9.1753103118896;
        Mon, 21 Jul 2025 06:05:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:01 +0100
Subject: [PATCH v5 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-7-a7bc533485a1@linaro.org>
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
index 6f556e993644..dba0e58a5fac 100644
--- a/arch/arm64/include/asm/vncr_mapping.h
+++ b/arch/arm64/include/asm/vncr_mapping.h
@@ -92,6 +92,8 @@
 #define VNCR_PMSICR_EL1         0x838
 #define VNCR_PMSIRR_EL1         0x840
 #define VNCR_PMSLATFR_EL1       0x848
+#define VNCR_PMSNEVFR_EL1       0x850
+#define VNCR_PMSDSFR_EL1        0x858
 #define VNCR_TRFCR_EL1          0x880
 #define VNCR_MPAM1_EL1          0x900
 #define VNCR_MPAMHCR_EL2        0x930
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 3a384e9660b8..60bd8b7f0e5b 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -1174,6 +1174,7 @@ static const struct encoding_to_trap_config encoding_to_cgt[] __initconst = {
 	SR_TRAP(SYS_PMSIRR_EL1,		CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSLATFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_PMSNEVFR_EL1,	CGT_MDCR_TPMS),
+	SR_TRAP(SYS_PMSDSFR_EL1,	CGT_MDCR_TPMS),
 	SR_TRAP(SYS_TRFCR_EL1,		CGT_MDCR_TTRF),
 	SR_TRAP(SYS_TRBBASER_EL1,	CGT_MDCR_E2TB),
 	SR_TRAP(SYS_TRBLIMITR_EL1,	CGT_MDCR_E2TB),
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index c20bd6f21e60..82bddd631b47 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3010,6 +3010,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

