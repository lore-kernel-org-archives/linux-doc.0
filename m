Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E828D341075
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 16:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569102; cv=none; b=qq1SrAwYSeT8WLxANQx+rzok2L71IhIkYFkA5yowYUut3QN0L1F4JomHVqqx8mHPa1mW99ajQgdH0K+/m3uazE72f/N1ZJlwRgP4n+IIJnMlDeFMtsKva9WDl3e818/ElYZSQ/ojqn+Rotpj1JWmnLbb3uxbaFZodzG61gaD+S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569102; c=relaxed/simple;
	bh=XqRAd1zSmBUMtYBX4Mc+HprX6TyT2TfIjT6REDUdJsM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O7VW1n3hWrcwkJsi4+GhEhnHhrdd7SwBx2pWuda+BKu2bK2qffwaDSL0wBBv7KeoIIHcAMlCjfrx0lvbrsh6FzAG971R4muMV1co4fYn05KFGMkiXnnvGiJa5PrNMU3x4Xu/BHtIIdFKKahlfBWcbkegAXcwlGTZfohHjYrbvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XVZ8h4uA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XVZ8h4uA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so48805085e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 08:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569099; x=1764173899; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqSmo/Laz/wqcGa5U2yqJUf0vmDAtS4/bm3ej3zoNlI=;
        b=XVZ8h4uAuEJ+o1Jql8s+HLup7ZqJQGiuJ//yfNQNoXjRQTdxGi6o8AJfntskkOfq1J
         ucHzUAtz0VB50mpPNjJVThzbhE5FEg+lYy5zITS6u9BkGlhP50AWmwRYNnS96iWcsobW
         hHWnpAm9F8WvfbMfSMJcfSjK42mP3XG8ZSmTy0D0TxalbBBMCp02mHoetx4JcI2Nff/n
         S02LlryeX17Mo3u4Drac4ofrEyg9U5CQT6fOc4XdDL95d5k6GHS/DM/MyXFUXIis1PSy
         srt/3iQe+9TDB0JR7EH2UyvvC/ECwdWaPky2za7RN6SULJ0c0XH0aKnwMgH1xk1Y9n2v
         /log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569099; x=1764173899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqSmo/Laz/wqcGa5U2yqJUf0vmDAtS4/bm3ej3zoNlI=;
        b=e2k2L37K0SrkOwFwUFJkrq/VnFnsCpYj6SZyVut128fL6cGTFd8M0ZwJpUu85p29wd
         l1aAdQayauCG4MFn4dpbigMTYu61dLh8WEriwAV108txzUmPxABHSDcD7TpZqRNz/HF6
         FeVbNM1q+ejJidRbg0uaMBu9VgYZ+0ZZEd9g5tywpeaJvaBx1J0CxG6+Y0itUvo522Yy
         f+QkSB2srefP/6Rw2OIkcbX1ZykFqnVSKadXi67RBhg91rmZxNEN4ggWRlI/Mvwna8Mm
         gWID3MC8k6PNrE3guxTyFABjTkY599DIOy4N2CiL/gJwrkAKL8yqS2Cm23YoPM7C89vp
         TdTA==
X-Forwarded-Encrypted: i=1; AJvYcCUptI1JwQXm/N3DFKft+yRzWQfLdZp0kEDcUx4nb3dsVxDuNKQlc9pNn+FuNI0iI6rqN6rN8TCZTiY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyivy/QWjXmUoKToFzsotQ00mLgSnhXkZ4llt4csiLz1b5TakFO
	9LEYmNkqYjafKP/lpgAU9KVmx8Nh34mFT8qH+tD56gDjlK13oll76y/YXIiymOwt7nc=
X-Gm-Gg: ASbGncsjRECX0rMH3RrMT8FxgRnwiTDiGIV9mF8A7aR88XotMsNuX9e9CiNASfHq/g5
	4vAbTWkfvNTJAuyK0BnUFYUIYfpbqR+qSoeWr6wNJ0hdcdXFqwEaVLxeeyZwSYlzXXKnW5UdkFh
	0bmzqFzcpnh6ykxfCQ+R28iGWVacx81Qv/86CZ8k1+vfYVfpKZOx9caXNlalmiwBjBskmlVOgdt
	hEOYNKCzhqv2NOPtrGBAifDC0JfGNe95rPiVYvc/hUHMU4G7w3vBUdGyLSzZqfgneThWoDtxFA7
	hvyEk7x9vylu6Cd2VM2/vtjhwjXbYva9UJ5M3U2afxMnf24yiUh6ap+zsxq4zWNS57mk2V9Xmsn
	0X3zvbE+sGMDP1ueTl7UcapZmBjA0TpmXsO/EiBnERkdREtpIkiRyRp5Wk1UJJjcVPWxMWeDhmY
	21hVNa0cOnRRLPtLt9YThRbTtpdJapAMg=
X-Google-Smtp-Source: AGHT+IHR+DwUC6v1Y3r57tcBgwQLVK6dWirnJF4ua41MnisnQJishs3n6VHMISKst8u5Qq9qepwLtQ==
X-Received: by 2002:a05:600c:4513:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-4778fe5c820mr231104425e9.10.1763569099061;
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 00/13] coresight: Update timestamp attribute to be an
 interval instead of bool
Date: Wed, 19 Nov 2025 16:17:56 +0000
Message-Id: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALTtHWkC/23OS04DMRAE0KtEXmPkbv8mrLgHYuFPOzGCGbCRR
 RTN3XGCBEHjZbXUr+rMKpVMlT3szqxQyzUvcw/mbsfC0c0H4jn2zFCgFhYVf3FvVHmovJ7mkAp
 9cBsQtXVyoihZ/3svlPLX1Xx67vmY6+dSTteKBpfrjzYBDLQGXHAvBIRoSCqhHl/z7Mpyv5QDu
 3ANb4nRoIadCNak4Cdr9iZuCPlLgBA4ImQnEumY0Kc9RNgQ6o8AGBKqE2C0dwhKQAwbQt8S04j
 QnZiQUrQenNX/V6zr+g3PnH2kvwEAAA==
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
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++---
 include/linux/coresight-pmu.h                      |  24 ---
 7 files changed, 244 insertions(+), 164 deletions(-)
---
base-commit: 9e9182cab5ebc3ee7544e60ef08ba19fdf216920
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

