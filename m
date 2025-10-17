Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609B32A3D4
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760698708; cv=none; b=QZdTrv9xhNO7ak7i9P0xRFs7Sey/Wev+CJySFWf3Gg/dEOVJ+3/3PGG5icjzu9zJTPWfiUHSfDlKk2OzziBniqFfVu3dqtF+Jug5Mj0sJM0KBnVo0BfzJ4zMhgBsPABZunf7nJ97ijHMl5vE5lTCYpSjRieohQHxIx/QOb8V3Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760698708; c=relaxed/simple;
	bh=awOXJ76qW+uqReitMYlhmpnBHHfBduEeSXRYaw9nhUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHOqIp5Wo5ANfbS6LRJJl/T0eJ9/bLdJ8qz/xZQraeQS1evuY+fvAfhJBHce4IwJ4hvzsaV+sIJLF9Xz3sT74VmRTpD60XSuL8NXevmlMfEohaMreu8WyGdgNbLbDC9X1Zd/KOpCUIlB6qh+iYagwHL6k7n1CQ6V9Q6MIRPK4Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfBRKWSg; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfBRKWSg"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1763998b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 03:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760698706; x=1761303506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKyThkLJsQQYLBoBp/ki0YsrfR20uz6FjDBOGTP9Uj0=;
        b=IfBRKWSgK1qID1uwiJksqs09EXX7uc74vkEsDElK8umlv74iUanQJW4TnJ4c9wSh+8
         yN1nw2Xk7J8jEeC+sgjcm41txUTtknAXpsDl2jnpujIJepSfirKtl6Q18Ui8YydN5V+u
         lGY/TjxSqmHKpjyAHxzVJKsaHJH6r3xzddJ2JUNCum63TdB4MnaUPZBjs+x8CYOvoUI3
         IqTtnzcqWVoqMvhD/alcKg99BJ6qVJt+JMatjMMos+toPHYsJ4ug7EyVUlMaPqP8PXPk
         w+ltCIC/WjRnehkmrkF56Rv7YN64kbEj2B6FudkrVcHve1s8t0h24sVBNOktQ/DD7vfl
         fCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760698706; x=1761303506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YKyThkLJsQQYLBoBp/ki0YsrfR20uz6FjDBOGTP9Uj0=;
        b=KvU/ePDMOBA4IUzpJnAJA8ZtTGXLzEzKYhqCCdyf2Z8aAduA3vZsb5nBUCzakRxJJj
         orNL6I5rSiNNkH2lMnrOZOylrxXz5cquf1LZ6ghAtTy3CCDWawYBO1wVJu7Jhdvdogws
         RXQl2tSjgveDnRXn+nQ4uApFUmlNOMNJCORxeitK3NlEz1hmnKB7uGvCdlEORUa4kzJi
         XXDP1XQxPHUlNZes8S0BPGFLcKXvVql1BltzVl8zOCDtaEpvaqBx+sZEFgUrkc97g0tM
         VIE0ssKaBpR3lDRhxXFef8lFqG/lq/6UI0HChFZu4d9Ou72E7Uh0W+9Q/F3JKoM4XNR7
         P14w==
X-Forwarded-Encrypted: i=1; AJvYcCWvL3sd84VwJZV9/qLd5YVgXhZMA/Suxrbcsd+7gmIJpJyrG0bE1fsgwM3fMK9p+VGQO1g3cI1N9CE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxjwv96ZLyDFZvE4TWNER0BCFKdy1UBk0ICgfekFrcIUVRE7Ug
	Iu1O98kN5LBD8lNsom67Ii/q144CKKuiWqo8r5ZLN6iGHBWvA+s9LBTg
X-Gm-Gg: ASbGncuOLFpkzSkzPgGPGtkkTzkOUNOCVuotx9ZRtXNRgpWIzSL8FsQQxTnL8q26nZX
	4K/jRXPF6IBfiRHES6pZsLyq60GCt2ytyT3adZxpRrgfkgmmR+fgByEmOtmgXi6VdsVrjTbAtRe
	DHBGvYQWEOQjSdl+5kLnvgbwOFivCkW86RqkSNb5h/1cymq2XucBN/Zujmu6AElK3YDz2OqzyHr
	CE6fLsEkuo/tbXj+OTxN/rdqE8pRQb7oSjvsLNBuCb16bqj2OrEHBFriGhyM8rDH/ug2yOXzjGk
	zTcMVEI8Z529X5ACY2JcBIGjQO+8TR0ArlLg1OquX2nonCli3pl/gkpES5ZnnI8W7pcgnL2UF4o
	BBO4Lb5wvmo8IAZO8pda//6+S4EA4CQbm/7Zxzo9zKml/kq+5Gbyin/p+S1mO/Uk7C42g672H0z
	78RDnwog==
X-Google-Smtp-Source: AGHT+IFVmlgfFGKJInD7guXV1jAhWwcObJ5HGSNw+n60AINx8nIvhIaYT0D8qgDuf7T/ppajshtYQw==
X-Received: by 2002:a05:6a20:12c5:b0:334:96ed:7a7b with SMTP id adf61e73a8af0-334a85fda77mr4338002637.38.1760698705934;
        Fri, 17 Oct 2025 03:58:25 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b639cc8sm25407571b3a.20.2025.10.17.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 03:58:25 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH 2/3] docs/hwmon: Add missing datasheet links for Maxim chips
