Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703801;
	b=xNfcOBZ63x45hqyzonqVr4trCC23yy+2M3vAcGugoekZxGGFkyTfFQS3paYBbMw9v3O/
	 jGCPqUMpVm7uLxHTnuwqr7PS1mjCBo9csUa3wgdoyPKFxcIwJ/LuFrHiWkTLM+VGh0Scw
	 F1DqqpUYpNg9aaeo6YjSHfURaAOPdDvydKaUYE9vIxwxl8eY/N1GiGnrOQ3wUAmrb2E8O
	 ajXh+XhhUGmhXMByBBk7i+yyo6GeoQ15TZUwp93GmK6Gnd+eeH5lcCAVy255RK6cFWpg6
	 aAatOnk0eNMUuxWjzYG4XqpxR01YBzKdJllzKKpS77uAQwGsPIGtA7izK3X1W27IasQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
	b=o2hetaioPpIeR5JohAl15qJ2NDeId2cRio4nVTaHQc3HZ5gSBdGw6mqkcORBIni/Fs+D
	 sMT+6oOAFnt1tuSKrpJEh/Nqd1q+oZik43bpsmnAUWmjunRF62sjI2n8fsfv21sIGWvc5
	 JgruqG09hIvP8GhKfQRfkXX7soydR3zzao27IjrC+tF8I1/jRhUmoUI5L6IWIX1PYLA1W
	 DQ9eGvFRVllb/c3s0PvA0qmaAD3xPaWYCxgBHDgOKDf/lu5f+oL0+1N3p0tPwYJKjGY3C
	 cpw6nLVm0kuAk4Ly3zRWdUqrkQ49cPTKujF+PX3v14vTOEX1aURnuA8nWomPNwjzZig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LJEFTgK2;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CF8606A338
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 14:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CF8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LJEFTgK2
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso5973220e87.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795703799; x=1796308599; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
        b=LJEFTgK2y+bSpXry0PbbjVe1EY/gQIxL0YjKFkbtnmSeP2S3iAFI4cpcJpA0QfgVf2
         t1p7/r5jtP5ruD7Zaniry3wA6I29YfBMO67y/KyyN1YFvJHJrUNO5NowSSA4mm3hKTAm
         jsDENlFJr0+j8Ohz8rimlhi1RnEn3SNcnGzDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703799; x=1796308599;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wZ2A4qfQpgB1E9Hmrqw85vL60jFNYPf3t/HcdS6s4Lc=;
        b=nVGDV1Vp7QWaIOlVOoTfi1Jnb9N5xcYB3Ur5oQ77d1FfYdPfD1Hu6eeZUA1kYMH4/X
         ydCbqC48wWWZscpy3YDXAjDmXOV1pxP1df8Kg7I/MaNBkYymZgFUdAubx0rjbBAFxQIL
         oIaNpsCEqpXD3ytfrE1Gf/5ztB913dMnf3u75dhV4QwGwQjQANUE9p7oSRu8bTAaUN4y
         0tYvCjNzQdhYQmxyud42jl4FGQ07XD25vyTbeedEMA3Gxu4zNgM2bFFGb3O2kFzM+tSX
         2J7EWSk4CAeoGc4c6ygWS1cMsZApHIWnFlca/4Rlf7ZUuIr6ySlmVZMyZ0CRp2/rpz00
         rHzA==
X-Forwarded-Encrypted: i=1; AL+hErHjJ+iXMEkDPIUbJTsVXi/5KNbqM5KLROf/Lr3leXO1Jf5eXl65niXgtXIc4Fs2vG1jbIM78BTXHYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wknOkbjfjB4nF57jE4QAG+K204eBhUWNbvNmBue4zgc22n6zv
	KEfFBu2s7KYaIODaXRt6YWx1QVAix/VsR1lli/hMxzyFfjH+yZlTK1m6ouaulMB6+7VOBHDvTDF
	LKeR2GA==
