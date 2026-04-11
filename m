Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B60023BCED
	for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920172; cv=none; b=E92na3kKwW/HUt4+DEiYs79Oj5kBUmOSPwi1R5rhvIE9OdfnVpkdSibKImmKIkfRuup+bi0HuTiIHlihb6B8jAfLPDBLLeuIJbrDOIG22eEmMNopQFEwu0VULQAGxJxCRSJbZBWE6omSotmFQattpCckIhLB41SL4DryVZSDdeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920172; c=relaxed/simple;
	bh=lwKz3S60lPfR/UruL7HyqieQfuBV1mhLCaYlQ+cddJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eQVZZIyxv588j9HLWuVKVCjTIgTM++ONKLnu5u1dJ5jgU1Kueb/mhY2GFGmnmjXOIO1KRcMwbo1v1rvScsx/QxX/EpdFPmJrl6/zMQtX0+OF/7mV6LXrRRHaGBZT+ykWMo3Jgjnxc0KmU0/2RMYrsPiQOyrRYHYQuMZsVmREL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ohBjPBHy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ohBjPBHy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a871daa98fso19690365ad.1
        for <linux-doc@vger.kernel.org>; Sat, 11 Apr 2026 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775920171; x=1776524971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZ/+0gdfc0R4BMhHn3bRqzxYcwGAO2dazgMq5MOhcqM=;
        b=ohBjPBHylU15tWrWXX/wXpW3XlFOgB4Ro7Gh+5X+ZB1zfsMlSUlN7SLiy0+GiDRbbf
         oNaKyuUb56nApujgm4xQ+aSGceuDiV7a/se3acP5c5U69/uoZk5soUARHWdPAbzdbasV
         ubqgZZbS+UbYVTWVMTXPPNATWMeB9gyxjmrk0fK5tFQYQB/8/kB0QNVP0XLuQBX/IOcL
         xIkbth8wHLLk5xDv2ZUKEugedWBLo15Xsghhp2xK93tJNJ+SvTJFVCxsBQshiAujNbBd
         XZcKJO6jpLKRyBywU0xnpYUW4anxQm6+/KoolS3cxzxihKH2I4efB8LmtOX7Q+DwSZZb
         q41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775920171; x=1776524971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZ/+0gdfc0R4BMhHn3bRqzxYcwGAO2dazgMq5MOhcqM=;
        b=Xc5GBMlhS1DPF8I2KbpuOpK/bHR0mVyNM27/ESLnEO5VyIwuJzs/vIceeGkR5TxzYG
         UAO5vY5KRF/vwInHpzhIeIVu3u7S7Twin84kq2hIp73EPDoUw9Znom6rhZpNaM9u532N
         9FLRMi/ul7qy6Y/OtS3yFBD13uxwsCeI+yDsMGJb/p7Af+Jj3qbF2e56YSIUIRXCyt3q
         Cnm54M0UJLlmzRWZTjSeq1ljHTzbqCceYjU4tMoYe7M7lKeyyTjrPLzD/D+OjMtm7vw3
         BVduVvK+6RX6EQdkc//3OkK/KyI7rHroINDrlllRXDWjzP/NO3x1hoR3vgcO5dnQ62yk
         ETZg==
X-Forwarded-Encrypted: i=1; AJvYcCXar12MGqi7CLd+WV3mIJLdYmG8cLvsBnvFZPVfDJS+ArC/balObLY7mODbP9E0sD4X0KOA6+UWghk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy31pN6pW1aVYbPsB97+Jz8wakn6HpZdwl55GDENAdt1v3Wa1qZ
	Cg7tbbQA/CgkMWv/CAFFDA5RVFhaLit9HkG2MBSCnasw1gH8SxmvyFs9
X-Gm-Gg: AeBDieuyiBJQNNMwtuhoqXQESVgAO7QQsR+17Yy32fsZxXAMgxwAwPuNWfiYdLSLBSA
	m+CMjUwuahyU4zpXgqWTCKXgSL8+RNqF0OaTsp0ca/NZMfZn005CmdLfJYnKYidn82vLTZvlEUI
	xCLsDhNn8CJzFvjgWW0NO22vaE86UY7hUQRHPjI+P+D9pB5nolo8z1blCiOphpobQIYDJIjRuRM
	BVH/bF1jt0LqEfgr56gHnQJ2wsWOJwsEGj8AtC3FMx2HNktB/Qr7EszlGa7I61qhdhD2soqdPzj
	14pVhZe/SSJoAsPBQdmhGlUjZMtG/A6p42ijONdqLGat5/F4+f4KJQFWyTOp1HRdlxqP0LP33/G
	Py0P5t49fN6J95Yn+5tW4iDNXd95uwaiPNhU8U9ZLSnVXxEkluL5L6aMQqi16NlAhFJrOZjMJa5
	Js/al1/+UkHq/3GnP8PF1Cv2LhGnf1+EEAu8ITqTBsJ19c
