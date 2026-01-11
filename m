Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ABA318ED4
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 17:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768151229; cv=none; b=u0OmNkGFPpMaGgzsNsYYxArkPEmSJ6Z00w3PvRiRJ2ZdikqoQ4aB/D0yCrOS0TYzQUT3CD4YOTOmS4HDnOQ8ZYxeWtbKqnNd26+cZS83UnPVEEFk94YXW/63SML7Uup2RBTHcsjLmEXUYcIoX7G3RWVoPi6jHhK7XSgVYqq6Hog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768151229; c=relaxed/simple;
	bh=wz7FblE/xXYcDQlTNm5YbDvqQZmOmyT2EmHIjH1APqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q7UoP1tdY5uhTbyeuQmOkAcK9yBCPYdOlhGvpL8k57CL2vcaT/doOwWYNIX+XhamTAY2TRwbNKmgCqOQ/Ri8P3OtOrPtf81drEemsfl1oQn7y7w5fH97T0LC65Mm4H20dEFCzAf52I1K+kjwZZWI4Se6Prm4WQ7eTU7x8evd3Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFDMLkgE; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFDMLkgE"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b871cfb49e6so19055466b.1
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 09:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768151225; x=1768756025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pI2GlQSfvL0dkZRygZ9J3EyE8XHuR7urKlW88RORvw=;
        b=kFDMLkgEqM54D29b3WfjX29ctJzmY/vzg8nXkrgtEP6I2domfA15IDcNhI/43CQkWS
         zlYqpjzdzEqqovNh8zFIz/qnoEq/oLgBIsx6DHXE1T9MfHNOl8nHsoPj8vsAMLJcS5/i
         YkBZW1kTnOSLvM9D2Bnt+QcWAzjIA6CLF/gizhmYlind6mauWKwPntHADXoS/qtD30XA
         arJ9qW9UBBpoGv/Z++56tPY+D20Km9uHVQ7mUTIE6SFK7XQQ/gafK/vYSPYxifvw156U
         dSVPsCb9btMQZv8yYjNuNN7rcH8jeP8zxV+6wQcQt94KdCmBXg8MJODXP+4ULcVd5DeX
         oxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768151225; x=1768756025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pI2GlQSfvL0dkZRygZ9J3EyE8XHuR7urKlW88RORvw=;
        b=drOtt+aGcroqAfJBGBdrirHnlHMXt+++j48t3geUlv6UX55SwzrcHhYZSLe5mwY+WH
         kfsxK5PkUorOOit52roIKe9hTMaQNtd0uY0nP8OVU+d2mWoCN5+DRAE/oqnmMjaohP+q
         RcYTZyhm3FfXaCVBB/QHzgEPW2Mw6Z6lVpzMrdj7L5TJI42Y6ovFd9VmueUozRaWYa+p
         OCR3Vq2YMg7g6LxK6MNyL0KQW0o2hXcRoubyTciYuhvM86vE3ZQJBJsDDgOOhg1FXTqy
         3Qu44xgIJfGsHZ5FQyL+Q4FytOsqxv8zngz+AQdmol9u9xz+5L80dyRSwtaUiSANGYE0
         lqvA==
X-Gm-Message-State: AOJu0Yz2W0i6YS+2a6D9/TFKn86Opsje+2U4yn9kP1/Y5UGn0mBb7jXI
	em1Z8xow168dIV/+0mosogFGLNqHXvvThRhRhBtb1YqC+fqXnk6voHTz
