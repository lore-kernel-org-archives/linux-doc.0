Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EC1EE7C6
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239705; cv=none; b=uEWuGkg6NM64R+XUoP7ZYKTQ1ENwwsuAcrmssNHTQrecAtYfqCAOh6DPSXBt2K3LSki4yYtjLxTWAa1fYrf+LWeAhpAkXHSwKPql4EiPh6AFVztzNJuz6Sk9diIdVUsNwzzcHI9tsxQ57qUmNIFuVX1c0ngVqnDpGr4AdcMqGJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239705; c=relaxed/simple;
	bh=i2XhmUiYnFer9xzDmhFquJehlBBmC6H0pTBvtA42ATw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PL2WQuZvfdYU2HwWsE8Jm2TFFyKRJltaiRiV8lZ9+p/Ibu5LIWA7rJuADWGChzsNLAfL+NvN8SoWAf88c8gx1eeFOwDHKM9VyldnujB+SXsXTbCwYDzPQOQzKzzbJrmpSjnMK7PC70oMwsjUQVWzZsz0xUDF0Byf696iHh9UeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd0WzJfU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd0WzJfU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2aae146b604so99947315ad.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773239703; x=1773844503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ha4kqWoqYsblto5PQkRWralkYomP/+jWSwYzX2+nEmg=;
        b=bd0WzJfU2YhgV/2QtHlDLHeJxmJKHuWmrW6vO3qt0i9/PQVdOaJaw90O3ufkWnWSCw
         452DraZfM+bPkqN/dn4N7C3dU33ZbarYrEeTb1mYgOmcYQkgYz5hbGN59+Hn9ZEMPf76
         eLNKVP2bDvKIwhWtW1UWkSlWOnh5kC53S5S1k6t/1l/oycoRrBIl7yavw+hSfevv0NSH
         ALuKPxkG1D+2S85MGA+gWQ3yHGmq5Soi4PkcDnSmDLAEPLH3zWDeW9y0z9VSyeAFhDVT
         EhIOBiqVa8R02IlJcrwXasJDlONIe9lURmtHEucdIEL5OmHrHwQxfEYi12wJnVQcEKd/
         z9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773239703; x=1773844503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ha4kqWoqYsblto5PQkRWralkYomP/+jWSwYzX2+nEmg=;
        b=h4i8gaOQImkTlY0egq6s14B27XL7/C7s2xxK/PlRBU6pHKhbpV+auXhKIGXdRqFf2J
         DuqiGQKTF9h77yLo6IcGT0qpdc3XLwERLq/kYM6kafJNnPnmYJY0BMI/E+GXEEIxNEoH
         HHFVDKazDdaTyp1m87SJwKaYqDdNQPEOzV6UpDY7N43DiyvD28QvC1J0dB3D5uIswbQq
         SQU6rhpWrUfQXVomq5rr/PQrYBv8d0JXcsrIlDXGmfoIvSC/HWKcD+RadI8PPIwZJGY7
         kNP/LJpjM+UDSITIgowIMtUh4OmGHp+jahfyRnRPuCg1HnhAVVMnkQqzkmw/NzWOOnEQ
         fQjw==
X-Forwarded-Encrypted: i=1; AJvYcCWkppBiah/JH2pEFgQC6va8zvSTDwpASnaLZIL+cDTVz6PryaLAZ66h7dd90WO5llCEqipp+5YnQdU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzka9iaks/XL4jeaUnfsjobkE1TGX39MsKr4YtYExNE+w2Hsdk6
	LvN+IFW4Mjws4/miQhnuRxCBGeyrPhG7S47vet8wQL/giHfwVa4UNBaE
X-Gm-Gg: ATEYQzyaKnjk2LZdXK4L/WjzyIrw1Uodk8pelRPER0DE6v43mpaSAiLNxI6lYnFLp0h
	7xv1/JjP16g/LeExnQabeuneW8SOIi0iYuKLpS/KMDKhSX+1vKP9CDv70BQsx5MSfdFFCh5aIar
	CCUV3feO5ZcH3IBINirnP6340E2BnwSqJgCxtVX+Pp36kwq0CHzIbKrLN17GwgKmThDfhE4EjMP
	C1um/mMe/dNXPHh3rsnQdaqaD+7wWQaSk7RiCGrPdMRik3HnUsQ05Dcz5MYORoYmPWxc8yaHHFs
	q4a0OYzrBZJcdQntgvZzYt4f/H1g3e3dnIrSS/7tfwAn/YBV7hxzvq090RT9d3ZPhdCnRm2eJON
	+GR0ZxuL1NWc8WP4BvSv5gg/45EsUV7o7g52l+lGBpQOuv9vwtTIpJfMMnxZE67bH316j3ONqrG
	Q1PTcKaGMMSlDfYt4RaEGpamvztDph+bdDBEWDKBNP50Mbs53U
X-Received: by 2002:a17:902:e744:b0:2ae:7f7e:93a8 with SMTP id d9443c01a7336-2aeae904128mr28551575ad.51.1773239702933;
        Wed, 11 Mar 2026 07:35:02 -0700 (PDT)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:dd5:d7ff:1c94:3624])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e070sm26399235ad.48.2026.03.11.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:35:02 -0700 (PDT)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v8 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Wed, 11 Mar 2026 23:31:44 +0900
Message-ID: <20260311143144.482145-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260311143144.482145-1-vishnuocv@gmail.com>
References: <20260311143144.482145-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v8:
- Fixes indentation

Changes in v7:
- Fix formatting

Changes in v6:
- Fix formatting of doubletap_enable sysfs documentation (separate Values list)
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 03951ed6b628..f874db31801d 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1522,6 +1522,27 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_enable
+----------------
+
+sysfs: doubletap_enable
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+
+Values:
+
+	* 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

