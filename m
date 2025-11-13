Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E73322DD1
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069205; cv=none; b=s4Se28W1NYtTlDkIiiC7gpsSa4eNJtMYQ7eGdvXsqi6Fhmt3DVFEK8GXJm1CAQ+//UKSjrgpM8U83q6LRih2V82yoX9R+B/NdDjsHIqsLvewQy7BRLfgKD47n8cjlIERNrFNDjCWL2bzsuvH8NCvKbXzzUeAScEaQ09a4xgclCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069205; c=relaxed/simple;
	bh=75BuXIjGpZny9CJyYZ3+cDjv4Td/7jryzbg1I2bUBp8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZRPvypqgcApBeS8ICTL1+EdaJwjP8cqdz/trBOP/A0oNLgDD54ASocyoFPzgn4GLapznKtKv0AkCEFCTb4a4ZqaHld+iLs8d9sQLWkyZnVjOX7DL+P7M4UzsJEur4NoDftDnKDZbZ+R3HbZjJZXLzH5vJFYJZ3YeN7c2BjhBLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmkL1HZc; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmkL1HZc"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso936120a12.3
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069203; x=1763674003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm8LcnZyr//0nT7mWq+F1YEGC3NfbcijTCKWk6nFZu0=;
        b=BmkL1HZcTfHeiGfgLY8doTDPzVBx6ymCS/gRBaYt0Nf9adnjVfYTchjtfi0Zhrio2I
         qt7fsxhCNwypHkWT6CdaY78iCSSFVGHzB8cOhyauEWSkAd9UXHYpET6Ms0CVFvUFs2HC
         7e7HFwKSDb9qaTuFczTcvd+tf3bsfP0GWXH5xcmTDF2MXMFmCjB9wrQb4s5qcpQQPbOV
         28HoOeonsmF4m0pPxMV9vMJtOYzlyHgXCTkPHaBuZ91DxXDV73bgFCR2z9e/7S5JtnKS
         edL59PnoWjI7cp30tI/pUIsq4k5y1ADXWQjt2yB7K+6joSSgvBNxm0X5k0njK+CxMyTp
         oD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069203; x=1763674003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm8LcnZyr//0nT7mWq+F1YEGC3NfbcijTCKWk6nFZu0=;
        b=Bn9fp5iotNqriD7psayUewjMIZd185ByMV2iMorE6Y47IbWWmpz+ASUN5u0hNRJ6/Y
         xvEJvft2lyIVhONhzpAP2+V6pk4P9H7imJ95ahEnnD+Y7dOhmuaR8N9kYMTzfF9SDcvn
         phdsBOK/ugQseJKVScjIEnK3oH4b9MDR24UotWIMQIPs8r3R0EPn8Ar83lxh7WOiFYvy
         1F8FAFsQq7RDyVeNGe8WYrKhApcwwz5xjFhypzMYpkFrlYMcYT+tL7KLEaYoof16g3A4
         UC++FECtZmTa4FxapVCsuW2wtQQfpvTp9wOgZNz7TEC/l6xd5KV4OgDBjAn4MTu8mWLO
         6Q0g==
X-Forwarded-Encrypted: i=1; AJvYcCXW9O5M7/p46rpWgYv6ubzO6d76Tl+HIZzn/tNuVo0rSv9syQVRD2CIraOUcHNf74cg4RZa5B2fHVk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIceEihQ/BRy6lCkZ1q5vsvw7yf9yperPgRK5h8scantSl2n0y
	/5tcV8GXmbeUmG6/bNFnGMsYYImvCIVWwW1CeEy6V4kx2G3RKP7I1qnL
X-Gm-Gg: ASbGncuvVYhOT3HkSIhTGM8n4Wcjrp8uZ++a+1QP33773kJEQ7CtCi/TLUUUZQVPgpk
	ZqVnJ8PT0JnfiJxZx2cgYr8n1Gh1rdlmRheoirBnP1K23Ynk6DUBc85T7VVqeQG2YwGKnN4o4K1
	VRBPjELBJnT8G6QxZw49OsuCoea6hHAUyzwfMxqtQaZvP0Il/Pl3p58LEMmpHhWOYfrvTOJU5sm
	5/7Bg6rnEYGXwKuDmv2w8EDR9Bd8/uIH06GQOEm4PgFpJ/usfvZJMAXX2iAT3DgVWC1CWirJkwd
	J4GTdZoGiTh1nTf3FMaQNqnpnhToGx21MIa5lCTI2SBolpJKxbHYYX35os/QSawvMgiFA0BS2LL
	blIJpDkeLm2UHdAkkFqWa7rHE9wXlliTQ+Jvcnr6CQDpEhjltpK0efvWceb9Xw+2hzxXgsLQuhb
	esCav4CkGDDGTGWfZH3qbeYaVkUar28qKKJSUAwsoC02oobRCw/fsT11hH
X-Google-Smtp-Source: AGHT+IH2ppKVKaegleIFYp2CPh1L2DqmyfOwakV0r/xJMX47RxpUdSR1jy5Z+Tosq9kSQTZd5Y8Tew==
X-Received: by 2002:a05:7022:69a0:b0:119:e569:f622 with SMTP id a92af1059eb24-11b4150c6aamr292336c88.27.1763069202522;
        Thu, 13 Nov 2025 13:26:42 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:41 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 0/3] Add max-power platform profile
Date: Thu, 13 Nov 2025 13:26:14 -0800
Message-ID: <20251113212639.459896-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new "max-power" platform profile mode and uses it for
the lenovo-wmi-gamezone driver. It also adds the Lenovo Legion Go 2 to
the extreme mode quirks table.

On some Lenovo Legion devices there is a thermal mode called extreme
that corresponds to setting ppt/spl vlaues to the maximum achievable by
the cooling solution. This correlates strongly with an overall power draw
that exceeds the DC power draw capability of the internal battery. This
mode being mapped to performance when extreme mode is detected as
supported, with the actual performance mode being set to
balanced-performance, has led to some misinformation being promulgated
that performance is always a bad setting in Linux for these devices.
There is also some confusion that the mode labeled performance in
userspace, which corresponds to a red LED in Windows, shows as purple
when set using the hardware extreme mode.

I'll also note that as the hard TDP limits are refreshed when on AC or DC
by the ACPI notifier of lenovo-wmi-other method driver, no special handling
of the battery is needed for safety limiting extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v3:
 - Rename the vendor specific "extreme" to a vendor agnositic "max-power"
   to better allign with the "low-power" platform profile.
v2:
 - Drop patch 3/3, keep extreme mode quirks table
 - Add Legion Go 2 to quirks table
 - Fix nits from Mario
v1:
https://lore.kernel.org/platform-driver-x86/20251026081240.997038-1-derekjohn.clark@gmail.com/


*** BLURB HERE ***

Derek J. Clark (3):
  acpi: platform_profile - Add max-power profile option
  platform/x86: lenovo-wmi-gamezone Use max-power rather than
    balanced-performance
  platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

 .../ABI/testing/sysfs-class-platform-profile  |  2 ++
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 ++++++++--------
 drivers/acpi/platform_profile.c               |  1 +
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 35 +++++++++++--------
 include/linux/platform_profile.h              |  1 +
 5 files changed, 40 insertions(+), 30 deletions(-)

-- 
2.51.2