X-Received: by 2002:a17:903:2c04:b0:2b2:4fcc:2687 with SMTP id d9443c01a7336-2b2d5a49c8cmr71870425ad.31.1775920170865;
        Sat, 11 Apr 2026 08:09:30 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.18.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f431c3sm58526515ad.79.2026.04.11.08.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 08:09:30 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH v2] Documentation: Refactored watchdog old doc
Date: Sat, 11 Apr 2026 20:39:14 +0530
Message-ID: <20260411150922.20536-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3e25ae54-e62d-484e-8d90-4f7825705e4f@roeck-us.net>
References: <3e25ae54-e62d-484e-8d90-4f7825705e4f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark WDIOC_GETTEMP and WDIOS_TEMPPANIC as deprecated since
neither is implemented by the watchdog core and both are only
present in a small number of legacy drivers.

Add documentation for previously undocumented status bits
WDIOF_MAGICCLOSE and WDIOF_ALARMONLY in the options field.

Add documentation for WDIOF_PRETIMEOUT and WDIOF_SETTIMEOUT
status bits describing their respective ioctls.

Fix the following issues in existing documentation:
  - Remove version-specific reference to Linux 2.4.18 from
    the GETTIMEOUT ioctl description
  - Fix duplicate "was is" in printf format strings
  - Replace [FIXME] placeholder with proper descriptions for
    WDIOS_DISABLECARD, WDIOS_ENABLECARD and WDIOS_TEMPPANIC

Signed-off-by: Sunny Patel <nueralspacetech@gmail.com>
---

Changes in v2:
  - Fixed typos: "tiemout" -> "timeout", "characted" -> "character"
  - Fixed "small number if legacy" -> "of legacy"
  - Fixed capitalization: "New Drivers" -> "New drivers", "USE" -> "Use"
  - Fixed spacing: "WDIOS_DISABLECARD,this" -> "WDIOS_DISABLECARD, this"
  - Fixed double spaces in two places
  - Added missing newline at end of file
  - Rewrote commit message

 Documentation/watchdog/watchdog-api.rst | 59 +++++++++++++++++++++----
 1 file changed, 51 insertions(+), 8 deletions(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 78e228c272cf..3e9021a79671 100644
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
+The watchdog supports timeout set/get via the WDIOC_SETTIMEOUT and
+WDIOC_GETTIMEOUT ioctls.
 
 	================	================================
 	WDIOF_PRETIMEOUT	Pretimeout (in seconds), get/set
 	================	================================
 
+The watchdog supports a pretimeout, a warning interrupt that fires before
+the actual reboot timeout. Use WDIOC_SETPRETIMEOUT and WDIOC_GETPRETIMEOUT
+to set/get the pretimeout.
+
+	================	================================
+	WDIOF_MAGICCLOSE	Supports magic close char
+	================	================================
+
+The driver supports the Magic Close feature, The watchdog is only disabled
+if the character 'V' is written to /dev/watchdog before the file descriptor
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
@@ -254,6 +274,11 @@ returned value is the temperature in degrees Fahrenheit::
     int temperature;
     ioctl(fd, WDIOC_GETTEMP, &temperature);
 
+.. deprecated::
+	``WDIOC_GETTEMP`` is not implemented by the watchdog core. It is only
+	supported by a small number of legacy drivers. New drivers should not
+	implement it.
+
 Finally the SETOPTIONS ioctl can be used to control some aspects of
 the cards operation::
 
@@ -268,4 +293,22 @@ The following options are available:
 	WDIOS_TEMPPANIC		Kernel panic on temperature trip
 	=================	================================
 
-[FIXME -- better explanations]
+``WDIOS_DISABLECARD`` stops the watchdog timer. The driver will cease
+pinging the hardware watchdog, allowing a controlled shutdown without
+a forced reboot. This is equivalent to the watchdog being disarmed.
+
+``WDIOS_ENABLECARD`` starts the watchdog timer. If the watchdog was
+previously stopped via ``WDIOS_DISABLECARD``, this will re-enable it. The
+hardware watchdog will begin counting down from the configured timeout.
+
+``WDIOS_TEMPPANIC`` enables temperature-based kernel panic. When set,
+the driver will call ``panic()`` (or ``kernel_power_off()`` on some
+drivers) if the hardware temperature sensor exceeds its threshold,
+rather than only setting the ``WDIOF_OVERHEAT`` status bit. Support
+for this option is driver-specific, not all watchdog drivers implement
+temperature monitoring.
+
+.. deprecated::
+	``WDIOS_TEMPPANIC`` is not implemented by the watchdog core and is only
+	present in a small number of legacy drivers. New drivers should not
+	implement it.
-- 
2.43.0

