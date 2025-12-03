Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551EB29B8DB
	for <linux-doc@vger.kernel.org>; Wed,  3 Dec 2025 07:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747846; cv=none; b=plt2f++Nd/PO6QJlxpPMdTTVmHjCKR9SKJZIoEbYLpiYcQGAgT1K71ClvQoD+xYazVIQvNyqLXnsA46O3GgUs3eNefK9jcujA0ljGgFB+6EvsTtOV0L4YUvWovVOAhsD391zBsIkcdzpb7oCYrFHm5tfZRRI1e1muqN1xRsZvoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747846; c=relaxed/simple;
	bh=HFfHaq84lowkvs9fqpKxO4da8+2xGKryV4IxKt186Og=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gwMmclELYclNxaVIPPepE/Z2LbUHXb0bPdxO+wWfrFzd+mC1n8R1cMBQqBTJ21TDOZyYsquR2Q7s1PaHYVSpeme1z3G5FYFfh+3iHWcHdhzx7yzvymNNFIkYjzNcAWMakCG9fniMNtw8ldxv9FB2IjeTWifrBywPAekyFn+ElbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W+te8IDY; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W+te8IDY"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79d0a0537bso69874266b.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 23:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764747841; x=1765352641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qDg0mAdezWfG6MBoyNeK7eOxDklTJF7sf+3+ikV+2oo=;
        b=W+te8IDY3ox0abiHFwnINvbb9RrejIzozBsRJtI8Cnz/VlnPYRgpLJN0vbCqNAbMa3
         UL4bBQtTOmaFhj/CIJlr6RFM4GoL8guBwOay8O/A6yBjXm3so8sHXpGemrB1Very9Vda
         7L/uoPBjukZFXRRoS4gckFR0M8piQ0BprPSrfrKEL5mXeM29/t/pdquFEzqE7TpanLcS
         YJpedlTvRLm/ut56oaNm6fc2Bi37LJCuo0YSSS0jVrmf1tQUpNpj/VqzOOXEpMZbLVLk
         P6+HvwganKuyNg68+F0zE8K44gQcYrGsSteIRNSbD/Skc5raoctxLuh2ep4fjC0dChnU
         +Vaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764747841; x=1765352641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDg0mAdezWfG6MBoyNeK7eOxDklTJF7sf+3+ikV+2oo=;
        b=wzR5PvYUDrr3bY/7itIx4/qXpNw18JwdvxPvCmZdth6if5U2hBnCBm1Hpshaa4r6Vu
         Isy/mHDQTPwM8HAHVxSpMH1k4dbyFUxgPWJeuGNUK+w7y9KO19Miqtx2AfuscqrS8t2E
         mPFuEGUe53fAbv8RlpuZu3mPlbOARbJ3s0hwXYpBJm5LlnJrNiKFkXd7dhQBKtvjhRPW
         bD0Y1snIjBtcYfe1aw1eeYLwvmBjJMQ9XbvQtqGLLuZgbH2TQRrpGi22IzFePxVVvVPj
         X85qmL5JwOpd6Bv/Dc0p+iHskKRefn7PxZW9L2s1EHvqgBZY/sqH2s+DLC5C4UlK91Zf
         8GUg==
X-Forwarded-Encrypted: i=1; AJvYcCWqSW+yhWRYFbTzs33Tzxl5ui2ahiqE1l+QT39gClGAMchnO6IDAXsbGV1Q6EMKx3vEOCqoFd+8VdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7+gm9a0RdJr0FdFsAG658PXEytpFBVjgf0iyfpmy6TQLg9utg
	wQOacvm2icXSfvlV20hMklAfnLjQ85Q/Aok/t1p+XkHJTvvZeu0oVIt73p+HmN5RY4U7gHoUsSl
	lIm+0
X-Gm-Gg: ASbGnct4xrN2OSDlBaJ7NJWryNXfYGCuy1e4r39oWwsD4wVSTnHIwLNVnODDad/WP5r
	Oq3AmvePoTFd+WgjLEhjRhjLC3DnvQ3ykMWHxifZEAy8H42IgITZQ/gX7LWgKXY9IVqYi+dvdz/
	RZ1UPa97YZfzsfAyr4fYRrIyDX0Sk0AGOOFEPYVIPDosizx7qXgztYu3tX/yOJ/QpaIQoCmI35I
	7rtsJmgh/F2yYUqKX9RzvkLQOZ6tVUGvY1bFxa/r0HzyMAeYgFRkns6WTUloJW+8jtEIw7FoKzG
	v14TzqRZRh5yO2wDdCo/Xml2QkP7eTLLSAKo/2ktyUzJYImkLPraanVI7SWPH0BfmguXhBSf0IB
	+idDU9G4x/yGtnwzmmkNVylNw6bGQno2oTqs9ZR6fnyVJKKgKbbTHvHKwXWzlo4HqmLSXgBaNl1
	RtpRU+vsp6myqD/3JP
X-Google-Smtp-Source: AGHT+IHOJmtnqel4E2MlxX3LOREVainlBOzpQXPj3OZ+vmLxOF/emLRKv2+K2zFqdKqpDzSb4sO3ww==
X-Received: by 2002:a17:907:7291:b0:b73:8e7d:4f91 with SMTP id a640c23a62f3a-b79dc76d5f9mr140365366b.41.1764747841519;
        Tue, 02 Dec 2025 23:44:01 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b76f5a3a4ebsm1718882466b.62.2025.12.02.23.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 23:44:01 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: Improve wording on requirements for a free Nitrokey
Date: Wed,  3 Dec 2025 08:43:47 +0100
Message-ID: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=HFfHaq84lowkvs9fqpKxO4da8+2xGKryV4IxKt186Og=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpL+o1uhAlXnfW+y+Mcao/pTDkmCr99U5NwCsK0 81skxDhlcmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaS/qNQAKCRCPgPtYfRL+ ThopB/9pfBKnw6yWfIai07WO6fpvoe4uS9DRlLjACWuawhiipHl19s95EKXBE/2DI7dbXB+Fxh1 LzR3V+YRNuKRhigmK26VOzIHOM1UfkSBtFp0dw57UFm+xf+lUn83E64EDmP20TYXU3EMIFPp4kx bgfcbxWp1nuqeL1waAZlsoFG35WDTHLIe1gWaWj8P2yp8xEFu92V1s00qcgbuNX5OVNhKkyyJsk XmQKasKZUXQQyagpaV2ROqOzdvEJIusUtS0LApUgabUc3WL2ctOWdLjDNQXAiduN1XakVrmz94I OOuxwHJpvkdb1ODTmLH4zvq/qYYeMp6QtjlDtP/mQeHIrjGw
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

"listed in MAINTAINERS" is not enough to qualify for the free Nitrokey
Start. You have to be listed in an M: entry. Mention that to reduce
confusion for reviewers who wonder why their application fails.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 Documentation/process/maintainer-pgp-guide.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index b6919bf606c3..2e4da3de25d4 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware considerations.
 
 .. note::
 
-    If you are listed in MAINTAINERS or have an account at kernel.org,
-    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
+    If you are listed in an `M:` entry in MAINTAINERS or have an account at
+    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of The Linux
     Foundation.
 
 .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys

base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3

