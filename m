Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72132314A6A
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069207; cv=none; b=s+JfHZv1goibX+jf2Cxfi8RTL2bR49VExGAq0Y+pUMa6+vbF4yF0t2KqFJxJ4CUGIGceshAIg9/jooUZPb7nHAMdJKNaxxCnjHJm2mmfab4OwEf+5xNCa6u3k8m378OeDFn4LJuDKda86YdKep3jIjfzWNZbZiJ6mFTWAwxbX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069207; c=relaxed/simple;
	bh=bINqTcYBnpMiA8eKDMIKE2dhokiXwzdMKmoocGJBxvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoN4X2dHDH0Zl5uVJiJq6j+WMjyzq5S6G93l/nY9gCiSn5/s2NPcJPjHa7WDC1dlgT34UD0HB7+zP5YbaXgmiTE2dLqA0SAq+o0FFTQEMAf9WBV+OEp8cpiDuZlIn2xVurslck+Qs92sPLebLzAeBFD5QhKOJi/ctDr/6sm6MD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tm/zOQpQ; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tm/zOQpQ"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ba49f92362so265882b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 13:26:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763069204; x=1763674004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETZ2FAyy2v+yzymxyjsZFHVgNltj1Cngjn3GryQ+ajM=;
        b=Tm/zOQpQlcIUrmG0+jB8yc4M8iTsTuc8qRK1RnyS+fcLs4P+5RVKq7laD5rI14Xdq6
         MkGNF5nD+bsi4tDZM6qzotwBAqcJvuompcQG6GzAn75Izac3+mpkBvPpgGRKsAyK6FVh
         JpA4hPrr+ihhxD+elLGZRa3qmPS71kV+rZqRPU/I8u28UG+V+nm1RpWPG6YEDxLt85hB
         yZd4XCmh99WIxQSufm1HQ5E7kE3pNlMftiRTq1cY/c1UQWKBz00LsjP/VUzG8AEPszOZ
         WL6dxvIJrD2d2TmmoPfs9TN/kW5nfPK7EYXZcuqbr0VdS01aPtMNfLgLEla2lez2XJ5s
         qNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763069204; x=1763674004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETZ2FAyy2v+yzymxyjsZFHVgNltj1Cngjn3GryQ+ajM=;
        b=sbRpbU+D15b4asgrWXogtXEOPL5EriQ/lf4wYdIQr0f1eFkSLyS1AaVMd8TTVrsK8u
         QfpQy7XPFfiZXNy/RCtwEXpeUER3+emppvu+zXWoECemK0WPpyWN5kDZicrhMhfpIrIm
         uUKgC4IaEM1arg6UM0YQHdrxe80IOTp6JOXFSR6vA8Slr3hKwohJ3mKEusyPigbcxMx4
         yTWGYhABP21xP/Q1r+yrvKGyXeUmqQvDkuiNz93awd2+XfIzRDrO/cDgAnMT8O881min
         aR30wFgCOEwsqFnNr5kzrR5tzhi1uYN2pfP3D8WyidcPntQwXP1IAAYJfFC4HiNLOWZX
         SM7w==
X-Forwarded-Encrypted: i=1; AJvYcCUI3m1PbtJkW+bI428qX+fd6ZghhI2o5w1MHAIUDypqwtUynwwk0YvE0YZ90cguRFNOAVvRzCvwsI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjJXGwrB8pwmQ/78l9MTKDJSEr0ATxMumGd81sqhDr/e2FxOWC
	4u1k8vs4P/kNjpySgx2VkpSiv6SMpwQFnFGYmHnMRU/ldrtScM2pw2hM
X-Gm-Gg: ASbGncuFBm8/5+P3MXnnJFxHcd/Cwv5OImy/wMv0yGri77CEbIPfhCPfvHi8c6B1IF2
	4MJYYV1dCJG/slhqkeWGl/fBHbhVbI7HAQl1op/RV0xzkNp6f3ZGYl/UBK2IXm4hUV6bIeAwM9G
	w1+UiDQGmCUSUPOffzNzO2XmSrssF18YNrJUiYkTr0FzelSKJ0XSiVDg5Wxv56p12DkLyGgmqsU
	w0NOJgl7QsymukMhmAtAcbB9JtQ+WXdUzyNrqc5R+z+70xeGVPDzJLlsFHeWWqy6W0KWu3zVtEz
	CIJLEyGdeGOyDtV6+FeTkQMtGfHLu1HgSJui4/3t0Xsfd22sSMBOBvZpsD8bENc1f7JF2SNOki0
	dr9DsKb2itgRyDNwr/UatVj8TiEQIB1gSPeznktpyi0RnMSltFld4fJMJRASd3r1uIwPdMYXh1D
	pW1Z2a6IdksdkE+uADZNrXzBhhfj3HHvDxVhCI6ASoAXShAt7u2eq//yBp
