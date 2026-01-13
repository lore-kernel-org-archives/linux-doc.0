Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463E334AAF4
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 16:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768322860; cv=none; b=FPVee5aVMgmwcRzuZ/ho5Fdh19r6hftHuOzAoT6ggIHeRK3I/4Zm6xSMD8Re5tOVC5unSDCfqjE8uPlTZjgO/C/Cn01QhBl7JZXkB9G/Uzw9NXYI2MQzcMIr/iigZsT/bD2cb8/2E17gAUMTssxR3Y2G9dEaRJWkvEEEwAXJZFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768322860; c=relaxed/simple;
	bh=mqkaoCppK2I6NFb+rJhwtgYbq0hw+BeHahi+xT7viQo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ogvcdCeLopi7mlCSxzlRupG002zxEF/JEhuz8XO5dooOQKtU2rAdgVclnwKAyRK6/Zckioou3+49a/qhStdLA02XxY97dW9AxLzYJR2jP+usl8Gf1Ed+jHj1TexymMBz7jAi+qvKkS6d2xRWAWsH2RduLe4q/2lprM4hFtnV+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMrVQdl7; arc=none smtp.client-ip=209.85.128.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMrVQdl7"
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-79273a294edso31413727b3.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 08:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768322857; x=1768927657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEU81biYFIkMzvmWoggpivknxTcirFD7/O8ZG0emUV4=;
        b=JMrVQdl7Uvti9TxbyC+l8Bz0/Xjq+fCvrbsHF/msVsijH7WX7gKfjK2cWOWqZdyow3
         f2pIuoxgBwaLlM4BCvguylIVu7ScT9LPTkKMxqCqhV+JYVbx0AyYVNRYn3sviPgVK1cU
         oadp23Z7lR2F52r0JO4wykidjHLdOqqKEZXK88IL0Ayx0mu04zL64KOmmh9QSsxks8kt
         2z8lb/6UQCYhPo/47ktgz2XCNSXjxlkvmJk8BknmHhTQ7K9rIIZDmQWourtZGo9NX9/L
         2rernwJWLC0d2KvoGEdb2DiGFUF3E/Ha2lCWaPjeEPA9zMcw/3HVdA0N09Q6DiNfM2e3
         JIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768322857; x=1768927657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEU81biYFIkMzvmWoggpivknxTcirFD7/O8ZG0emUV4=;
        b=Iz5Em0oiC+1CeImhq+uk4ZyVvLrCchSSj+RpSnoilgCiRRpsS0bPDD+jkxJiorHuud
         4Q+6uLxbAvRrEyLjMYo7mXyP/keSIwHZYdzshXRTTau22p27jmhAs3A5o6dkPDYt2bmH
         0j0+yzviQKRhttwRSQy7avCu8R7/AJVJFKyFPhkOeo7QEPJ0gGZ5zIXjgtObsmM4QpeH
         JTb6JZ1NJdhKYbVH3kLtkP8t1/XAPKxUSGodM5IMDN1RpnigL7AvTc1sks92P1/NzA/J
         3m3Z11KUTCklAxvtR4Ivo8BJC0P0XDCSNhS6B43SYg0jP6YBeSSqmaUhRCJlLlOGuOeF
         pRBw==
X-Gm-Message-State: AOJu0YxflTMOTJjWWL6vYcTTQOvxAUa6wQu8wzdlmc0nUGfgB6Fen9MK
	HXbEebQBW93Tb0LLThiEJQuz8X2Q2LrZwHyzN3e2lB7ev7UQhzi+Mpw58/v8SpiLKkI=
X-Gm-Gg: AY/fxX6OSzlsNQOfn8pp1fkm59ur7PHtyjIn8LcNfFPEntbL629kcb+HiucLOPEfbfI
	j/JdLuq5x5TTMul3unrcUue136r76e77/cOH4mGFBMjGKTAZOZ0SwLxxrkIJNgfhvBFRIquqg1Y
	swrN7zw8leazmfZsukl2+VbvVNvj82dakfaEx3Q/jb2WuEFovO3VJUKjCaQILSms61FesfDG3iB
	hOs9enbf1buY1FiGWexohdIJGoflbRefXQi8X9ii7pf+USCjF0gAJrdYUe5GvLVW5Zr3Ri/rjx3
	cs6eGMCr/5G/vfLkUXEHyIwhRQDQ+FVR3lJaYxzhOd+OxGa0PriKpHPNYgqYnlwoJa2DCKLWj6Y
	hV/fjIWYailqcpPdSRCM7W3HMVzGINkpayXp6MvWu2CCuslXyj2mLpopMYlRvK+an71lknnnSpo
	9l268R53Xsobedpai5DrS8DvMkqHxJIZdQHF3aDF3NzcC/NpEga+UPh5xPgnYu
X-Google-Smtp-Source: AGHT+IHXHOZp8itjhh+fkFaZbQ3VXLcXGs8r0jXw2gV03YybC4VJSPuyqcNx/oMNWk/BzkLUNpT02w==
X-Received: by 2002:a05:690e:c49:b0:645:443d:10df with SMTP id 956f58d0204a3-64716b37dc0mr19199791d50.10.1768322857068;
        Tue, 13 Jan 2026 08:47:37 -0800 (PST)
Received: from localhost.localdomain ([2600:1700:e60:2e00:56d:5d13:bd30:c0a])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6470d89d510sm9530578d50.16.2026.01.13.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 08:47:36 -0800 (PST)
From: Shraddha Ramachandra Phadnis <shraddha.phadnis@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shraddha.phadnis@gmail.com
Subject: [PATCH] Documentation: arm: keystone: Fix broken device tree bining reference
Date: Tue, 13 Jan 2026 10:47:18 -0600
Message-Id: <20260113164718.8037-1-shraddha.phadnis@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The overview.rst file references a non-existent device tree binding file:
Documentation/devicetree/bindings/arm/keystone/keystone.txt

This file has been converted to YAML format and moved to:
Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml

Update the reference to point to the correct location.

Signed-off-by: Shraddha Ramachandra Phadnis <shraddha.phadnis@gmail.com>
---
 Documentation/arch/arm/keystone/overview.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/arm/keystone/overview.rst b/Documentation/arch/arm/keystone/overview.rst
index cd90298c4..bf791b2fc 100644
--- a/Documentation/arch/arm/keystone/overview.rst
+++ b/Documentation/arch/arm/keystone/overview.rst
@@ -65,7 +65,7 @@ specified through DTS. Following are the DTS used:
 
 The device tree documentation for the keystone machines are located at
 
-        Documentation/devicetree/bindings/arm/keystone/keystone.txt
+        Documentation/devicetree/bindings/arm/ti/ti,keystone.yaml
 
 Document Author
 ---------------
-- 
2.39.3 (Apple Git-145)

