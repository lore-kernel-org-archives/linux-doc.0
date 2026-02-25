Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F3C38F23C
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772013103; cv=none; b=X7rdAhq7lVAgCb269UxHYfJHNPZw6ex3y6hirzkR5cYoPymxGA1aZqyFmIAkAZFW5RxR5ZWFbSFkUjgi3II9CjQ8JK+iZmwyAxLINtEfNN9/6kLruJ0lzpay2nQHpLRN3WPFXYq+nlFHU9NDJPcdlsl8DjgnsWeSnIh4qC+HrCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772013103; c=relaxed/simple;
	bh=P6wKGDmbT7eKbm4qfK7W83uJm6uaEtWIKE0S5h34TlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aGOAhwdqYng5GwFiL6Jk/fC9zJRdEFO7uT7j50aCN02csMVyW23fKh6x/XAOPDDUezP4hp1V5DROzwyligbfODn12yMETTPEWcCTh9fieKd+TjJsFve0WB3VhQ8K6xO4afHzHy5InzAHvwR40WbT/pe8vTrIMSZLxHZq2fFasTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNVMGjwI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNVMGjwI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43767807cf3so4815242f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 01:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772013100; x=1772617900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7St7FbJ+o1PN/SA6fmu1avVMiYkbGVBh1ecJWqCjgE=;
        b=iNVMGjwIhM8KKTCXRQ0F9DTQgp/lS68frNXhugD0kC5kXrBZkWtU9fSBNSwuz2QVTI
         hYXnYvuPtAoH+GTJJqepHtdxcO8m9fS7gXfakuf/ZjbHv4+j9uj10SQ7PUNtmxbOpN/e
         vyMrSgBM+l4kRx2ab1oNbHtl39pBho3Rw0VaaHn+IjFprAKuxiGzDquVGCIFQiXvhjFe
         Yp1AjBmjDT7uXQK6K7EGOWPXgyUEsZBL7aJO2JqJjHdzYk5kgpogZOQhlhKqTZKIFq8r
         Z4oyjFRSn4lCG5kD5TimK9Na0OHF7O+SpfQ1aOdzlJyT+N0CmEpcf4Z2fLhWRGlMbmHr
         AItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772013100; x=1772617900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7St7FbJ+o1PN/SA6fmu1avVMiYkbGVBh1ecJWqCjgE=;
        b=otipWeiNBQY2qoSmYgHxeAxJjj1specGay/IawW92UkPB6jxWG7cXMR5uakq7sVne/
         WNNWws0VywbXCpyOs6V9hVP1rce9yVEpChT5bVwO85CQVOuAd6/SZUmM/f94ToX/+e5a
         DutMblvJTcpNRFAB9TxK1cbhrDU/SA9K71z/3vQl+/hJU7yDa7kLFEsPkufHz38TbwQ2
         apP144qEvln3QOy5BPkrg09MSo0HkcTKm8Vi7xHbqn+ASzKs1aDIqwMFz+OiVAEHxU5H
         r3HwdFKqNkS66hYuZDP4hXnkbLAc2Ftoh183Q22MdZ92AXVzDlLhehGsk0n92cE+8HAT
         dx5A==
X-Forwarded-Encrypted: i=1; AJvYcCUwE/jDY+yT4gWd2uinsGjCbgXxSLya9iD8qb/Vb2Ao9fOctSz13YZu0Lv6bpBeHtCgHcQK6cFoyms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxbKT7IyMMJEZaqEjkJrFSzZSbxHqiWecwIiC2Vip7lqpyo4M2
	Yvh/emL9UROwFvZjy1/v8nFsFFc9efmPw5ZXgrUoQxDT/siufOBtWkLu