X-Gm-Gg: AZFdTZce9ZuhFyeOXIUXLoydVzu7TXFOPMsTzPY/GAAAvwoAtLfNjbRp5Py4BtvDXD6
	TyuSePtot/CilyMX2nmitqxjItMN5QX7Zs0fj5VJZznU0OfAPv+LqYgP9xnqZM0FEgkNPXkuz0E
	juqLEdnznmDtnPDGSxXmVSLoBbFjldGateHDpV6M+cmQcHIGqLmHBRkyt1YC9CteH5np82JPbhQ
	EJIWI303F8l39JlN8WsOykUhKzBIANYcBGouUNrWsSgHMiRTjuX2nq5+rA6rd5ukyejyvU3W9JP
	5qRKed+OomuwtXvkgPclPNeGC8FwjLOIHarlX95UQRwZmA8sDJujGus0KuZmB9bLQdor6PnjOmo
	saj9zduivq7BdWgwyAzfDEEu2gWsc+sJ5Ug9Oah7I2LguHGpKf6gWXQ3/ndliWAR7kjUOvxFwR6
	dKZhi/dqc1KIaSJ2e62abplb/C9elAs80az5/2JfnUQThpTfYHkpjd8iWoC09aD5MdchTC3RAke
	1by5BR5ptIrwCyA2A8N8ZwmaW+BFnl6nJWbVOlqC7DXX+V0VQ3Q6Xa7rSELU2wO3srJQX0yP4l5
	nhMTSU4sPIypqTBNBGI9CQK5GAeCQE8YIctbD5dsvQp2IZ/6yO6o+qos5rEqgUmgZtVy+7ZTkrQ
	eRbBBL3+6czj3JtGCdimryDZZwwiy5T8=
X-Received: by 2002:a05:6512:3b21:b0:5c1:5746:9c3a with SMTP id 2adb3069b0e04-5c1bc8f3c5emr6643497e87.62.1795703798763;
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0563casm5231653e87.67.2026.11.26.06.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:36:38 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Nov 2026 14:36:35 +0000
Subject: [PATCH v2] HID: Merge duplicated documentation for Lenovo Legion
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-lenovo-go-v2-1-99db2904513e@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPNDCGsC/23MQQ6CMBCF4auQWVvTVsDiynsYFlKGdhJhSKuNh
 vTuVtYu/5eXb4OIgTDCpdogYKJIvJTQhwqsvy8OBY2lQUvdSnNS4oELJxaOxXmo0dbDJO3YQPm
 vASd679atL+0pPjl8djqp3/pPSUoogV2jWzQGUXZX6wPP9JqPHBz0OecvWQpfj6UAAAA=
X-Change-ID: 20260831-lenovo-go-7b4ec4bf0cd5
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Jiri Kosina <jikos@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

Lenovo Legion Go and Lenovo Legion Go S share some definitions. Merge them in
sysfs-driver-hid-lenovo-go to avoid this warning:

WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
[WARNING] /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; ./Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

Cc: stable@vger.kernel.org
Fixes: 168c91839139 ("HID: Add documentation for Lenovo Legion Go drivers")
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Revert unrelated "built in" -> "built-in" typo change in os_mode description (Mark Pearson)
- Pick up Reviewed-by from Mark Pearson
- Add Jonathan Corbet and linux-doc@vger.kernel.org to Cc (Mark Pearson)
- Link to v1: https://lore.kernel.org/r/20260831-lenovo-go-v1-1-e9526e88ee09@chromium.org
---
 .../ABI/testing/sysfs-driver-hid-lenovo-go         |  9 +++---
 .../ABI/testing/sysfs-driver-hid-lenovo-go-s       | 35 ----------------------
 2 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
index c8221373ef76..07f3ea054383 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go
@@ -365,10 +365,11 @@ What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-
 Date:		April 2026
 Contact:	linux-input@vger.kernel.org
 Description:	This controls the behavior of built in chord combinations.
+		For the Legion Go S, this controls the touchpad's operating mode.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
 Date:		April 2026
@@ -377,7 +378,7 @@ Description:	This displays the available options for the os_mode attribute.
 
 		Values are windows or linux.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/product_version
 Date:		April 2026
@@ -640,7 +641,7 @@ Description:	This controls enabling or disabling the touchpad.
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
 Date:		April 2026
@@ -649,7 +650,7 @@ Description:	This displays the available options for the touchpad/enabled attrib
 
 		Values are true, false.
 
-		Applies to Lenovo Legion Go and Go 2 line of handheld devices.
+		Applies to Lenovo Legion Go, Go 2, and Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/vibration_enabled
 Date:		April 2026
diff --git a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
index 4d317074bb7e..218164cfe544 100644
--- a/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
+++ b/Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s
@@ -231,41 +231,6 @@ Description:	This displays the available options for the mouse/step attribute.
 
 		Applies to Lenovo Legion Go S line of handheld devices.
 
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls which value is used for the touchpads operating mode.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the os_mode attribute.
-
-		Values are windows or linux.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This controls enabling or disabling the built-in touchpad.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
-
-What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index
-Date:		April 2026
-Contact:	linux-input@vger.kernel.org
-Description:	This displays the available options for the touchpad/enabled attribute.
-
-		Values are true or false.
-
-		Applies to Lenovo Legion Go S line of handheld devices.
 
 What:		/sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/linux_mode
 Date:		April 2026

---
base-commit: 25faec9ce61c01fb45abf812a222c5b43c3cd5c5
change-id: 20260831-lenovo-go-7b4ec4bf0cd5

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

