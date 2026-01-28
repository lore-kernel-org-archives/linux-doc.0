Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343A342CB1
	for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 22:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637785; cv=none; b=OAj5kDWrhCHE4HemaC3m0t/1zAVygnheDXrGJiMysa7A6EkWs5qJV+L60ejruCSYhJl2hZV9Ci+LyIgwDd6+Den/RLaH6HjpBuGGXyqkVtlUATW4zoyM35UK2avIPg4uxL4P30R7Ymi2zVWAsgXiRWcyP015+rG0j1fGaAahRUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637785; c=relaxed/simple;
	bh=ZtbU3D1WDUFk8SZGtEKE3SbItI5Z16+d0UMDKB0fQNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZmrPH3GwimhZKt4G+HqfY5JMiqUZzAT+Kf+e3kxDG6JMMdLj2xJi88BW8ncuw6qGctFmjRH+tcWF2SvphQAS5VS6GaEscQUiSIjOe0KijBS6KCRf1zX89eob9k7/RPLVpp8mA9JZGDxaMt3mCpGodiaX2v/0itadd0UyQf1ZvlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20230601.gappssmtp.com header.i=@tumelty-co-uk.20230601.gappssmtp.com header.b=V79pTx1g; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20230601.gappssmtp.com header.i=@tumelty-co-uk.20230601.gappssmtp.com header.b="V79pTx1g"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-4358fb60802so173645f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 14:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20230601.gappssmtp.com; s=20230601; t=1769637781; x=1770242581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzTZT7Yv0iT/f2RZU13M5yG6g7XquRO98kCEWaM5wiQ=;
        b=V79pTx1gT2jsIzbNqIqoRDhZ5WplykwiIReD4WYNov8Zt8rZov0wA7F6tc9Y5bGLQg
         RFHPoXE1IcNX2ShX2lhOy1fsKXWtCg37/xc19X8ZNwE+1VIk6VW4h/h8zrWUCr3BWFEf
         F0QMUfXvY4QN3Idkyxll7hst217BjjNZhO/RrE/lW4scsRrUugy72tOI8X0eN6mKV0tc
         o4Rwiu/SoJq1K83jYoSbO0MTJwu9TJzduwyc/+41FhAGF3nI0eEnYIisLOHx1YQB/gkQ
         lsxZHa+IdCeTW4HTmzK0ZMzjoxmJg6FSiMW7YqnATCb7OHFk1hBfCA/lL06uA6ieSsvN
         MoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769637781; x=1770242581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzTZT7Yv0iT/f2RZU13M5yG6g7XquRO98kCEWaM5wiQ=;
        b=F6I4WyZEkIb9GzLRCpIqmhUcxJq9bNDHchO7NjiC2eOgwEcDb2bIwgREZy+ReUW4Sg
         miShnsWjCOPVqRAPhV60a5P3uB5N7MkUOzT+vp7xRq8alSND1VANZmbzlikAUasM92Tc
         1r9MJY1igBruwfoUtp/NoCLAJDfrURwM2i80zPZTWE/gcEWQHnzpTIOp82Pp69qShluD
         Mpep0Z3WHTg2LSnh32WENx/wkEGyCY2eiUVNzasrwg74zLKJyHlXvaxFboxL40cD4erI
         CFeKWHXUMvjn4L0tR9pOxl6TfYN7QivPjSBQYyTDLi307r/ZVFVW5sAc+aaZtdfzZosU
         v69A==
X-Gm-Message-State: AOJu0YzU0Kadx3m1Q5ASjLF0f3WqyReDdhxhsmMGyZw5xqOKFIEZ75ac
	PkXYq3vDlZOazXMKKtBf4HmhYJAB1WBZtMARJiHWiG7eGRZFEHcVriiY8B860QcXRwgNWTBSnJW
	e0TMVm7Y=
X-Gm-Gg: AZuq6aJBnSJZyfry08yq3vr5B7KiKImUmvZ0GPtCMwzYAIbKsD6ZnqexpzSn6IikaaP
	CqZhcfySgOIYffDhd2dB5LJEeElAGnQKEAgdP3lncPNzV8B2AP1LupfUu3i3vrw7k1V7K9CGBs+
	ZbmgRnbPRMpjPtLODxAmFBTQQHx0yciOo1djeZ2TwZAoUJmSNnX0BsAddqlcUG7QfwtioTNnb66
	V4ffD/WJUby57qGNufpDLQR1EokkAyWzFKwcBslTqJp6m+4NaHFnNOF9/nwggbu/owlRxwLOVaE
	WF+WkgePKvgRhDN9FWDOGXYU2NhSXhBlhRiCv3q7ZZeab6gB/mFkzgTusI21CpKerTBRnc3JPXS
	ia19CqB2gai7OIkAIn7X/AbRzCA4JWN8nN5TfWXRkEQvtoqcDpEgdV9svbHyN8j8Spt8ScIy5tc
	0HqATBEk+qCf17WkZ9baAwBkumIaMQVCY8CW1yske+6/hkt7gj4tGIhqunGJ74Kc1eJumF12U=
