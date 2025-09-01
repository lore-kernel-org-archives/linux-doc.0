Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BF33438F
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 12:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730522; cv=none; b=KKQWAKf+8k0+JFRjSOAC+1AX8FQbi2VYRPgFgXcjZu86NGYMIWzom2mEEjnb6hVqcONMnSGwBw47AOzz4sEwgI88x+rT3HEwGrgEtD0LimepboIYKbuuWyvTks6g+Rc07+0afLlnYzlbBEjCa7qj1bodnwcd5ODC/uzhP5z7Vao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730522; c=relaxed/simple;
	bh=CrtUTDi45Qns4EGcNkps9RWbCufp7alE0/jGYmVMHDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rlFzCzBtRn+egyq+MSYa5xTrgQpSDduWaeWLKIl+jW1vaTM7pLeh7gb3Nc/dksUcop8dRBjh2bMrn01gED5RdBx5vauv34LhqSLd2GC04uQSqKzN/MunV82oVr20a9idkSlcBp2MuJaDABJ7qNxdcFJGVuOY2TLu4fVENrqImwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VVa7P+mX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVa7P+mX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b8b2712d8so13534925e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 05:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730518; x=1757335318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=roHZTPEwCGJoEFzevhfwMCKmJqGfJWiT+6yPYuF1kKY=;
        b=VVa7P+mXvPA6KblTmWgTBWqU2VFhG1epBpozYO4eQE9Vnk7myZaDUKSslTH9K1L56s
         v/n4GiTpsmnWU2omHc0WG5PwpxnY3kfQQMH/2neOZx4j+un0KA1G8dYPnIckkWRw4Epq
         ko29dLX9437Fm96pf1DJQp9CgHwPnnZ5Ptl6EQLY9VhDc4+sQ+CNDTI5Vdz3wfPwvuYY
         cnxYl+Z3VJ3CuhCWMFuK0pyXnZ4v96PqeFDo/n0nQ0Xe5MzpMzzPqSZx5lwC/E9pns50
         6rQWd9BXuJFLV1tT6U8eO9YJj0ekktZQYAdD3i/f/RSztWajY89/E/iRMC/IojPqdrZ6
         INFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730518; x=1757335318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roHZTPEwCGJoEFzevhfwMCKmJqGfJWiT+6yPYuF1kKY=;
        b=mPf4WPMmtJOZCcvV2CD6R6SPhmvvi3TvsPDvelM6XYxEQzL9WD314BVcOp9XxU4+zP
         hP1rri2HiN5eG52Sr7abrjK/7ZWl5IxK/4VDlnRhXqkDsY6YMat8brFfYWQPGQxpWAsN
         2iN7Cgs98zGHxS6bpDcFAn94O3ZDCHnAdC/5EjFUmnHs/pIt82lERZBM6s3/gfOP8pxt
         5Z2U9mopsFOFpwqdpWgr6xIZ4j+Fvoz0b+/gYBXjkDmweHrf29IrHzkYyaEodWnFNl+9
         5m3V09bvyU6QfqfmhmuWrLxTlJKrlS3OZaIN3sabWYTgP9XOx7x3sq+TOrO2VWOtYkqt
         qOkg==
X-Forwarded-Encrypted: i=1; AJvYcCUuRS7nPJolt/mbK8CpJLEhPdqxDRfD0oseUAR7ksCKAw2MT42iHQGszSm4vCdFniTRS8i1TJ204dA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuSFKqtzkpeDKz18IGRIYkZNBNxTb4pNvSUBtnNZcwkP9GlWj
	jdgplOt0SVjRPVhFYWP2I3+VX6/s5VdpC+w8vAjBHZLny0okxhBTPDAnSPUhLOZdiqw=
X-Gm-Gg: ASbGncs8tmO8zCurvua36Lg5dfxsR0oA0BzuSO1KRUC+LdXUOsn1GablBh04fqnpEqk
	drmVTCEi7RxnNGvMt6bqiRs2ADEozrb5h/a5gC0mgvj/dA4iJAyb3L41u+eoJ2GdMNkEosGDfOy
	fWL64PFcHfjzTRvcF3Orza4V7NyHuFQ3yyevxXqDDtM0Rpb35x9ioFsAt50C6cIBU3dJmHVsgKH
	eu2Gz1hUuUgOKtI8qeB6XUfc6rSNQFBOyrLvoldUzfrbhqof3p6CKzJwLKbY6rTaDvhoq+UmQgG
	soTxPQtzag2iIZ/HB7RwVRwIonbLJCH2z7NPR+AG69xT63mTyppvvAyYgeVW4Y8uccL8RcUynvN
	NkzLSeu8BxggQpCuHmPfHlF3iyNkReVOZP3u/BIOFiw==
X-Google-Smtp-Source: AGHT+IEYsYRoLgxLqyTVy0NzxTp86n2JBRtVW7sZ408sdKUcLSuGVXIbslWs4Mhg9uhS8qt4f2Cbrg==
X-Received: by 2002:a05:600c:19ca:b0:45b:8aad:d604 with SMTP id 5b1f17b1804b1-45b8aadd867mr37637205e9.33.1756730518458;
        Mon, 01 Sep 2025 05:41:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:36 +0100
Subject: [PATCH v8 07/12] KVM: arm64: Add trap configs for PMSDSFR_EL1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-7-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
index af69c897c2c3..834f13fb1fb7 100644
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
index b29f72478a50..4732ee1ad7fd 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3238,6 +3238,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
 	{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
+	{ SYS_DESC(SYS_PMSDSFR_EL1), undef_access },
 	/* PMBIDR_EL1 is not trapped */
 
 	{ PMU_SYS_REG(PMINTENSET_EL1),

-- 
2.34.1

