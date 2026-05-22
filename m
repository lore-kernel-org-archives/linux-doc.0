Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F73A7D6E
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438254; cv=none; b=n97xXzFaSl6cjuXMbCxyGPjqu6YnEzG+fLUpW51WZaVGP0ikl3xacF3gF4xG90yNOrUjjitFljgRh74+aXaYNEtB70wt1kU+m9cgZYh4YnRxgoHbPte9tGBA4+3/6SwogVty4UeE0gUT59CiHUOYIQ5KzpQFeB7dwUGEXv2XEbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438254; c=relaxed/simple;
	bh=hAFWwmeUdoIRPeHMu1R589WDqPZK2EVU2mJ5y87RrMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BjdqDref5NPJiQ0oNTB0fsaiNqqcOYeeXcYYRCMzEs4sm0Opc2NyFzjOMzBo7ts0Yu1wrFyBZK+Qk6cQLAagqM0TONjdQHqFxODW76cJfWvhxgFERfXXkmF+ZFb/WBlQoLSWjp0FeboFZ8Lxb3LZkzz4G3+WIrpy09xm/uSB2ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HPkbXxLq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HPkbXxLq"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so15705195e9.2
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 01:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438251; x=1780043051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkJvqH4tZQVXdYwb9TspsEPOaEailU+8tDMuNLsX0P4=;
        b=HPkbXxLq4LmOVT1sk7PX/ZTaIxNdi3yUj/AuSWO0lgJA62lNikVGRz8tqlnP1WFvxZ
         k0/ACAZWFxyIDYfjzaGPD3GjFS7bwTIfKyjZMpcLXLcr8sNFHiwU0+92SGw3Qr60AVVS
         v8gl2rxtTkOzs2lBe4tLQI5xdL/qSg2JW/vZPaPItH1woyzsEGj/UgE+KZzczQgWqhbO
         pdQTCnh/1mP79NN9PYsdc9jAVdDSGWpq4tTBwCrkRYRNcucUULAWlu1yj+RJ/KHuyrW/
         NQFxkf8+O7VMiisCTDcK+piTgVvwgaq0FrJBCHovN8dbZGxIf2yBxpsqyTGPbWJN068e
         0Omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438251; x=1780043051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkJvqH4tZQVXdYwb9TspsEPOaEailU+8tDMuNLsX0P4=;
        b=XpnTNKFlmkYtH/Dn8VenrbBNQXBu43jMn9vQ1G6un8WJ3qVKkwpVu5i5cZ+21XT56J
         1wANIr8bQTu1pDRG/sMH9hvQxyP6B5H6VHO7nhdNA0twooMxFbamyMihF7hxDiizcFbM
         s5pGQycZiUmX5US5KmOIMHtNEmISmabB4G93aT3SurlcZ9P2AWmkCLy+M8svu3A+b/D0
         5vS22OCpdbcnGDy5d+airK9u7dI70L3zXZ2rkLiMLv+i5sja4aVJmFxYghMrF0YhHVYQ
         XoVMQeu7FJbyKI01eFKkp1SsUz7HLIENrmcAhYKCC6LO1I0SNTARg2GkUubuZu9N76l1
         jwBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9uqNFTzRWr2UAAsXlYmhunCvjLLsUO8DW+5mNIXhStapS/Fn0Xbb5UfODb+PA6Hk7dr95Mgb36Bds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMdeMob322qb0F35qwFIYXF+DHuF/opm3+jMsBrtXpCKD0zSUI
	XLUvuhwvY+WBC1cN2EiCtlzeK5Ic3DOAVMoSb9q3G37IlzGRDyzXiHcFUSz4x3iO+Gg=
X-Gm-Gg: Acq92OFjYc/jpt3SH4fq1vVXYV53D1TWkG7//wnpoVn5E0+i47bXVLaE9KQjUPcf3cv
	mUse9L8f2P7cp0XePuvUjw9biyFL/ELJ5BQLwL0UrM5hoOV1H7gOPQnHqNhFD3EwkVBIYWZod5J
	pk53Twro4nnAy1czG/qP0pwRBs6shvcHu2yaxWz82j/bS5V396TuKP1QyTcQm5RiyKxjFwl+n8O
	PIM/blDU/tdFo3f6+rM9UN2AgzCrMRZMQ/LtHjrdWHk4c+46U/gxvMb9p05wlLBPFLxxv2RXDiF
	hG1D7RSaK3N2OCthaqumzZJOcUzj1z9rzcAwsB/5A0kZQJO7p2++nkVLYqK/jWBbYdju16KyH2C
	lycyKSIDD2DeABnuVJKK6jTY/RiSsA4sW9AP8yN5Aol6Y3YA9hyG3cPid46aD1uAKdB/fbNNcbr
	+caS8j9qM3wB5XsnN0PS6ri3cKc07Jsev4c0yXE7rouSAwZ8h+ATId7HcDx/dsl8WTUrlbUqU0+
	M+vmg8Jx9U=