X-Received: by 2002:a5d:584e:0:b0:435:96b3:68d0 with SMTP id ffacd0b85a97d-435ea064631mr1281880f8f.5.1769637780843;
        Wed, 28 Jan 2026 14:03:00 -0800 (PST)
Received: from glacier (cpc103552-stkn17-2-0-cust928.11-2.cable.virginm.net. [82.2.171.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132368csm9047488f8f.31.2026.01.28.14.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 14:03:00 -0800 (PST)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	trivial@kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] docs: fix 're-use' -> 'reuse' in documentation
Date: Wed, 28 Jan 2026 22:02:31 +0000
Message-ID: <20260128220233.179439-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 Documentation/ABI/testing/pstore                           | 2 +-
 Documentation/admin-guide/initrd.rst                       | 2 +-
 Documentation/admin-guide/kdump/kdump.rst                  | 2 +-
 Documentation/admin-guide/mm/nommu-mmap.rst                | 2 +-
 Documentation/arch/arm64/arm-acpi.rst                      | 4 ++--
 Documentation/arch/s390/driver-model.rst                   | 2 +-
 Documentation/arch/x86/shstk.rst                           | 2 +-
 Documentation/driver-api/phy/phy.rst                       | 2 +-
 Documentation/driver-api/tty/tty_ldisc.rst                 | 2 +-
 Documentation/driver-api/usb/gadget.rst                    | 2 +-
 Documentation/filesystems/relay.rst                        | 2 +-
 Documentation/filesystems/resctrl.rst                      | 2 +-
 Documentation/firmware-guide/acpi/DSD-properties-rules.rst | 2 +-
 Documentation/firmware-guide/acpi/enumeration.rst          | 2 +-
 Documentation/input/gamepad.rst                            | 2 +-
 Documentation/process/adding-syscalls.rst                  | 4 ++--
 Documentation/sound/hd-audio/notes.rst                     | 2 +-
 17 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/ABI/testing/pstore b/Documentation/ABI/testing/pstore
index d3cff4a7e..dfe2d9801 100644
--- a/Documentation/ABI/testing/pstore
+++ b/Documentation/ABI/testing/pstore
@@ -26,7 +26,7 @@ Description:	Generic interface to platform dependent persistent storage.
 
 		Once the information in a file has been read, removing
 		the file will signal to the underlying persistent storage
-		device that it can reclaim the space for later re-use::
+		device that it can reclaim the space for later reuse::
 
 		    $ rm /sys/fs/pstore/dmesg-erst-1
 
diff --git a/Documentation/admin-guide/initrd.rst b/Documentation/admin-guide/initrd.rst
index 67bbad880..6c1660a4c 100644
--- a/Documentation/admin-guide/initrd.rst
+++ b/Documentation/admin-guide/initrd.rst
@@ -297,7 +297,7 @@ as follows:
   8) now the system is bootable and additional installation tasks can be
      performed
 
-The key role of initrd here is to re-use the configuration data during
+The key role of initrd here is to reuse the configuration data during
 normal system operation without requiring the use of a bloated "generic"
 kernel or re-compiling or re-linking the kernel.
 
diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 7b011eb11..7587caadb 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -591,7 +591,7 @@ with /sys/kernel/config/crash_dm_crypt_keys for setup,
     cat /sys/kernel/config/crash_dm_crypt_keys/count
     2
 
-    # To support CPU/memory hot-plugging, re-use keys already saved to reserved
+    # To support CPU/memory hot-plugging, reuse keys already saved to reserved
     # memory
     echo true > /sys/kernel/config/crash_dm_crypt_key/reuse
 
diff --git a/Documentation/admin-guide/mm/nommu-mmap.rst b/Documentation/admin-guide/mm/nommu-mmap.rst
index 530fed08d..8a1949b36 100644
--- a/Documentation/admin-guide/mm/nommu-mmap.rst
+++ b/Documentation/admin-guide/mm/nommu-mmap.rst
@@ -38,7 +38,7 @@ and it's also much more restricted in the latter case:
 
 	In the no-MMU case:
 
-         - If one exists, the kernel will re-use an existing mapping to the
+         - If one exists, the kernel will reuse an existing mapping to the
            same segment of the same file if that has compatible permissions,
            even if this was created by another process.
 
