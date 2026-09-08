Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76938C2D0
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850917; cv=none; b=mbwZzWTxY0VIaUI614TW5rZoM5AcvbcxxOwKSSRG4OMM5t8erKk2yV/f/El7Wb8bWWDzdnZTKqabJO4bx4zdcYpUouqD5pg1Xm5UKIwkxgLQ5gVilsq0BT+jesQJZ0lTyT/BCGH6V+12p6g5ATfU1kt+4mG2JGmtBrX8iwXPVdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850917; c=relaxed/simple;
	bh=woDkwfEuwfC4HRUIw5dO9ioa2u5fHtmv49TNTjh7IRc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=RVLVwe1oJDvIrznAv899Fhe+X0b9LcOnTUFTZBBa6iYe9lPnuz5tfiQf80BQmX3fHpdmtzrz6rvfNKdYhjeCcbZf386UuBJzAGyfcwirZFbFgssBWV5XZzkB23NH9J+qqWYOGyw92U4em8eONDnSx/FAtAxjAaiRO//eRA1Fi0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnBxDwkw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnBxDwkw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b965570d7so49563285e9.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788850914; x=1789455714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwflIzcBWQAlCH5G1lHkwk2yyve824n1VD85Tvhgohg=;
        b=RnBxDwkw7EVTyjvF443+sxnRHTt4XpyamutejmOuGgzQwz/Me/143o+SkL2li0mIUH
         kp7AWndd+lwGR28dJOXONXKRPvFlAy8pFUc6Iver2KKiXeHWKXT1rQ9DqHJW/bML9pPE
         IS+2GY6Az7aDFvuQtG9qd/hnQy2MkIszVTDtfpVWfiTxIqYK46iEInL3HQ0MmG0wD3t6
         MV7JvvyqwaEzzTy2vXTJQJcjDPQeST4wvqOJIhFDSN3dSk8vKB+F2M6rtsfP9sDkGUKN
         HTbHTRM496p1VzTHOxu7t/a4B4UgW8xthoUKsdJbQMPVEmJIxbwaBUENwe8CJ7MABAkb
         xpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850914; x=1789455714;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwflIzcBWQAlCH5G1lHkwk2yyve824n1VD85Tvhgohg=;
        b=r0/BYHHFlNGtudGUEPcFqt8ElW6VptnapjBw/hBJuHmp5Ld93H6IyAIZAClqIjlt1O
         UEiqRGzXVx4I72xPFov3XbnoU3vPiUHCxbdFZGgUMvzee+f8dMSZ+3CLz1zokaQCOxP3
         U6GYr2dBNbBMXtz/fHl10Vi9Bnz4zd+kh50ok19MrWHys7StLOZB2Bi1enWtTz3tHQrE
         hCIoYMTIXA0C13+ENoqsgkl/XWPsw9iJdz9mTmbSDj3/hzoPdec/zwhYYP8mlIWj6NXf
         rtTFga7M7XyBDgiL2nJhHaFEdO6XdwBQtHIV6T/Fuh6kEENc+2YFNxiiOgzgxVB3b0tI
         xjbA==
X-Forwarded-Encrypted: i=1; AKwUvByZN8E5NauA+MdSjKpbyPSy4eQ9yvjIgcXQHmYpqhamC/xVzuGwUzbc3Ampmepse71iHnKrc1A2qLY=@vger.kernel.org
X-Gm-Message-State: AFuF++kZVJRcCCxC9pTL8Y6T7MgYLNp79QDrSDwRFfNbGQLRbkehJ+UV
	w9EkjiyBrmSmAPQ8lyOZwjdguDEvzPP3vQdDkGYgJ4wU7TibQOFgpsPJ