X-Gm-Gg: ATEYQzzFqjUSAqpiivninTvEVTjq9As+HTgTvXGSwYilaO/IhYnT1YUqExpCCAVzMOj
	fcsYHzv5CiRDlnFD8nCFi4MjlvgWoSnjOHaHjem294owhUR4ohKkluT83H9T7ijsSVQChAYzqwf
	mmQVP1ykwOoTglVPJfaTat7vd5Iw7IbxMRTUOCuOFJKTy1MiKV+VQLK2tWFppo1ZtIVw2GWtVIH
	/LVwn49Mph6JjbAuyh0RRxXyzPfGewjNLlO9hblGSV3v1MnW1gl87GWBIAf6aM8HrfdJ/1C/I7r
	73jg8EDBDnmmQNDGloU2cvJAwtgJceg7f8KvotTRGZbCxFa/f3f9bsJeU7jQNMeFaIFd9Ico4yA
	qCK+CUIGSBJGmRaFM6BOKq+U/0Y2pp0ASLEGjXz8F9mP8R+yYIUdKdFC5vnVFQIzCFn+7JXJNkO
	eN84RfK2LcWELiLHlshEnUOdPfxopAvYYsrYQdVJ1umUqadGz8dtNH7tnQ9yfn2ehj/6NSVGVue
	yAAMJXzytIUlQ==
X-Received: by 2002:a05:6000:178a:b0:436:30b0:75a2 with SMTP id ffacd0b85a97d-4398fb3cc5emr2959516f8f.56.1772013099614;
        Wed, 25 Feb 2026 01:51:39 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([93.122.249.99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm31204449f8f.29.2026.02.25.01.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:51:39 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Flaviu Nistor <flaviu.nistor@gmail.com>
Subject: [PATCH v2] hwmon: tmp102: Add support for TMP110 and TMP113 devices
Date: Wed, 25 Feb 2026 11:51:32 +0200
Message-ID: <20260225095132.29954-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TMP110 and TMP113 temperature sensors are software compatible
with TMP102 sensor but have different accuracy (maximum error).

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Drop the binding change since no ACK from devicetree maintainer.
- Update only the Kconfig and documentation.
- Link to v1: https://lore.kernel.org/all/20250915170819.126668-1-flaviu.nistor@gmail.com/

 Documentation/hwmon/tmp102.rst | 21 +++++++++++++++++++++
 drivers/hwmon/Kconfig          |  4 ++--
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/tmp102.rst b/Documentation/hwmon/tmp102.rst
index b1f585531a88..3c2cb5bab1e9 100644
--- a/Documentation/hwmon/tmp102.rst
+++ b/Documentation/hwmon/tmp102.rst
@@ -11,6 +11,22 @@ Supported chips:
 
     Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp102.html
 
+  * Texas Instruments TMP110
+
+    Prefix: 'tmp110'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp110.html
+
+  * Texas Instruments TMP113
+
+    Prefix: 'tmp113'
+
+    Addresses scanned: none
+
+    Datasheet: http://focus.ti.com/docs/prod/folders/print/tmp113.html
+
 Author:
 
 	Steven King <sfking@fdwdc.com>
@@ -27,5 +43,10 @@ operating temperature has a minimum of -55 C and a maximum of +150 C.
 The TMP102 has a programmable update rate that can select between 8, 4, 1, and
 0.5 Hz. (Currently the driver only supports the default of 4 Hz).
 
+The TMP110 and TMP113 are software compatible with TMP102, but have different
+accuracy (maximum error) specifications. The TMP110 has an accuracy (maximum error)
+of 1.0 degree, TMP113 has an accuracy (maximum error) of 0.3 degree, while TMP102
+has an accuracy (maximum error) of 2.0 degree.
+
 The driver provides the common sysfs-interface for temperatures (see
 Documentation/hwmon/sysfs-interface.rst under Temperatures).
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 12763950d11f..3956d385bf05 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2337,8 +2337,8 @@ config SENSORS_TMP102
 	depends on I2C
 	select REGMAP_I2C
 	help
-	  If you say yes here you get support for Texas Instruments TMP102
-	  sensor chips.
+	  If you say yes here you get support for Texas Instruments TMP102,
+	  TMP110 and TMP113 sensor chips.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp102.
-- 
2.43.0