Date: Fri, 17 Oct 2025 16:27:17 +0530
Message-ID: <20251017105740.17646-3-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017105740.17646-1-spyjetfayed@gmail.com>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In 2021, Maxim Integrated was acquired by Analog Devices.
maxim-ic.com & maximintegrated.com links redirect to analog.com.

Missing datasheets now available at Analog Devices added.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 Documentation/hwmon/ds1621.rst   | 20 +++++++++++++++-----
 Documentation/hwmon/lm75.rst     | 13 ++++++++-----
 Documentation/hwmon/max15301.rst |  8 ++++++--
 Documentation/hwmon/max31827.rst |  5 +++++
 Documentation/hwmon/max77705.rst |  4 +++-
 Documentation/hwmon/pmbus.rst    |  4 ++--
 6 files changed, 39 insertions(+), 15 deletions(-)

diff --git a/Documentation/hwmon/ds1621.rst b/Documentation/hwmon/ds1621.rst
index 552b37e9dd34..415d4c3043a7 100644
--- a/Documentation/hwmon/ds1621.rst
+++ b/Documentation/hwmon/ds1621.rst
@@ -9,7 +9,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1621.pdf
 
   * Dallas Semiconductor DS1625
 
@@ -17,7 +19,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.datasheetarchive.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1620.pdf
 
   * Maxim Integrated DS1631
 
@@ -25,7 +29,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1631-DS1731.pdf
 
   * Maxim Integrated DS1721
 
@@ -33,7 +39,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1721.pdf
 
   * Maxim Integrated DS1731
 
@@ -41,7 +49,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available from www.maximintegrated.com
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1631-DS1731.pdf
 
 Authors:
       - Christian W. Zuckschwerdt <zany@triq.net>
diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 908b3a9df06e..2dbcf0c204b0 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -23,15 +23,17 @@ Supported chips:
 
 	       http://www.national.com/
 
-  * Dallas Semiconductor (now Maxim) DS75, DS1775, DS7505
+  * Dallas Semiconductor (now Analog Devices) DS75, DS1775, DS7505
 
     Prefixes: 'ds75', 'ds1775', 'ds7505'
 
     Addresses scanned: none
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog Devices website
 
-	       https://www.maximintegrated.com/
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS75.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1775.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/DS1775.pdf
 
   * Maxim MAX6625, MAX6626, MAX31725, MAX31726
 
@@ -39,9 +41,10 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Publicly available at the Maxim website
+    Datasheet: Publicly available at the Analog website
 
-	       http://www.maxim-ic.com/
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX6625-MAX6626.pdf
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31725-MAX31726.pdf
 
   * Microchip (TelCom) TCN75
 
diff --git a/Documentation/hwmon/max15301.rst b/Documentation/hwmon/max15301.rst
index e2222e98304f..94d6491400b7 100644
--- a/Documentation/hwmon/max15301.rst
+++ b/Documentation/hwmon/max15301.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX15301.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max15301.pdf
 
   * Maxim MAX15303
 
@@ -19,7 +21,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/max15303.pdf
+    Datasheet: Publicly available at the Analog Devices website
+
+	       https://www.analog.com/media/en/technical-documentation/data-sheets/max15303.pdf
 
 Author: Erik Rosen <erik.rosen@metormote.com>
 
diff --git a/Documentation/hwmon/max31827.rst b/Documentation/hwmon/max31827.rst
index 6cc5088b26b7..f40daa4bdcf9 100644
--- a/Documentation/hwmon/max31827.rst
+++ b/Documentation/hwmon/max31827.rst
@@ -13,6 +13,8 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
+
   * Maxim MAX31828
 
     Prefix: 'max31828'
@@ -21,6 +23,8 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
+
   * Maxim MAX31829
 
     Prefix: 'max31829'
@@ -29,6 +33,7 @@ Supported chips:
 
     Datasheet: Publicly available at the Analog Devices website
 
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/MAX31827-MAX31829.pdf
 
 Authors:
 	- Daniel Matyas <daniel.matyas@analog.com>
diff --git a/Documentation/hwmon/max77705.rst b/Documentation/hwmon/max77705.rst
index 4a7680a340e1..0491dab1ec8e 100644
--- a/Documentation/hwmon/max77705.rst
+++ b/Documentation/hwmon/max77705.rst
@@ -11,7 +11,9 @@ Supported chips:
 
     Addresses scanned: none
 
-    Datasheet: Not available
+    Datasheet: Publicly available at the Analog Devices website
+
+	    https://www.analog.com/media/en/technical-documentation/data-sheets/max77505.pdf
 
 Authors:
       - Dzmitry Sankouski <dsankouski@gmail.com>
diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index d477124cf67f..dcfb69fc4db3 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -72,9 +72,9 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet:
+    Datasheet: Publicly available at the Analog Devices website
 
-	Not published
+	https://www.analog.com/media/en/technical-documentation/data-sheets/MAX20796.pdf
 
   * Generic PMBus devices
 
-- 
2.51.0

