Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DC12F39B4
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 09:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163568; cv=none; b=rhUGjdWV5vfQTDeErnZEx2mHjaER1RMUi8afnIcW+RUeSPnSbnMSyM8VVckKVop8UzZvhDDe8/AQTn0GU/TY7iu2yZQl3IchREsTNvYqcfdV1tKXco1G1qmUFThP4XLlsXftN9uVv5CSE+AHx/KcaGsgMX/q0WwyEQAlAIIPd6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163568; c=relaxed/simple;
	bh=o5hoKk8PVrb3Jz138QI9+seK1sxidrzo/A/lviEOL3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Co4f5nLrLK+81ExF5q78NLR4dEvn2IXd1W9GjLt6zqFAkuZ/fsK8vLKPV4OrwSM25gqr2y59EmznhLIROY1/3LAldmmL9dj8gFhqqgLRXAijoNtgIfBuL/JVhU5lBwpKCaupBhUtZXwAiQM8zjX5K1MApkY1thhfgFFQTO7flJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9S641uk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9S641uk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so4655195e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163564; x=1755768364; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CHd8HPOm/LFAxhlOS9e+lKUAamxvrPZUbEjnXUTZJIA=;
        b=M9S641uk7y40vGu/P0qaXAFNhSeXaEKdD9nwGsvVBxT+7rRafrhvvbfrx1e60/JogZ
         f7jYboych6Ts03qM+FHUL8Fb8cI9U/HIpUVqEmsKMVIndq+xL5Z27mvNwS9w3s8X1XLW
         t5C5z7/txeF/ZYa3WZcuu+JhEvlM7npiWhdHlg7ec5QXjDe49itGkiLMvl1ZmwTf0qit
         1wqy4OPYbahJ6/ODUFv3L085TJjk7uXYQubX9lbhrRO8KN8T7SHDct9xRwaAzEmFSzEH
         fZTpXDxIuTEVaX0UzZJIw6pbzEBYzSQtGOH1H2Yhfgr2pCrGE/JPZstg3cFa+mt5/S6b
         ez8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163564; x=1755768364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHd8HPOm/LFAxhlOS9e+lKUAamxvrPZUbEjnXUTZJIA=;
        b=uY0gYobnaQAN/+N7YDYzTh2Xr2HLkU+13nDOzFbcfX2B6P2LKT8PemuJ6e5EUuifPf
         O1ZuzFli+MiiIyvimoxBQeOxoRph0r0/bpHMe6K4wv4Fu4lstC8WeLvow83dBd8bzKLo
         vL2foI95Rax9i5PYnnwq3v1yUOw0g/RiBfQ1IGzLwGenqD/E7I0gMZWdRzmJCfYx8FEW
         PUVgZXNLIWo4GUK+DjdbQQRvzOJh+HmjA6EsCFAdDpRE2ct+zRNDPym1R/6B6uRHqQBu
         g2TTTe4rKl+vnp8pLN+HT10rwk65ieMVZhr27fRYrFUvihrJupJygh8f8LLlaxqBGZrs
         6LnA==
X-Forwarded-Encrypted: i=1; AJvYcCVe600+XdVWwPUca7b6d39NCWqCBTwZkZLo15be1vrBCCEqULvaZvFWfIG/etpqnXI56JbvNdj0wNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/0pYUX1u21FhJdCjOWvzPzOGp7GgSIhKKg+S25Hc5GeYmnQt8
	2NKMoBcQjFdhg5JXdEWcEf8P683lTzaZ9d+WfzYbNEZkoPW7e7vKGQX1OZKiULRe3dU=
X-Gm-Gg: ASbGncu/ccOlsrOhzWVPcMpQYViuioU0KSUWD8DHbl/SSnPhrUIrQZ9nf4wgm6phhfM
	N1RkUn7PhyJNKi0KQwZlKUp4b0XexYmtNLqeeD8Jp2WIV0cgg7MwUT4s72ONBWyTDzWoir2qkCJ
	zwjlNtwV0HC3RMVt4pBThbs4S7PsCt/b2eHoz29ZD6ETC8rfvfgCt1lx48zplHPvYu6aDiNMwvW
	h+E9PtnCLZwGs/dBYj4h3rYzpBFBxgS19J95pqdO3+3WnTzou+DXtWEK/rj7arYil11GAK0/P7g
	cGk13pcR0r1cMuyM1IkId7vMwrURlAAKwCCVrhqUZzmvftFGNm9w4Ub7vaIq+OkCa82pePCMCDz
	3eiLVdzg6pb3nW1sxkGDwLtnKGZSn7TQ=
X-Google-Smtp-Source: AGHT+IHVbFNevY/X+5Fk3dLFGyCp8s96euJO8o8AaVBD0HLHGypEL/usVLk1GhbMm0uoIXFS5XgajQ==
X-Received: by 2002:a05:600c:458a:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45a1b791232mr17035875e9.5.1755163564130;
        Thu, 14 Aug 2025 02:26:04 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:03 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:27 +0100
Subject: [PATCH v7 05/12] arm64/boot: Factor out a macro to check SPE
 version
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-5-6a743f7fa259@linaro.org>
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

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..3a4ca7f9acfb 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -103,8 +103,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -255,6 +254,14 @@
 .Lskip_brbe_\@:
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
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

