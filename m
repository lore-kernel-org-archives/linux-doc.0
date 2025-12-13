Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6313093A8
	for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656371; cv=none; b=QAVLPm86U20lw8DpBBjsjceUJenmOnLOBlw90441CkGvX2giMZTjPCzmy4T45DyKhlsqR9tyKswpWr0DK8H1CT+9cCM6GHlJdWsaD6uLFnAAu6x7UTjLrMwtAxaVuYI0AFSDVMSKIhnSHiOF+UPRjRsHu+D+ecyYpy2/UNIGCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656371; c=relaxed/simple;
	bh=vHDffevPJvWn0TDEIr3DY9YUUhJW/hc5O51BO7cTGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=koQkSBsuP31DKG2/zClLtF5g87fYEViEIqgWyaoOy8UiXUlGbWKm+cC5abDq/NalhDz8Fqtxm0nr6ijJj9UabCDdy1w1YJsRTt8E2XYUJKXK3KC4pdVHCX9Ss6rHGA6akoLMjGWJJWdPQY2hRVEhugdNC1xYltaYd4PeQdcUc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdoMBnWB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdoMBnWB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-640e9f5951aso3405085a12.1
        for <linux-doc@vger.kernel.org>; Sat, 13 Dec 2025 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656368; x=1766261168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=OdoMBnWBXJUvgCt6FjFPSA/wI3XyYJr7VkA1XgisTNI/Z099SjhgpmX7ZbcSO6WQdK
         oBeNEnTLGBFqpzYaaGMJsnsLqL+m7G0lI95jbm2WrDS7Eh3jEj+/7axAGi002rigipQ4
         JlfS2ld4en8S8ZBmg/h9tXjSeZQrIpvwXRuM6RNpK1amicTUYPg8gbvxCFSkaJ/nouZt
         z6yBdC6jG03fukuvJBgLH4VcKW2BVBUVL5JWspFmJE5oNH2nU9XsIamZ3kjtI/qwUZms
         X4x6NXuYa3+O0TVJWn1Jh1inZBOMKYT2udZW2577AL7KPLl6nTIvz3I5iWcQWEUVXFlX
         Xrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656368; x=1766261168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=ZCY+Wqkb0TVO6mhhiwPgATnUfhbzN2K3wgHDTwkD/snss+WYLh/+DIfuGfb4+lWROm
         A9UyOsCKESjCeNKUP6O0D0ZeSkPeUviCplDCULWd6HAdCxDqaDjn8TUNvM+rq7RByJ/7
         yuidCE2MrGyzqXo/GG3EQCoWTZ5GFYe1nGtK8hDJxGWA8GSr0tiMmYEyZHWrqEhb5mws
         H0+mm5o0X61ErhnK9GntN+Y6A3IP2zbIuMlE9tzFJ0pUnLvmB7RtkkW4MnOqjB59ukMd
         3u+akFRfYGk9Wi7SF5i9II0gJUPHEgMM4ffvtdXd+Xq4Rdf57soq2bSKZ+xAwEqdDtK2
         OkDg==
X-Forwarded-Encrypted: i=1; AJvYcCXH4bR7a2w5IButLLiApaRpjaJKk+D3Qt3vLLqRn0K/6y8ysBhwm0KRepql9g64gSnCGBXByNmyoLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTf1XI1L15NaxzguahcVnDxY1zhY87fwnmqgJy0WYVAac7FbXB
	59dULb65uk9GpQybVf1jKcPGsZt26PpjlO8uvxkXcxMCP0AhEX4rM5vcRcmqj2RoBNg8pA==
X-Gm-Gg: AY/fxX4NvBAKsjxyA1xPlTg4tbtNHs4TkqvzDwUWn/X4WC/iF9ECFnfsed3bRWIIKm2
	CKoNLjunB5k/TMdLuBkWs5TWOKUADciMwAjDMYLAedvNc+CE77gwwFSI9umioqpb6hSlqN1umGR
	mTD653+Vp00y+mX1963F4r5gGv3U+pyp5FPONutID0UTEE9WMO+t9yDtL0vvf6ijxZk+Ri5c2Fz
	hi5zdirK1S4ywtitJqWOuiR3T6q0nUzNkocFF62vlf1FWgXKjZDlVCpi060dzSd53oxlmJIWrAh
	8wz5HUCtvx00RbuaI5jUfnIdyKPmTN7XhO2qnC6ZpFKSN1VuArz9+GODkeCPKrldHkAUqiW/Oyy
	4iH4jjMiaG8Kn9UJ3gwGiUb0o88Jy46HhgV21zpBfizqfVEYP2gKG8nhaVtZ5mh1FBWQVOpxHj6
	n3mnQK1kaz44dCCm8iorwf1O/uBccd4w==
X-Google-Smtp-Source: AGHT+IGkFR8KVg+zdxuuss0BF3hYrZ4HGGY7kbjmNzxD5Mlxslc8PoRc11H9ebO7TNQ9Ky1SaUI8cA==
X-Received: by 2002:a17:907:3fa5:b0:b79:ff60:8205 with SMTP id a640c23a62f3a-b7d217ed002mr729990466b.19.1765656367620;
        Sat, 13 Dec 2025 12:06:07 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:07 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Date: Sat, 13 Dec 2025 21:03:43 +0100
Message-ID: <20251213200531.259435-4-eugene.shalygin@gmail.com>
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

From: Robert McIntyre <rjmcinty@hotmail.com>

Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
sensors-wise to Pro WS TRX50-SAGE WIFI

Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index fb32acfec0f5..58986546c723 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
  * Pro WS TRX50-SAGE WIFI
+ * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
  * Pro WS WRX90E-SAGE SE
  * ProArt X570-CREATOR WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ef4561ae38f9..8435be30c3f7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -801,6 +801,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x870E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
+					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS WRX90E-SAGE SE",
 					&board_info_pro_ws_wrx90e_sage_se),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
-- 
2.52.0

