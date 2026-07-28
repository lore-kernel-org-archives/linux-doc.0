Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EA941A922
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 19:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268339; cv=none; b=jA9mCd8XHT7lSSPb0bXEp2AexEA+RW0OWYxQBgPToGG6JURzIwkRIQT/LA8tmY5NNSsg5ZY/rDYkOIQ9jIkC8O8DQGEnakObVsXT+mMRy7+4FD4uuY2u/7AGf6GdAPoFhaD5BnAEvqF0IRgx5FyxYPQYyAgmgP+S5Cz+CYw4OH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268339; c=relaxed/simple;
	bh=zr85cf5OM4ACF/oZP+D0He7J6hHB3ill7heyRNrcFAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fk4QP8c7a+/OwY2ugzBvcqUmNAMh3OoRjFqcbt4bzkh6voEmsJxKTMvmutoMkGNpX/dVnyBWOMYMSQm4N9UtFbH7xnkUSeftDa10RCbM4y+6d43SuTes/Sx0xEZtFQB+G2SMWXXTBwuDJ2gpXcHqXlWVZmBtrGRpKQ3iOQBgBCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r8aQ+5NU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r8aQ+5NU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso200769a91.3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 12:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785268337; x=1785873137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K777BRooUawVspr/rUZWKDKbuSCg0hJqOA2h4aegueE=;
        b=r8aQ+5NUNsLqkdzeqQYTySi6Snbb7U2y/iHAMEhZYLdX78XlyLkDDZhw8K21HUgrCF
         EJdwj3L1LnlnsmECojQP82yhRTBlS8b12rQ/kiZCY65QAWFNz5c1AcF1iO7aAtyRI/W1
         iJjJVbvaI8WgHhuurqo5oAMz7QujIo00jcd02p769NDGDAJ7lzL8J7BQyZyTejgLa66+
         u1PNCsBqCT7YFbqTemc3zC9atIJsk/WLnwnJEJa6DaNpYuHoH4CAy59PAVUEer+57Ed7
         fQshJxtQgUgJxVNcB9ZJ43eZbN4Q5A9IYoB6N0nBIW3bPAJwqn/GWvHqN53IsTcQD1Zr
         hZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268337; x=1785873137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K777BRooUawVspr/rUZWKDKbuSCg0hJqOA2h4aegueE=;
        b=agg0zHf/fQ1sAVSeabl6AtfsLSbgF+9SXvt9mf1rBNh805Lh919YIvTfZCeCLquA79
         +BDS2DTOHB+BHqQSZZHhM40z79Dxk0kolwLk2jxWQ/x/72eL1JhfisBBArRIUQ4yB44P
         28Do0C54IZLjAlGW4jZ3mFWOXO83EyfHzep8ZUJtU8eEYrbh+KnhlTLiIp5wFAzNAdv8
         lBwEY0Ly3mTkmyRKS0bRMrq1R6QBzpeQxfSsqdD8OXL/PwhoKfR8Fn9cSC/9GupTqFQZ
         dg3b078iP9yN1CRB0t5mvwPlIMwQQP6jjfLdF1WswIrFhLdldCFfBuyrJoK69Wq72AKM
         r9dw==
X-Forwarded-Encrypted: i=1; AHgh+RqqYRpuSmXQUKCHam2I/aXH87WXj4Uwczjizr3fYy68en/spLEQfWiHDgnc8c+9KL7uwnIEqRFthsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTuKcPdY2lAlJqHxHYMr9GdNm9rQEUNn1we8+4rkGw+ztXj1Fr
	JnTi0t9ztBflEUggctZII5SZEzyGiIc4+3t1uQvQXPOBayg6iRXUfFh+
X-Gm-Gg: AR+sD11m9VZcfzUtm6mDAwawKcPzKkxPXSjJuQvC/ZJ3bIS6+ZYiS1/1wDgKgV8f7Wf
	EAjPrC1IGo73RvkX8oCFGRwWofnMynsxePaua2lJ3aoPqmYwdkBCT9viu7flsFBuMxf8tnnxSGt
	lluNsAc7bQ6BgsVKieXlfjtLvX4pBLMeyrjKpDG/YYN1b2mkzGXJx9Xoy4jp9LJcWPr6693BX/Q
	8SLpNn0xixPy4w1mk6YPoCfOGdUQ+h+YWS7DxrHiTLIRscPXDv+yko01YZ7OukmhqvWL5IDbhix
	n40g4o8meJx/0FzixVSGEFE04+W0tn96/lgSuhtFOOoTgArsr6FMJs4U2rGttjlVw5c7DKkQC49
	DLG0HqbxV1aE06ZKPWtqFzkfHO6Mbg2+dyTgyOqWN6bzaq9S6IpYACpNbbziZyRkTeglWp0x2lt
	aVuAykphPeq42HxSrkKbxOP5le0eznlSP1Bswyc7KZTOg1v9Fb74BL22ZL72OzKIBGQw==
X-Received: by 2002:a17:90b:448c:b0:38e:a205:c84b with SMTP id 98e67ed59e1d1-38f6a4e2d36mr3992072a91.28.1785268336559;
        Tue, 28 Jul 2026 12:52:16 -0700 (PDT)
Received: from localhost ([103.170.252.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d3250asm1448051eec.20.2026.07.28.12.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:52:16 -0700 (PDT)
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
	ishaan.dandekar@gmail.com,
	Nikhil Solanke <nikhilsolanke5@gmail.com>
Subject: [PATCH v5 2/2] usb: hub: Split announce_device() to log device identity before enumeration
Date: Wed, 29 Jul 2026 01:21:58 +0530
Message-ID: <20260728195158.65162-3-nikhilsolanke5@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
References: <20260728195158.65162-1-nikhilsolanke5@gmail.com>
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
Acked-by: Alan Stern <stern@rowland.harvard.edu>
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
2.54.0

