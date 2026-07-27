Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FC43D75C9
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 19:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785182098; cv=none; b=qGR/aEK7AVQBDsrO5dryUsepxW+T1hjGCTUPSYeufs5YmJ45ub7Ai/Tbe9OhMfa335emLgnW9qvfUlrulf5o/4x8/zB6lQPC8GdtTAdWiFQBrYVeDZYMP0bAmlFRqsA/Pgro9/vDZbyDliNKr8O1DnIwgQElYC8EH+sCmWanYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785182098; c=relaxed/simple;
	bh=9ZBeAX2irN6IiFpbq51FyVlxw9EXPjSN5Dzv9LGCwpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIixxxptYCwfKZUmgxsxDxvgHpyHLFXHIZRgZcgTUzI1KdVe2fXfIT59DoliucUv1NZWd4zyWPdhL6FedUdSOdELErvCAFGJhnSsXoKAu2TeY3C7m1WZ2M5EN41K7GoQmabk4JxSPypay1d681hDKPrKLU41QRWCgnWmuumuqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfgKI6SO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfgKI6SO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e347638adso2890665a91.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 12:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785182091; x=1785786891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45bSubc16iJ1Yi2VGl5jEvwrYCA1dscUnxoTtRLbDfY=;
        b=JfgKI6SOJynfn+nBGuho59EYResO3e3MNwwLxE0SBOo1DpXpXDe6RoPUThSrlZsy0M
         E7XCOQUH2D9zYJGHJGi+55En+OOJ5o9R83QtiUTE/3BiMvtRMGbsbWpY7VuGqyc2O4Ep
         oyv65RxVb+Yz6sq+6kPhjhkMC8+WHS6g7v2BFJO6l5z4X/CiuD7GUxJS5l5L1fxEfm3i
         KRSPds/jtZV4PBPUSLTig/4hTjAUkveq0qd9PnvyVEivlYtFbr4OQCiIjmfGFuXYGJf3
         /TthduPdb2BIo30PUeKYw3OO9ITlHG4Qr13K98o9hql0GzrBdisRmErNX+s+wKn5izRa
         L1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785182091; x=1785786891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45bSubc16iJ1Yi2VGl5jEvwrYCA1dscUnxoTtRLbDfY=;
        b=oZsEBvXjl8RMW743S1yZReqKraqfD7KmGRnPxwp3sn29usxdxyz6bOiTM3plNg8b7G
         8I+2Xanx1CzfzsOWzYkUgGZQ6sB/+eRSIZhSHXBfltLZvrSUrVII2nGpH6LPQNyrYlkc
         NrZu9HKNyHGjhWysTqs9Bc0HnUjn6FDkwHhA2zma3/VmzQ/XyLaSVyB7ihQK8LmxiQ8s
         mlSAr+dV0M2+evq84OZNuaeDaY0GjUpmKXuhARiRirChBnevBzW5AEEkvN33hk1swfj5
         BaMk5yGsa5JomZk3qtRq/o2n4LTLBeP73QVzxZcOavX0bX20RGUx7KeSXOxNm1smi/JB
         CPOg==
X-Forwarded-Encrypted: i=1; AHgh+RqIuHlpb+DWVeu0PyjI5p0GIWGqRt0g9zojS9DJMxkjgykxn3gqANT+2oVjZJsLefHm1I77NK9Viqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9j4iefZIMCNnClTjoCdXSEo+5UdXRQcftXejyOuTWNzDOKqp
	kPUWj4FSiIGu1dmhpk5nfp1rLwNA75RcNFGCnCaCGpvckUF9bLM7gstq
X-Gm-Gg: AR+sD11di5wxSQWfur542nY+mgBhE7JCR9hfNJyCdtc2Ify5xyHV8OQWO0Jhychk/Zr
	HUTiA+2pShr/gLKed1FFE3M126K7jFHpiwUNePrSkNh09scNPL66lbvOA0wckaHT3ns2hqLSTil
	1deGuSe/ltXr0eO8YIGCcVPySs8A7ZBfMF3TaMXcZn2/rWCfoIF5HPJjVBu4QvvhXTiPrd6wisA
	qv5GWsMsOpcr/5ZD7ETGGvAH1XTvnyUxjteP0s2Cmg9btygzKhgQo1Yvg4xLaeKTnETKP9YXYbl
	tit/80tNAvm0n+wSLwSXT0VCYBR9qgNLntElvNVlsc3y+fOsYroFolBbeqhfMdmztS09gjPbX8O
	HS8xGa4nafoidrKDih40L6JDYMUVaNXoxH7YfY9tMjqdcPoLkJdeXDQpW0G+WUG8E1kM4Wc1iQj
	YTdXxDqOVEJeZ6qNwIs+6LM1nAEj7UZuYbMctPWw8DHyppDLJmCckeFhfIEYqV2QM8BKCWUSP6z
	PG3