X-Received: by 2002:a05:600c:5488:b0:490:47e0:e13f with SMTP id 5b1f17b1804b1-49047e0e21bmr9122025e9.3.1779438250911;
        Fri, 22 May 2026 01:24:10 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:10 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v4 1/4] hwmon: (pmbus) Add and export direct conversion calculation helpers
Date: Fri, 22 May 2026 11:23:36 +0300
Message-ID: <20260522082349.2749970-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TPS25990 and upcoming TPS1689 need common computation APIs but
the current implementation is static to TPS25990. As a preparation for
TPS1689 support, split the math-only parts of pmbus_reg2data_direct() and
pmbus_data2reg_direct() into separate helper functions:

- pmbus_reg2data_direct_calc()
- pmbus_data2reg_direct_calc()

export them so the upcoming TPS1689 can use the same APIs.

This has no behavioral change on TPS25990 while allowing TPS1689
to use the same.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  2 ++
 drivers/hwmon/pmbus/pmbus_core.c | 59 +++++++++++++++++++-------------
 2 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 23e3eda58870..dd4fe7d9821d 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -578,5 +578,7 @@ DEFINE_GUARD(pmbus_lock, struct i2c_client *, pmbus_lock(_T), pmbus_unlock(_T))
 int pmbus_update_fan(struct i2c_client *client, int page, int id,
 		     u8 config, u8 mask, u16 command);
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client);
+s64 pmbus_reg2data_direct_calc(s64 val, s64 b, s32 m, s32 R);
+u16 pmbus_data2reg_direct_calc(s64 val, s64 b, s32 m, s32 R);
 
 #endif /* PMBUS_H */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index e8fdd799c71c..2eaac337eeab 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -817,6 +817,22 @@ static s64 pmbus_reg2data_linear(struct pmbus_data *data,
 	return val;
 }
 
+s64 pmbus_reg2data_direct_calc(s64 val, s64 b, s32 m, s32 R)
+{
+	while (R > 0) {
+		val *= 10;
+		R--;
+	}
+	while (R < 0) {
+		val = div_s64(val + 5LL, 10L);  /* round closest */
+		R++;
+	}
+
+	val = div_s64(val - b, m);
+	return val;
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_reg2data_direct_calc, "PMBUS");
+
 /*
  * Convert direct sensor values to milli- or micro-units
  * depending on sensor type.
@@ -824,7 +840,7 @@ static s64 pmbus_reg2data_linear(struct pmbus_data *data,
 static s64 pmbus_reg2data_direct(struct pmbus_data *data,
 				 struct pmbus_sensor *sensor)
 {
-	s64 b, val = (s16)sensor->data;
+	s64 b;
 	s32 m, R;
 
 	m = data->info->m[sensor->class];
@@ -848,17 +864,7 @@ static s64 pmbus_reg2data_direct(struct pmbus_data *data,
 		b *= 1000;
 	}
 
-	while (R > 0) {
-		val *= 10;
-		R--;
-	}
-	while (R < 0) {
-		val = div_s64(val + 5LL, 10L);  /* round closest */
-		R++;
-	}
-
-	val = div_s64(val - b, m);
-	return val;
+	return pmbus_reg2data_direct_calc((s16)sensor->data, b, m, R);
 }
 
 /*
@@ -1057,6 +1063,23 @@ static u16 pmbus_data2reg_linear(struct pmbus_data *data,
 	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
 }
 
+u16 pmbus_data2reg_direct_calc(s64 val, s64 b, s32 m, s32 R)
+{
+	val = val * m + b;
+
+	while (R > 0) {
+		val *= 10;
+		R--;
+	}
+	while (R < 0) {
+		val = div_s64(val + 5LL, 10L);  /* round closest */
+		R++;
+	}
+
+	return (u16)clamp_val(val, S16_MIN, S16_MAX);
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_data2reg_direct_calc, "PMBUS");
+
 static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 				 struct pmbus_sensor *sensor, s64 val)
 {
@@ -1078,18 +1101,8 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
 		R -= 3;		/* Adjust R and b for data in milli-units */
 		b *= 1000;
 	}
-	val = val * m + b;
 
-	while (R > 0) {
-		val *= 10;
-		R--;
-	}
-	while (R < 0) {
-		val = div_s64(val + 5LL, 10L);  /* round closest */
-		R++;
-	}
-
-	return (u16)clamp_val(val, S16_MIN, S16_MAX);
+	return pmbus_data2reg_direct_calc(val, b, m, R);
 }
 
 static u16 pmbus_data2reg_vid(struct pmbus_data *data,
-- 
2.43.0

