Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C0721D3E6
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754904763; cv=none; b=WUjPHv+sA4rdL5N+0XnMNbdqi+hPYQ1rT23Us3wnRZ1/LKarzNOeeU9H2DVbwzl1aPltMw9TRiTYS7vxi2YjzJgJauc+o6VYK2hBywTBNVY3Bwgnx5duWPyU1zm5V7E1uEx+A2o88k9pXO4RdkE/noXdIUXKTFhrtfgWJJYWgEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754904763; c=relaxed/simple;
	bh=QRhrdkf/dzLj5skKI+9jF97tErLwlGBI1q/OhEGZmFc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DT9cn9NFehFbFy25mNaa1KP0GKWeABG9Kj+/tPOcMs11vAMOoYkFoRqx5Zd9ZqBtOZcf7m20FkTe0PvoXNu0CajGAGtzmeqkIqaZ+uIAw8CmhEeWrug00yTFLPp61YzqLr/Uwumh8j4O4xinzMjXijAZfgN1F6uR8rA7kJwUgJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HSY2xBZp; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HSY2xBZp"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b78310b296so2172797f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904760; x=1755509560; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NMhYy0D7+tDMBqaPesJxlaquyxiEfLakNWEt456gjBI=;
        b=HSY2xBZpHK3oT+HgSh0wzXjWwBalK3WA4Cwe7b/6jMX1FNjwbTbJBtLdVWW5U2p93X
         j6M3PkhX0SgEMHhZsokDt8+w31qfoRReZ9fJorhiRIVDCNFJE3iJ2QnYCnO+mSNN8TzY
         EDB+59hNCocT/fzCCDjylfkG0jJ220vRPQtGkkEJWI4FA3vsocwKdDp/Je/yN8YRvBDH
         a2CatxJ4nFIlgD7uIcy5hu5YvGxqTYDVyt9IdskXXYHUutPbDcxKhO5rTT+YaQRSBp2m
         w+kRKAfFW0KsL5wtGdts9F4V3hxla5KwC+uiYoLOSc7TI0Ru8eblphkl3dDlxXKyUb5M
         1x3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904760; x=1755509560;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NMhYy0D7+tDMBqaPesJxlaquyxiEfLakNWEt456gjBI=;
        b=hWPV+tARA4DeRMZ9V7845Ovy+Rzq4Lv7hP+Qqam49rZPFXDvHabiiHp/LUjFFP/WF4
         0EjS8P89tFhEndUJSHKFdQan2Tg1VbEYQDcLlZ1QPCSbFOiIu0O1ak/knEq4WF99ar8y
         9UD2FCnpiB7CTlTY7mK60Xny5zpLkyUGesdCB80gJRySxCqHlAw4DZVwMYnlnbUyiyPd
         VmDx3DaWAr4G2bUvJAkzovxVBw8GuyRAof5txn9KuOQALfttwedXnNli89s31tppwWPm
         37bVzEcZuDMZwUKbe+WWG7GuNbDPhNiGJjDIAMYpKGXTTv54lwggUsz7hWI+mtABqbwi
         /+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWBb6e+BY5gUybmSnKQT3n4SIsmClJ0/Y5tnPrC1Oaa7Cid7imDxhrB/NXheEQvN7GgseZHwWD0O4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDfpsgf7GpRNyC/FCqT+bdC1gEVzuV3ZfxJ4u2A5pXH40Ss1vU
	Zsc3iiwHvyqn/TLjsyQYE3wrJiWiFbrTKu7y+mELXalhRmp3bevN/fymFBBQvJcl+G4=
X-Gm-Gg: ASbGncv4s+118oC8bg4xTw6yTdn5jfBlFk9N12PRa537MPX052YicccvgL9DDedN86Q
	llnf8+nOOwWyOMVdoi2+DT6CwUwAXG9ns8iYuiuH1x7uG9UeH3UW3dtZsnTBfLar/BePls3Uqbv
	ih/fvew3TbhVoC2sS3gfSs5i14ZWQPE/07cxNlHmP+LeEgafurZEAg9T3zy4H85I18UmxshEZ30
	Wlo02m0cOjWoFye7g4v7kAysQsh6NITr2D0QzCxRF+vMEPX8HbqynUqjGz9i5Mwzpg/xzX3tZY9
	9CJjxTAeB7SjJmyWejoMyk/BHECNFIsYYYRw74tgr/BB43QX3FHCPrvg/r0mZtZHeIGTPtadK2L
	8wyppXc57PSrxi6AQ0NqjM83MqYk9cKg=
X-Google-Smtp-Source: AGHT+IG926P2UAZWTkKtlExqrZmNaWG7qVePQONHyDrug9yxfDtNL3kmdiq1ifaCnyzk+36/Ct5zPg==
X-Received: by 2002:a05:6000:4308:b0:3b7:9214:6d70 with SMTP id ffacd0b85a97d-3b900b2c485mr12845369f8f.15.1754904759816;
        Mon, 11 Aug 2025 02:32:39 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:39 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/6] coresight: Add format attribute for setting the
 timestamp interval
Date: Mon, 11 Aug 2025 10:32:05 +0100
Message-Id: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJW4mWgC/x3MwQpAQBCA4VfRnE0xSyuvIodtDUZZ7JRI3t3m+
 B3+/wHlKKzQZg9EPkVlCwllnoGfXZgYZUgGKqguLFW4uJUVvaLewY+RD7SeqLbONDwYSN0eeZT
 rf3b9+37Hq4JgYwAAAA==
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
James Clark (6):
      coresight: Change syncfreq to be a u8
      coresight: Fix holes in struct etmv4_config
      coresight: Repack struct etmv4_drvdata
      coresight: Refactor etm4_config_timestamp_event()
      coresight: Add format attribute for setting the timestamp interval
      coresight: docs: Document etm4x ts_interval

 Documentation/trace/coresight/coresight.rst        |  14 +++
 drivers/hwtracing/coresight/coresight-etm-perf.c   |   6 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 110 +++++++++++++--------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  86 ++++++++++------
 4 files changed, 144 insertions(+), 72 deletions(-)
---
base-commit: a80198ba650f50d266d7fc4a6c5262df9970f9f2
change-id: 20250724-james-cs-syncfreq-7c2257a38ed3

Best regards,
-- 
James Clark <james.clark@linaro.org>