X-Received: by 2002:a17:90b:39c5:b0:381:a766:efcc with SMTP id 98e67ed59e1d1-38f2950e593mr11038240a91.14.1785182091394;
        Mon, 27 Jul 2026 12:54:51 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm57448005eec.13.2026.07.27.12.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:54:50 -0700 (PDT)
From: Nikhil Solanke <nikhilsolanke5@gmail.com>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	stern@rowland.harvard.edu,
	michal.pecio@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	stable@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v4 1/2] usb: core: Add quirk for 255-bytes initial config read
Date: Tue, 28 Jul 2026 01:24:33 +0530
Message-ID: <20260727195434.14626-2-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
References: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain third-party USB game controllers exposing (or spoofing) an Xbox
360-compatible interface (VID:PID 045e:028e) fail to enumerate under Linux.
The device disconnects from the bus without responding to the initial
GET_DESCRIPTOR(CONFIGURATION) request, and the kernel logs 'unable to read
config index 0 descriptor/start: -71'.

The device then falls back to a secondary Android HID mode (with a
different VID:PID), losing XInput functionality including rumble support.
The failure reproduces across multiple machines, host controller types, and
kernel versions including current mainline and LTS. The device enumerates
correctly and remains in XInput mode under Windows. Notably, the device
enumerates correctly in Android mode when the same 9-byte request
is issued for that mode's configuration descriptor, confirming the firmware
bug is specific to the XInput mode.

usbmon traces from Linux and Wireshark/USBPcap traces from Windows are
identical up to the point of failure, with no visible protocol-level
difference explaining the divergence. The root cause was identified when
Michal Pecio discovered via a QEMU bus-level capture that Windows does not
use wLength=9 for the initial config descriptor request; it uses
wLength=255. Alan Stern subsequently confirmed this with a bus
analyzer on a different USB 2.0 device, and Michal verified the behavior
goes back to Windows 95 OSR2.1.

So, add a new quirk flag USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE which causes
usb_get_configuration() to issue a 255 byte sized configuration request
instead of USB_DT_CONFIG_SIZE (9) for the initial
GET_DESCRIPTOR(CONFIGURATION) request, mimicking long-standing Windows
behavior.

Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Suggested-by: Michal Pecio <michal.pecio@gmail.com>
Closes: https://lore.kernel.org/linux-usb/CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com/
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Nikhil Solanke <nikhilsolanke5@gmail.com>
---
Changes in v4:
- Reworded comments and messages
- Moved the memcpy() block that skips the second read after USB_QUIRK_DELAY_INIT

 .../admin-guide/kernel-parameters.txt         |  5 +++
 drivers/usb/core/config.c                     | 32 ++++++++++++++-----
 drivers/usb/core/quirks.c                     |  4 +++
 include/linux/usb/quirks.h                    |  3 ++
 4 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..3d35270dddef 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8169,6 +8169,11 @@ Kernel parameters
 				q = USB_QUIRK_FORCE_ONE_CONFIG (Device
 					claims zero configurations,
 					forcing to 1);
