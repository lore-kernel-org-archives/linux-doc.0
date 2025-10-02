Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699B53081D2
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759399798; cv=none; b=XG55ORQZjwxKcRmwXYQ98h2zYy3bMts517P80GPeVJ1+4gkHxgll2Ipth5eGzWYTcEyEHbQaxCsXIJLKIACVNm+CCUCz8BtL/FioERinLhEiLJkmfqpy7mdIU/FOAkXrdgwBvrCt/vC/MK6lFvZEKKN6OfjgqajYGZw5RkcPvsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759399798; c=relaxed/simple;
	bh=n8iNlnG/A9rqNs6ZLLb45X0uDju1aV4WAM8glr4yrUU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OnsvPQGwPC9S6WYQRPEU6JtNMmqBwTM80mgAD9YzOZgd0ErL9AVl3xh3H6nleuw2pvbH4EIH9qmvj0PPeKtECK3R1tYdir1a4QEku/RcO20A0caDyQM5kPPsqMYtx2HxR1xw0Pizip/IynKQEnZvbZFtht9H5pWRk41adeqU92w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gmGmmvWD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gmGmmvWD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46b303f755aso6119255e9.1
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399795; x=1760004595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2glQqIoDqidxCvkUg1dS2LmkAX1c7KXwOLpe1injDU=;
        b=gmGmmvWDnmIqupnjkBwxR5UJQRv83ut40b111D3AP9dwEHXKVNcUkCJPpnA7rb7SCc
         yMBAhPabPlyWGXrFkSo2RpS0CKNUuXSe+6BOzJOFH9kSaCOSaz5jbckg/amaziS+rmKx
         ZkRIsDM/Mab3vnRsIa+eBuYEWf3D6ah1Q8tUrJBCVXSHM2Qp2Jp5qQ92Pp/lq230wVEJ
         l7YDovb8h/mDgpOwfEhlrbBQ6xs03YoK5IfjStJ36pDJ0agIe+CLgUpglccgyJSaVvAb
         VBHvNhNngayXvcd6k86RbnoErrNLh+i6BYL1wOwurMkhHSbojcs8dWN5TEaecnohVlIV
         ZNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399795; x=1760004595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2glQqIoDqidxCvkUg1dS2LmkAX1c7KXwOLpe1injDU=;
        b=SB+x+0aGMR5rct18iv2eR9wbxoAh6a5du25fGKK7kYgFyZAt3NYbPS+g5T+IfZOakz
         hcb7f7eai8qPDhn5RdYLEhcNOvRhz6L65znwtHaagKhpMWWFMnL6B0UY42qA/pxeSMnS
         0svzeRPxN68bv71dfduHVw1jAW6Lj9AWUhGcwkb26BWr5RgX0yGlefwaasHbU7rDmXAw
         J371/yrRimP2BTcGq4e2XIbT5mF/OUYZChDt1UcRYMtH36xzTk+pfeISJUVIDF7T8Q0j
         4N6jRVVK23gCj4afMvs8b06LMQHIAB7vAaVlvAts90lnieKsNHjO5xgqFFyEWuSLhCRO
         QfcA==
X-Forwarded-Encrypted: i=1; AJvYcCV9eEU8fXBWKw6vMmxYNG3WVniswYPvJ7tl9PNB6ZYrantOcIpR7wgA9nYmdf7Cx8ibzTHkvrNxC4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt9C0glQz5tOkCKs+4m4SQI+8u5JbOFNptJ2sBpsNEItDF0cEq
	EpdXjIFvrQhu+dXCixlFZaA0S7u1ZOYZPOeX98FzIeTl7Ma5zKDEVaORpkt7jVyOadk=
X-Gm-Gg: ASbGnctYrZf+AG5KfPv4TTr0rpIwAlyRsP5ccofjIHyVLGko+W8BceOVbWjDloykYpf
	y7RmwQPozZhSuyMpUHKoccmwKba/VXZaF8RFI8wpMzI7HsfNlXz0s+vLQOP45iDbqEEt4mKBksC
	+Aau1GG3VJ3bZDlrpv2q6h5DKuxoftRLrpDgyYiCAKTYYH4/g+P1o0rGe49Y4Yp7CNusS1unCuE
	Lo2TgOZLlkg0zasAu+Bn0WNK9V/2zO3pACM2Za0194wH7meDANKOwdqd2gOvJrMwnl2H0/bNtBW
	6oUEaKa4xO++asZpwU1TzDBzKlMACeL8eeKle7e+mNDthmlsduN+Xm9XopCwNNw+N22vqrOT1Km
	4bORbcnD0mxPz38saTXj0nW7Jf1VRAHQpesTD4ZtQcWfqaJuebZXIcRU19YHZ7n9C1xajc+0=
X-Google-Smtp-Source: AGHT+IEH3w3OVVeZtpHd+VudJWMIn/QHbYxRQn1xSG2I6GioyRqjXQBLA6ig4WEqtopdkFxe9EMwgQ==
X-Received: by 2002:a05:600c:1d1c:b0:46e:2d8a:d1a1 with SMTP id 5b1f17b1804b1-46e61285e6cmr55580785e9.10.1759399794785;
        Thu, 02 Oct 2025 03:09:54 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 0/5] coresight: Add format attribute for setting the
 timestamp interval
Date: Thu, 02 Oct 2025 11:09:28 +0100
Message-Id: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFhP3mgC/23OSw7CIBCA4as0rMXwaKG68h7GBYVpi1FQMMSm4
 e7SutGky3+S+WZmFCFYiOhYzShAstF6V4LvKqRH5QbA1pRGjLCGSFbjq7pDxDriODndB3hiqRl
 rpOItGI7K3iNAb9+reb6UHm18+TCtJxJdpl+tpXRDSxQT3BFCtRHAa1Kfbtap4Pc+DGjhEvslt
 h5KrBBail53rRQHYf6InPMHqPjXjvYAAAA=
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
James Clark (5):
      coresight: Change syncfreq to be a u8
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |  16 ++-
 drivers/hwtracing/coresight/coresight-etm-perf.h   |   7 ++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  61 +++++++-----
 5 files changed, 143 insertions(+), 65 deletions(-)
---
base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

