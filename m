Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86D132C310
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730520; cv=none; b=FEkchJY0nToLdex89bkIqe9ARsVy+T3t7jSK7jmeawu4VfRU4Ohmq1lQ6sz2uqGT44ZUKB5XJG4gO+j3EoopFfEtuJB2bSUcR1GgGRXladWno3IDdfnNkcgySzs+yOryYXmm/E8kSLqoq368Tiwil6g2iVJ0MTM5TLBY3m0xUyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730520; c=relaxed/simple;
	bh=oruhsQ/XnkBWLsHo0pDjGsCJg2Naa/yFYEoihUsJuQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RwQ5++fDuKt/uHM1cP/Buyk6qOFlAmS31ePafXmZrQOFi7EuB8cvajkD+DkkmwRYgIc6EyWWvf/2J/NOwdrGEYwvHFt+HAFXOFTLv4Nw+XQcev/bZ4HCC26OPqhiUfTkIjdT/3xFwxfpQGYVa3OF6zcu+KQORXU9YiJapnswwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePXwn0MV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePXwn0MV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b88bff3ebso8366985e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730516; x=1757335316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH4IhsI7u0PxrBs1+bnHSTEJenEfrd4F7dzjVPqlBZM=;
        b=ePXwn0MVt5XH9a0y83Mm4/qPuBH6c1iqF+heiqdhm6mdcVaTNl09RjCndaUPFMYIXe
         2f6QEOMDKVXkhjXhsxWUjuz0EFd56W81UXcWGtoIQQ1EWR7FkWwVZHeMCaRl/F00dWJ8
         wOTViPmFHbxSh5K/O43+ROhAHCbjiEtfroH3r0XBi/CK/0RU5ZiD5aABEeVdIaLuFcCT
         Mz7YqdI6eutp4FM+Gy286/s77SleRaKz0JUoUfj0JGurRhWx23RPXsQjMmSyA1xZzmNd
         sJ1pvBXpvymqZm5DPJtdtty9K9ntvCJRAEawBzb1o1diPUvfKtXQrD2aQ6t9zAP1duRj
         QBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730516; x=1757335316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH4IhsI7u0PxrBs1+bnHSTEJenEfrd4F7dzjVPqlBZM=;
        b=UHU7tf69Xuos9cbWw/ia4dhBzvEl9QFuc4zeKwlFsnrW3atfIoGq3dvfHo+g6qk0uY
         3GuXU/hmYHmeTw5kzRdiKoicg8MFj7CmNYg+SQMdLKcd0o/38JIrneJh1ZeBf5+ip8Ex
         JAY4W7qexKhuwc6v3eT8S63de4jRhrisrtCyMHJsAFfGwvBXJzb8j1mf8QtDGQO+g9jv
         r9P/7KgCW0Dj2KQyUEh3453XdXY+phXE4gG4cWXxfIDVzFJmtkJa6eDbpvyuIrwgoQ7Y
         rac89PIvXt/aXwAOSgh6dfJOVr4+76E675Oewse+S3Gv3hTNcTcm+IKEN8JvXhpzuOF4
         OLIg==
X-Forwarded-Encrypted: i=1; AJvYcCXbBs0FTjopjGpzrPwrFIXDW13TSkxd2zU2rWyuzMMtsb7gyndIoPE3txqc2ec0yEYG0ZDOGc87fr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJXSpzEAiu3RBR2l0ALAXOnX/caGy3MYxWQTxQpCrOw4qjRwgW
	phwQwXOzBVlswZG0HPrd49eJK3ttTr09NbB4gzIdMXI0R1GgNcNOwD302Lb7FpqT3gE=
X-Gm-Gg: ASbGncuZT9fgAg3Z97AEjpC6TjsrcHRw91sfGq9lyPeEyK7xjet/MP3/njoBj9pJH0j
	MYQwVknL1RHjB6Sz+UyxRcuNB9gX6dxYoh6eYOH154vLCaWhQGrUc3c4bJRMBnOkkOiPoPm8n/3
	u116BL4IW/sdexZlkmB4uwlMLNcIT/9l5X7/tv5vZrzlbbGTOH6EYQN7C/4gt8E68EQXR3iTJEk
	6e7danMLGaqIlNhzYzziE4Bnk78PrDvkN88hjXSAVG2NT2/4ECBPU2lWSMp5mflXI/H/jVg2MAH
	+OR7/2EWYQudIxXqfnTkHTa5Pvkuq7DBluyewtECLKQel2V25+zvYo2h8SUKTQ7M6j1Mh4yo24Y
	+k1+9t1/mEUvGydbrIp1NBVZQd5E0NkQHqAKO76mH6Q==
X-Google-Smtp-Source: AGHT+IHhau7EY0MQDlSyqPT+GtgoSvzp5Mp3oC9O8x1gCNdLj74/uD4J58UjK1u3FTzG5sPU+DMpPg==
X-Received: by 2002:a05:600c:3b10:b0:45b:8f38:8d36 with SMTP id 5b1f17b1804b1-45b8f388f6bmr19047285e9.30.1756730515555;
        Mon, 01 Sep 2025 05:41:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:34 +0100
Subject: [PATCH v8 05/12] arm64/boot: Factor out a macro to check SPE
 version
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-5-2e2738f24559@linaro.org>
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

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..a305386eb2e3 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -91,6 +91,14 @@
 	msr	cntvoff_el2, xzr		// Clear virtual offset
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 .macro __init_el2_debug
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
@@ -103,8 +111,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -263,10 +270,8 @@
 
 	mov	x0, xzr
 	mov	x2, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
 	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK

-- 
2.34.1

