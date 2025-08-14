Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198752F5316
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 09:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755163569; cv=none; b=nX5Qk9OEbdx6rpIEWHb9zg0tWVK/S61fOlenObWq71fveafjpBIwRLky2luqXAxo03bxE8WpkDkfBxbhAHoDesHrwu2oERR6SBM2fZr0D7g+jU/0P5hSyQGf01c5cfQhnm+e755/gyU2mKHYeedZRKR37sfMkT6xrIGTUkMSYTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755163569; c=relaxed/simple;
	bh=GxOVOeFB86vYsIqEPOrJfP+toIpofQdbwv56n+DyiyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a420rCP8mxB9ENA0Om/K0vLU33Hh2ZDGKKQGU3IGl/SWj2QtK5OocohcB8YiyqUtq56FjhkHlBcguHuZRKUPWQCbdE29KCG0HX6K+JoRPMggTvsEPwXSHv4aoVYK2BmYoirEHMKsEoTokmt9d6AJ4TiDG+40LbqBSvzcskk5iv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ezv7EonJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ezv7EonJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso3545225e9.3
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 02:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163565; x=1755768365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ufcAb3VHeR+uwp3SrFDBKP9OtJsomlijITnASDdFZ4=;
        b=Ezv7EonJMyPf1NgVaElc4JTZT5urIHO9FIiaZQWcjU9vYDaY5yz+zOyZafgMOsKFEv
         Dq6lzJJ78wtXtxxI290zFatfTb2Ib/EkTAiz/A0tQn/fX2JZ0ZvP6HcgRY5pRb24ANGn
         bY37KrEfl3h/S0MjfSZsqVzqLLbVQpdYNuWEWyoMF9vfwz2kBLOJkyZjYRy5XqlGSyRo
         Ce9PD8SWOgbI92Ir8kvIX+X9mOthM6eo9hCWh5gB0pV5BWOEG43mCuNVFNLSRkxWJkF9
         PxeScJmfHITDSv4Lb3PJixyDVrEwzxJiGPszx87WFLTJ0mfxe0TZ9WicIe6ra4l6pxXL
         Ka6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163565; x=1755768365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ufcAb3VHeR+uwp3SrFDBKP9OtJsomlijITnASDdFZ4=;
        b=PdV8X+ZGWHoprbDe9AGzvtRfOn+utw6vpp9e/nRBpYfyPM9jrqe+V3GriRcGVE+3og
         AoIVugcQU/SylKKSg4S2KI8SqMNXp7xOOh7w7jYw761i/7TuQNrsn17NkMfMJI5vWmbA
         ZVRqa71IIHnUaHVdczPhuTBhyV3j20Zn/usLCNKZR40UTjZs5V1OQd2opyV7wWZLYNNA
         0qO/OfuNlHyoTvjcO1m8xU7JL1UgbwlkOPzCZ/qufWuLdnzEehFpp40KtHWY087v8HpD
         TQkIfBvidlxvnGKM1e9CRRtIToX6TxD2Papsv03BnkF8R+5VHx5Ogjsh+4cKnIfmaLZ/
         zlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFMMBcp8ho3aHsRUfOyv/J2kRM/rc3qiuxpOYj4qARsN3wRqlXi3daOC0jOajNU2tzCW6Hh61PoAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLn3YM7PfX3/Uyqhb07MU54kxfxScqNSQfNhwoCufSR7LK6jcn
	n9MwJ28mlBwB3VdeQRHVNmCydfrRZMwWbHyVbiYZcifpRi3vUL4Ma+kx00moY9UlbtQ=
X-Gm-Gg: ASbGncv8Dl1yYulcFNSyDpu73aYXpIl7upyrjgiHBkZ4pREMnV2Ewqqp8BCovvM8pcd
	10lHb8qzoI8yxMjt9MvV9iX3Z79NgqDwxxs6UOhvVOH97jcOk10pju+mIv/e1D7XxxV2aXrDtSf
	K9eGOso6VmiljWjsIUuBYgonjZI8BnpXz3YpQBars1MW/D/qePQlnaXrJbnqS3YgmdpL+ayfkBT
	Y8ezKrg/b/S52x1ff0ooHi5xzo1/Z3TeSRRfZy1K5mJuHOOUCIMm+S//cyFS+8wovjtnqWgySKS
	JcFxXQkgd1R7gD1g28F5FJJ9JPGSC6+MWORWTjn6xJk1sMJaZaQ5Yqq8Xcw8r5EdhpW8Fmhp1kD
	QlLSNkBJi1/27XPDvtD5Vq0KWG7aqY10=
X-Google-Smtp-Source: AGHT+IHAe77kAGKOL9ac19qggXFCssFULmcjf7EqpMgCC95aWkBTN0oGZBZjWaCvCRy5GyrpGxVt+Q==
X-Received: by 2002:a05:600c:450e:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45a1b6753a2mr19670995e9.31.1755163565465;
        Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:26:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 10:25:28 +0100
Subject: [PATCH v7 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-perf-feat_spe_eft-v7-6-6a743f7fa259@linaro.org>
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

SPE data source filtering (optional from Armv8.8) requires that traps to
the filter register PMSDSFR be disabled. Document the requirements and
disable the traps if the feature is present.

Tested-by: Leo Yan <leo.yan@arm.com>
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