diff --git a/Documentation/arch/arm64/arm-acpi.rst b/Documentation/arch/arm64/arm-acpi.rst
index e59e4505d..e74c8ab71 100644
--- a/Documentation/arch/arm64/arm-acpi.rst
+++ b/Documentation/arch/arm64/arm-acpi.rst
@@ -306,9 +306,9 @@ that looks like this: Name(KEY0, "value0").  An ACPI device driver would
 then retrieve the value of the property by evaluating the KEY0 object.
 However, using Name() this way has multiple problems: (1) ACPI limits
 names ("KEY0") to four characters unlike DT; (2) there is no industry
-wide registry that maintains a list of names, minimizing re-use; (3)
+wide registry that maintains a list of names, minimizing reuse; (3)
 there is also no registry for the definition of property values ("value0"),
-again making re-use difficult; and (4) how does one maintain backward
+again making reuse difficult; and (4) how does one maintain backward
 compatibility as new hardware comes out?  The _DSD method was created
 to solve precisely these sorts of problems; Linux drivers should ALWAYS
 use the _DSD method for device properties and nothing else.
diff --git a/Documentation/arch/s390/driver-model.rst b/Documentation/arch/s390/driver-model.rst
index e7488f02b..14f801e0d 100644
--- a/Documentation/arch/s390/driver-model.rst
+++ b/Documentation/arch/s390/driver-model.rst
@@ -279,7 +279,7 @@ status
        - Can be 'online' or 'offline'.
 	 Piping 'on' or 'off' sets the chpid logically online/offline.
 	 Piping 'on' to an online chpid triggers path reprobing for all devices
-	 the chpid connects to. This can be used to force the kernel to re-use
+	 the chpid connects to. This can be used to force the kernel to reuse
 	 a channel path the user knows to be online, but the machine hasn't
 	 created a machine check for.
 
diff --git a/Documentation/arch/x86/shstk.rst b/Documentation/arch/x86/shstk.rst
index 60260e809..30b4e4f36 100644
--- a/Documentation/arch/x86/shstk.rst
+++ b/Documentation/arch/x86/shstk.rst
@@ -165,7 +165,7 @@ in the page fault error code.
 When a task forks a child, its shadow stack PTEs are copied and both the
 parent's and the child's shadow stack PTEs are cleared of the dirty bit.
 Upon the next shadow stack access, the resulting shadow stack page fault
-is handled by page copy/re-use.
+is handled by page copy/reuse.
 
 When a pthread child is created, the kernel allocates a new shadow stack
 for the new thread. New shadow stack creation behaves like mmap() with respect
diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 719a2b3fd..0865c2e94 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -19,7 +19,7 @@ PHY. Other peripherals that use PHY include Wireless LAN, Ethernet,
 SATA etc.
 
 The intention of creating this framework is to bring the PHY drivers spread
