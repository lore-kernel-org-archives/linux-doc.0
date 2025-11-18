Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C423570AB
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763483295; cv=none; b=PpF500Gu09hQbcKNs7UWffyixT0zXNLr+23HMoWkwQ2rtOF5FBd3QZAhoS2BSvl+YqQlPV5FPUZBuy/ipjP2sTdmK6MR28jHm7mD1MBRGdq0dizJV8qOoHPx3aDaTS15PEAQ8mv+uw187lfVYESHWKIiwNAlBA2B64EQp1o6kfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763483295; c=relaxed/simple;
	bh=75F4XL7QLrzHR61DKisQn8hpIl6mvQeUy/QwPdgCNus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mNlhNUtEfHfyqSjTSSFU8S1gaD0wbmkh0LjIUCf/UMVQ53G3LzJ033A/2J8OOXuuHfK3478Y/WRGuiH7a+4iM4SHsTvlQsYfwxjIQLy/69+txBIxjWFlWSxgYl99vtpXMDPHc79N22lgtknrMsvWHTl6YJxlEoxpRc/QV7B8mzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVOx+XHm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVOx+XHm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so26951215e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483292; x=1764088092; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=faKepgN5zUJ1IGhRx8V75UbQcZJhRmJlyrhlcIcRmJY=;
        b=WVOx+XHm6KjINQvnyAUxARUYM4xjYq776mVVicUBMi4ugQkm9C1wB3SEkbgdIvC/hY
         /32Brp5xLljBAw9sBfya4ljbwoxMHh1PIDJnupCv1bdR/FKdHRe4chY21XMTPFcgZPnw
         DqXsrkO8A5da36HjkFBs9z9h/y3CV+GZg7MXg7JRdA70J9Kl50npU1zgiVE3xQhOLAyh
         T34f1kmy8VHG/iy6J61Vh3hAdAHcI11UmYF4oXo3RYml3dcxolprBshKzRXHxKL9pceb
         06b52HjiCctdczU2B+ZvjzeCUxx1F+EoRuGOuBfNnxse/NSu4UgXCCMUV2P+FmH/GDNB
         YllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483292; x=1764088092;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faKepgN5zUJ1IGhRx8V75UbQcZJhRmJlyrhlcIcRmJY=;
        b=VFOAzGxY/Ev7YTsAe7yQPAMnom12YQB33nGGC8qjz2RXpBDoX7Gqm6KluzN2Bw3LhR
         8dV3CCcc6EibH5+9Gfvt64TsqZQZzTaReDEiRycy8hHz9xVBsXtrXH6dWGBOwqYG7s4N
         V+5QAMlc1o3W8LQoUbZXBFTnmwPy9whxxOqLZV29o8q6Wo8Q6f4j1Mgv7kb9hgyZf3aJ
         OJildHKGiNoFzUx6qkghjdkbzVfPYOLwv19gNqGNC79v7HR0fD5X4lnTA4KTPZ/fpSzC
         aHh4PpNueHh+WfiJ/2KKimJasGhpWrGKUE0tPpVtKw2jNfxjqCB5z3DhvQ/zyDkBa6H7
         F6SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCGfsVczNOtUdpKQFRrkUpuAS7ENFNLguz+5OxQoNo3F1krAV7oAwHZds+T1anoMkwsFYrj1aOrRY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWDUzq9HxbMT3XDQphD+FMuNBAPyZfiVp0QQx9XgWQ1rrX7wdg
	AhEywXFKm9sB+KMg8MqPZ/a+PX5XjtU9+0nO4zR7yx/49qz+kN6jH0H/MgTC3EDIfiU=
X-Gm-Gg: ASbGncuFzv6o7f7BW9dJYQZtAOTt4t1hOHCFj+CqU8MNKEKFrIawFQzFi0h64mtqY00
	pvMXLw++yAxEDYESG0c5v1tL08odHBBNIjGPWbVVDIcUUcFJQoPYeV+8RIyViS1KvdKSHXkjjji
	Qw+WLcCC3GXp7qwr4CuiM2YO3Le665kSR5AbDPPVjBbAcZkOYS+MANnOv14gGVCTecpF2bOXjL5
	Kx7dGSOcikgWI3k+WhDyxUcoUuvCpC5AFBkuwAZKuC+dv7SOSMkxjoKnPdHNsbvlKVY+CQK47pl
	HYH2h3fZU3cImZpmAEaRv0vbLqn5tCfUJI6Qe3SZeePIXtt1wphU/VEaqkbogR9zGeHA5pYEmd5
	Vzl/LjazxerBPIa87iWAademBvib5paRNudW0NXazyVdoowr50vg+XXDdHZb3VB3Pwm2cUGYPQG
	jMCUwXe0hcK0BrpTDYam0w
