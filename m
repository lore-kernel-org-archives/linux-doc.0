Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A5306B15
	for <linux-doc@vger.kernel.org>; Thu,  6 Nov 2025 21:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464090; cv=none; b=PitIBrwyFiyK5aie/PlGPz/x4XASKMoEOWf7Je6ONuusuou/0ApccGTJeg1iyiiQV5sym7Dp6xCStWECIPJ6U4PGCWH53wVnZv9uPqNOc6J5HfqpoVRjUc7sae6CHRNhxO4Mig+g4DRx2CvWWRsnico34E6hUPKOs3aA0tkn2NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464090; c=relaxed/simple;
	bh=gQDolCcuD5vIgWYrJOYDk+Yjb2OnvDvhndDe6j5Tii0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4scbbikWZQZzV7NpKPQMdd0zvU1W2cKgWf18GK2lb/e1VoMrkeUSAvuAD2DyrBY5nPxtyt0BJkwEcJxGxTVYBmWdsEPGsxnUS0kKUbmCwvff7jMljFmSxRPu8afvcqWXrhHLGJE/fULsDlSxQkyUtfNPva0d1jL618aq1m3itM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBQIWIhH; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBQIWIhH"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aea19fd91cso152593b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 13:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464088; x=1763068888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IL4It3kAEsZc/+9OA5N/VLO1Ag46m6s63x6+w+Fz15Q=;
        b=fBQIWIhHOZntTRKDfIRCxhUlhUY2OkzdtfDXOLxkT/ImlD28sMMC0M27BP5A1MCQQo
         3QlLzufwdZQd1AKVUaY9GyIq5x8zDvaGa38BHLFGHrB6c11j69fvAnuK3Bv6CfGavb5X
         tex2e3OlFdmdOC9vfvBISATt8j0qkHHgtiwOVhfQfwmHcBZIsn9G70wnWnprRzer0H1o
         D9xhpFNX1oFq99k9G9bkPNgQhykc6yHYCt02O78jOyJ/ZvVHBFb6UIbzvHbWDfiATFxx
         EpMRJAWShLfPw4zGk+R6B2qGU7lfR7mA4rZJfv1OdCsNQXA2wi1NvgsVWnXGtzu3QEb6
         zfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464088; x=1763068888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IL4It3kAEsZc/+9OA5N/VLO1Ag46m6s63x6+w+Fz15Q=;
        b=E39d032IIQ4aitSN8yZBNhxjTOVhwEqTHz81LNOcnVvyEW5RrHMmtZHYfMBuKHuzSS
         03HRyl+gL0TiGQrrSu+TFZpzi5rXjhaFwMpD7SJCMJmHfmfL8cSzpWmx9/igUC3mXNUA
         nJD9E9WNJBpi4bDthzkuwpyItv4igRsC+JWXGilJTaOHAKwXeaaIpyB0D6AycR2R4LXb
         O+YHFNZ7f82pO4vGDqaMbKQ6FmPZs7OMTSJLX2zG6Xp7I4gxn5eSTaNh6lAObw+8RX+r
         JYNJgqFRvhEdZUtY1feXUoIRvxoUbYxMd+zPpQPnBsDL3wTTg755D/9+vd7NnEIwu7Lv
         Nsjg==
X-Forwarded-Encrypted: i=1; AJvYcCWkyegMTWaSlJkSNL3sw7/QrKysq6WrerO1VIUyIVu3sFKdTzgbk8z6oQWkpDwwVwlE2jzYOVGLgyo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj7XrL8XGDMVDakYcmsD5YM2shjTbyrY6qmVJaii1xgU+eym4n
	XMovO6ufyqxCeTzkhbrrV96EKEs+s1LpDjYzuaAtfJPucWcZjY6nr2Q6
X-Gm-Gg: ASbGnct2PVYB6puBL/K7P9u8VDf2B3VZZMWoDMnhHdYqt7JOXAhzAYAaSBsRBdawPDt
	7XGRYGsm5vpy4uWG0iAIdSSj4rjQmt+MRMNEEujvKgoDfBkAGANhFl8hBw89+0aNtD8jJ4mqc98
	Wg0bcCQ4cpn68TqvMBvjAbOXnjS1KsTN9YkVSPDdW6WnSylagJKKqXp0Wy+pZ92Qz+fZYVvNVuK
	z84P9QE8gnAE5a8gMpL09nh3/Ii4m7zx/4pIGtJCedaM00/JBflu3E1/hc+8eDQDzCf/faOcu4z
	ZFv5zIBGSS+PUVEHgPKiKTzTZkRna8WRiwgss05Rev/ZnJAHQbwOHYeIZBmj0LRrIUxK5WIkGbc
	BSgnWScX+inyrC8tTy942PBaz7Y+02VkmI5z+hoFr6Yry699X0AjYAxc0gjzneTuVp8gKXKrimS
	BFuNMnKwYwundI8T1CknTJsM6R78veiHup1UhvO3LBjDLadEDl+GzvgN8VKNo9nQN/P6Y=
X-Google-Smtp-Source: AGHT+IGnZ3ioVBRnnG8un6BDnXO8Duun1EVSqTxxH6SbHC2rrOCyZqeAC5RipHrEQAaoZitkIkBHEw==
X-Received: by 2002:a05:6a00:17a9:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7b0bdd76f66mr1178498b3a.30.1762464088459;
        Thu, 06 Nov 2025 13:21:28 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm521360b3a.12.2025.11.06.13.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:21:28 -0800 (PST)
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
Subject: [PATCH v2 3/3] platform/x86: wmi-gamezone: Add Legion Go 2 Quirks
Date: Thu,  6 Nov 2025 13:21:21 -0800
Message-ID: <20251106212121.447030-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106212121.447030-1-derekjohn.clark@gmail.com>
References: <20251106212121.447030-1-derekjohn.clark@gmail.com>
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
index faabbd4657bd..bea4d2024628 100644
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
2.51.1

