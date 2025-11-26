Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F263314B6E
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 10:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764154666; cv=none; b=M6QJ462py9p+fhkhRFCxmiWC+VxFlJyec7xKjpBL5hSl98pWDWDAVYfe0vmTXLPCAttgSugDmxMGetNGmPC4fenXx6rVA5VVRv13UADIeuinmQONcTWAiZPgu2ukyoKYLwTi6bQDf7PsH2AAckq7Kfg3Bwwc5ULR45d4AZBzk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764154666; c=relaxed/simple;
	bh=u/uJzsKj9BeYJyhk6EuVzymGU6ADNwWlflhqTQk7FVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J8tpCw/SAJG0Pd7MHMcFubQ2yAdOVV+Md84/Ntsl5QpaSSRHaaeGaTrAEIJY6SdBSECHPh/Yy27QLFJMi7lsdosUvedENQ/WOgvKsdmAxtQNsB1D1I9Ww5h73fL3yLoDB5grXweAcc/EnAXjymrY1Rfc3b0ycVu01PXhwdOTLP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNHu2CYw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNHu2CYw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779d47be12so50185605e9.2
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 02:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154662; x=1764759462; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDVfKPw1JQQfmTQ3Yg6qwG7h5RkKYvdvv3LkFEdpMto=;
        b=FNHu2CYwUnZczjeitdyn9o7p5+RgEMs05qrSAB/gcWVtr3XDeM90lVgLC2QQNHMc9E
         kVqscuQOsRJmhafisjx0kh/ea53JEe6zta6a4Q14QMiWr1QJcPgiwqj4ssAX6IpwkU+h
         qjbouztAD+0WAZxZdZXctplmhdYucnuNBZTDW/fCHi5Kj3UqoGn4FsmRD1g9shwq+4vD
         3IRAyVB+imAGQSBkY6F19MB442qmYKjH2DDN0o+UQUhR2V9q5v+VXArk7T2zUPFBbEvC
         NEZXFUKtSZCDrqxNBZRuYJAZJ3FCQG4vxaLgPeQTouqnV/chq1N83DJxMpLdqVNV8aGP
         aOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154662; x=1764759462;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDVfKPw1JQQfmTQ3Yg6qwG7h5RkKYvdvv3LkFEdpMto=;
        b=uXlMgEWE3qIZ2lLQ8BBu5G+JKhiQ6bqALc+SsPsgoPIGeJsX3eTW1wcjCti1jFCggc
         Ph6p0gHnjspGqC+N9IvHpTpN7HHENcb3r6KHzg1JY11kwQG+Nl0Mk/xPxXOO7f9dUL7X
         sjbaiIdozMJuuG1CZovbhbxxIYHAMTiKmgIlbRNJDu1E0PnSQPpX+P9wRtobbOOjOZPu
         US4w2yn5z0AsqQ6yQkys96It6w6utpkUnj6H0mtydBhgytUL7B/4On00fMwl/9NjVfEA
         6EEWqaLEgFl1GSXoKlcXVdIBGblnzdG/IJjMY8Dm3RlNh/s/yICovqL0jA2EMcvlKGec
         L1UA==
X-Forwarded-Encrypted: i=1; AJvYcCVwg2b3I4Vgn/vMtgA8L1ATYe3rPCJJXDgphc9ve9j4gxGy9WHAg425y1qZ7KsMk++fuFoj2lKWePc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDakvXVBwTaKNBFkpOrrglVOnQYYgseX1SrUNI/fbpYH9mam+p
	PbY2z+xCoI+sDZv8xRHi8LjA5tNp+kD9o41cqfdhqpAMoljMmtNfo1uqYZBSWBf+UiQ=
X-Gm-Gg: ASbGncs4WI/U2xpgtgXtoSRUrh8WICBO+axk+VpZVzLpcALcuoknqfNA+2VNFF4/ryh
	M3ybTY4Wtigr8tQZLrHLmVdIfRNmwlAuS340BRn/7kUrM2SiaDLiGxDOrNaZNfiL8JGcF65dtR/
	FBzn0rChUaNbH7ZNRT7angzNg/Glkf0FvzAvBFRGNa59L9rjlaemYRy+25wb9CDJx4wR1+2pDRs
	xLh01imKOKK462lQHvrFaiMtv4IsLGDwj+vNPRVsh3RH7ACxg9sYRG3sfcp6RIXD7EaGOC1rH2s
	PswS1JPOS5nx/l64f4E8+oWQzbOJvUM1uvHaXDNoQVuGOHNTb/GyKfIXiBMcR4g/nmAyJI/qXXQ
	kwKHdfbTtxv/7ZKuwhxjbE+Wr2R9OGBpNbTTVMZHIkWqlPbX/j0N1o7+XlBOj/uTEW9sYNbu+rK
	Yv34QLW/SzuJrf0DZUgKSHnFEh/d/fjUo=
X-Google-Smtp-Source: AGHT+IEodMVo47Bp4FxcEOGn3B0CEL26ZvCKbvlxSi500O8+h+deBEZnexXdLuSJoOjBK1BjjSrPYg==
X-Received: by 2002:a05:600c:1c82:b0:477:73cc:82c3 with SMTP id 5b1f17b1804b1-477c01ee405mr190579045e9.26.1764154661799;
        Wed, 26 Nov 2025 02:57:41 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:41 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v7 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 26 Nov 2025 10:54:29 +0000
Message-Id: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXcJmkC/23Oy07DMBAF0F+pvMbIM/ErrPgPxMKPcWsECdgoo
 qry77hFgoh4eUeac++FVSqZKns4XFihJdc8Ty2YuwMLJzcdiefYMkOBShiU/MW9UeWh8nqeQir
 0wU1AVMYNluLA2t97oZS/bubTc8unXD/ncr5VLHC9/mgWoKMtwAX3QkCImgYp5ONrnlyZ7+dyZ
 FduwS3RG7RgI4LRKXhr9Kjjjhh+CRACe8TQiEQqJvRphAg7Qv4RAF1CNgK08g5BCohhR6gtYXu
 EaoRFStF4cEbtV+gtMfYI3QgjRUTpcKR/xLqu35fc/xICAgAA
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
      coresight: Extend width of timestamp format attribute
      coresight: Allow setting the timestamp interval
      coresight: docs: Document etm4x timestamp interval option

 Documentation/trace/coresight/coresight.rst        |  16 +-
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  68 ++++-----
 drivers/hwtracing/coresight/coresight-etm-perf.h   |  39 +++++
 drivers/hwtracing/coresight/coresight-etm3x-core.c |  36 ++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 164 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  92 +++++++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 275 insertions(+), 164 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

