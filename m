Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4262E37418C
	for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775987628; cv=none; b=CE1NjzJudqrYNMdVjpAy19G90kQ9UXeC+CckMrN9cS1BmJgIaUuuy7mnf873nE8Wn60Dn54Dy0t4ZpWk8LkEBRya5+/Sp2zkDCExHG9FVc7scML9sWgFH3lQhmhug+D/IeVXbBZrx6wnSZVD9mjKWOnzNVl0Vm0HkHqadTXfKSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775987628; c=relaxed/simple;
	bh=jZnww7sTjKwI8L3j9J7l3AfTgTXSm3kSCXq0cC+3GCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oQ5cjHezB1TiNpmxPopFKUJj6tpLRYcsxefu9CdcXQmJLcSztBp52Rri2iGTUtUTTuIpYJmm9nQv2uSBlxuesaX/en1gtlcNtRGHvgm/nhnLEHuM5cD4MSVn0MNdlcbkXbY6/CrOxJK9NHXIZqBXZR3GDOBOlMxsqXPJ3pYGw+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5wbfxET; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5wbfxET"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ab232cc803so16995965ad.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Apr 2026 02:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775987626; x=1776592426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbD+flsfonZZoNyS69lUCHnSInbIfPoXujp36zcL6wg=;
        b=g5wbfxETAjHJCUa2DZTN6+h+qHFV1d6qztpwTl3YQa047aQXh9chTHzfQRooTyWFty
         7jhrnCeNhMEDTYk1omjaxUv2J3Tx+IIw7sFhCi7WDKIn5uHxnCBdOyAUxLvUxKD6cZWL
         arpUMiNqXbjeXG4EYozDNjX83/LL1uwXP3+S4NuFOlCL+cANdp8RU+bZcaviLuAoxUc8
         tur9JYBPtqWOXqN+JYrJSC/ggzy4ATfyQIyCT3APMvGsRBQyXF62g5kr1j4RC67BVnkR
         E20mCysBNRt6af0xOKp+zAK0NjnoFDXN+Ex5dIpHcm8BEFHgkRQEzAaUARytKuZ0aDH+
         Qe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775987626; x=1776592426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbD+flsfonZZoNyS69lUCHnSInbIfPoXujp36zcL6wg=;
        b=QMJyJO0M1QsK2RgI4YVRFJXymXXMDZfHM+lK4vedAWnWLV3p5LaXNfZZF1lJNHU3u+
         tgpJ8IJrNHNNCy0ueKXIAs9xT8WEGNpgxZHaLEsIMgXwstyaHOXBGFRoU3QrM7QSYb+q
         Ngk7OhfWrm2+DtAufnsXEkhkRGyo8H7AnTr/0YgnSzpCUncA53EnPyjVsyT3t8tzCHvT
         FOBFlyhy7EXISZqLug6sTKIM77QEa6kkDgQL/Ov9ciYhN8zZc7W8egsIFWEY+EW2rxuh
         ehdvdjt3umlPWZ8KKpuGHC9H8BEFUU3R1V7TDbTahmNbELnM6kCQ0U9X/PkRMxQvZAIW
         KkvA==
X-Gm-Message-State: AOJu0Yys7S43is0mTh+jqK015Z4VSFGRg+r1ZKAPyyN+nnMYW8b//91U
	VIgMPz/tKokUGNy48a6qAKatp/WAMpwtHISj6FNHbq5EJwb1iKhVoL6RhSGeomK2dnc=
X-Gm-Gg: AeBDievYG57bNBUPL7hBUn/VjtPhIlXEFIL+eEq44ylLgVTY2rDok681veOq+EImlz8
	Z2Dbc4IeuNWFraxPinXS/GUSrPPJeUlkN4pG3iYSSFb1pBVxl7lRBPHODrfjJ5Aetqz137E8pBb
	hFZTTIVLicBlyQ9gSdAYGnZ/eFlMCz0zdlm3askmPPEMcD0cYHrKFVH9fgUtpoAZ6GR7nMIV/nr
	yN27XrkHUhl8WtZaMnqE8M5RfoH5Od7uQftobq3ds+oG2apyJLsiEmaf1oBBzg3/UH5eCQKt1fL
	Dmb6mij5+JlZIvbF7NuMuU6IRsgX5FaXKPJBXxBvxZe19mO1jqH1HNtT/Y73QsQcyAoIlDdLLLT
	SYMRkVMV0yYF6l73lljzlReplv9Wbqbb9fMXTqKzBSKrDYLXS2Mdv7stXE6dURS/Hot78HYbSUF
	rtcDg9rU33yvKDr8MymzH5QT646/QAf7FFWQpfTur/y7z3