+				r = USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE (Device
+					fails during initialization when asked for
+					9-bytes configuration descriptor request.
+					Ask for 255-bytes request instead to mirror
+					Windows' behavior);
 			Example: quirks=0781:5580:bk,0a5c:5834:gij
 
 	usbhid.mousepoll=
diff --git a/drivers/usb/core/config.c b/drivers/usb/core/config.c
index 45e20c6d76c0..346a2faa9bb8 100644
--- a/drivers/usb/core/config.c
+++ b/drivers/usb/core/config.c
@@ -912,6 +912,18 @@ int usb_get_configuration(struct usb_device *dev)
 	unsigned char *bigbuffer;
 	struct usb_config_descriptor *desc;
 	int result;
+	size_t usb_config_req_size;
+
+	/*
+	 * We usually start by grabbing the first 9-bytes descriptor so we know
+	 * how long the whole configuration is. Some devices with quirky
+	 * firmware will fail enumeration, so if the quirk is set, use 255 instead,
+	 * mirroring the behavior of Windows.
+	 */
+	if (dev->quirks & USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE)
+		usb_config_req_size = 255;
+	else
+		usb_config_req_size = USB_DT_CONFIG_SIZE;
 
 	if (ncfg > USB_MAXCONFIG) {
 		dev_notice(ddev, "too many configurations: %d, "
@@ -938,15 +950,13 @@ int usb_get_configuration(struct usb_device *dev)
 	if (!dev->rawdescriptors)
 		return -ENOMEM;
 
-	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
+	desc = kmalloc(usb_config_req_size, GFP_KERNEL);
 	if (!desc)
 		return -ENOMEM;
 
 	for (cfgno = 0; cfgno < ncfg; cfgno++) {
-		/* We grab just the first descriptor so we know how long
-		 * the whole configuration is */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
-		    desc, USB_DT_CONFIG_SIZE);
+		    desc, usb_config_req_size);
 		if (result < 0) {
 			dev_err(ddev, "unable to read config index %d "
 			    "descriptor/%s: %d\n", cfgno, "start", result);
@@ -956,16 +966,14 @@ int usb_get_configuration(struct usb_device *dev)
 			dev->descriptor.bNumConfigurations = cfgno;
 			break;
 		} else if (result < 4) {
-			dev_err(ddev, "config index %d descriptor too short "
-			    "(expected %i, got %i)\n", cfgno,
-			    USB_DT_CONFIG_SIZE, result);
+			dev_err(ddev, "config index %d descriptor too short (asked for %zu, got %i)\n",
+			    cfgno, usb_config_req_size, result);
 			result = -EINVAL;
 			goto err;
 		}
 		length = max_t(int, le16_to_cpu(desc->wTotalLength),
 		    USB_DT_CONFIG_SIZE);
 
-		/* Now that we know the length, get the whole thing */
 		bigbuffer = kmalloc(length, GFP_KERNEL);
 		if (!bigbuffer) {
 			result = -ENOMEM;
@@ -975,6 +983,13 @@ int usb_get_configuration(struct usb_device *dev)
 		if (dev->quirks & USB_QUIRK_DELAY_INIT)
 			msleep(200);
 
+		/* Skip the second read if we already got everything */
+		if (result >= length) {
+			memcpy(bigbuffer, desc, length);
+			goto store_and_parse;
+		}
+
+		/* Get the whole thing */
 		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
 		    bigbuffer, length);
 		if (result < 0) {
@@ -989,6 +1004,7 @@ int usb_get_configuration(struct usb_device *dev)
 			length = result;
 		}
 
+store_and_parse:
 		dev->rawdescriptors[cfgno] = bigbuffer;
 
 		result = usb_parse_configuration(dev, cfgno,
diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 87ee2d938bc0..f5a60ccf21d3 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -142,6 +142,10 @@ static int quirks_param_set(const char *value, const struct kernel_param *kp)
 				break;
 			case 'q':
 				flags |= USB_QUIRK_FORCE_ONE_CONFIG;
+				break;
+			case 'r':
+				flags |= USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE;
+				break;
 			/* Ignore unrecognized flag characters */
 			}
 		}
diff --git a/include/linux/usb/quirks.h b/include/linux/usb/quirks.h
index b3cc7beab4a3..a4043b33c2c2 100644
--- a/include/linux/usb/quirks.h
+++ b/include/linux/usb/quirks.h
@@ -81,4 +81,7 @@
 /* Device claims zero configurations, forcing to 1 */
 #define USB_QUIRK_FORCE_ONE_CONFIG		BIT(18)
 
+/* Use a 255 bytes config descriptor request mirroring windows behavior */
+#define USB_QUIRK_WINDOWS_CONFIG_REQ_SIZE	BIT(19)
+
 #endif /* __LINUX_USB_QUIRKS_H */
-- 
2.54.0