X-Google-Smtp-Source: AGHT+IGlGHa64m4FUlNTDBrkTzOJTPv1hG5OJIfDH4dSktE6GCpD7ccEQGk4etzbj8JDAyYp5jdCUQ==
X-Received: by 2002:a05:7022:925:b0:119:e569:f866 with SMTP id a92af1059eb24-11b40e8ad2dmr366548c88.3.1763069204472;
        Thu, 13 Nov 2025 13:26:44 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885eesm1811414c88.1.2025.11.13.13.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:26:44 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 2/3] platform/x86: lenovo-wmi-gamezone Use max-power rather than balanced-performance
Date: Thu, 13 Nov 2025 13:26:16 -0800
Message-ID: <20251113212639.459896-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113212639.459896-1-derekjohn.clark@gmail.com>
References: <20251113212639.459896-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When developing the gamezone WMI drivers, "extreme mode" was matched to
the performance platform profile and "performance" was matched to the
balanced-performance platform profile, but only if extreme mode was
fully supported; otherwise performance was matched to the "performance"
platform profile. This has led to quite a bit of confusion with users
not understanding why the LED color indicating the platform profile
doesn't match their expectations.

To solve this, replace the confusing convention by using the new
max-power profile to represent "extreme mode". While add it, update the
documentation to reflect the expected LED colors in each operating mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

driver
---
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 31 +++++++++----------
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 18 +++--------
 2 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..1769ad3d57b9 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -19,27 +19,26 @@ WMI GUID ``887B54E3-DDDC-4B2C-8B88-68A26A8835D0``
 The Gamezone Data WMI interface provides platform-profile and fan curve
 settings for devices that fall under the "Gaming Series" of Lenovo devices.
 It uses a notifier chain to inform other Lenovo WMI interface drivers of the
-current platform profile when it changes.
+current platform profile when it changes. The currently set profile can be
+determined by the user on the hardware by looking at the color of the power
+or profile LED, depending on the model.
 
 The following platform profiles are supported:
- - low-power
- - balanced
- - balanced-performance
- - performance
- - custom
+ - low-power, blue LED
+ - balanced, white LED
+ - performance, red LED
+ - max-power, purple LED
+ - custom, purple LED
 
-Balanced-Performance
+Extreme Mode
 ~~~~~~~~~~~~~~~~~~~~
 Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
-enabled in their BIOS. For these devices, the performance platform profile
-corresponds to the BIOS Extreme Mode, while the balanced-performance
-platform profile corresponds to the BIOS Performance mode. For legacy
-devices, the performance platform profile will correspond with the BIOS
-Performance mode.
-
-For some newer devices the "Extreme Mode" profile is incomplete in the BIOS
-and setting it will cause undefined behavior. A BIOS bug quirk table is
-provided to ensure these devices cannot set "Extreme Mode" from the driver.
+enabled in their BIOS. When available, this mode will be represented by the
+max-power platform profile.
+
+For a subset of these devices the "Extreme Mode" profile is incomplete in
+the BIOS and setting it will cause undefined behavior. A BIOS bug quirk table
+is provided to ensure these devices cannot set "Extreme Mode" from the driver.
 
 Custom Profile
 ~~~~~~~~~~~~~~
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 0eb7fe8222f4..df475e52f79d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -171,14 +171,10 @@ static int lwmi_gz_profile_get(struct device *dev,
 		*profile = PLATFORM_PROFILE_BALANCED;
 		break;
 	case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
-		if (priv->extreme_supported) {
-			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
-			break;
-		}
 		*profile = PLATFORM_PROFILE_PERFORMANCE;
 		break;
 	case LWMI_GZ_THERMAL_MODE_EXTREME:
-		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		*profile = PLATFORM_PROFILE_MAX_POWER;
 		break;
 	case LWMI_GZ_THERMAL_MODE_CUSTOM:
 		*profile = PLATFORM_PROFILE_CUSTOM;
@@ -218,16 +214,12 @@ static int lwmi_gz_profile_set(struct device *dev,
 	case PLATFORM_PROFILE_BALANCED:
 		mode = LWMI_GZ_THERMAL_MODE_BALANCED;
 		break;
-	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
-		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
-		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
-		if (priv->extreme_supported) {
-			mode = LWMI_GZ_THERMAL_MODE_EXTREME;
-			break;
-		}
 		mode = LWMI_GZ_THERMAL_MODE_PERFORMANCE;
 		break;
+	case PLATFORM_PROFILE_MAX_POWER:
+		mode = LWMI_GZ_THERMAL_MODE_EXTREME;
+		break;
 	case PLATFORM_PROFILE_CUSTOM:
 		mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
 		break;
@@ -338,7 +330,7 @@ static int lwmi_gz_platform_profile_probe(void *drvdata, unsigned long *choices)
 
 	priv->extreme_supported = lwmi_gz_extreme_supported(profile_support_ver);
 	if (priv->extreme_supported)
-		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+		set_bit(PLATFORM_PROFILE_MAX_POWER, choices);
 
 	return 0;
 }
-- 
2.51.2

