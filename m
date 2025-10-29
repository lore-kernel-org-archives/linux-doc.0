Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39847325737
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752802; cv=none; b=REZBRdJ6FMY5B/y80d2cwsOT8/0lUbpc1a/fzb02kqb4tz2+ypMBd4xTZXkBv1joZmMAZ7TYKeSg5W76mx+XIIU8/JfZ49uU2sEKar8SbshWV+iXaCwaSRDRTE8NAjGCaEUtyZCyDw/65wNY/iGz0gC16PSa+mnc/lH83WIGeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752802; c=relaxed/simple;
	bh=1TP15azltOhFLw0Kefsw27j7zgWEijXVp/Z4E0ktb9A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CZLN/ySCxzIayCbbwQbLerHlc8XlMgf/pxOPz9r5lKqxa5Jx5P71E3mg7c4GTqeLdmdH0xPLR3PZCy8di5Spyx9nDBru8x6F7ebjLEelVlLG+DEm00eGVij/MB/KnH+K3R4OEE6Ltx/AZ+tGb3GFEceNZYm60zRfRzYKvngUljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r1LB53ui; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r1LB53ui"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-475d9de970eso40803585e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752798; x=1762357598; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYmI0eokywhHOoY+WBqC2paCFaISLNGO3jCxnQ7GNHY=;
        b=r1LB53uiShVe/HFdD091/iRELowd0zYBmPK13pV5N79xcAkJjyAzFoKeETv2Y1A7d0
         AvIsNExfZXWP4/2f2KWrFu0UPsy1jfHszM8VQrfDcUfFe0iyZ+2PNZNPAWY+UgqNpDR6
         esirPWho6bt/blvTzimoJmSZgXZM4Wgyfc4JGMNWLaCHwFDcVzoyDPkGPLb7Evb81mc/
         FFNuCx9C2tgPPs3SLc9KjUXo7VVi62f5XDvgdNBjYar0p69CcsPLyZXDBi9yLULzdZZw
         Mb+aT08nHsTCRsK3hDcqq32Z+21NYQaK7r2NP3DLcY4uVMuegQmY55H3WIA+5T6SXC2O
         HYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752798; x=1762357598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYmI0eokywhHOoY+WBqC2paCFaISLNGO3jCxnQ7GNHY=;
        b=jOggzUp1meO99Ndl4t7ahHMI+ml3e5ymCZGlIMkrP82YlIOg93k4JT1D5/jxtUu7K3
         cO2vLJmT+NbnBAKG3k+FFBDC2dy3qgLRmc+2U9TN36hVSGH6I+GaAF+HbD75/JuhVdnX
         7GG7xx3AshTIsIsohs7sw3GJmm/B13HNs9rhL7wSSxmGHNiSIZVxc/uOi5E9e2qRhmaF
         AFZY06xz6TE7CK8B9pPN8dzZuJpGH9JEoILo7TPFux++5S5BaAf1Trnjf3noLxDk3pH+
         S3PWr9hr4LkxJRa7Ff2e90KjezmAMAC+PNr0bTQHBa8P4KRFBGXfnTSpc/QsFUNtSHuA
         h/7A==
X-Forwarded-Encrypted: i=1; AJvYcCWts1QYoSNFTPPxX/IhRp+h2BfuXRypa2U35PQobBl1mg/YKsV/rPTjSX+r11PmiLIVI7mbEKdSCDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwaDU8BRt3ycTHXQKvnwks4mZQ3h5xda6reY1F9ysGr9OBmUyu
	zd9fM7v0q0Z/Fo1YEOl8bTSsbTJXfYPtmelEJhc77txG3L8ifXKVOhOX2cpKf1FdV7M=
X-Gm-Gg: ASbGnctbbQFzcvAuA1bIs4IwafXzIpPVJPXo/5By3Z/kVFY7R90fiJ86S4v40cJ6KEB
	3YIZm78Sywq/r5YRSlND8QcfR6YCH6qHippTgTElSEbktYpTb8WJKjsjJB/uZWsV2cjooj1Gpje
	Fm+poTEyrvAUDyQ8+9/jP8MhzxWyn2CcQLDsUqPD3OgkQfZwOZWKh2uKlHZmAM7FSAs4zg03GpN
	hR8U3F+EqEonCvTu5XMHL6lA0gxQ+qBfoOweFKy24q+mGO2vZIMe/U9id4CA7tAxzGXawjYua4c
	+5iZnx+Lfsy2VbVBvzSCsBy2rLZ5hhlyFha7b3hqxAhFIqJVx0Pevnr2VjB0q9gwoadsOUDK0Eq
	71F3Z44b6kKnhujYig+KVRitOebvxLzV+DWOxinfeOpn+lVccMXinwxIJdZLH3GCMuKqTVo7UYV
	LAIcR/P4JBVQ==
X-Google-Smtp-Source: AGHT+IFwHWp3z0WfR5BEyLr3nsy+4DqHZJcjqlkJZW93LcT7e+RtCP65cMKCJuN+XEYyyExdOCX9Iw==
X-Received: by 2002:a05:600c:3109:b0:477:19bc:1fe2 with SMTP id 5b1f17b1804b1-4771e1740f8mr35479835e9.6.1761752798296;
        Wed, 29 Oct 2025 08:46:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v9 0/5] perf: arm_spe: Armv8.8 SPE features
Date: Wed, 29 Oct 2025 15:46:00 +0000
Message-Id: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALg2AmkC/43S3UrDMBQH8FcZvTZy8n3ile8hMs6Sk62i60hHU
 cbe3bQgnZYOL/+B/M5Hcml6Li33zdPm0hQe2r7tjjWEh00TD3Tcs2hTzY0CZUFLJd7og3tx4pJ
 FZjpv+xNvOZ+FczFlkzBzCE29fSqc289Jfnmt+dD25658TYUGOZ7+mHrVHKQAoSgqSAZ8jPj83
 h6pdI9d2Y81JsCCuw+kZBAY2aCVt8DY1aDmTqwK65CqEIGksCNK4GgB6RlyYNchXSEvdxBDDgh
 BLyAzQ17JdchUCMgqbyRkzGkB2X9CdhzN76LVuq6IljtyM4SA65CrkEuUTUDr8fdrTZC/gaRZh
 /wIkTc6+0zKhgWEMxTgzmg4/h9WXmNWxv6BrtfrNyPHp0D/AgAA
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

Support SPE_FEAT_FDS data source filtering.

---
Changes in v9:
- Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
- Drop already applied patches for other features. Only the data source
  filtering patches remain.
- Rebase on latest perf-tools-next
- Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org

Changes in v8:
- Define __spe_vers_imp before it's used
- "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
- Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org

Changes in v7:
- Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
- Pickup trailers
- Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org

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
James Clark (5):
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

 drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  13 +++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 10 files changed, 170 insertions(+), 10 deletions(-)
---
base-commit: ab29ff9f6fe06d23c16b5565fcae96bad21be900
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>

