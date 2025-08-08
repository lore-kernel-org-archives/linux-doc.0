Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89ED273D6C
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 11:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754652227; cv=none; b=XOjKVawI6TEoJ0zYeIYy0C44zCMXUT411YPek9p1FdPnP6PVgV0zsyvMo5+jLT0DsH9FUPCHTPDWvOrECRSsCt0m4q0x1S7Fgy6vHTUpacvQKPoQfwJYvsrz1eD59yZPOhuekfhsnCshZBR8UicAsXT88hZObYCQn3pqqM43cws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754652227; c=relaxed/simple;
	bh=3Up3kwRIerg9fg4YQW6lOfJHj5P0kMfll1euXunJB6g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p01kr7++Gcbd7xxaIO+G4eEa3iqHmwxO8ppn/ck9A/lGHWa/0NOO4h1DmFnYx5empGxAfLOhBnCOGR+k6cJ3GFRzXF6ashSeM8daLY5I7X/gD7TwdQSWI6a7Eo4mFXZiNjdI/eT9NKvMyk8bQqQAIWG5a626kSUtN3Z0c3FGj+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ep0V4Rb3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ep0V4Rb3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-459d4d7c745so18951035e9.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652224; x=1755257024; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRspYZ6QAEJaF7pYavgjx3m5cWsrC6eyWll+Yl4bXuI=;
        b=ep0V4Rb3UvqR3X9QnvF0AeM/8ahsbgOcC5NDWcGQxehtKtXcAme+O96ZORWIYhTNJP
         GFjalDaLDkzTRQE66/FL1Q2N+LaT/Y2CJrQXI0OAleD+qHsd8bMXIqeFtCzSJmU8Hx4Z
         hmIXQM8u5pHYA0agO9Ox8QERdyA/oSCHtAYLSoJ2DZ5pJy1lZ7CGhQ8g9m2D3mxBWc2x
         MvvH4ORJSxHMAghI7H358os81+Z/XXhlPh9TxU/NCpSzwNTt39x1hqc3zF0TtC5AU0fN
         eONDLhTI+y4S8X1xQbPS+9oOf1W5ZCNWsO2A16Lbiad5Nmh4a/mKm33rdfMW7ZodCGfM
         WNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652224; x=1755257024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRspYZ6QAEJaF7pYavgjx3m5cWsrC6eyWll+Yl4bXuI=;
        b=Kd2C/x/V+LT9YQ6f/nIvqXTWJUi6g+53QMDqS+EYe32P8eizAJF0hq2vQWmC7H/51P
         +WLZivjfMVFrYMyIiUB9JYleIh9mVUcgyJ5BjqVlrixHtNDuSHVR5IV+QWXM82T+Na8S
         dAu8uLKsJSCxE7roC9ZeRu0S0BrzuqMJkCqRa4JvVzzWjfcn9zJEUN6oiUwBEDDOmAfE
         1fFCIt5JzSun2nFuLxpJidADuyPBj2dWa4kqnNQCu33D4aNJ5Qi4amFq+GYnfI8KpcSP
         SsTH6EsR4N5EBkYSO95yU2PoEHlF8VmLQes14GEGdRAtvQ5PrZWgVtw1gRJZ27DpjTIA
         LITw==
X-Forwarded-Encrypted: i=1; AJvYcCXLRug2C9W4q6IKtfnB9hT+HKpyCGMWYVlHC5szRuaS08l5qVH9gDlwq0+wnR7sFamLizMOUTKlCgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCcnm2p36sskhw5/nm5Yth2aQ2fkKgQoyWryg/An1XbqiJzGwT
	l5tKZm5Ul0Qy4TymBQFLx7vPOQlWzMjxxCOys/uavTKjQUU6M9JWkgHgPQnhRdU3dYQ=
X-Gm-Gg: ASbGnctS1sS/FCHM0N/pU9PkhN8J1/5XlUzLtknvz4uIW3jpIUmtEmOmRPrsI58WUgo
	1UVYzNbEhs/JCYkp8lN2s2yG0B13BqwuCBWnqhoKzNfnY5+hz8Tz7X4W65CnT8P5nmlxqZOYJyo
	wZ6Ok3d0DIgHdSDL64+q1ThdmjQYKTch6x4jT7IKhZmB2TIbe5RrBKXrFuGj+QRmzojra52dkq0
	GOq8kYaTv4tVIKcdY0Fl0K1wr/biQwoNNbqJXEcTd0NjNJXtTJ7Q0PIt0fZWJI/9IBl0psLD+eT
	jXTedexDqtmLm/xzDS880Ki696VnhCkYp7YB7qhN6ZISpDClgj6q6mQ+dE/RtzXBJhMFyXp/TuH
	tx9oqnzEjjuobT8a1QQ4EIGzhjAe0FVQ=