X-Received: by 2002:a17:903:acb:b0:2b0:5cb4:d89d with SMTP id d9443c01a7336-2b2d5a698e9mr102220615ad.29.1775987626300;
        Sun, 12 Apr 2026 02:53:46 -0700 (PDT)
Received: from tech-Alienware-m15-R6.. ([122.171.18.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f099d6sm100360175ad.50.2026.04.12.02.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 02:53:45 -0700 (PDT)
From: Sunny Patel <nueralspacetech@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	rdunlap@infradead.org,
	Sunny Patel <nueralspacetech@gmail.com>
Subject: [PATCH v4] Documentation: Refactored watchdog old doc
Date: Sun, 12 Apr 2026 15:23:20 +0530
Message-ID: <20260412095338.52271-1-nueralspacetech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Changes in v4:
  - Fixed WDIOS_DISABLECARD description: corrected inverted logic —
    the ioctl disables the hardware timer entirely rather than
    stopping pings. Clarified that userspace, not the kernel driver,
    is primarily responsible for pinging under normal operation.

Apologies for the broken mail threading on v2 and v3 as well.

 Documentation/watchdog/watchdog-api.rst | 65 +++++++++++++++++++++----
 1 file changed, 55 insertions(+), 10 deletions(-)

diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
index 78e228c272cf..43ca6b2bbeff 100644
--- a/Documentation/watchdog/watchdog-api.rst
+++ b/Documentation/watchdog/watchdog-api.rst
@@ -2,7 +2,7 @@
 The Linux Watchdog driver API
 =============================
 
-Last reviewed: 10/05/2007
+Last reviewed: 04/08/2026
 
 
 
@@ -42,7 +42,7 @@ activates as soon as /dev/watchdog is opened and will reboot unless
 the watchdog is pinged within a certain time, this time is called the
 timeout or margin.  The simplest way to ping the watchdog is to write
 some data to the device.  So a very simple watchdog daemon would look
-like this source file:  see samples/watchdog/watchdog-simple.c
+like this source file: see samples/watchdog/watchdog-simple.c
 
 A more advanced driver could for example check that a HTTP server is
 still responding before doing the write call to ping the watchdog.
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
 
@@ -145,12 +144,12 @@ before the system will reboot. The WDIOC_GETTIMELEFT is the ioctl
 that returns the number of seconds before reboot::
 
     ioctl(fd, WDIOC_GETTIMELEFT, &timeleft);
-    printf("The timeout was is %d seconds\n", timeleft);
+    printf("The timeout is %d seconds\n", timeleft);
 
 Environmental monitoring
 ========================
 
-All watchdog drivers are required return more information about the system,
+All watchdog drivers are required to return more information about the system,
 some do temperature, fan and power level monitoring, some can tell you
 the reason for the last reboot of the system.  The GETSUPPORT ioctl is
 available to ask what the device can do::
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
+The driver supports the Magic Close feature. The watchdog is only disabled
+if the character 'V' is written to /dev/watchdog before the file descriptor
+is closed. Without writing 'V' before closing, the watchdog remains active
+and will trigger a reboot after the timeout expires.
+
+	================	================================
+	WDIOF_ALARMONLY		Not a reboot watchdog
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
 
+.. note::
+	``WDIOC_GETTEMP`` is not implemented by the watchdog core and is
+	considered deprecated. It is only supported by a small number of
+	legacy drivers. New drivers should not implement it.
+
 Finally the SETOPTIONS ioctl can be used to control some aspects of
 the cards operation::
 
@@ -268,4 +293,24 @@ The following options are available:
 	WDIOS_TEMPPANIC		Kernel panic on temperature trip
 	=================	================================
 
-[FIXME -- better explanations]
+``WDIOS_DISABLECARD`` disables the hardware watchdog timer entirely,
+allowing a controlled system shutdown without triggering a reboot.
+Userspace is responsible for pinging the watchdog under normal
+operation; this ioctl stops the underlying hardware timer so that
+the absence of pings no longer causes a system reset.
+
+``WDIOS_ENABLECARD`` starts the watchdog timer. If the watchdog was
+previously stopped via ``WDIOS_DISABLECARD``, this will re-enable it. The
+hardware watchdog will begin counting down from the configured timeout.
+
+``WDIOS_TEMPPANIC`` enables temperature-based kernel panic. When set,
+the driver will call ``panic()`` (or ``kernel_power_off()`` on some
+drivers) if the hardware temperature sensor exceeds its threshold,
+rather than only setting the ``WDIOF_OVERHEAT`` status bit. Support
+for this option is driver-specific; not all watchdog drivers implement
+temperature monitoring.
+
+.. note::
+	``WDIOS_TEMPPANIC`` is not implemented by the watchdog core and is
+	considered deprecated. It is only present in a small number of
+	legacy drivers. New drivers should not implement it.
-- 
2.43.0

