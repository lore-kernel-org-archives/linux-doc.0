Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599CA324702
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069207; cv=none; b=D/nSxBBwUjw9YOljpTVhbQc3KBtBP5BL83Tj5el+je2XFcM1MG2EFvmVPXUGXM+j/Ho8/Ckf7Y41J2VyoobkrUVVh1m4uLxwjVQLIK7bSExC/xX4UeK7hVknNUDvel7otr8u1f/L0rRnUiuMZjG0L948kgjnCNWjtiUzRCn5dIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069207; c=relaxed/simple;
	bh=EAYHD0uflfQd6sszqckCoZM9plV9potl4DoHq6i9A4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGkCfqBLLwmAAl+dliSgdU8p2ho6lZaj6jz7KFIg3pqAhcAe4wz45aCYJ+6TxfdvPM5v+U8wHMmEO0EPLbThXBwc2x30ijURt+n8QliQOOjojNaf8Mr1LDpLZoUNj7yMGC7ptbwco7ti+Ys6OXeVhZFBLu3vTrCT1Wh/C/XUm54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLeo9aAX; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLeo9aAX"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b98983baeacso523294a12.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069205; x=1763674005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=SLeo9aAXvz8+jnJn+Ek+oV6/IpdfpReJeK6ysMpgYnJH5+YGaMaPuaU7pRv161/0fH
         6cD5fybdcAOoQnIFr1sP66XKYxAJNwq2OFRZzsrLpUZvbY7E1JWx1oV9NCFkaQzW03cR
         g144UbZXLtBsqwtilem+qzxqRJ1JcFGou6vU8XH5MdW8vm+KNXeCJURweMjcy6kSCVGt
         drzF539RFvBIWkUynQrjuKVrwi6x6O6kmtmLBwhdKRptbwlbAzPmzdJ/btdQNcsauhiy
         F+vTKj7XaLjBd6I4FnG6h7/xqEwHcV5porkrSeKftdFATtZp8mj4Rvz9wvPG9t66y5m/
         i+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069205; x=1763674005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2SI5IT2ccA/LcmNZQUHmcdI+iq0zqrTHDtVhV8fx+VI=;
        b=EgPD1Pvxf4k9DvcWJuO+NTFkk5vUjEhimvOIFXTYN/Mk6nk0YkTe4ADP4jSQL/4Up/
         OorPasCII3HN12nmPkwjekeB8mGc4HpvKfvQN+8/EctpujNG30TqMv3Ncv27b3X8oFNl
         Lpxp+hqputZEkVOq9lXWcYgomTWy22UCg4RTB6wfDaIEmYpHF7SUD7d4Ccavyr5whdOk
         7y+8svmSUkk4r+kAUSVU5h5WKsmTROmMDClhPjPxZmp5naFnxTorvFk0zA/NmjRtwzyf
         mtWfPRfjvsusmOWdV8qNOu4qj+JAmxm8apVUCi6arZATPM9OrS5r9l/RUiZhwSy1Y7qS
         toew==
X-Forwarded-Encrypted: i=1; AJvYcCWe1wYJAZNseeHtbELjkib1KhqvaKayFuZK18np3KPVx9I+bezpCNgcjXctO2Fd+RPvCER9V/9QhPc=@vger.kernel.org
X-Gm-Message-State: AOJu0YweXAQ5N46Q4Wz6T38NcEbNQcYbH/q8U1eGqU8pNOq4PhB3I/Dd
	Y17xf7Tmkn+fEKJ2i2zhYes64MauWXbu+k5MqVpn2QAPI+1g4u9ADqqt
X-Gm-Gg: ASbGncvDHaCD11QmW2F7IAtgIXdyzBcPVavh2+i2SjnxHlwbSiD34XZkojTTz3WrA6p
	BJ3NN7M140HMtn9yjYEmliNIgT/7SEumH/En89gQrCLbvvXrjZh67Vsnz0ZtzG9xLx5i6o/CfSk
	KeGcOFwecsQWVFd46kgcWctOyqn6VPCs9l0GsDBKm6O/IET130xZQoTkChlmbQQq4fjP1sAs3ol
	prvrgRRBKrt6+H4KMba2bL7AwUjnZEvnHkbH/LNn6fCoTPbxLgFgu1FomgoP8vO81IppY/FW2dT
	aV8LoeMb9YDIzoznHMOgNSpV8A5WnXmLA5Gv9XAmQ0Dz6aSQKbr8GFVJpHOZSgPYnxi2MiUu+uN
	icGgv4MurN7prxWWPqAG1d3FHpapyXqtlXID9dStbWEm4Pgdp9CDVeUaEdt4aWhsya0KlvJuKTW
	rZ0w9mj3UNuxJCGjEF7V+/+MfnJfbcZRu5sOjGRPk1scG+mCZBxXKUY6NXtjSbSWjdd4k=
X-Google-Smtp-Source: AGHT+IE4bqe47dgeG8a0SwzrDMd8To6AhA03KdcpEfj8eolNH4fytB9FGHHkvfol2Cp158xttn8Vgw==
X-Received: by 2002:a05:7022:1581:b0:11b:65e:f6f with SMTP id a92af1059eb24-11b40f98007mr318605c88.14.1763069205472;
        Thu, 13 Nov 2025 13:26:45 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:44 -0800 (PST)
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
Subject: [PATCH v3 3/3] platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
Date: Thu, 13 Nov 2025 13:26:17 -0800
Message-ID: <20251113212639.459896-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212639.459896-1-derekjohn.clark@gmail.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Legion Go 2 SKU's to the Extreme Mode quirks table.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index df475e52f79d..381836d29a96 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -266,8 +266,23 @@ static const struct dmi_system_id fwbug_list[] = {
 		},
 		.driver_data = &quirk_no_extreme_bug,
 	},
+	{
+		.ident = "Legion Go 8ASP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
+	{
+		.ident = "Legion Go 8AHP2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
+		},
+		.driver_data = &quirk_no_extreme_bug,
+	},
 	{},
-
 };
 
 /**
-- 
2.51.2

