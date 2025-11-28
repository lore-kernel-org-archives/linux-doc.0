Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15D2325713
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 11:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764330952; cv=none; b=jOzk6tvWh3TWt/18bVx0qW5O/m+T0fctCYasYV7iGHw4pXqvLZ+CBIEfwu8+P19MHC4FOZOOdpjROAQcVwGYCjK9wuBA6be7gMKxQh8Vqz98xlhzFdx8BsuUGFdiM2jTkvsfNA2EhN41BJxR1dSFdWfsx55oVqZMJLmT4BQbvSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764330952; c=relaxed/simple;
	bh=DlgRtTwie5viPqNLCH83FLtZ9KI2/5DRKlUAl1opSvM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jX7s+ns95nVIIXnGPU6AazHUmyU88IwTNBQlUEaHS/zWUutcv58ZSvFVtp/8fff2myUMtwn4QSXmHaO9DnDlr5JRrYZyEIQcqLJmjTPhWukBljQPGwmnN6xoaer8P2k5WLyyYsaZj4W9BcMV4geSm0yOQMvvXN8LjL/3eTHcRfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6Fh0jz/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6Fh0jz/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47118259fd8so15246325e9.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 03:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330949; x=1764935749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w0TcHWb9fHTi0jCTcopxtEaDqpd5gmt1KJnh5vwOy84=;
        b=b6Fh0jz/AGg6gxDTcxYAL90P5Q39onagwXiht8Rb5G8tI7oC4EPtxjJLCL0vp5Dgzm
         c0MU97Avy8KkoRvgxXow4KQqJFbQPyMmDltRnrzRPXiKckpDaCzz6wLi9jHMHloz//2o
         ijknETOm2WHMnlIWRqo8cm2UswH2u5KGzs2+Hk+nlyb8Q8DeQPw/BWOc0TvN1lste0eN
         0qqPSr/w5+h7gH1ch/GXj/j9SSxtHAGFs3mfBkCEpyw3PfbrdOeJqAjJNyf5JyaYPYN9
         dfV9EM+EmA3zdx0wu9Dpl0Y20kQh9A44/OsWRmgSc788tyOGxRJRcat3oIrfwT0pzTDP
         d6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330949; x=1764935749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0TcHWb9fHTi0jCTcopxtEaDqpd5gmt1KJnh5vwOy84=;
        b=U6+DDlMa9ylZ2+PbbRTU0iSgHU5sNQqf3G8zLn+/kzS8oHmLMMgMLtouwjTJMvUJko
         UUAFybR8imTxKJNYOkmMldkH2syubdi5SUyVgxA4IbqtRwc/8utIbQ/eAptM3ie1Lp4f
         bkGMr/2r1LNRuR7W6mXKnCpkgIRrD4oY7LOMr/zZX0bnWDIIDiGljVVFl5BPTBwrwsCm
         ioQxWXW4isw8Jpftqo6UBlMvEMSz2SLq6+zvBKiP69pOb1AxRmyayh5TxeZ1dI1ZO8Mk
         3XDqMYS+Q8a7V7acGPAx897XFRvQysVU5PMVr1eNwySxm5YPuIdN1fgHRuoujMKahUoS
         PWOA==
X-Forwarded-Encrypted: i=1; AJvYcCW0VzJNlciBWuaz56SxC9mnTypQoK/gLT8jpqVDpxruJa8b1IL/ZuQX6cYSLee+/KoVXDXJ+/TKPtw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqj8z3rjPklfw/DG/jyP6jHGEvxj+YHv/xM+vAohLBNHoIUyex
	3hpK971TMmreNmQUUv+M3n1BUClvd2Pm3L6uAg/mTKrGDloRCq90HfdwLjls7BLUdPU=
X-Gm-Gg: ASbGncvl/LFXDXMzzjlbfLnJg+KjClCdAvOxePyzco+jt0PGd4FnQrkd6guW9BzosdZ
	uYNUl/zSaIcxBvnSwmwHCEpjMrWBT2JRIvPky7kzTk9KjBmRHOyngDuv5sHodKgjbWpYgJt7f3C
	OLD7gEP5OtQ0/JCfZv4aG6y22aTuA2oY6yJgos90SCpWTRAvYsDA6mqWfFro8hI4aoL1IJS0YZB
	j2VTQAg8TQqkTnQGvFbxB4k4pGyvfan3Y9u/xVkMab/WcC9JaYZgBTaHKaMTJVi4YXBuZ4IPelv
	tpIrvgrZ4QaN/LOCdlLxjXb4I8hDJ8ifxN0iPgZPQ+71lJwlxdtcrzdVOh5yay+mQaIpSkEJCsu
	1URSJf5ytLvEtcwmn/qsaM73I6Z8Dvk4RQDdTzcy0RmLhWNf8l5LqRAHeaoA8SpV/OaSYapObFv
	1dT6UbIkwgAL0iqAP7Ndro
X-Google-Smtp-Source: AGHT+IFCaezpDzwvJ5YFy4YkZmmbr4ySHFAbq4jp3qLN1r0Mys7bkocqdmJgJAT/s2gldrYAZNuG/Q==
X-Received: by 2002:a05:600c:3b11:b0:477:8ba7:fe17 with SMTP id 5b1f17b1804b1-47904ac464bmr139805295e9.7.1764330949090;
        Fri, 28 Nov 2025 03:55:49 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:48 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v8 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Fri, 28 Nov 2025 11:55:12 +0000
Message-Id: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCNKWkC/23OTU7DMBAF4KtUXmPkmfgvrLhHxcKxx60RJGBXE
 VWVu+MUCYLixSzeSPPNu7FCOVFhT4cbyzSnkqaxBvtwYP7sxhPxFGpmKFAJg5K/uncq3BderqO
 PmT658YjKuM5S6Fi9+8gU09fdPL7UfE7lMuXr/cUM6/ZHswANbQYu+CAE+KCpk0I+v6XR5elxy
 ie2cjNuiVahGSvhjY5+sEb3OuyI7pcAIbBFdJWIpELEIfYQYEfIPwKgSchKgFaDQ5ACgt8Rakv
 YFqEqYZFiMAM4o/Yt9JboW4SuhJEioHTYU4MwGwJ1izArER0pEnVA/yOWZfkGG1gLkUUCAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>, Jie Gan <jie.gan@oss.qualcomm.com>
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
Changes in v8:
- Handle ts_level attribute outside etm4_config_timestamp_event() (Mike)
- Flip commits 11 and 12 so that the new attribute works as soon as it's
  published to sysfs for bisecting (Suzuki)
- Remove some spurious header includes
- Link to v7: https://lore.kernel.org/r/20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org

Changes in v7:
- Change TRCCNTCTLRn and TRCTSCTLR register definitions to use a
  combined field for TYPE and SEL (EVENT) so that they can be used with
  the new utilities.
- Add utility functions for creating resource selectors that do compile
  and runtime checking of the resource selector ID.
- Link to v6: https://lore.kernel.org/r/20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org

Changes in v6:
- #ifdef out format attributes for ETMv3 instead of using is_visible().
  Then the same block can be used to define format_attr_contextid_show()
  which avoids an awkward WARN_ONCE() and comments in arm32 for a
  function that's never called.
- Link to v5: https://lore.kernel.org/r/20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org

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
      coresight: Prepare to allow setting the timestamp interval
      coresight: Extend width of timestamp format attribute
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++++----
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  38 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  39 +++--
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 175 ++++++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  92 ++++++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 279 insertions(+), 173 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

