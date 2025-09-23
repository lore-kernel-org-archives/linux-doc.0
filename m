Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882AE3043B9
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655787; cv=none; b=AtmhWgK0QB2YA9a5Wf0hdWfHx9V+6PO5ck+gmiwUS2GhAbe+guEehURA1E8VMqx1JRpRWRAEG105PqTq5JOO/C+SyOldwSZHL10G4mBzGYP20m0kFsPJBKOaTXfQmi21VqX/DTVOIev++CFYnFKpgkOwmueoSKL/8WXynEvHRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655787; c=relaxed/simple;
	bh=fP3thc+kVifTosgn3z97ZGSIOh9Iu49HneFiVEHzD6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wmkf9FqCbptJQNwOV3VVOQCiJCp7uKJ+lO2iGH5whWeSnx03Mwot5GrzpAp367Fi/aSC/3PcwzUNf7AcFGVf606igJUPromma72vIUb/MSViCZz9Q6pXvjEm+GsrZ2mKak+gQ+ksheHXVLvnBKchLj8HrjuP+TC5kxBr2mH4bUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgA28qNB; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgA28qNB"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b28e1b87c31so468399566b.0
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655784; x=1759260584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48AS41XIpjVoRU+0wgpEbU66QCbFruFApgvY2hxBZiI=;
        b=AgA28qNBm3mHAQUw75KGYGhZe0eQ6vdW0+tECAWXr+Tf0leXkJKeiNAVryiI8NIamr
         NWeSX3twMNWOfMiUvT8pTLRG2U3awMse+oX1+ts9etCEMalkyx0JDgt9+iSGzjX1fHBJ
         Y3mNgRAyjwAyf73zhcBN0ZUlq7sXKITktKwdGP7sg4usiMW70UOAEL//o6Kqp7poPDbV
         q/qn2RxfRIlBRRwPxleZokLE6x7hV2gycV7UKQTfbbZfjasE7rO3e113uYVGv5UhasnI
         KEqw1G1odywluMM9h/EGgMJuBsFCmyBU8MHJ2czZMytixgXvTfbk33FKfIEOnkS2IUuy
         Mv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655784; x=1759260584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48AS41XIpjVoRU+0wgpEbU66QCbFruFApgvY2hxBZiI=;
        b=MLbXKEHC3nqBxl0ncfXmlSxFKV+A9bwVBiqqBmbHDgBDyBfQMdr+K3Kv3fq9TaKJTp
         ElDo9vHha7Elmq2Jvy9WiiGgYy2csr64GpaiWQowhlJhZVWsSCcZYAn49JakbLMBZsCo
         6IqcUCGAQHBhWD5+TVL9mX6Fc8QgWQUPOFhqOWdBzKI3VIsXHSmiT+l+4tNDOrKdSAzV
         nesOgA5A7yPHZmVb783HXUiCmciOfCtPYIUma5JKkINhPZ52Kf7GvRFXpMwkkvzYyynn
         aOoIFC2BWyATWItTV8/yQSTqiqEhX701KIEnqEdm6TfXdZCjnOIRBGV/HCJdfnP14wcD
         ui9g==
X-Forwarded-Encrypted: i=1; AJvYcCVzggQ0Y9WGBWL9yAzC3Atixe+WUnUag2+xr9IfWSChvt82UBK4zpkbzsJhoU6v5aElCCN2C7G0g/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxig7Y96+wrVw+Q6GZPqYRh5SVe1+Xw1NC5jjeA79YB6YLpnIts
	awQMyfzc16qKaUDLetyBHjUH+YyOwumgOTeo3nSCDa11hfR0y92Z4FIv
X-Gm-Gg: ASbGncuhAIHgLjcKuEGKD31TZHBdBwuQgLM6sPF4Wnoq9AIEPhCDtPfnuYriD1/UDKt
	MieoIABJYkmUgADY6ZsfmaA98sBEEm6QAc+7b2Tr0VaPN0T1H7N3R4hGumfBrPTuKnlJ9FYnSUA
	SpzfgTjB0lqKaVvaFh1X5gioD4n54zxv/ldr2JW7PAei7/q2VqQQAs2OBOdQJKgL2bBrN2N83wh
	Yi4GhZO33JKQ5jWp4jU3Dnkz61j1xVq6bPnkfLNKeARg3vsSmss44m8A6F2Q++yGHtmodQPSfdC
	Pz4ArNLmPN1cupwcmxAvwgAVjtxpbu/p3zoUvGaMGXaboIXA405YZO39pvoB2/WAyoc6YPyjYwx
	Snt1EdkhCrFjrE5xkScp9mo62vy5bl3lTGe7JmdrYrcI=
X-Google-Smtp-Source: AGHT+IEJi5n4B3lRbxv0Dhubtahif4aO7G+ZtrfSFN8eZ2s95Bk6Owhctf2Hc2F2YFNV0l1GWudmIA==
X-Received: by 2002:a17:907:3fa8:b0:b04:563f:e120 with SMTP id a640c23a62f3a-b302bd15aa4mr365987166b.53.1758655783835;
        Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex
Date: Tue, 23 Sep 2025 21:26:56 +0200
Message-ID: <20250923192935.11339-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923192935.11339-1-eugene.shalygin@gmail.com>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Copeland <ben.copeland@linaro.org>

Some motherboards require more time to acquire the ACPI mutex,
causing "Failed to acquire mutex" messages to appear in the kernel log.
Increase the timeout from 500ms to 800ms to accommodate these cases.

Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ce3ea0333fd9..34a8f6b834c9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -49,7 +49,7 @@ static char *mutex_path_override;
  */
 #define ASUS_EC_MAX_BANK	3
 
-#define ACPI_LOCK_DELAY_MS	500
+#define ACPI_LOCK_DELAY_MS	800
 
 /* ACPI mutex for locking access to the EC for the firmware */
 #define ASUS_HW_ACCESS_MUTEX_ASMX	"\\AMW0.ASMX"
-- 
2.51.0

