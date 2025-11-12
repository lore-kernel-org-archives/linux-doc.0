Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677F2857F6
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762960952; cv=none; b=UlvE3RUetsIySDjvMJMpVEUCTwTyct8Div9flmhQY7+H0HwR1+3c8n3smLrBlCdr4fkCC6uLLFjxmY/Q+FVxqS1RyhbVtWK86o35AzzvtdCzUFLqOSR3vc6d+omqqbov0psAvmHvfOy4okTM51EkTyKBKrjqfvM2MuGtv6U+tDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762960952; c=relaxed/simple;
	bh=T44cSBi9UvufQqOLWBJQoQsP2hR6sNOKPIGfnaFV5Uw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X19w2YeiZSywMSRsxq69xvuTrpvJwc5Vy1dpXxSBXmYiKrc6x+GodLRIyxaKT2iM1O2DNV640mojpNDec0hDYDf1MpviUP7cnroDZYD/HvFA+zkI+ycT02AqMDWCD2XXRCEP4fY4wZtcE6L60sC06IFDIFSw7EDwc9GjCdhgGHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQi2Nk2l; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQi2Nk2l"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b31c610fcso829378f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 07:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960949; x=1763565749; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z4YAab8lEVoX8o7HKOXOiywpYzCpEEyW7oCkq/M5CVc=;
        b=YQi2Nk2lHhcW/bl7KNIvdecFhM7wXPd9th3BRzzmGab34izgfwdmkR3elk5Drz6SWj
         wXFc3iZ8hSIzxmbct7YBsbQbpAT6sBDfn54YeZFIYCpc1Bghvcmv/Ep8JRWH3i+dmvCI
         WkG5eKFPUF3j+6q54rrwARFx7ycOz2KnLWg8Qe8cZ3hQfTncPZ2be2xKg3r6sAP9Raxu
         Jda305lhBpmCrrRPQDT3uDgcqtFV9T9uVvF8k7V8K5tl+QQo/uutAyTKirzaFmQHB64r
         NUh0MKe+jEcjTmpYHxPVWjUr3ZInNDUOOlz7M6SOotwErUeRnoIn7G80+/fnJgYigFiv
         07OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960949; x=1763565749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z4YAab8lEVoX8o7HKOXOiywpYzCpEEyW7oCkq/M5CVc=;
        b=KD8YHcJj2r1IHkKMGlbqPuYAiuhlhm4YUTEhUsFb5rBKmIdRDPz1i0Ra3mrF/sMMGn
         P5QkHb73D6DGsjTIkWjR473yGyU5NeTnFBGGsoAuAe5w8sYQRBdNeRMJ8KcvOUERT5/9
         FZhDa6uXVfu6ycevkyVsGJCUszOr0RNy69PrYIPzzgOJuZGoqu4Sk9jwE7pZKnPmYxtn
         Gzf2HGPPQd4cQx6MNhvUw+i4jUNgfxwqsO6GBaBP+263B58+jhVQXw3qlfU2IyZyhi2k
         vGJhkxqCn90ju0cpfei7a7clnnpvzB7xpGdlwg+pbyQICi9CiukU6kmMqk9kTgDx02Jz
         qfWg==
X-Forwarded-Encrypted: i=1; AJvYcCWq2S/kjETJRxhoByiUQryASW0cnxCYBIzpsLyWeeqHKfPWcznWd6TUWsEGCrwbEefxHMEcuvzGQ9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx1ZHWE5Gczo5Lm5PKG1SWJrHur+ZtzPDYPiYwJ4+3xQRX30vN
	UWwogPLHTrNsgAYEf5+jtmsR/Mh7gjsn3PD0+rLH0eiy9rh7YVAg5RbVkFqpVMTiv+8=
X-Gm-Gg: ASbGncsBQokhx89VzYLqn61uHKeH5zg+24reg1DJHdX+gUw4GTovZ9W4hQH+Ae5hUPb
	DiRRGDQBUJi4So15E765lnqiNfsDh7h+tsp+anxLkV8lDDdQHHhRZmwjRKP/giygOCGT3HkYK/o
	4ialEh1PS7VV7TH4u+zyQcYGSJbwvMgzNlVYqH5WmlJ53icJdf0YTAAxrdR1ybp6QhIaSq93oKn
	2FAF9qCxuCjg9ElOT6WxjFNUfgsP32Ipq1otukMPLhLdmJ4ZzFlfQCT00tEzP2/w7H8CcKPVnqE
	B6+IQkgogWRt7SAfAjgMq/Ljtodpshlq61seYhDdFzyf8YSeLS0ifExahcmPNzIIQV1Fn3tSUu2
	HzIEgyypgqHpO+AjQreVgKNDIDau9k5sEQIeKx/ULG7M42pt+VmiIHVZabdBlo0zsith4JVdQWd
	STL41qBOO49g==
X-Google-Smtp-Source: AGHT+IGne5oDnoDNxspZOCag1+PS+dRQCZvqbFW+O5kS5m0nBl9iRLtaXl0HXuN+7Jr4WMxw58qV2A==
X-Received: by 2002:a05:6000:4308:b0:429:c711:229a with SMTP id ffacd0b85a97d-42b4bdd4f2bmr3324821f8f.56.1762960949156;
        Wed, 12 Nov 2025 07:22:29 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 12 Nov 2025 15:22:06 +0000
Message-Id: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6mFGkC/23OwQ6CMAyA4VcxOzuzdcDAk+9hPMDWwYwO3cwiI
 by7AxOjkePfpF87koDeYiD7zUg8Rhts71Jk2w1RXe1apFanJsAgZxIyeq6vGKgKNAxOGY93KhV
 ALmtRohYk7d08GvtczOMpdWfDo/fDciLyefrWSs5XtMgpow1jXOkCRcayw8W62ve73rdk5iJ8E
 2sPRUiEkoVRTSmLqtB/hPgQnDFYI0QiDObaQGMqrvkPMU3TC4G5yJU5AQAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
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

 Documentation/trace/coresight/coresight.rst        |  15 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  59 +++++---
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  62 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 247 insertions(+), 152 deletions(-)
---
base-commit: efdccf6a511891db037e08f1351e72eaa101021e
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

