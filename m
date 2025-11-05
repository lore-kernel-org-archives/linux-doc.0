Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB295314B64
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347315; cv=none; b=TFqz5pNhoSsNODzYjvBsIX2978VYmEtvD88y8Gq8KOuxRRvxyOgvrqcwRUmcnvi4PgcfhHbzVsVZcO9/2LqIOekvob9gu5d0FvBnlJRFX2EGN6dTqLdrRu5ZFJsion2k1yfqY1LBwHgEPmLwSwQfBHWQzMBdROBbiXZFsXBDMNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347315; c=relaxed/simple;
	bh=Wn8M4nU+g/UwE05Qu/WSvpGvx9G0oLrJnBTtlyx7Ujc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZTHtVA2+8dJREbGiHjaiuwVZa+t9DOf9MFXIJEyNOevWWKlbQ2yZYOitpx2wYRO9sJbtD6S5c38nr2BmEwUJpdG1flAgSuP7mOasmfZ7H7wkwZeQqPXiPaehspF+Jv6r8LoDCVehKBPeZSN9oR3RdAopz8NaBsGfNJqYuoRleM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDlZw9Fs; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDlZw9Fs"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33db8fde85cso6331273a91.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 04:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762347313; x=1762952113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RfaksWJE0d3VMCElIbQg6mYL84G2wqZDW7eYD0q+rs=;
        b=dDlZw9FsGJl6aEa7f26v32cn88PcEe8JianrfkPzMyic6mM4h6kdiG1iG6MIqrTjji
         jefbJV5+RLkNjEwbySBrJvFt9S3d98fMAWprZJoahZGufGlZE512EL7NQkOsOPVprNoj
         m6y0+R7+0qXneUuH5ZoQbJvdmkCfrWqS4jEqthN0ZI/ozFaaEdXWZrR07sys517mzlzR
         a3rUUpRsdGxJ7j0PEOHE/f7Yl+FkRNQz1y6AT8+F0r5oYF9U1qyilO/u5X8aQuGny8Wc
         3M52t3WbKsKifSS0juv+e04c0BdL50FlFKiF6nQFhWadFJW5i8pXrKhBZjPUigeAHzcR
         w/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347313; x=1762952113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1RfaksWJE0d3VMCElIbQg6mYL84G2wqZDW7eYD0q+rs=;
        b=eqZImOfJpWMVvUuD9naB06iwLuPDSgM/JqR6/jxLwPhQBZBrk+I8A80SUc6p4y2dGC
         S9K5fx9H+BKzfnK8dmjkdsqSq5u5zZr32GXF9+Gxcn/AGjJRJ1Ky8RI7wzAeUQPsrRjH
         TktDv83m1VHnKkthg6WYnp2cXjRFAgL0VmzwNd5U5zkVkmOcy2DosQ/epjgQzOdVyvHc
         YBHOAxxb7bu9Krjn1dy8oBol5ykuDzyJoAyvxfuOluZO8dUak4rEk9itdATuqR/HhZbJ
         X3u4j1nxfiwC0Y2Eu//Ss0uhoeh8tDrexPblkkQQzJ77QzruxbwFy1ZzRGLaGYHxHVnS
         +biw==
X-Forwarded-Encrypted: i=1; AJvYcCUon9Kj+2/rwu0Wxq7DrzJvZ0jMtwv2mdB7ML+aitPko6UAmuNvF2yXejBkXoG0rlco3J9kPnsQWok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWT1BIX0rPaHk3zpdV4z8YAajxEtaofFL8f/c6PWlH5SHi6CUp
	+Jbn3+v4Kvwc73Rd2WrnpP8fvGZCJnD1mhaHXbXarl8t6aN7vdvpqTUg
X-Gm-Gg: ASbGncvfOV2Kh/3jNbVKfFssUMWYF/dQUEIlJ/uzHcq306PljUOFT49Nc+nWOCDyrHB
	CdX/aWZNMsF1oKRWgYA12ROWfmMgKmcX5CKDv1gP2XLvJ5enmIwrmyx0K/0/LsXtSiInmvyjP1G
	/eFRW5JwCQrBjvZtncmNnc9J+L/dIgFDFIUeRaizYXW1gAMRnxq1xDykWPPWH+ppGeWaOnkj86V
	3SfHM50A5guXlDqgXOUQgCW1247Sq+5Tim0IANQdM2qm8rbLSG0VWM6PS+eB0FWD8jj+zE6lb86
	eP5yJjqKaRDfssdH9ZEHFHHELJDtVF/NAtG44aCMqBV/4ro/KSc+fZEwBzlonBRvNIbIgyKKhyb
	HnmpLqfLO8Et8kjzMmGuzDDOMw67j6r5dC/+2dB258gv9HyjL7ixPuX74LpPdHmFNBe29LqVG2M
	4x