X-Gm-Gg: AY/fxX5jwr9NH02uovG84diOkzhhYX+KATI4juRPwN6qPWWYtwfK5P67ZAHvEOw0faQ
	5PexbdGGX4sYhySqaDEC+Pvaj25X32bcRmWft+9a4UgJUlDcCOpOi3cvYjPcioq5zovGc7gFSmU
	YjuptmP2HqnRjnx8RE2Kqgl1rDRUqphSo3WhnxLA35ds0uL2xR4t3usk0VlhPawK7urDiqNa3OK
	jlfLsBW13F8aok9uKAQAiZjspf9JoeVKJ+JNsntMAAwMTfIquXrnNeeTnIOFxKEyNWPoGjo3tm1
	hfdLpF2WgSrhhxTlyDRtbiYl7s7GwUlIvxkYj4gC3Cbd1IdzAkab7tahWc6Zgjylbwhu+DC7UQI
	Coif2iSOVDlljm/Ep3pUW9+vwCzEJMuuR5KhLaCBPGkRbplNb2jwW9bOjNHFd1vXtCFzgPCfmJG
	stBpY6fNql3+UlUaliHgFZiDUx4Dlch9hasZEoX3yS15ziyCPvTap3jxiZo5psKGMjJkrrQuScB
	OsKvdeJLGrmw0e9IJz27mj2CZ2ZMPAqOppBDxHdzcVt0uI=
X-Google-Smtp-Source: AGHT+IFdofQMCFaweRF/vGOMeM7MmC1JqZwhLDNsy0pxBdgMTOQ+lNRn3qIE3D/w/WNLijro2/f5nw==
X-Received: by 2002:a17:907:84e:b0:b80:402e:6e77 with SMTP id a640c23a62f3a-b84453ddd9bmr1336606966b.54.1768151224889;
        Sun, 11 Jan 2026 09:07:04 -0800 (PST)
