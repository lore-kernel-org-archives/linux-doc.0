Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7633064A7
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763231356; cv=none; b=lRT2G4TzxwgOx710L7fEBLi9OsZyWDrqcaJlbLUMGhHP0UAS91K+hk69os1CTMfnvRGbvZPXFrPu9R9DP3rJ/xWXIJNETZmyFpRsHjfKPGXNwSiTCUh7z5dToFLrpq7+y9CIKJDm5vR5W/osVuIF5s24lGbkkhz0fd0d7983bLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763231356; c=relaxed/simple;
	bh=Xkp+AlOrp77vDyfTjWGA5vol4JLYgJgv4g0+c9b+DoE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=raVV+j3+ABm2ihRgs97zXBhLc5HSafgsMoqvrazGY6XZ6tTBLydokl/FtLbSPx9IZWg5rW0tGBI3OytcpLze+zXBB7cVzA6VzsjawLNPVMHjtsSTBtnweQH98DJnsQEzzTQ65FeSRLlma/S2ICz3s74KCmEXilowFKHX6kFSyig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=k/byuNno; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="k/byuNno"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b9a98b751eso2024689b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 10:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1763231352; x=1763836152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iej97Lk0IpH9rmKjnGruuelwGjs+gRKjN3lzcMuN5y8=;
        b=k/byuNnoM9yy0zbpbuKZ8ZqeEKIDtQDCGxU+OWlbtGOM2FaU2m3AFwJHMfXzhMda3k
         Nmst1Jwe+R1yV6P71qeXnhDnyNGMeiK0f0d86nwQr05sEXkkdGxOvzFImCxhq++HM3zE
         fzRLQtkVvIS3DoxjBWZLGk3ysNT2gik3t40krDDp0PvZrxEwvZstuuKSWSB+9zlvZc+e
         fUpS+zIL7YNraxpHDQrW0brrRcovkEQv9y7EWcuCSIYe8Ix7RJR1tE8alyC3nFKx3sUW
         8ikwO7zNs1CvYWmOCyHj3ynvlJ1H34OFjSbm8aQhZmNOBRSEPNeXtcOW3M8xv1jVrQZ8
         3dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763231352; x=1763836152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iej97Lk0IpH9rmKjnGruuelwGjs+gRKjN3lzcMuN5y8=;
        b=c9jEPEBT//Y5B/6blg+spVVu+X2H9Af9ZJH+ArIDfuahkjJ3Vxrjjbp6VaRTqKO1O0
         OIq/+BIvC/pRkQF1M3Mhns8jnHKHjR34JZhCbKdLA2GKdBAcLzpt0INkkYlWoyIyPiUe
         /VDGxH9YaCh4E6VwDXNDkaUE0Oso4n+NgtgRW5uNreDTzTcAQfIzKmZlUYY9ocU6pLEL
         Tm/Yg0Ge+ueQ7WMNy6PLysTxp4wWOhycHgnk86Mld/tONEPIx+q+8qQHo1fW40tyICUU
         570jnU5979PnngUsHhgwr2nikjy8vn3fDubngkztbArUgbUFJADPzKTcM5u/fvIDTNd4
         2Ipw==
X-Forwarded-Encrypted: i=1; AJvYcCUfqkCwezEOLjtHdcimdjbkVrh0hehPfzez5sLs+mfRpBLnHAvq6wRR7Hl8ZX73LSTTeyg1//Sg0PA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxn5wjq5XbYaSbcN2EJ8f6JsRbTDVN9hxTY0A9fdmUGnqxRByW
	mxuuLUvhCK4CJqhIj4/wMFl2RYpi7mhKtKKnG6aNsnLQ2bFcZgC2tdqPLYwxMSp3lgc=
X-Gm-Gg: ASbGncv8DqG0CsrcjBLdZvZF/umlUdAeu/gsjwMa5EBJb9wqC7ehz/U4OQW7hK6eP5F
	1nmcfRrV46hK/PodmBe+59WsDhNxaaR8Xx7Xaulstdq4NfPOOVQZnTiDnIzj/XtUKEAfrIDbeqH
	vqFiJOObXaPWh8tMuujPlBZLyRCLQkP+6zOp4Fl0Me0dUipmoOnUrxdppZ2dIW17t1nebKfwGDG
	+Xf6WSOVgvj05k4S8HV6NSIRlhN1fTC+t12P5ZldY0HvX1IsPN8ChJcPB050+AthrJmQ51egiq2
	yghzsD6QHqwEDc1u36IaJigeWTz8fBijKFBNrv+7ncG83/WHGQY3n9HxSGcsECNgDQo1rwqxka5
	kp7EG7r3tJQr4oPNpOLsJCqE5hl+bbGPpG/KRAbZtVQUQVW3vrq9CvMM+pPDh5gdtO8lAD6OeLN
	1Niq+omO3UK5aocGx7
X-Google-Smtp-Source: AGHT+IFr+7VrQ2I3mNfNSDZrGqD2SF80pfacPUgADezFX6U8zJsGzZnjhP08LKSVROpYiRoE/ISCgQ==
X-Received: by 2002:a05:6a00:460e:b0:781:2291:1045 with SMTP id d2e1a72fcca58-7ba3a0bd788mr8487955b3a.8.1763231352049;
        Sat, 15 Nov 2025 10:29:12 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:b19a:5e09:9d0:f111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9251c99aasm8686206b3a.28.2025.11.15.10.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 10:29:11 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/hwmon: Fix broken datasheet links for zl6100
Date: Sat, 15 Nov 2025 10:29:08 -0800
Message-ID: <20251115182908.1357793-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the datasheet links contained .pdf suffix which resulted in 404.
This patch updates the links to the correct URLs on Renesas website.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 Documentation/hwmon/zl6100.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/hwmon/zl6100.rst b/Documentation/hwmon/zl6100.rst
index d42ed9d3ac69..1513c9d2d461 100644
--- a/Documentation/hwmon/zl6100.rst
+++ b/Documentation/hwmon/zl6100.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2004-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2004-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2005
 
@@ -17,7 +17,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2005-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2005-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2006
 
@@ -25,7 +25,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2006-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2006-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2008
 
@@ -33,7 +33,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2008-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2008-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2105
 
@@ -41,7 +41,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2105-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2105-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL2106
 
@@ -49,7 +49,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl2106-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl2106-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL6100
 
@@ -57,7 +57,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl6100-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl6100-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL6105
 
@@ -65,7 +65,7 @@ Supported chips:
 
     Addresses scanned: -
 
-    Datasheet: https://www.renesas.com/us/en/document/dst/zl6105-datasheet.pdf
+    Datasheet: https://www.renesas.com/us/en/document/dst/zl6105-datasheet
 
   * Renesas / Intersil / Zilker Labs ZL8802
 
-- 
2.43.0

