Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BF21A23A4
	for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 10:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755168683; cv=none; b=e8rXDztqhJE5NP6gwaSEaUSxrkkc+dtktlvDvtgzGM/BI2ZXYufyMMXJQ9ajsbwVCG3QconSHtOWScngU95wv+MNZc/cbCoCzH8ipyRbt3cnsEOg+hh2iZ6r0igerd+T8r5va2q2JgO6yjM1V4LT5lBd+fIXjuheh33BZvXNUfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755168683; c=relaxed/simple;
	bh=rSx84v2RWy7DYtMA4DT3vwAvFBT/1eeXyAR0mT5L71w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=avC0GzkZooqusSFV4lly7g039aRn7XHVJtvrw1aNCGi2II7fQ2WsCXMG1kS9qa0KBm0hX49UfOZHaJHmp4tbgf6Qd6vuBaxHg9bmITdt+mL6GSLZYrvWmMFDgTFBbuEnPZ6u3kBz+GAt+meiAM5uAore7T918X5ANcL8HQH0gRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6guDUGj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6guDUGj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so4025925e9.1
        for <linux-doc@vger.kernel.org>; Thu, 14 Aug 2025 03:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168680; x=1755773480; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Usjf2Lwxzvbim7S5kgmgOqxfjpVorryscczoj/caPjU=;
        b=c6guDUGj0TYUHwYrUze+3NjW4aBlSDunI3PeOPfi2EYLDf1KXCtc1QcQCssuFEw9eo
         EyhRVZN76Oc0tqtfsL0Wkr3o/Vy+8XcGtF2Pr9Mbov7JIhLLCxc5mTNdl+22kAxNj1xY
         Pwq0l72ivAqYNq7Wj3kMlBsc9DXtUn2mFKjPyiTzAO6Iaomfj5xp6fDqcwiWwRTMv8gp
         60+L/MFsEXAmvL0qrIAHDEyyb6+4TxwJ99kCg+004oY/wi6SRS5QR9bNODvuoW8iLa31
         yTcO/3ouJ8upxzLTWQw9oMQmKpKSj4uwLGrLLJVlbclYFhGP4yjh2ErOwyV57mXFDC/F
         QZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168680; x=1755773480;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Usjf2Lwxzvbim7S5kgmgOqxfjpVorryscczoj/caPjU=;
        b=JLy2nQ4T6IGRwYZoqTu33KB78s9DzPxsgvzEwEvGagvL1AYOiBZwnihjy8yEc0gWU/
         TOa6Qmwc72HQ+hcg/znGAd4HV8m98WGBjQ7JE+y4ENhwV7rkcay8QvD87hDbRGlgsp+y
         Ivu1B9DwDDxZW+tPT/kPpNn38TD/fERvwxkGCEIuiwd3TmxQJ3iwGHJgQUbVZSwbQt8V
         2m87eG18yiIqCbYYsFDMZBLOMqmb/Gy/jHCnQLtEM6XsWN5Ce94Y/+ntF7jqO2t72Ba8
         iJnU7hrxw1ZprJ4bx8R4I4Ytl3Uf/x5F3ZIR4Kyk4Lk0Brk/WnF0+tKvbfPx5o2dhS4k
         n3FA==
X-Forwarded-Encrypted: i=1; AJvYcCVfmILJxqf5p7GV3hmpwuHoBH6eVonUSd6jqQvwuMBrxxdTqg77w4C8xBLW2B+4j1z4O0yB7/gV8Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsyANUJGh2hsQ8ezLsAdSuVFHlHhCsFABUSY0JVN4wyzRLoI2
	bwqhyfqx65IEqdZu6JLLkCL4f7Qaq4qeJV6M45fc+whC1u60/VzqzQXNkMCO08VSQxw=
X-Gm-Gg: ASbGncvJcBNoIFawCKt2xrav7wS5xQdrmDNQAMlzmpqbEZFhIZLQMQ0XlqXETOXDiQR
	OLEn2hfzp42dVDpDbocEbNJIPvVHSnBpjpVSf78wXnqJIzBMOX/HmxcFvnGLMbRka0S5OszLPmN
	AE9Sb+cWHeYfMXrBUrRiVQh2tABv1D0w9us4M/CMWbKxm0gCU3Jj+o03pOlFkXKDrR4wYjHaST2
	wV5Gkhd2sKK7ZfZqA9UlTCVXY2D+Cr/pfMX3//UDOVQvD95C/eiqnuoJdxhh7J0yR+OpRbE4gpX
	pT4shTkX9XxB6aDGK23J5+jd2KQmI3YKfcstqWIq9BRHV/dYXC0oIoaGlRrmI+J83ToHWTrzTMk
	mG5suJxo446C+2JusxJIhUYfVIqf9buWHpzLBmJDYiQ==
X-Google-Smtp-Source: AGHT+IGi1J840nNnMEHt0PQ+bJMM7STyMRvyW+nAoUIIj5zhCJZ53xyxLHO0So7XafSfOfSk3XvbbA==
X-Received: by 2002:a05:600c:827:b0:459:e094:92cb with SMTP id 5b1f17b1804b1-45a1d7309camr9947535e9.12.1755168680077;
        Thu, 14 Aug 2025 03:51:20 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:19 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/6] coresight: Add format attribute for setting the
 timestamp interval
Date: Thu, 14 Aug 2025 11:49:51 +0100
Message-Id: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+/nWgC/22Nyw6CMBBFf4XM2po+QIgr/8OwqGWAMdrqjCESw
 r9bcevynOSeu4AgEwociwUYJxJKMYPdFRBGHwdU1GUGq22la1uqq7+jqCBK5hh6xqeqg7VV7V2
 DnYO8ezD29N6a5zbzSPJKPG8Xk/naX60x5k9tMkqri9YmdAd0pS5PN4qe0z7xAO26rh/AyvQns
 wAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Do some cleanups then add a new format attribute to set the timestamp
interval for ETMv4 in Perf mode. The current interval is too high for
most use cases, and particularly on the FVP the number of timestamps
generated is excessive.

Although it would be good to make only SYNC timestamps the default and
have counter timestamps opt-in, this would be a breaking change. We
can always do that later, or disable counter timestamps from Perf.

This is added as an event format attribute, rather than a Coresight
config because it's something that the driver is already configuring
automatically in Perf mode with any unused counter, so it's not possible
to modify this with a config.

Applies to coresight/next

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Only show the attribute for ETMv4 to improve usability and fix the
  arm32 build error. Wrapping everything in
  IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM4X) isn't ideal, but the -perf.c
  file is shared between ETMv3 and ETMv4, and there is already precedent
  for doing it this way.
- Link to v1: https://lore.kernel.org/r/20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org

---
James Clark (6):
      coresight: Change syncfreq to be a u8
      coresight: Fix holes in struct etmv4_config
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  13 ++-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  86 ++++++++++------
 4 files changed, 151 insertions(+), 72 deletions(-)
---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