Received: from localhost.localdomain (p200300e927076b8419a2308b15d6c5b2.dip0.t-ipconnect.de. [2003:e9:2707:6b84:19a2:308b:15d6:c5b2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8715d0e99asm133393366b.51.2026.01.11.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 09:07:04 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [PATCH] Documentation: Fix typos and grammatical errors
Date: Sun, 11 Jan 2026 17:59:01 +0100
Message-ID: <20260111165901.8508-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various typos and grammatical errors across multiple documentation
files to improve clarity and consistency.

Changes include:
- Fix missing preposition 'in' in process/changes.rst
- Correct 'result by' to 'result from' in admin-guide/README.rst
- Standardize spelling to 'recognized' in admin-guide/README.rst
- Fix 'before hand' to 'beforehand' (3 instances) in cgroup-v1/hugetlb.rst
- Correct 'allows to limit' to 'allows limiting' in cgroup-v1/hugetlb.rst,
  cgroup-v2.rst, and kconfig-language.rst
- Fix 'needs precisely know' to 'needs to precisely know' in
  cgroup-v1/hugetlb.rst
- Correct 'overcommited' to 'overcommitted' in cgroup-v1/hugetlb.rst
- Remove incorrect plural from uncountable nouns: 'metadatas' to 'metadata'
  in filesystems/erofs.rst, and 'hardwares' to 'hardware' in
  devicetree/bindings/.../mediatek,dp.yaml, userspace-api/.../legacy_dvb_audio.rst,
  and scsi/ChangeLog.sym53c8xx

These corrections improve the overall quality and readability of the
kernel documentation.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 Documentation/admin-guide/README.rst                 |  4 ++--
 Documentation/admin-guide/cgroup-v1/hugetlb.rst      | 12 ++++++------
 Documentation/admin-guide/cgroup-v2.rst              |  2 +-
 .../bindings/display/mediatek/mediatek,dp.yaml       |  2 +-
 Documentation/filesystems/erofs.rst                  |  2 +-
 Documentation/kbuild/kconfig-language.rst            |  2 +-
 Documentation/process/changes.rst                    |  2 +-
 Documentation/scsi/ChangeLog.sym53c8xx               |  2 +-
 .../userspace-api/media/dvb/legacy_dvb_audio.rst     |  2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 05301f03b..65a06f946 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -53,7 +53,7 @@ Documentation
    these typically contain kernel-specific installation notes for some
    drivers for example. Please read the
    :ref:`Documentation/process/changes.rst <changes>` file, as it
-   contains information about the problems, which may result by upgrading
+   contains information about the problems which may result from upgrading
    your kernel.
 
 Installing the kernel source
@@ -264,7 +264,7 @@ Compiling the kernel
 
  - Do a ``make`` to create a compressed kernel image. It is also possible to do
    ``make install`` if you have lilo installed or if your distribution has an
-   install script recognised by the kernel's installer. Most popular
+   install script recognized by the kernel's installer. Most popular
    distributions will have a recognized install script. You may want to
    check your distribution's setup first.
 
diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
index 493a8e386..02f8cd0f1 100644
--- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
+++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
@@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
 doesn't support page reclaim, enforcing the limit at page fault time implies
 that, the application will get SIGBUS signal if it tries to fault in HugeTLB
 pages beyond its limit. Therefore the application needs to know exactly how many
-HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
+HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
 there are enough available on the machine for all the users to avoid processes
 getting SIGBUS.
 
@@ -91,11 +91,11 @@ getting SIGBUS.
   hugetlb.<hugepagesize>.rsvd.usage_in_bytes
   hugetlb.<hugepagesize>.rsvd.failcnt
 
-The HugeTLB controller allows to limit the HugeTLB reservations per control
+The HugeTLB controller allows limiting the HugeTLB reservations per control
 group and enforces the controller limit at reservation time and at the fault of
 HugeTLB memory for which no reservation exists. Since reservation limits are
 enforced at reservation time (on mmap or shget), reservation limits never causes
-the application to get SIGBUS signal if the memory was reserved before hand. For
+the application to get SIGBUS signal if the memory was reserved beforehand. For
 MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
 limit, enforcing memory usage at fault time and causing the application to
 receive a SIGBUS if it's crossing its limit.
@@ -103,11 +103,11 @@ receive a SIGBUS if it's crossing its limit.
 Reservation limits are superior to page fault limits described above, since
 reservation limits are enforced at reservation time (on mmap or shget), and
 never causes the application to get SIGBUS signal if the memory was reserved
-before hand. This allows for easier fallback to alternatives such as
+beforehand. This allows for easier fallback to alternatives such as
 non-HugeTLB memory for example. In the case of page fault accounting, it's very
-hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
+hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
 the HugeTLB usage of all the tasks in the system and make sure there is enough
-pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
+pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
 systems is practically impossible with page fault accounting.
 
 
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95..098d6831b 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2816,7 +2816,7 @@ DMEM Interface Files
 HugeTLB
 -------
 
-The HugeTLB controller allows to limit the HugeTLB usage per control group and
+The HugeTLB controller allows limiting the HugeTLB usage per control group and
 enforces the controller limit during page fault.
 
 HugeTLB Interface Files
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 274f59080..8f4bd9fb5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  MediaTek DP and eDP are different hardwares and there are some features
+  MediaTek DP and eDP are different hardware and there are some features
   which are not supported for eDP. For example, audio is not supported for
   eDP. Therefore, we need to use two different compatibles to describe them.
   In addition, We just need to enable the power domain of DP, so the clock
diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 08194f194..e61db115e 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -154,7 +154,7 @@ to be as simple as possible::
   0 +1K
 
 All data areas should be aligned with the block size, but metadata areas
-may not. All metadatas can be now observed in two different spaces (views):
+may not. All metadata can be now observed in two different spaces (views):
 
  1. Inode metadata space
 
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15..7067ec3f0 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -216,7 +216,7 @@ applicable everywhere (see syntax).
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
 
-  This allows to limit the range of possible input values for int
+  This allows limiting the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 62951cdb1..0cf97dbab 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
 Linux documentation for functions is transitioning to inline
 documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
-files the Documentation/ directory to make enriched documentation, which can
+files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
 In order to convert from ReST format to a format of your choice, you'll need
 Sphinx.
diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
index 3435227a2..6bca91e03 100644
--- a/Documentation/scsi/ChangeLog.sym53c8xx
+++ b/Documentation/scsi/ChangeLog.sym53c8xx
@@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
 	  Fix sent by Stig Telfer <stig@api-networks.com>.
 	- Backport from SYM-2 the work-around that allows to support 
-	  hardwares that fail PCI parity checking.
+	  hardware that fails PCI parity checking.
 	- Check that we received at least 8 bytes of INQUIRY response 
 	  for byte 7, that contains device capabilities, to be valid.
 	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 81b762ef1..99ffda355 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -444,7 +444,7 @@ Description
 ~~~~~~~~~~~
 
 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
+following bits set according to the hardware's capabilities.
 
 
 -----
-- 
2.52.0

