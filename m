Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506D27C14C
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 11:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531762; cv=none; b=LySZtZmRo5Yf6msbkArrlAVXNSMe33w8QDFVSAB38inke2c4rO0muah3Ef0PZyRdp3KnfI1LnV7vMJQX+ZwiVinTRH8uHhgqQXJrF/wvU5kxRjgROO3B8JnOucJFBS5LyoXq4/1KnJpIOcE6MDSuOY9nvy2YLWOTby1XRcH41ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531762; c=relaxed/simple;
	bh=TD6ToqP0Mw9/zwmt/jMIGuCKaH1dYDGMG9cypkdxqkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtGULoOPTM6bz64GaGbKRDKKFuj8WHBDAJ5qTyvt+DMvMtMDsl4LOFH9gIpZUAosDyf9oSHcf5La3/M8sKqlBl+EB+2/s9nF/y6nA66Rc4r23WJ7/vQl5EWD45g0r6QXna+HyBRTwoA/BIB+FJK/aomMhHR4RmA7mZqypGpSdas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqVUSZUE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqVUSZUE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso24482355e9.0
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531758; x=1747136558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=;
        b=OqVUSZUEIn9+M4eH2yndN8kQVMh/r9mh7UrA5j5nrKxNl23G6AdHIdY432VQA8GiPV
         2aRchZV5WQRxE4RrpZ9NsljVj6KUYtWxyKeSmoUZVPdV7KgT/+Clseq6omsdj2+d7hec
         7I2g0NVWKO3m7zZ4uCDWrBvgASAcrzPoeTWWrdofquwAInhuLl8PBfRbr+Iwey+NEKCq
         eqECHJpe9LvmUnzFjpMRnjS/DCKPjoxoZHP5RwWD86v8/r57Uh+CWGp/c/f0fR2peFD3
         fBYZU8MrgKZiKBgSTIuMW8WdnHGTx5rV0DVuShLuwMzJXMeEBUAlYFGU5s2YQLYTbLGu
         ZDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531758; x=1747136558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=;
        b=mUL7j0XMgM0+R/Wl0aS/vaV0xITkzxkiMnraiucYsB9iIHdpI6JU5R204U7Vy95Gvk
         aTaQ++DQkoJhDDA+3y8j+VQhUlPJDGH72NrjePpMJN4f/AmJkIPhvTcKo+bCcIAKpsTW
         GT+ANV/FfTMmEpmX8Abzykw7+SM3AhyE9ZH2bb769I3+vsAIUXNwq3UzCkwve1ZHH9Tt
         dqC6tFBJJbGRDbJOPmeMJrLL/aN5JdwC3vYU7maHHszh275kTmK5URr7/qKFkAz2cLUK
         RpS8GzHBO0H4V4WlnpJT/U6k/CRGUdFn01Q3ty3FG2dunCI+Ev6M6pCHSjtiBUdMS18h
         gldw==
X-Forwarded-Encrypted: i=1; AJvYcCVcFEo/2Zi19px4ytO6ystwGJRYDVmzQVUL70N872uZaj+Okb/OV0nnigYisLNQeVTFrKO1/ai3CbE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDoj9A2V+oqvYu90ACR36t2Rg5GdaKGUoCU7U72j2Dv4NiGy7Z
	nLUiOtRbjzHW4a2JEOY5grTfjc/SVY/9xPULQNuY+ZrtafBv+hPpECI3DPjDgtk=
X-Gm-Gg: ASbGncuMEzXOdB/KMbP7z0s1cXq/aj20FPQYl92KoHOSmVBIFZIuFpsMsMPcd8APoEo
	FvRDEzhtoWaFDJ7wVrLyEAXNdI78h2K74W74LSgakbqVFrUP8RTGR9keGzx5o/4J2JHxdGWTZx6
	pcKgAhP7yhiE3OvrS6v/7ZI2ppB3+I9NVC7cDvVPSOmdetx4E25DBqLdhQW20R8k+CFi8GGTFoh
	Z947qYXgXN47A/dPTj5LpbixKSvnYYCHvYOtNB5zjs8CEupyHzrYirWH/9i30rBkFg54znxDPNK
	gxhGjUE7CtwAwH9VEIO1IEyiZ1u+czMmNEvQ5uHtGexngs4=
X-Google-Smtp-Source: AGHT+IFY2PTkM5OGqyGQ1rieutDdi16VfttDeC1GlcJYbSC4zGE/aIwEggIDkiNucqgP5hbvdPyHIA==
X-Received: by 2002:a5d:5f8b:0:b0:3a0:b133:8d4a with SMTP id ffacd0b85a97d-3a0b1338f93mr1496745f8f.5.1746531757737;
        Tue, 06 May 2025 04:42:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:36 +0100
Subject: [PATCH 04/10] arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
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

SPE data source filtering (optional from Armv8.8) requires that traps to
the filter register PMSDSFR be disabled. Document the requirements and
disable the traps if the feature is present.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/arch/arm64/booting.rst | 11 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..8da6801da9a0 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
     - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
     - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
 
+  For CPUs with SPE data source filtering (SPE_FEAT_FDS):
+
+  - If EL3 is present:
+
+    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+
   For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
 
   - If the kernel is entered at EL1 and EL2 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index ebceaae3c749..155b45092f5e 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -275,6 +275,20 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+	/* If SPE is implemented, we can read PMSIDR and */
+	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
+	b.lt	.Lskip_spefds_\@
+
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1, PMSIDR_EL1_FDS_SHIFT
+	/* if FEAT_SPE_FDS is implemented, */
+	cbz	x1, .Lskip_spefds_\@
+	/* disable traps to PMSDSFR. */
+	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
+
+.Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.34.1

