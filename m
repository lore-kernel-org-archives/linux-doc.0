Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368803921E9
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 19:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318056; cv=none; b=jVwhYLLe1GOeL/nfBnz7+1iDdJrfGWDsB3V3tPO3JP4rtiUQIdKtNrv0nIkmazNS0/apByinge9ogZI1sqJXD1d3gMdKvfOypc/4Bsi/gj+xE1b0VAvShoiKhyOZI6gyJccwBKIGYRhaQ1+zlNRlbRBWCT59RvKN/+rQtrl256s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318056; c=relaxed/simple;
	bh=OovEX5j8oO9dt0RWb+VLsO7EVU4CwpJSCIQyuF/rK64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n/PhWEgqee5hoWgOi8MVXZJfLRg0lwkszpZ7IMWWyWBHBY5f5gHUpSf0B2LO1OM8U4zF+380jUcztgUmCeTyfMYtLMcRRGDrn8YRqH5d3eENBGkL1GEFtAiU5LxvvCPeJxjy4yhde2HCFiM0Muz6A3DD+XyjF6FpPUkSkBPh8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j42IAOvK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j42IAOvK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso92625625ad.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 12:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318054; x=1784922854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V/QRLXFyC7iudgBp/aY0Qb4ATVQXu8Baj1/SfCLrVxo=;
        b=j42IAOvKxqnZj3n5K8PPiEyEA0/rceoW371CuW5G9lu3f/qPSxND06blwGg7s4FZbS
         EQaV2I4h1lKfnlVTC6EbUpi1Ktie8lvo7X2FmTAzBXdyfA0Yq6vrAZFVja0Hh6BKWx7P
         5S663aYfl0Gn90Nurqh0STxP6pjYiRs1MRAytFPo6mNSe4IH5YqZ5csFbO9YVZ3JkAfo
         D9h74oJehVUcMpmtW6/rqIB7zqcHridhd/4OnUGN1C4fpknbS59mMjhFwhIOhMRH7Pei
         k8stnFdnz47EhWaZnCPZ8+eaZT0rvXkJ4ZxAFsbDdCQv6MxPB3N9tS6Af1mHQZ4XU9wW
         IhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318054; x=1784922854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V/QRLXFyC7iudgBp/aY0Qb4ATVQXu8Baj1/SfCLrVxo=;
        b=K3WaCvPwveAP/K3JAx9YZidx/H8IdMcuAVKFm2j2Us0Jkg6aiYRQqKM5dgiLkXJDq6
         moUidNuCbNowor9BdymlL0qon1RdgKyJ5TNje+TmMSlL9TAgeF268hBcDBibEwNKx7Xl
         EuUNvKj3OkDj43bttLt6MsZlqRSV8WsIQWjiF0aV9bO6TwKfnY1qbjT7S7AMg0yAuDTn
         27jw4tFHROEq//LQo7t/SOvQ2y4aMPTTvBj9IiXOjoJDg3caJhO+wcn0xnE4Wvr7p78S
         ler9v4lRtODr3iyTj9QnlhDuT0XXyCBVr+UYACKQMa1qkT+1G03t4BrsHNX0EgGOZrYK
         OhXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp/YsxuMxDD92jx6hwfjB5DBfD/wn7hLUbWEM0M9FTvrGtFWlpa3a1CZ7lpm+3tA8i9EBmn/yMnBwk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFdCT6p6N1SycL/OymF80oovtpB4+IBv8DlrktxC2npWnw1SUs
	xe3+RrmpTVfVMeuVcXc4d+Oyo150WtW88dg4vSmxZMO99mKOo1PJBC0vLGmarRMz
X-Gm-Gg: AfdE7cm84lIuQPcJNSqiX7dm3L9P0w0L4hzlws9kJ/rwrT9BTuQ5DUUeJXVGrdCGFWI
	36aYCGBu0oox06N5aHO4awWrrbInuNyoj2jDtw5Cdu9etNG7kOwsiBY7p+btVYqQ1JkxKnp+ioE
	tVU5081pHEWtIEBpmChyT3JFA2bkGMNP+6MGjZxM8EGHs7xxbcgecpcfhn7UbM5Clsc3OeyLXZE
	/x0OLb+IlndVMntGPvH8+A2iICeLAFiQOiS9o2vHDnPmBRPw0uDm3IlWtjkGKzhGQSIE92YpKEx
	cpr9SifQhGZzFwM5NhIDMvJ/cC0m4BEdL3Ydwco7doVxCZ5xiJ84PWIl0IylbgzNi12GJaLYmb5
	DoF/yRrLTGkRZ4P9a5gGaqVFbwSNbIjX17YE04ssSivgpEuunCinhS7lzrPYWygO3m262GE6Nma
	35V3ns60SLLa5scb32QZmSDbIO924cmoJu7hvNX6GP1aDkbIJSJmDD8a6bVl4VKar5Zcsf+vHFX
	Y+y