-all over the Linux kernel to drivers/phy to increase code re-use and for
+all over the Linux kernel to drivers/phy to increase code reuse and for
 better code maintainability.
 
 This framework will be of use only to devices that use external PHY (PHY
diff --git a/Documentation/driver-api/tty/tty_ldisc.rst b/Documentation/driver-api/tty/tty_ldisc.rst
index 5144751be..d034e117c 100644
--- a/Documentation/driver-api/tty/tty_ldisc.rst
+++ b/Documentation/driver-api/tty/tty_ldisc.rst
@@ -18,7 +18,7 @@ Registration
 Line disciplines are registered with tty_register_ldisc() passing the ldisc
 structure. At the point of registration the discipline must be ready to use and
 it is possible it will get used before the call returns success. If the call
-returns an error then it won’t get called. Do not re-use ldisc numbers as they
+returns an error then it won’t get called. Do not reuse ldisc numbers as they
 are part of the userspace ABI and writing over an existing ldisc will cause
 demons to eat your computer. You must not re-register over the top of the line
 discipline even with the same data or your computer again will be eaten by
diff --git a/Documentation/driver-api/usb/gadget.rst b/Documentation/driver-api/usb/gadget.rst
index 09396edd6..6f0c67885 100644
--- a/Documentation/driver-api/usb/gadget.rst
+++ b/Documentation/driver-api/usb/gadget.rst
@@ -459,7 +459,7 @@ Linux-USB host side driver stack, or as a peripheral, using this
 ``gadget`` framework. To do that, the system software relies on small
 additions to those programming interfaces, and on a new internal
 component (here called an "OTG Controller") affecting which driver stack
-connects to the OTG port. In each role, the system can re-use the
+connects to the OTG port. In each role, the system can reuse the
 existing pool of hardware-neutral drivers, layered on top of the
 controller driver interfaces (:c:type:`usb_bus` or :c:type:`usb_gadget`).
 Such drivers need at most minor changes, and most of the calls added to
diff --git a/Documentation/filesystems/relay.rst b/Documentation/filesystems/relay.rst
index 301ff4c6e..dd6b52612 100644
--- a/Documentation/filesystems/relay.rst
+++ b/Documentation/filesystems/relay.rst
@@ -452,7 +452,7 @@ closed.
 Misc
 ----
 
-Some applications may want to keep a channel around and re-use it
+Some applications may want to keep a channel around and reuse it
 rather than open and close a new channel for each use.  relay_reset()
 can be used for this purpose - it resets a channel to its initial
 state without reallocating channel buffer memory or destroying
diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index 8c8ce6781..5b27321f2 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -482,7 +482,7 @@ with the following files:
 "max_threshold_occupancy":
 		Read/write file provides the largest value (in
 		bytes) at which a previously used LLC_occupancy
-		counter can be considered for re-use.
+		counter can be considered for reuse.
 
 Finally, in the top level of the "info" directory there is a file
 named "last_cmd_status". This is reset with every "command" issued
diff --git a/Documentation/firmware-guide/acpi/DSD-properties-rules.rst b/Documentation/firmware-guide/acpi/DSD-properties-rules.rst
index 70442bc25..98a350250 100644
--- a/Documentation/firmware-guide/acpi/DSD-properties-rules.rst
+++ b/Documentation/firmware-guide/acpi/DSD-properties-rules.rst
@@ -89,7 +89,7 @@ In those cases, however, the above validity considerations must be taken into
 account in the first place and returning invalid property sets from _DSD must be
 avoided.  For this reason, it may not be possible to make _DSD return a property
 set following the given DT binding literally and completely.  Still, for the
-sake of code re-use, it may make sense to provide as much of the configuration
+sake of code reuse, it may make sense to provide as much of the configuration
 data as possible in the form of device properties and complement that with an
 ACPI-specific mechanism suitable for the use case at hand.
 
diff --git a/Documentation/firmware-guide/acpi/enumeration.rst b/Documentation/firmware-guide/acpi/enumeration.rst
index 0165b09c0..168c43012 100644
--- a/Documentation/firmware-guide/acpi/enumeration.rst
+++ b/Documentation/firmware-guide/acpi/enumeration.rst
@@ -12,7 +12,7 @@ In addition we are starting to see peripherals integrated in the
 SoC/Chipset to appear only in ACPI namespace. These are typically devices
 that are accessed through memory-mapped registers.
 
-In order to support this and re-use the existing drivers as much as
+In order to support this and reuse the existing drivers as much as
 possible we decided to do following:
 
   - Devices that have no bus connector resource are represented as
diff --git a/Documentation/input/gamepad.rst b/Documentation/input/gamepad.rst
index 0c918b6f2..ddc65fa36 100644
--- a/Documentation/input/gamepad.rst
+++ b/Documentation/input/gamepad.rst
@@ -79,7 +79,7 @@ change the mappings so you can advise users to set these.
 All new gamepads are supposed to comply with this mapping. Please report any
 bugs, if they don't.
 
-There are a lot of less-featured/less-powerful devices out there, which re-use
+There are a lot of less-featured/less-powerful devices out there, which reuse
 the buttons from this protocol. However, they try to do this in a compatible
 fashion. For example, the "Nintendo Wii Nunchuk" provides two trigger buttons
 and one analog stick. It reports them as if it were a gamepad with only one
diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index fc0b0bbcd..f41f36ce8 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -117,7 +117,7 @@ then the flags argument should include a value that is equivalent to setting
 the timing window between ``xyzzy()`` and calling
 ``fcntl(fd, F_SETFD, FD_CLOEXEC)``, where an unexpected ``fork()`` and
 ``execve()`` in another thread could leak a descriptor to
-the exec'ed program. (However, resist the temptation to re-use the actual value
+the exec'ed program. (However, resist the temptation to reuse the actual value
 of the ``O_CLOEXEC`` constant, as it is architecture-specific and is part of a
 numbering space of ``O_*`` flags that is fairly full.)
 
@@ -459,7 +459,7 @@ the compatibility wrapper::
     ...
     555   x32      xyzzy     __x32_compat_sys_xyzzy
 
-If no pointers are involved, then it is preferable to re-use the 64-bit system
+If no pointers are involved, then it is preferable to reuse the 64-bit system
 call for the x32 ABI (and consequently the entry in
 arch/x86/entry/syscalls/syscall_64.tbl is unchanged).
 
diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index f81e94d8f..6993bfa15 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -191,7 +191,7 @@ model is found in the white-list, the driver assumes the static
 configuration of that preset with the correct pin setup, etc.
 Thus, if you have a newer machine with a slightly different PCI SSID
 (or codec SSID) from the existing one, you may have a good chance to
-re-use the same model.  You can pass the ``model`` option to specify the
+reuse the same model.  You can pass the ``model`` option to specify the
 preset model instead of PCI (and codec-) SSID look-up.
 
 What ``model`` option values are available depends on the codec chip.
-- 
2.51.2

