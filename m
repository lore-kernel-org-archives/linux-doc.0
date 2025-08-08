Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30154274676
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 11:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652235; cv=none; b=kgi9hMxRuAvrGcEBdg7dlVQ+U38QAVJUwqMRT2eXGTAh/v5/cFA04WJelCB8cndh2RqVIrx1Gt9kHHPfKFtbVIFCVuMzQ4c4jHrXRMqWOIu+ilV0HqwOXz/us+KyePgYYRcVuH1u0aFf1A3TYbi3Ebw+cWCYDRitFm8kDtl+u5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652235; c=relaxed/simple;
	bh=+jA3Ncis4HX5+y5SYS2TqC8tE0E6O8ym2X0vV73LTxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GWaSf8eT7oT+gotqafC6G+drPujV9osRK2sVD6Os2XIluJonShYqjzB34apE9tx/PoeZtI+x0y8QfYA1LLsHYHHby/O8f4+wCaZUl3WR1xHoqqZ9CMmv308KwzV7D83E/gef7pG8b9Ax/SoBZMMVj0vVwGSxrsr3ZL7FgK3A2wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MegcH7q1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MegcH7q1"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b790dbb112so1173014f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652232; x=1755257032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzFFhgGYuB4xjedzO7rx53MXxPvJ8n/ZLwqm/7UkgOI=;
        b=MegcH7q1FUNryfCKhtQfIDZEoAwBBh6ttMIf09i9sji81axXCWHaQQb3/J86i3nnES
         3lAXn5E6wYGhMPhZ8xrPDbHWT0mbDNfMGUY6Vzh6iKqwx/2UpBDBmUxBCKIj2D0e8nln
         Wl8qhm8R2t6rnpGWFYDzbmcJX0BRWa73TWBp90ijjrBOa6448x/hKana/jTEkxhb/bT4
         u4MVDvsXVJaW8JLx6UwjGc4eegFoWlUq+edv0ToRcgaIRFSKUy2ZeIySadllpYpRc5E8
         Xlz0/ChAE0Y2TuqXeF9GxEhmaPt9c3j81KudgIg1iLpi0dbV++O88qdv+pW01JjEjXxi
         EQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652232; x=1755257032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzFFhgGYuB4xjedzO7rx53MXxPvJ8n/ZLwqm/7UkgOI=;
        b=AY1jTTzomPEvzpxzNemZoyOVGxT3eqsUTxKLFgZKsb1Bm4DJjZMI84BWnC2qQcKviD
         xTpnS1spd3oKoGhb4OipUC2rvr2gEbZwpVRBER3A8lT4PCpPoYROqE5D8wW6S9gr53H4
         wC8GhVeEIhtSiRnK23YmS7KHgaCQZOqTH1G1qZvsrXZpIcpCgba8AiIOeRG5ecAafyzF
         zg0aZupdePXQ2Qy52QCIRClE4OH+x+4fuSCCUB4MhBMuNPoXa9YTHMoPeLxqvzRQyYPb
         w74nWkmPvrjtYr6/LRjLY9zVicVmNNrsm5fh2Yau5VOVKlLhsetud20NB2sCn3vafLxU
         UvrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi0df3GbO46m4YOYjKBx1glE11+2IQnb1Ev+TNMii5InVVUrmsyptJao5MrLrn0Xm6ygQABmtVmfk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HAhLodGAqhtUTUMjvzs4Tm1InooHHjWntA4U2J5t/ULc/w9/
	VO1vfv34xeJOdbcoBFxKrTURm137equOBqWFnKzR/aYb1yk3fmYzQoxf58t4YCGwq+c=
X-Gm-Gg: ASbGncsdlHc4+Q9JoRgEMEBWFYhhIfw9pMpwIYQRB6k1VP6iCdW79WnzU46BpKVt8GU
	4SMXyT1tHkUCrnm82hj1k24VvBeP5hDFg9VwS/h/G2bHQjReAwl9mM+MEL6dPPsgv6v5q/UTPne
	+2vAoujSSqKHiiJz8WrpgsDg4N9qi9pP9SBgrxe7SyBj/q52hLq1g2HJIOSUW8w2jN7AHF0Vlcq
	8yC/hq85Q1//tRi5vn8/JjgEHzX2mTtgPzcBGFiVpk5jubaStBtvRvkxnMM0j0wt2XdiE2GQHwa
	BSipOB0KSHzuSlSqtitrN7a02Yk1WpScd4axvz3ita7rbWTbA5eiW7I9TiTd+0xXe8zP+AeEciQ
	UmQ3X90Ck62EjTPe3C1oDXs9tq/Zm0Ku8V7bMJCq47A==
X-Google-Smtp-Source: AGHT+IFA08gaH/PE8BI7LMp8YziJ1EgstGveIjmcsXTetOJTEOPbmTHS6Iwam90twv6fI5T7D1HpPA==
X-Received: by 2002:a5d:64c3:0:b0:3b8:d337:cc33 with SMTP id ffacd0b85a97d-3b900b5026dmr2094550f8f.28.1754652232546;
        Fri, 08 Aug 2025 04:23:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:03 +0100
Subject: [PATCH v6 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-6-6daf498578c8@linaro.org>
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

SPE data source filtering (optional from Armv8.8) requires that traps to
the filter register PMSDSFR be disabled. Document the requirements and
disable the traps if the feature is present.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/arch/arm64/booting.rst | 11 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 2f666a7c303c..e4f953839f71 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -466,6 +466,17 @@ Before jumping into the kernel, the following conditions must be met:
     - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
     - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
 
+  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
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
index 3a4ca7f9acfb..a0361ddcdca4 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -392,6 +392,17 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	/* If SPE is implemented, */
+	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
+	/* we can read PMSIDR and */
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1,  #PMSIDR_EL1_FDS
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

