Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD411DE3DF
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 00:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216406; cv=none; b=hoJfDqko2nqTeZ8+4ARpNjcZoGTop151nAPixmTs5GFQSlrPYRaDqWbJyYwFxXTEEt5RDS+ER0tdRRryXLT6In49xmuIN8Gvw/rzagynz7k+cMbKh7QlU49tjmQjNcgCycF32N7bcCrZjrhIjkzra/5psip3r2J0iRX+V+umS/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216406; c=relaxed/simple;
	bh=TcYju8n2wQ920cf5z4H9pMb0Z3+C7so+Lr81+sHREOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nYHyMkInT6VvW4fUTR50OhFLP7Xq4T6+hPywizpxvBL1+u1qZ8I3Cfe3GeJDNVllPTu6dVGyUIQBp0+hP6JdBGvKJisrAg28YHSlPca5lOBTip3n8yZOhIBz7sFhzeWeYwUnzoBr2GqvD4pJnfhTPRlooxud+NfBiwFiHdXQUJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=SgrADH5w; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="SgrADH5w"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9cdf62d31so2741462b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 16:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762216404; x=1762821204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXCqgHkp/y6Xvj0pMaw2k9PHANDsHwn/e45azlj4aMY=;
        b=SgrADH5w4yXGc36mKpk81GvbjPUHRY5rwD0u7yX4bfWqHMSc1o6YUY1VBu8ZVLPaTp
         DYxQDzzwSLlrR7NGLnozsnaL8E6bgnv5XdMY3DDsDFC+Q1PcqNmJtUyuQWNXiEnbXCdb
         kxHPxgOYwjm4wtaCklx6hY8ki0Uk8fxDoGKDGeeRY19sQM5y7YIMmMiXDw0COKhmlIp/
         KP7Q307eoUpsYoNbDjQUzyFbSjqj7FfQ3RCP8pu0ugPGSeE9mtFZq9xhvACXq1x/4EnQ
         m1CaTr6E0UQrZ73zShZzHqjQaf4QPIp1JzUOY5rkAi3zq7dv6LBjyCsWGIJDSmTH72+c
         gLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762216404; x=1762821204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HXCqgHkp/y6Xvj0pMaw2k9PHANDsHwn/e45azlj4aMY=;
        b=nCYdXK00NFuiXe19JnbYHgNLmm1GTgKV8HakvuBEM4kh4+GwlfjtPwMZBsJIHqstve
         Q4s8mJZRcufEyDejNZsB5ctgpC7CQ9tA0YsjeMKqPpnWzBhhzzXUO1GHH8xJrZhLkAix
         Gi0wkqliUZnd/MCxU8bA1i73XOphOz8Ou7r1tt+RuMkW+sd3m6wJMd8HMAjXCsedxHUq
         QKZ5xGGSsqnSk8SIW7TakrdpU85Fk+qDgqXfl1PELhlibU6gOQwypmPgdmDunajwtS/K
         ac4X64tOkZmFDSKdqTMiz7sjnQ89JKctsvzSF+LA1VqyQPVmaov03eDNwbxyu/5T7QHR
         B0/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCmV9zLUAtIpx1ch6hz5yxtQsJI8TZrurSYabt/rdZBdST4EinRpUG5CXWXaLy9gt7cb0XXLw+4Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz56n4SatKHP8yVoJYbn0t487p2ChKrorb24Ud6L0V3Ylm1sX+
	L8Hr5MZm9MaoJyLi27zAR97ZMCOGN8jbYz87syQ60d/ytvq2RVp8ZZo6Nkn3EuawGde0Grz5ZMr
	nSKUjyesiJg==
X-Gm-Gg: ASbGnctokg0S8tKaD4FH5u5OZ9I36W2ar0g978oqtOfy4/OcMf1gRPefJTVhHXEjtur
	SdwWjdtCW7Eq3AZ7b4lvN9seL0z+4ucVgKs8k7z4le6TLfi92BmkigebESDvvht1NDyQU9pZLHz
	8k/EDP94GXjEzwMGgLMFASsnv8Syw6l1nZgKzGTdIMbw6bKoWRH25UrvI7njp4HTYYGqRBvQqqZ
	JGC2cEoPdmCKlzYhpfVluGFNXvN1VubdLt0PIF5UVccrXXNTP7e4J6kGEbvDJ6WRNsgdM+UWRtj
	Dvplzl+pAxh3SQRVH7GxlyFq7xQQrJNZWQ5s8Tk65cnlGSRTLwPAmPshqlv6UatWtr0XywnTX/C
	L4UfRy0/aUpRnu2SPZ/2efZGxBq2oDihoe+yEKOzY/UEe4hFaWlNnVOs8QNt8L7nHQojeFHMeaF
	uJ2SyBBB/tBsVy+CqtWw==
X-Google-Smtp-Source: AGHT+IG5K9xuPSs6yLpF1b4AqM9fFQ4oDhiSJtrDt8p9KL3Qz56dNNylWn90xNwGiCETSOBSEA0SjQ==
X-Received: by 2002:a17:902:e749:b0:295:7f1d:b031 with SMTP id d9443c01a7336-2957f1db28cmr98709205ad.52.1762216403710;
        Mon, 03 Nov 2025 16:33:23 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:6127:c8ee:79ad:a4c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f9615c9dsm360123a12.36.2025.11.03.16.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 16:33:23 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3 0/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Mon,  3 Nov 2025 16:33:18 -0800
Message-ID: <20251104003320.1120514-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the ST Microelectronics TSC1641
I2C power monitor. The TSC1641 provides bus voltage, current, power,
and temperature measurements via the hwmon subsystem. The driver 
supports optional ALERT pin polarity configuration and exposes the
shunt resistor value and update interval via sysfs.

Tested on Raspberry Pi 3B+ with a TSC1641 evaluation board.

v2: https://lore.kernel.org/linux-hwmon/20251026065057.627276-1-igor@reznichenko.net/

Changes in v3:
- Updated devicetree binding to include optional interrupt property
- Added shunt value clamping
- Changed limit attributes from lcrit/crit to min/max
- Improved limit handling to preserve register content,
  (current limits might not round-trip exactly around extremums due
  to inevitable rounding)
- SATF flag handled properly
- Misc. small fixes

Igor Reznichenko (2):
  dt-bindings: hwmon: ST TSC1641 power monitor
  hwmon: Add TSC1641 I2C power monitor driver

 .../devicetree/bindings/hwmon/st,tsc1641.yaml |  67 ++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/tsc1641.rst               |  87 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/tsc1641.c                       | 748 ++++++++++++++++++
 6 files changed, 916 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
 create mode 100644 Documentation/hwmon/tsc1641.rst
 create mode 100644 drivers/hwmon/tsc1641.c

-- 
2.43.0

