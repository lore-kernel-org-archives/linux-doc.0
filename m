Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186836A372
	for <linux-doc@vger.kernel.org>; Sun, 26 Jul 2026 06:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785049127; cv=none; b=T0+Q0D7pSijY8jawv8QvbqVY/gemuNv66kSVt7iAbs6haFelfe+IpIN3Y+YAPVpT0a9pDGozGivuxq8EbNt3Hp5tn6B0DF2dcXWHs0lQULYOqeWMyNZjyxkhWtJlZQh7j/ATRWlEVa/63iD7auhTj8Tv67kYc3BYU8yus4H8Lcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785049127; c=relaxed/simple;
	bh=iWUJEIQp15Vv+mHQ2FLlbzu13SJ3z5D3SLnInr8haoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TJozp9QqM/3aMl3DP+ByKX/cPb8QaGWQqCALYtibaKBJeD3VTUYBvKJ6V9b6943DAt97gGQ+uOgCfgg0mgfCvPaLnY9lBwtpbbM8CnUmWQxKhUPYNl8svA7oFaPYvPrLsFe2mf61ohikjtE0IvbWj07A6M9ON0D37rj97UoNNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeggcgyW; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeggcgyW"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf52d15d88so16055335ad.2
        for <linux-doc@vger.kernel.org>; Sat, 25 Jul 2026 23:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785049126; x=1785653926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kb8i2R2pDMPs/7f5uag+f02VBSsq6VTvV2JKsBdYskg=;
        b=PeggcgyWC7pITh0S3fZZ1eYrvAF0tRp53I0/XuppDW4O7nD+Jb0PeLBd8lTIZGW4rO
         SbZocmuHGBEi+wDmMFC3jvjz6lXqsBfuJtdBJZeg8LGXTv1+fvih1Nv6890hf3jwH/ZZ
         likhZkG055ExICO3bSlIvhvVHGF7eLznxNZGmVx6XUsHk36XpyyaBIPC3wXnjcFzGwIl
         sOeOzvY1hwgy1SzYQtXQ03Wu1BjzzJFu6YnM+C+8ZX7BLSprfmp49R0DDz3ZpH8azloY
         H0i3GLmME2dMaILgyaXPyauhUqWPw4qOASBKnElM17LYVJk3xakPa5Cns60KHB+K9QUr
         eqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785049126; x=1785653926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kb8i2R2pDMPs/7f5uag+f02VBSsq6VTvV2JKsBdYskg=;
        b=HMAtmxuyNdpu0C0JmIE8dgk7EFV7h0rAK4OdXtNZ2xgfLS9HrzQkwoHo+cecu3P1c7
         sWyNlP3TKbv9oMiYtNx0Ghwgw36yTKD8PrSvpmASR1AnMEPMm+qxRfA5szRW26X6Q+tj
         kWrM9MVhSCCl7jhunQfVkJ3z/QxaGUGr0CM8cEWcqAAAZ8a8Oi6xWOCBjZk1XQ9MHDsa
         HkA0bk5TUCGhT/AL7O0KWYqbWMObRtxGb126Bbb5qvLuDL/miOzuhix7Zm9JJ4jT6LcP
         X1kXnLtvbqfQy4RZiQOD957J+kvgD22HZzcs+9RVPJYnGNAwIE58VZfKGtZKU8zcVCXB
         XC6A==
X-Forwarded-Encrypted: i=1; AHgh+RqbrKikZwRhLzqo7dUhRfMBwnawAkLyel00VH6jC+zuqGD8HhfsLP6qgzIJ9cQ2I0F54cD60CP6kDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4aDOZTeIf5I7oMqWVgazycEQeTk2k830GoSDBBMQJo2626up
	vsH/ChrXu4qUcDYcMPwjHcGLTlV3eejb2Snxpqf8nHvtnJ58sqYwbt8H
X-Gm-Gg: AR+sD10igAPsAWmnWX//VUAUWgjLNVHs06SRZHH5GpYLUuOt4EMfigwB783CBjoUy8J
	Toe5+CLPKadH9cuFZRnvbtv+dhouE8bC1HpHWATFZ9/5MKAkuGFaWrTj2KdbXtKw6J7terqL5vH
	5Uxd9lTYegRQa+5HXpApZVo4zXisU+URx1QKRWbQb3G6xmMUzcF6dwn9e5Yrogx4eC0QxwL+O6H
	jVzRY/54/QiNXm9ZEYaxw7px1/mQBOHwupzrzbqfioKJ+i9XAVS06wRPThAtS6kulNxfx2jybxB
	BRMQEsuAEN1y+rMkqDFVy+t0GNX+uKv+b9mD2zx6AuRjPdZUbTd3kruvYqylnRCWugjAmxsBD8o
	bp/uhW/Th6LzAsLSWWhwAFT7r+g5NBDdJpDXSwM5qNoiobRNSDgdHa1Dft1pcbqSO9Kev4gh31M
	VipSKfPoFdllF7eVk3H9FTxKN0GUdEayk=
X-Received: by 2002:a17:903:18b:b0:2ca:ed57:8586 with SMTP id d9443c01a7336-2cfde83034fmr41352235ad.23.1785049125808;
        Sat, 25 Jul 2026 23:58:45 -0700 (PDT)
Received: from acer-nitro-anv15-41.entro.com ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde5e28easm17153545ad.24.2026.07.25.23.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 23:58:45 -0700 (PDT)
From: "shaikh.kamal" <shaikhkamal2012@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: hwmon: fix spelling error
Date: Sun, 26 Jul 2026 12:28:35 +0530
Message-ID: <20260726065835.21012-1-shaikhkamal2012@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling error reported by codespell:

  supprts -> supports (sg2042-mcu.rst)

No functional change.

Signed-off-by: shaikh.kamal <shaikhkamal2012@gmail.com>
---
 Documentation/hwmon/sg2042-mcu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sg2042-mcu.rst b/Documentation/hwmon/sg2042-mcu.rst
index 077e79841d2e..431ed832d083 100644
--- a/Documentation/hwmon/sg2042-mcu.rst
+++ b/Documentation/hwmon/sg2042-mcu.rst
@@ -18,7 +18,7 @@ Authors:
 Description
 -----------
 
-This driver supprts hardware monitoring for onboard MCU with
+This driver supports hardware monitoring for onboard MCU with
 i2c interface.
 
 Usage Notes
-- 
2.43.0

