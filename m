Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A802E282B
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656370; cv=none; b=IS2o1Hm5bjwmnDk+f28vuJasw3NXq1IrPx5Dy43OhJR9aGxdFKC7TF6Zqrc0vIObl+kAT2sFtE3Gi+QmcTQcma+s/F2lN45xpEOJ9fKyr2MzrcEn1H7J0UjlRhhvFhZAjPUm8rxgLTg4iLy5nja83nv26eHvd91P6USdWGjnbzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656370; c=relaxed/simple;
	bh=FpUwGkzvz3rrTNZPPOiP02YajkG0j8BUEzXxp/iOwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDTwvsRxQE8MIqLAyui8wEUrYlsNZ+6UCeU2YoV0zBNx8mRgt9MhELWoD9ZUUr0YIfs1TY3eqH/4nQzDMg+d/v/Eif1QMzWSE3C9wqVQWXUt4a6Sd3fgobDzZ9Vm8hrU4Bg6SR3OpTnjMFL88MYpH3yJotpmjLebLe/p4IUpDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfqJC+nM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfqJC+nM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so3035082a12.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 12:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656367; x=1766261167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s5dkq1vk1AHcVUHSxDmLyBvnvr/yMNsJ6hcXpFniJA=;
        b=bfqJC+nM14Lp3OT3Zv9veLfF9dQS9J4c03R0CG1j4fCF/UmrcrXpkPvU/YLaOj1esR
         d5qEu94sJVlK0ER/6I2YSYSbO1OT9E+HXmXzII4okQ3BooBU0s3GEtw1ZNsMneiOUHLP
         HAIcaUK3MRlUqedPaH049ReS3L5hNhZ10KwbR3KQOifiluh3CRtKPRVj6qbYT5osj+KP
         6zp/9pz9F9nxS76LTZwY+IemJdhT0pQ4rLz70a0UD97B12lsF+pO8w9MvAfjtUkpSWpP
         Hnz7YAMbdevQ701o0K9x6IJ3PBIMC1sviwWaUTqmhdjPM9bjqJKwk4XkIcdZWSHmfEqz
         lHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656367; x=1766261167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5s5dkq1vk1AHcVUHSxDmLyBvnvr/yMNsJ6hcXpFniJA=;
        b=U22HY07BDKQr9A+FgSYinXkuKwSmw5e+YkrWPextoQc/jMfOu4pa/FRVSoRTseoLnK
         9qOcsz+tuVB7OB7EjsIGAIaJkZwvOElDinjrdxyfyrV9urciJhujCs7ZBgnkqaV4k4gp
         75iWMkg5GFshRs5SEOMcktSw8ZSpnJuwQbhoR0KEhXqaFdjTLin/5Us3RqCed9yQBnAP
         uyv5I7Htk6wAYm1FHsyQJwq4p2Ba0yocYFTR+KQRXHV816swFM7Y4DhAaHnT15w17BI5
         SqwqK58YCL+iTsKiUyTN9zWLBdioz84lZFjfQZq2EasjVoOBskJQTTs5R+tHwcsxeN2+
         zWtw==
X-Forwarded-Encrypted: i=1; AJvYcCVor6UJHBMRBnH7SLNkBMagg/Woa/zI2cQ5ae0i2KGiUlhIEPtDHqLrLzrNzKfpvHZbN6AT+eV39ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJt7qdOyVXiwgJq/Vg+hnWaVMx43UrFRA43HSTmFD55802qO8Z
	ZAGEVP5ct0hwi9zOGSxq7R6z4ELbch9UhvsKxdAM0nfkqLHz7HXdmpPl
X-Gm-Gg: AY/fxX5p9tJjfaCwgEovgJmENrWvjyUnnKATcsD13zIpK5+4700q/S9xwP7+GskjGcc
	QlIV4hiDCtWKGZPbriHdnQ5izFHLqoJwj/IKuAJf/EahLwb1CabeQim4FuFnTlWz6KRgtNLMISl
	l2yTN8fhhAi0+B8+SF5PDQCEVj7JXMzXiFgByy2ID5HZBAmmRgzDMnSzWebARgQB/cB1ADVaaeI
	/J/SohpXRPc+sUysmw+hZNBN4yD/ZQB/KwDapzOt2SWxUDQNwuuhSZvbuCf21bYysWBwZ26+3bD
	kFcHlWsvZAkFKBApDoaIGonsSOgVjRMgSo9lRsjl6hCx+n0yH9c0CNeBp/LQyGp3bCp/L/g5M75
	Du9dlcSTs4YDeL87Soi+LBqmzN/u80ekrU+R6XCJU8QYbTiW2QhrFUBEcTqXUV/qDofnR4Tv8+P
	iTk4vNP0e5aurhr8WosP7p8saOjBReD24E62GvLGLX
X-Google-Smtp-Source: AGHT+IFEf4AeZqk/y2Uc4hdBQ9EAJ/emBupffcRfGxaUuJK9YxYrmpAdf40oE4IoN3O0wAzUQW3vrw==
X-Received: by 2002:a17:907:940d:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b7d236610ecmr640225866b.20.1765656366622;
        Sat, 13 Dec 2025 12:06:06 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:06 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Reis Holmes <reisholmes@pm.me>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO
Date: Sat, 13 Dec 2025 21:03:42 +0100
Message-ID: <20251213200531.259435-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213200531.259435-1-eugene.shalygin@gmail.com>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reis Holmes <reisholmes@pm.me>

Add support for ROG MAXIMUS X HERO. The support is incomplete because
the second EC, which provides part of the data, is inaccessible via the
kernel ec module.

Signed-off-by: Reis Holmes <reisholmes@pm.me>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 232885f24430..fb32acfec0f5 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -23,6 +23,7 @@ Supported boards:
  * ROG CROSSHAIR VIII IMPACT
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 61b18b88ee8f..ef4561ae38f9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -474,6 +474,14 @@ static const struct ec_board_info board_info_maximus_vi_hero = {
 	.family = family_intel_300_series,
 };
 
+static const struct ec_board_info board_info_maximus_x_hero = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_LPCB_SIO1_MUT0,
+	.family = family_intel_300_series,
+};
+
 static const struct ec_board_info board_info_maximus_xi_hero = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -815,6 +823,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
 					&board_info_maximus_xi_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS X HERO",
+					&board_info_maximus_x_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
 					&board_info_maximus_z690_formula),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
-- 
2.52.0

