Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF3113D503
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 08:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779005099; cv=none; b=kq6MxhQlqeylzPwF5A0DUUctcY/o2QzQoCQuA9zJqpHTI+PeoC3J+6wAxGsxia2e64Oxrid3N15Bgbl3mWNsrv8+y8i18y4VYFI36WKLt+4utMCWgTLmFURx8nXOyxulIH+hZIFBP6y14zhQD0dVpnop6UgZhI2IQBKKDpTz+7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779005099; c=relaxed/simple;
	bh=usAOCOiGdp19nhtvQJ3dcvU9o3HkmfOBh9yPAC8m85A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WITvbm6cRcn9Wb+ND/u64AVX/hejcUykHC5Ub4yYrO0RMPF1JBXgmdT2j0zywAy2f1U2QDrgKG8KVE1OC7RVVlLGMW/1vj4SXUOlTdteHphcdWSRSqOhg+5rSs1DOLL/FrZBfA3sOdaLUMHwDjTGryXmlLfP4Jr1cFbDq6HO+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kixbvrsv; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kixbvrsv"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2bccb978bd9so13776315ad.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005097; x=1779609897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=kixbvrsvUKxji0h4D6G5SWHJ4Q3+RlnqhFAmmT939SOi8XymXK18RMCoYshpdqpZTv
         /TAvUU9E5ECaV1GrJZN0bMr+aU7H2JMXFJwBn9NGQLoo9PNnXRtIrYLKuzQenKX0Ef1b
         RXddmnRuo6sOf3WEJUwcZ9OHEUSDOKTVzIPIlaBtJ7ZEctM/g3zTxN7naoIjM6ssRtXb
         y83nJUU0vB8N6ZvM2GaCQVd9fBzmbujXFVy9eJN0HK8hRoeAWqfeE2utUH+R/vXhvl0n
         tbXSY9iGaTr3FqNReZJmGydKDyQuLQjPX5LlEUVFY/GxiPRQUMhtCBdwZmRW5hv/xDE6
         hYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005097; x=1779609897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=lTqxFp1y2fWmhzd9X+zGazZMZQz7jgw1x1Hfhe/j2UvTaoCVBnwM4d1b5KSjtwQ5nn
         KNGxNETP6SgZFtxMK7Thlv5lTKvk57veNrUDsPZ7lZzPS4nCrgEalhwxgwMP8Fh2olmL
         BuBT3g2kMFevc53vNRXhwgWbK7qFy1pDR9Ps15EGWNCA+6Ab0UzK4e1gEzkcnwWotAMb
         sCJLVh7CDUsy8mzq0qFeer4kH1d+U3zYqAlKQDvX05K5Xe54lc/ExyFVQELZ76Zk/myl
         LHqA9CnfW/6N+Fj5er7Rk96FcmjZRbIA2wWMwpuZ7Ftoi6BTD39SJxtHOKHliB/9axBj
         Gt/A==
X-Forwarded-Encrypted: i=1; AFNElJ+4lVqUqdPskAvj/8bUHGRDbwIf48jzT65Y2q7lM/A6XYW7TV+KCnTGrZNGmOZ9VJANbX0sJz4DGbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQq9Dlp5fnRw+xaT1RlSSD5ym36/h2eZYUkOvjIR2L4sxYQjvm
	ZSO57yAHEN2m6xb7m7p2U2YlFloYPQKyzt9kvSm0jnBRLQJkpHRlKmd5
X-Gm-Gg: Acq92OHU2xQHkcKD84hkJZBKCVDLYeqF8hxqJTnYfiPdRfgZc12qDR/GhjQxbkuJujo
	3I3eWaNBhqY5SDoIoSxY7gjA/BS/3dYXhgEl2Flvmra8XmI1lNFvaHXc84u2lTqr073H7EOIHFs
	lp64FSaR2NaP3Oql07BoTFEqF13X4/oRxLtZHSyM+5KSDhCQihkMP2wxhc+Am386vvHla5E0Roc
	fcDk+V+URt07f7xkC8esYYU9mgqGJO9CmaCfIESxaIKzFMjwtaE5iX7RqGuSaT9TvoXJ+YFtnF6
	ymx88J3eR+v1UDGRjU15KF0ktySUOBvVe51Du8SPmZX+kkcv0rmx5TQL6m9mKvD0FkVtfBSjs8W
	2wVQzDZjA35sXCikLmkulZojeOMqjo7F3L2lZKcfiQ47ccafjjjuxuCLetyd8Phr977KBrUCSmn
	WQhrtqA9aQEyaXveVpye/+fZJj9QhwKvYQz3bB7XOOzyTlPbWRLP3+jv0TZ7oU
X-Received: by 2002:a17:902:ebd1:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bd526fd16amr125158475ad.12.1779005096859;
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 0/3] raspberrypi-hwmon voltage support and teardown fix
Date: Sun, 17 May 2026 13:34:42 +0530
Message-ID: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds firmware-backed voltage inputs to raspberrypi-hwmon and
includes a separate fix for the delayed polling work teardown path.

Patch 1 adds the firmware voltage IDs and the shared voltage request
structure to the Raspberry Pi firmware API header.

Patch 2 extends raspberrypi-hwmon to expose the firmware-provided core
and SDRAM voltage inputs through hwmon and documents the new sysfs
entries.

Patch 3 addresses the delayed polling work teardown concern raised
during review.

Changes in v3:
- corrected the SDRAM_P and SDRAM_I voltage ID mapping
- moved the voltage request structure into the firmware API header
- made the voltage request structure voltage-specific
- split the delayed-work teardown change into a separate patch

Tested on:
- Raspberry Pi 3B+ running Linux 6.12.75+rpt-rpi-v8

Shubham Chakraborty (3):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support
  hwmon: raspberrypi: Fix delayed-work teardown race

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 139 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |  25 ++++
 3 files changed, 171 insertions(+), 8 deletions(-)

-- 
2.54.0