X-Google-Smtp-Source: AGHT+IFCMozOTwE+MxJzqrobvwL8Tio0dUjvbjpt5tE0xDuzGkAjBw2SFMGp7HYlkEU8CksYHLPAsw==
X-Received: by 2002:a05:600c:474a:b0:456:dc0:7d4e with SMTP id 5b1f17b1804b1-459f4f0376fmr25391795e9.18.1754652223952;
        Fri, 08 Aug 2025 04:23:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Fri, 08 Aug 2025 12:22:57 +0100
Message-Id: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHelWgC/43Q20rEMBAG4FdZcm1kcmzile8hsqTJZDfitiUpR
 Vn67qYFqVIqXv4D883hTgrmhIU8ne4k45RK6rsa9MOJ+KvrLkhTqJlw4AoE4/TN3bDQAXOkEd1
 4LgOeMY5Uax+iDCaitaR2Dxlj+ljll9ear6mMff5cB01sqX6b4tCcGAXKnecQJDTem+f31LncP
 /b5ssxYAQX6byAEaQANSqPYT2DZauLbJorbY4hXyAFztnUugHY7SGyQBnUMiQo1rAVvozVgxQ6
 SG9RwdgzJCoFTvJEMoolhB6l/Qmo5rWm9EqK+yP3+0TzPX5Op3I8kAgAA
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

Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
filtering, and SPE_FEAT_FDS data source filtering. The features are
independent can be applied separately:

  * Prerequisite sysreg changes - patch 1
  * FEAT_SPEv1p4 - patches 2 - 3
  * FEAT_SPE_EFT - patch 4
  * FEAT_SPE_FDS - patches 5 - 9
  * FEAT_SPE_FDS Perf tool changes - patches 10 - 12

The first two features will work with old Perfs but a Perf change to
parse the new config4 is required for the last feature.

---
Changes in v6:
- Rebase to resolve conflict with BRBE changes in el2_setup.h
- Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org

Changes in v5:
- Forgot to pickup tags from v4
- Forgot to drop test and review tags on v4 patches that were
  significantly modified
- Update commit message for data source filtering to mention inversion
- Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org

Changes in v4:
- Rewrite "const u64 feat_spe_eft_bits" inline
- Invert data source filter so that it's possible to exclude all data
  sources without adding an additional 'enable filter' flag
- Add a macro in el2_setup.h to check for an SPE version
- Probe valid filter bits instead of hardcoding them
- Take in Leo's commit to expose the filter bits as it depends on the
  new filter probing
- Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org

Changes in v3:
- Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
- Add VNCR offsets
- Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org

Changes in v2:
- Fix detection of FEAT_SPE_FDS in el2_setup.h
- Pickup Marc Z's sysreg change instead which matches the json
- Restructure and expand docs changes
- Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org

---
James Clark (11):
      arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
      perf: arm_spe: Support FEAT_SPEv1p4 filters
      perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
      arm64/boot: Factor out a macro to check SPE version
      arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
      KVM: arm64: Add trap configs for PMSDSFR_EL1
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

Leo Yan (1):
      perf: arm_spe: Expose event filter

 Documentation/arch/arm64/booting.rst      |  11 +++
 arch/arm64/include/asm/el2_setup.h        |  28 ++++--
 arch/arm64/include/asm/sysreg.h           |   9 --
 arch/arm64/include/asm/vncr_mapping.h     |   2 +
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  13 ++-
 drivers/perf/arm_spe_pmu.c                | 148 ++++++++++++++++++++++++++----
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++--
 tools/perf/tests/parse-events.c           |  14 ++-
 tools/perf/util/parse-events.c            |  11 +++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 ++
 tools/perf/util/pmu.h                     |   1 +
 17 files changed, 312 insertions(+), 45 deletions(-)
---
base-commit: 37816488247ddddbc3de113c78c83572274b1e2e
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>

