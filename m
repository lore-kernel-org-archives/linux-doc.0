Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF55E8BE9
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 17:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775757192; cv=none; b=JQfoQRpscEzRsHYsq2UCbTwmtw39c2Q9MU9mu/xNY/gFLrF/u7q17jxCba9Xp5QA4k9ka07xIhOCn+dch85YO8mmFbjKi66vft9W/AlfvBPjWxfEr/jt3+UOCksN2P6kUTarTXfvDztWbrr4eo2vryGP0wDYvLTqUVy2KoFvZx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775757192; c=relaxed/simple;
	bh=mm6VZqCRkab8GZnSK4FaXiFdyAa0ocA3azLFcvPZj6I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UUbVIlqlmNhX3BWvKkdaJBusPHHjMne5e27UCyhIHniZfjj8/DF498D4UbqUyG3dz764yVFQtReVwF9L7cZQfnQHJZvWSn40FQPxYd/HPTYzIZNQSnBBaDRXnTkgzn9n0dYuCPriZb8kx6oioGSZHFVB+6ELtNhUacOnZx2krIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qE5XTpm+; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qE5XTpm+"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82cec955160so905426b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Apr 2026 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775757190; x=1776361990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJq3rYsQ60yHYBH9wgTwGBJ0UIOoD7LqWc0lT9QqzeA=;
        b=qE5XTpm+vD/pSt6vhIWj8Ic2USGW4Eb2VmHexzTDxjViEM1ppdO3PNL0r9hfMVPDcr
         7xibKWXT2eDovlBtHJap1UwpPztLlZE0CX9blzNGCe6WE4XbrJxyZ7CT93u+k1P9Jpxy
         hVXnziDDngRVlCk+h3sBEMZGbgJ/AH/N51DdjLyxywSw3hxmKGlhRO5pa980pBp4KCPb
         obmft2ULHiW+Im5ydqsu9h/xspyLtr0/wqRYCwB3YZlKjBGL0LH/w1YSQ7UkC0z9fOAi
         VGAwnQwZoGC9EoeOBhit9fe/ewHYzDanpV7kNDhxc3a0at+Y6m8dEC/foi73HGc2ARJi
         NVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775757190; x=1776361990;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJq3rYsQ60yHYBH9wgTwGBJ0UIOoD7LqWc0lT9QqzeA=;
        b=lrLUVicjrh0/HEEy7uh1H6OK1R9qnF6yjWakUgXhyjMT0mVQpK+mt+NW3U6sDvc6y+
         6JT9Ojt7B69RzbJXenrtWOVeznYN+DaMlU9kBDbBEuPtXaKV2NzR5MsxJuhaeI2ahzAi
         EKzFzEdHtJPvRwpIDnW1t8gn11NLtBMoFZMUbHvIKxt2SfqzO3kAbFstDR608f1Ksb5I
         OCMZxXoqRVCWlzC8pM/wzud9YtkCpH3iOCbhNhyDszzhcWmi/qi5WI7DH/BMfdQZ+p9a
         qHRtYmEWqTMoHA+5clva34BEQFokE9ylKYDavPtd8UkwArxk8yHBUpN72mAL26rqbVur
         1mPw==
X-Forwarded-Encrypted: i=1; AJvYcCWAssD4CUbTGpYshN5Ov+1Vwx+ZM2EgsFligAWGgEHZt1PT5dZJyFfhEwNq5FUHch4M0azt0LTckpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXX2bQIJlo97Wr0IkZkkemWPv1pSsn1Lmrhvd0OtBgpwfUP59u
	+IUpkjFC0ubtt7zdKL22SciI4n4lidL2rIvNhGygizbiD7uSTmgDNw2R
X-Gm-Gg: AeBDievgCDEBCMO5DPrcH+rl/YosK7R5Lko5lMAG7uhnNZd9Ti4FF2IpNb1X3OEzLyy
	v0j4Nexql0kyuWtJQ919bRgbmy8dgLZGqk44BEvb+zB92ng6pWx0KPDA6CBnjuH2UQD+mkBHWFk
	u9xBB1bC/p975kgpN/aONeN9JSUrHZMENYVLUAN0kpW9d16XwCNRdaAV53PQ53oSgvIP+T36QET
	uwkLbHS/gbQyLlkidGcA0gSrg13EaVFwrVxikuTCibdY7an4zGos7GPcPiKok1vqcZnLckK1kz8
	J4ClUH7oq+TERis5XX6m3c3FrtoWbImD7Bs6qHgHH9Mmi9vIWD8KJJ8pWiGoIgioyh8lMm0W1mE
	E9OcqHwyYXl5x+tejJusApPhv8IWqCgwI8TGKJOt+NAKIOhepwGqiyZ/lziSUmdeDa5qurEyXoB
	AHhWeVzZzYMZLI73g9YJq76pN0NaxAXQaBKFnCAGw4mP0pv5grrKb4iVG2