X-Google-Smtp-Source: AGHT+IFY/GIp2ub5yggP1OkETG5FUg1k7SgxWvzcAPkxkGMe+FzO5/IcGapEB/VobU8EKioqIpXiBQ==
X-Received: by 2002:a05:600c:4753:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4778fe5ff23mr145350685e9.1.1763483291692;
        Tue, 18 Nov 2025 08:28:11 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:10 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Tue, 18 Nov 2025 16:27:50 +0000
Message-Id: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaeHGkC/23OS04DMQyA4atUWRNkO69pV9wDscgkTpuqzECCI
 qpq7k5aJB7qLH9L/uyLqFwyV7HbXEThlmuepx7mYSPCwU97ljn2FgRkwJGWR//KVYYq63kKqfC
 7dIHIOK8Gjkr0vbfCKX/ezOeX3odcP+Zyvp1oeJ1+awPiitZQghwBMETLSoN+OuXJl/lxLntx5
 Rr9JdYeatSJ4GwK4+Ds1sY7Qv0QCEBrhOpEYhMTjWmLEe8I/UsgrhK6E2jN6Ak1YAz/iGVZvgA
 3n0D7fAEAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Do some cleanups then expand the timestamp format attribute from 1 bit
to 4 bits for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive. This change not only still allows disabling or
enabling timestamps, but also allows the interval to be configured.

The old bit is kept deprecated and undocumented for now. There are known
broken versions of Perf that don't read the format attribute positions
from sysfs and instead hard code the timestamp bit. We can leave the old
bit in the driver until we need the bit for another feature or enough
time has passed that these old Perfs are unlikely to be used.

The interval option is added as an event format attribute, rather than a
Coresight config because it's something that the driver is already
configuring automatically in Perf mode using any unused counter, so it's
not possible to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v5:
- Add parens to interval calculation in docs (Randy)
- Swap "minimum interval" and "maximum interval" in docs. (Leo)
- Add TRCSYNCPR.PERIOD to docs (Leo)
- Use CONFIG_ARM64 to avoid is_kernel_in_hyp_mode() (Leo)
- Add a comment for hidden ETMv3 format attributes (Leo)
- Hide configid for ETMv3 (Leo)
- Link to v4: https://lore.kernel.org/r/20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org

Changes in v4:
- Add #defines for true and false resources ETM_RES_SEL_TRUE/FALSE
- Reword comment about finding a counter to say if there are no
  resources there are no counters.
- Extend existing timestamp format attribute instead of adding a new one
- Refactor all the config definitions and parsing to use
  GEN_PMU_FORMAT_ATTR()/ATTR_CFG_GET_FLD() so we can see where the
  unused bits are.
- Link to v3: https://lore.kernel.org/r/20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org

Changes in v3:
- Move the format attr definitions to coresight-etm-perf.h we can
  compile on arm32 without #ifdefs - (Leo)
- Convert the new #ifdefs to a single one in an is_visible() function so
  that the code is cleaner - (Leo)
- Drop the change to remove the holes in struct etmv4_config as they
  were grouped by function - (Mike)
- Link to v2: https://lore.kernel.org/r/20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org

Changes in v2:
- Only show the attribute for ETMv4 to improve usability and fix the
  arm32 build error. Wrapping everything in
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) isn't ideal, but the -perf.c
  file is shared between ETMv3 and ETMv4, and there is already precedent
  for doing it this way.
- Link to v1: https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org

---
James Clark (13):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Hide unused ETMv3 format attributes
      coresight: Define format attributes with GEN_PMU_FORMAT_ATTR()
      coresight: Interpret ETMv3 config with ATTR_CFG_GET_FLD()
      coresight: Don't reject unrecognized ETMv3 format attributes
      coresight: Interpret perf config with ATTR_CFG_GET_FLD()
      coresight: Interpret ETMv4 config with ATTR_CFG_GET_FLD()
      coresight: Remove misleading definitions
      coresight: Extend width of timestamp format attribute
      coresight: Allow setting the timestamp interval
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  70 ++++++---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 258 insertions(+), 152 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