X-Gm-Gg: AYBFou2t0sMKdsvMeVT4qvNbxgo7xirkmVfluGRATtSFzD6eoH6aJEo/Bgy7LICGSga
	bcIuZO9h+TzNtYUnCSoJht0/YHfuRDuvwi2tJ5+fplRzTD/LMynm8mruWqZWAuEXH4UiVJzih98
	Bb5m+60flsf+wbiBNBilIB1wmollqW//jGdyzW59E15eGZyyQs8vhhEzHwojc1DemAKjYqLwgTi
	0Yrl3/Q5Kgsupcq0cMTRRTopQCrVMM8Zl7THI4GPJGe4PQVqVmk0NSjB7TqtPYZTWF4TsY2OWX7
	dSg19MFfMcbPUkk8TkfNwIi354v3TrY8ZQfIEkfoS38JRJyvOi4AYy3g4AXE6Qc+eaS4UIyN7MZ
	1bDn2Vqry+e3j2pTGVw+2Ko+l10FQx89+NcLX/kHrK0kByJA0qSNCbV8DYhArpFyx9hl+wq3dfc
	PhOpBLGjonickZLXIP+07RKcVANc/+C/99sgQF2HVQJDxOCrukbhdR4W3JCyqoRRh3jGoT9saoC
	5BhKGJs37yPGpqJ3zTImXm9F2mtMMsAVvaQi+I+TGaXHIkRpNLcJJ7dhTGSK4MJn4ErEaqKq/Gv
	vyQO97oc0se7l7vbfDtQiOTP0RLOQHQaCpwfpSvt
X-Received: by 2002:a05:600c:34c2:b0:49d:10d6:fd55 with SMTP id 5b1f17b1804b1-49d10d6fdeemr97830585e9.1.1788850913275;
        Tue, 08 Sep 2026 00:01:53 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm492402925e9.14.2026.09.08.00.01.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 00:01:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v3] Documentation: Update after split of <linux/mod_devicetable.h>
Date: Tue,  8 Sep 2026 09:00:31 +0200
Message-Id: <20260908070031.32833-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Most structs that were defined in <linux/mod_devicetable.h> before were
moved to a bus specific header. Follow the movement to get the struct's
documentation back.

For the list of device ids in basics.rst use an explicit list of all the
headers that have kernel-doc annotations and that are not described
elsewhere (i.e. pci and mei_cl). <linux/device-id/acpi.h> is left out on
purpose, ACPI_DEVICE_CLASS() is not a device id struct.

Also repair the referencing in the zh_CN translation of pci.rst and
don't duplicate `struct mei_cl_device_id`.

Fixes: ad428f5811bd ("mod_devicetable.h: Split into per subsystem headers")
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
[Karl Mehltretter: use the :file: role in pcmcia/driver.rst, say why
 acpi.h is left out]
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes since v2
  https://lore.kernel.org/r/ede7ce64f20e10660ebf6bc1b41836dad750ae3b.1783349758.git.ukleinek@kernel.org/
- use the :file: role for the header path in pcmcia/driver.rst (Randy)
- say in the commit message that <linux/device-id/acpi.h> is left out on
  purpose (question raised by the Sashiko review)
- carried Randy's Reviewed-by and Tested-by from v2, the diff changed in
  one line of markup only
- Uwe asked me to take over the patch:
  https://lore.kernel.org/r/apv6yQ1U-HhNglyV@monoceros/
  It supersedes my PCI-only patch
  https://lore.kernel.org/r/20260905084916.40196-1-kmehltretter@gmail.com/

Randy's suggestion to add kernel-doc comments to <linux/mei_cl_bus.h> for
struct mei_cl_driver and include those instead of the duplicated struct is
left for a separate patch, it touches a header outside Documentation/.

 Documentation/PCI/pci.rst                     |  2 +-
 Documentation/driver-api/basics.rst           | 31 +++++++++++++++++--
 .../driver-api/mei/mei-client-bus.rst         | 12 ++-----
 Documentation/pcmcia/driver.rst               |  2 +-
 Documentation/staging/rpmsg.rst               |  2 +-
 Documentation/translations/zh_CN/PCI/pci.rst  |  8 ++---
 6 files changed, 39 insertions(+), 18 deletions(-)

diff --git a/Documentation/PCI/pci.rst b/Documentation/PCI/pci.rst
index be35e9a1ee75..71c42b0bfa8b 100644
--- a/Documentation/PCI/pci.rst
+++ b/Documentation/PCI/pci.rst
@@ -84,7 +84,7 @@ initialization with a pointer to a structure describing the driver
 The ID table is an array of ``struct pci_device_id`` entries ending with an
 all-zero entry.  Definitions with static const are generally preferred.
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/pci.h
    :functions: pci_device_id
 
 Most drivers only need ``PCI_DEVICE()`` or ``PCI_DEVICE_CLASS()`` to set up
diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 3b182cfdf135..84f701b84e4f 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -10,9 +10,36 @@ Driver Entry and Exit points
 Driver device table
 -------------------
 
-.. kernel-doc:: include/linux/mod_devicetable.h
+.. kernel-doc:: include/linux/device-id/amba.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/cdx.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/coreboot.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/dfl.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/fsl_mc.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/ishtp.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mdio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mhi.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/mips_cdmm.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/rio.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/tee_client.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/typec.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/usb.h
+   :internal:
+.. kernel-doc:: include/linux/device-id/wmi.h
    :internal:
-   :no-identifiers: pci_device_id
 
 
 Delaying and scheduling routines
diff --git a/Documentation/driver-api/mei/mei-client-bus.rst b/Documentation/driver-api/mei/mei-client-bus.rst
index f242b3f8d6aa..d46c0d0b3540 100644
--- a/Documentation/driver-api/mei/mei-client-bus.rst
+++ b/Documentation/driver-api/mei/mei-client-bus.rst
@@ -41,17 +41,11 @@ the ``struct mei_cl_driver`` structure defined in :file:`include/linux/mei_cl_bu
 
 
 
-The mei_cl_device_id structure defined in :file:`include/linux/mod_devicetable.h` allows a
+The mei_cl_device_id structure defined in :file:`include/linux/device-id/mei_cl.h` allows a
 driver to bind itself against a device name.
 
-.. code-block:: C
-
-        struct mei_cl_device_id {
-                char name[MEI_CL_NAME_SIZE];
-                uuid_le uuid;
-                __u8    version;
-                kernel_ulong_t driver_info;
-        };
+.. kernel-doc:: include/linux/device-id/mei_cl.h
+   :functions: mei_cl_device_id
 
 To actually register a driver on the ME Client bus one must call the :c:func:`mei_cl_add_driver`
 API. This is typically called at module initialization time.
diff --git a/Documentation/pcmcia/driver.rst b/Documentation/pcmcia/driver.rst
index 5c4fe84d51c1..0b6370c1d525 100644
--- a/Documentation/pcmcia/driver.rst
+++ b/Documentation/pcmcia/driver.rst
@@ -15,7 +15,7 @@ runtime as shown below::
 All fields are passed in as hexadecimal values (no leading 0x).
 The meaning is described in the PCMCIA specification, the match_flags is
 a bitwise or-ed combination from PCMCIA_DEV_ID_MATCH_* constants
-defined in include/linux/mod_devicetable.h.
+defined in :file:`include/linux/device-id/pcmcia.h`.
 
 Once added, the driver probe routine will be invoked for any unclaimed
 PCMCIA device listed in its (newly updated) pcmcia_device_id list.
diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 63612b7ee120..ea0eb1981124 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -224,7 +224,7 @@ content to the console.
 ::
 
   #include <linux/dev_printk.h>
-  #include <linux/mod_devicetable.h>
+  #include <linux/device-id/rpmsg.h>
   #include <linux/module.h>
   #include <linux/printk.h>
   #include <linux/rpmsg.h>
diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
index 347f5c3f5ce9..64372a16caf6 100644
--- a/Documentation/translations/zh_CN/PCI/pci.rst
+++ b/Documentation/translations/zh_CN/PCI/pci.rst
@@ -84,16 +84,16 @@ PCI设备驱动程序在初始化过程中调用 ``pci_register_driver()`` ，
 
 该API在以下内核代码中:
 
-include/linux/pci.h
-pci_driver
+.. kernel-doc:: include/linux/pci.h
+   :functions: pci_driver
 
 ID表是一个由 ``struct pci_device_id`` 结构体成员组成的数组，以一个全零的成员
 结束。一般来说，带有静态常数的定义是首选。
 
 该API在以下内核代码中:
 
-include/linux/mod_devicetable.h
-pci_device_id
+.. kernel-doc:: include/linux/device-id/pci.h
+   :functions: pci_device_id
 
 大多数驱动程序只需要 ``PCI_DEVICE()`` 或 ``PCI_DEVICE_CLASS()`` 来设置一个
 pci_device_id表。

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