X-Received: by 2002:a05:6a00:3007:b0:82a:955:50d3 with SMTP id d2e1a72fcca58-82f0c2e4290mr127537b3a.45.1775757189921;
        Thu, 09 Apr 2026 10:53:09 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.16.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c52cf05sm30817b3a.61.2026.04.09.10.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:53:09 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH] Documentation: Refactored watchdog old doc
Date: Thu,  9 Apr 2026 23:23:01 +0530
Message-ID: <20260409175301.22902-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revisited old doc of watchdog and did some cleanup.
Also added support for new api in doc.

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---
 Documentation/watchdog/watchdog-api.rst | 49 +++++++++++++++++++++----
 1 file changed, 41 insertions(+), 8 deletions(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 78e228c272cf..446f961852ec 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -2,7 +2,7 @@
 The Linux Watchdog driver API
 =============================
 
-Last reviewed: 10/05/2007
+Last reviewed: 04/08/2026
 
 
 
@@ -106,11 +106,10 @@ the requested one due to limitation of the hardware::
 This example might actually print "The timeout was set to 60 seconds"
 if the device has a granularity of minutes for its timeout.
 
-Starting with the Linux 2.4.18 kernel, it is possible to query the
-current timeout using the GETTIMEOUT ioctl::
+It is also possible to get the current timeout with the GETTIMEOUT ioctl::
 
     ioctl(fd, WDIOC_GETTIMEOUT, &timeout);
-    printf("The timeout was is %d seconds\n", timeout);
+    printf("The timeout is %d seconds\n", timeout);
 
 Pretimeouts
 ===========
@@ -133,7 +132,7 @@ seconds.  Setting a pretimeout to zero disables it.
 There is also a get function for getting the pretimeout::
 
     ioctl(fd, WDIOC_GETPRETIMEOUT, &timeout);
-    printf("The pretimeout was is %d seconds\n", timeout);
+    printf("The pretimeout is %d seconds\n", timeout);
 
 Not all watchdog drivers will support a pretimeout.
 
@@ -145,7 +144,7 @@ before the system will reboot. The WDIOC_GETTIMELEFT is the ioctl
 that returns the number of seconds before reboot::
 
     ioctl(fd, WDIOC_GETTIMELEFT, &timeleft);
-    printf("The timeout was is %d seconds\n", timeleft);
+    printf("The timeout is %d seconds\n", timeleft);
 
 Environmental monitoring
 ========================
@@ -227,12 +226,33 @@ The watchdog saw a keepalive ping since it was last queried.
 	WDIOF_SETTIMEOUT	Can set/get the timeout
 	================	=======================
 
-The watchdog can do pretimeouts.
+The watchdog supports  timeout set/get via the WDIOC_SETTIMEOUT and
+WDIOC_GETTIMEOUT ioctls.
 
 	================	================================
 	WDIOF_PRETIMEOUT	Pretimeout (in seconds), get/set
 	================	================================
 
+The watchdog supports a pretimeout, a warning interrupt that fires before
+the actual reboot tiemout. USE WDIOC_SETPRETIMEOUT and WDIOC_GETPRETIMEOUT
+to set/get the pretimeout.
+
+	================	================================
+	WDIOF_MAGICCLOSE	Supports magic close char
+	================	================================
+
+The driver supports the Magic Close feature, The watchdog is only disabled
+if the characted 'V' is written to /dev/watchdog before the file descriptor
+is closed. Without this, closing the device disables the watchdog
+unconditionally.
+
+	================	================================
+	WDIOF_ALARMONLY	    Not a reboot watchdog
+	================	================================
+
+The watchdog will not reboot the system when it expires. Instead it
+triggers a management or other external alarm. Userspace should not
+rely on a system reboot occurring.
 
 For those drivers that return any bits set in the option field, the
 GETSTATUS and GETBOOTSTATUS ioctls can be used to ask for the current
@@ -268,4 +288,17 @@ The following options are available:
 	WDIOS_TEMPPANIC		Kernel panic on temperature trip
 	=================	================================
 
-[FIXME -- better explanations]
+``WDIOS_DISABLECARD`` stops the watchdog timer. The driver will cease
+pinging the hardware watchdog, allowing a controlled shutdown without
+a forced reboot. This is equivalent to the watchdog being disarmed.
+
+``WDIOS_ENABLECARD`` starts the watchdog timer. if the watchdog was
+previously stopped via ``WDIOS_DISABLECARD``,this will re-enable it. The
+hardware watchdog will begin counting down from the configured timeout.
+
+``WDIOS_TEMPPANIC`` enables temperature-based kernel panic. When set,
+the driver will call ``panic()`` (or ``kernel_power_off()`` on some
+drivers) if the hardware temperature sensor exceeds its threshold,
+rather than only setting the ``WDIOF_OVERHEAT`` status bit. Support
+for this option  is driver-specific, not all watchdog drivers implement
+temperature monitoring.
\ No newline at end of file
-- 
2.43.0