X-Received: by 2002:a17:903:3d0f:b0:2cf:477d:8a87 with SMTP id d9443c01a7336-2cf477d8f76mr5826235ad.10.1784318054611;
        Fri, 17 Jul 2026 12:54:14 -0700 (PDT)
Received: from ghost.localdomain ([103.170.252.7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm7103119c88.1.2026.07.17.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 12:54:14 -0700 (PDT)
Received: from ghost.localdomain (ip6-localhost [::1])
	by ghost.localdomain (OpenSMTPD) with ESMTP id be1d25cf;
	Fri, 17 Jul 2026 19:54:03 +0000 (UTC)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	stable@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH 2/2] USB: hub: Split announce_device() to log device identity before enumeration
Date: Sat, 18 Jul 2026 01:23:36 +0530
Message-ID: <20260717195336.98500-3-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

announce_device() currently logs the device VID:PID and string
descriptors only after successful enumeration. This means that if
enumeration fails, no identifying information about the device appears
in the kernel log, making it difficult to diagnose failures.

Split announce_device() into announce_device_ids(), which logs the
VID:PID and bcdDevice immediately after the device descriptor is read,
and announce_device_strings(), which logs the product, manufacturer,
and serial number strings after successful enumeration. This ensures
that a device's identity is always visible in the log regardless of
whether enumeration succeeds or fails.

Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
 drivers/usb/core/hub.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..d92bf887739d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -2401,7 +2401,7 @@ static void show_string(struct usb_device *udev, char *id, char *string)
 	dev_info(&udev->dev, "%s: %s\n", id, string);
 }
 
-static void announce_device(struct usb_device *udev)
+static void announce_device_ids(struct usb_device *udev)
 {
 	u16 bcdDevice = le16_to_cpu(udev->descriptor.bcdDevice);
 
@@ -2410,6 +2410,10 @@ static void announce_device(struct usb_device *udev)
 		le16_to_cpu(udev->descriptor.idVendor),
 		le16_to_cpu(udev->descriptor.idProduct),
 		bcdDevice >> 8, bcdDevice & 0xff);
+}
+
+static void announce_device_strings(struct usb_device *udev)
+{
 	dev_info(&udev->dev,
 		"New USB device strings: Mfr=%d, Product=%d, SerialNumber=%d\n",
 		udev->descriptor.iManufacturer,
@@ -2420,7 +2424,8 @@ static void announce_device(struct usb_device *udev)
 	show_string(udev, "SerialNumber", udev->serial);
 }
 #else
-static inline void announce_device(struct usb_device *udev) { }
+static inline void announce_device_ids(struct usb_device *udev) { }
+static inline void announce_device_strings(struct usb_device *udev) { }
 #endif
 
 
@@ -2651,6 +2656,9 @@ int usb_new_device(struct usb_device *udev)
 		device_init_wakeup(&udev->dev, 0);
 	}
 
+	/* Announce the device identity */
+	announce_device_ids(udev);
+
 	/* Tell the runtime-PM framework the device is active */
 	pm_runtime_set_active(&udev->dev);
 	pm_runtime_get_noresume(&udev->dev);
@@ -2672,8 +2680,8 @@ int usb_new_device(struct usb_device *udev)
 	udev->dev.devt = MKDEV(USB_DEVICE_MAJOR,
 			(((udev->bus->busnum-1) * 128) + (udev->devnum-1)));
 
-	/* Tell the world! */
-	announce_device(udev);
+	/* Announce the device's product, manufacturer and serial number */
+	announce_device_strings(udev);
 
 	if (udev->serial)
 		add_device_randomness(udev->serial, strlen(udev->serial));
-- 
2.55.0