X-Google-Smtp-Source: AGHT+IHL1apm7PIdUs/PaS9mChKE7wtKefYCCLYmCyunjycPDwXiaaAlhs8Q3Fs/tPla3kMZKGUiQA==
X-Received: by 2002:a17:90b:3843:b0:339:cece:a99 with SMTP id 98e67ed59e1d1-341a6c2d9ccmr3797669a91.13.1762347312700;
        Wed, 05 Nov 2025 04:55:12 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f1a19e70sm5469191a12.7.2025.11.05.04.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:55:12 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7E2DB420A6A0; Wed, 05 Nov 2025 19:55:09 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net
Cc: Corey Minyard <corey@minyard.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH] Documentation: ipmb: Indent boot time loading steps
Date: Wed,  5 Nov 2025 19:54:49 +0700
Message-ID: <20251105125449.45643-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2528; i=bagasdotme@gmail.com; h=from:subject; bh=Wn8M4nU+g/UwE05Qu/WSvpGvx9G0oLrJnBTtlyx7Ujc=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJncbjP+ur//qaPnmpoSrpLBoSc1r6bin820u8kn5QzSP zFkczt3lLIwiHExyIopskxK5Gs6vctI5EL7WkeYOaxMIEMYuDgFYCIGTIwMd678OKPJvzv3W/65 GQUTJl7c+innblfT+pU2GboKLqGKaYwMH5+tjD2d1Gn19XGwqvLPvavUpbk/L/JexDBhJV8G078 2VgA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Steps for loading IPMB driver at boot time, written as enumerated
sublist, is indented instead on the same level as its parent list.
Indent them as appropriate.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/driver-api/ipmb.rst | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/driver-api/ipmb.rst b/Documentation/driver-api/ipmb.rst
index 209c49e051163f..dd99d034272b7e 100644
--- a/Documentation/driver-api/ipmb.rst
+++ b/Documentation/driver-api/ipmb.rst
@@ -48,35 +48,35 @@ CONFIG_IPMB_DEVICE_INTERFACE=y
 
 1) If you want the driver to be loaded at boot time:
 
-a) Add this entry to your ACPI table, under the appropriate SMBus::
+   a) Add this entry to your ACPI table, under the appropriate SMBus::
 
-     Device (SMB0) // Example SMBus host controller
-     {
-     Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
-     Name (_UID, 0) // Unique ID of particular host controller
-     :
-     :
-       Device (IPMB)
-       {
-         Name (_HID, "IPMB0001") // IPMB device interface
-         Name (_UID, 0) // Unique device identifier
-       }
-     }
+        Device (SMB0) // Example SMBus host controller
+        {
+        Name (_HID, "<Vendor-Specific HID>") // Vendor-Specific HID
+        Name (_UID, 0) // Unique ID of particular host controller
+        :
+        :
+          Device (IPMB)
+          {
+            Name (_HID, "IPMB0001") // IPMB device interface
+            Name (_UID, 0) // Unique device identifier
+          }
+        }
 
-b) Example for device tree::
+   b) Example for device tree::
 
-     &i2c2 {
-            status = "okay";
+        &i2c2 {
+               status = "okay";
 
-            ipmb@10 {
-                    compatible = "ipmb-dev";
-                    reg = <0x10>;
-                    i2c-protocol;
-            };
-     };
+               ipmb@10 {
+                       compatible = "ipmb-dev";
+                       reg = <0x10>;
+                       i2c-protocol;
+               };
+        };
 
-If xmit of data to be done using raw i2c block vs smbus
-then "i2c-protocol" needs to be defined as above.
+   If xmit of data to be done using raw i2c block vs smbus
+   then "i2c-protocol" needs to be defined as above.
 
 2) Manually from Linux::
 

base-commit: 27600b51fbc8b9a4eba18c8d88d7edb146605f3f
-- 
An old man doll... just what I always wanted! - Clara

