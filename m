Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68631B809
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948629; cv=none; b=NCyYo1glA6gjt0OKSZHUdqFPNJe8xj2hht+ct1S4mVPDaB0+t5jYXZhz2ipCfK/M3xeA1F9r//Wmg2+BGcbOXstK8KLK2fcNhvTAPaPr+WJ6hpWquLKObXlSgLAP+mDmebTF4l9F24+kD4ifWV8ok3ZqB46fpE0vXAAdVPpsq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948629; c=relaxed/simple;
	bh=CtrLPM+jX+fBnZa9OPhLR8N1Q+trc0/srdkJjkKT9M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=unNkxgkAJC3TC5clyFwcmiuGfhKco+ziJQJ0gsa/P4hz44NdhCkx52gEhq+WcJc7qHuCC5NHOmiQGUAG+Gkno/40STsY0BwDx+TZaiusQQ7ODxyoFTYodoRTJwlhwZOr3RViDRBbFXHANL3rD7JTEQeTWVOCie+g1TX6fguqAbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCRjhy2T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCRjhy2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948626; x=1794484626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CtrLPM+jX+fBnZa9OPhLR8N1Q+trc0/srdkJjkKT9M8=;
  b=jCRjhy2T2DfLZa3YFT2DGvWDMvwtUkMxUPy6qL1vNHXy9Oo9yoZEjuql
   uzs8VEyeTy4DVNZpTYOHB1aUXXWb7MZxB0COc31VM4Woso0KiD6HAYWU3
   hiumYXRqENh9+1SX7WGgylyWz0uHRLYXyn/tbsn0BoV9ZmQ7zfLNeLvXa
   hKoMtzlrbHPhfe01mubqJuerCoMTxm+EoF+Yd3wUrHXLI1PBiiDsg9ekn
   dFIlbAxpFD6eAA9COII2shGuU7xdHzKZXxQcAKFXyG75imkVI8XIf8QZK
   dyGTLCFcWG0CznSAoqeNjWyii+bOu1hF/dk7gxKgNe1LyzgyCOyUVwoWB
   A==;
X-CSE-ConnectionGUID: RYEPAxpHRVaFg3cq+Mijaw==
X-CSE-MsgGUID: wzdzCiSYS3+E59pdH4oInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467792"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76467792"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:06 -0800
X-CSE-ConnectionGUID: rYHUsR3nROSgYBQzqU17+A==
X-CSE-MsgGUID: 1CCEOJ1FSMiNm3cJ88+ajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193323582"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/4] Documentation: remove subproject index links deep in the structure
Date: Wed, 12 Nov 2025 13:56:51 +0200
Message-ID: <c7f9fa7545d1048d7f173d819aa1c4f3c8f050c1.1762948491.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762948491.git.jani.nikula@intel.com>
References: <cover.1762948491.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The idea of having

.. only:: subproject and html

   Indices
   =======

   * :ref:`genindex`

in index.rst pages is to add the index link to the main page of the
subproject when doing SPHINXDIRS builds. There's no such need deeper in
the documentation structure, and we can safely get rid of them. In all
likelihood, it's just cargo culted and copy-pasted.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/admin-guide/aoe/index.rst                  | 7 -------
 Documentation/admin-guide/auxdisplay/index.rst           | 7 -------
 Documentation/admin-guide/cgroup-v1/index.rst            | 7 -------
 Documentation/admin-guide/cifs/index.rst                 | 7 -------
 Documentation/admin-guide/device-mapper/index.rst        | 7 -------
 Documentation/admin-guide/gpio/index.rst                 | 7 -------
 Documentation/admin-guide/kdump/index.rst                | 7 -------
 Documentation/arch/arc/index.rst                         | 7 -------
 Documentation/arch/arm/index.rst                         | 8 --------
 Documentation/arch/arm64/index.rst                       | 7 -------
 Documentation/arch/loongarch/index.rst                   | 7 -------
 Documentation/arch/m68k/index.rst                        | 7 -------
 Documentation/arch/mips/index.rst                        | 7 -------
 Documentation/arch/openrisc/index.rst                    | 7 -------
 Documentation/arch/parisc/index.rst                      | 7 -------
 Documentation/arch/powerpc/index.rst                     | 7 -------
 Documentation/arch/riscv/index.rst                       | 7 -------
 Documentation/arch/s390/index.rst                        | 7 -------
 Documentation/core-api/kho/index.rst                     | 2 --
 Documentation/driver-api/80211/index.rst                 | 7 -------
 Documentation/driver-api/coco/index.rst                  | 2 --
 Documentation/driver-api/crypto/iaa/index.rst            | 7 -------
 Documentation/driver-api/crypto/index.rst                | 7 -------
 Documentation/driver-api/cxl/index.rst                   | 2 --
 Documentation/driver-api/dmaengine/index.rst             | 7 -------
 Documentation/driver-api/driver-model/index.rst          | 7 -------
 Documentation/driver-api/early-userspace/index.rst       | 7 -------
 Documentation/driver-api/firmware/index.rst              | 7 -------
 Documentation/driver-api/memory-devices/index.rst        | 7 -------
 Documentation/driver-api/pci/index.rst                   | 7 -------
 Documentation/driver-api/phy/index.rst                   | 8 --------
 Documentation/driver-api/pm/index.rst                    | 7 -------
 Documentation/driver-api/serial/index.rst                | 7 -------
 Documentation/driver-api/soundwire/index.rst             | 7 -------
 .../driver-api/surface_aggregator/clients/index.rst      | 7 -------
 Documentation/driver-api/surface_aggregator/index.rst    | 7 -------
 Documentation/driver-api/usb/index.rst                   | 7 -------
 Documentation/driver-api/xilinx/index.rst                | 7 -------
 Documentation/input/devices/index.rst                    | 7 -------
 Documentation/networking/device_drivers/atm/index.rst    | 7 -------
 Documentation/networking/device_drivers/can/index.rst    | 7 -------
 .../networking/device_drivers/cellular/index.rst         | 7 -------
 .../networking/device_drivers/ethernet/index.rst         | 7 -------
 .../device_drivers/ethernet/mellanox/mlx5/index.rst      | 7 -------
 Documentation/networking/device_drivers/fddi/index.rst   | 7 -------
 .../networking/device_drivers/hamradio/index.rst         | 7 -------
 Documentation/networking/device_drivers/index.rst        | 7 -------
 Documentation/networking/device_drivers/wifi/index.rst   | 7 -------
 Documentation/networking/device_drivers/wwan/index.rst   | 7 -------
 Documentation/networking/diagnostic/index.rst            | 7 -------
 Documentation/process/debugging/index.rst                | 9 ---------
 Documentation/tools/rtla/index.rst                       | 7 -------
 Documentation/tools/rv/index.rst                         | 7 -------
 .../translations/zh_CN/arch/loongarch/index.rst          | 7 -------
 Documentation/translations/zh_CN/arch/mips/index.rst     | 7 -------
 Documentation/translations/zh_CN/arch/openrisc/index.rst | 8 --------
 Documentation/translations/zh_CN/arch/parisc/index.rst   | 7 -------
 Documentation/translations/zh_CN/arch/riscv/index.rst    | 8 --------
 .../translations/zh_CN/driver-api/phy/index.rst          | 7 -------
 .../translations/zh_TW/arch/loongarch/index.rst          | 8 --------
 Documentation/translations/zh_TW/arch/mips/index.rst     | 8 --------
 Documentation/translations/zh_TW/arch/openrisc/index.rst | 9 ---------
 Documentation/translations/zh_TW/arch/parisc/index.rst   | 8 --------
 Documentation/userspace-api/gpio/index.rst               | 7 -------
 Documentation/wmi/devices/index.rst                      | 7 -------
 65 files changed, 451 deletions(-)

diff --git a/Documentation/admin-guide/aoe/index.rst b/Documentation/admin-guide/aoe/index.rst
index d71c5df15922..564354bbce57 100644
--- a/Documentation/admin-guide/aoe/index.rst
+++ b/Documentation/admin-guide/aoe/index.rst
@@ -8,10 +8,3 @@ ATA over Ethernet (AoE)
     aoe
     todo
     examples
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/auxdisplay/index.rst b/Documentation/admin-guide/auxdisplay/index.rst
index e466f0595248..31eae08255fd 100644
--- a/Documentation/admin-guide/auxdisplay/index.rst
+++ b/Documentation/admin-guide/auxdisplay/index.rst
@@ -7,10 +7,3 @@ Auxiliary Display Support
 
     ks0108.rst
     cfag12864b.rst
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/cgroup-v1/index.rst b/Documentation/admin-guide/cgroup-v1/index.rst
index 99fbc8a64ba9..14897a8d32b3 100644
--- a/Documentation/admin-guide/cgroup-v1/index.rst
+++ b/Documentation/admin-guide/cgroup-v1/index.rst
@@ -22,10 +22,3 @@ Control Groups version 1
     net_prio
     pids
     rdma
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/cifs/index.rst b/Documentation/admin-guide/cifs/index.rst
index fad5268635f5..58ab58a71a82 100644
--- a/Documentation/admin-guide/cifs/index.rst
+++ b/Documentation/admin-guide/cifs/index.rst
@@ -12,10 +12,3 @@ CIFS
    todo
    changes
    authors
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/device-mapper/index.rst b/Documentation/admin-guide/device-mapper/index.rst
index f1c1f4b824ba..030d854628ac 100644
--- a/Documentation/admin-guide/device-mapper/index.rst
+++ b/Documentation/admin-guide/device-mapper/index.rst
@@ -40,10 +40,3 @@ Device Mapper
     verity
     writecache
     zero
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
index 712f379731cb..082646851029 100644
--- a/Documentation/admin-guide/gpio/index.rst
+++ b/Documentation/admin-guide/gpio/index.rst
@@ -12,10 +12,3 @@ GPIO
     gpio-sim
     gpio-virtuser
     Obsolete APIs <obsolete>
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/admin-guide/kdump/index.rst b/Documentation/admin-guide/kdump/index.rst
index 8e2ebd0383cd..cf5d7c868b74 100644
--- a/Documentation/admin-guide/kdump/index.rst
+++ b/Documentation/admin-guide/kdump/index.rst
@@ -11,10 +11,3 @@ information.
 
     kdump
     vmcoreinfo
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/arc/index.rst b/Documentation/arch/arc/index.rst
index 7b098d4a5e3e..10bf8c2701bf 100644
--- a/Documentation/arch/arc/index.rst
+++ b/Documentation/arch/arc/index.rst
@@ -8,10 +8,3 @@ ARC architecture
     arc
 
     features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/arm/index.rst b/Documentation/arch/arm/index.rst
index fd43502ae924..afe17db294c4 100644
--- a/Documentation/arch/arm/index.rst
+++ b/Documentation/arch/arm/index.rst
@@ -75,11 +75,3 @@ SoC-specific documents
    sti/overview
 
    vfp/release-notes
-
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/arm64/index.rst b/Documentation/arch/arm64/index.rst
index 6a012c98bdcd..af52edc8c0ac 100644
--- a/Documentation/arch/arm64/index.rst
+++ b/Documentation/arch/arm64/index.rst
@@ -33,10 +33,3 @@ ARM64 Architecture
     tagged-pointers
 
     features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/loongarch/index.rst b/Documentation/arch/loongarch/index.rst
index c779bfa00c05..df590b117240 100644
--- a/Documentation/arch/loongarch/index.rst
+++ b/Documentation/arch/loongarch/index.rst
@@ -13,10 +13,3 @@ LoongArch Architecture
    irq-chip-model
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/m68k/index.rst b/Documentation/arch/m68k/index.rst
index 0f890dbb5fe2..c334026e0ae1 100644
--- a/Documentation/arch/m68k/index.rst
+++ b/Documentation/arch/m68k/index.rst
@@ -11,10 +11,3 @@ m68k Architecture
    buddha-driver
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/mips/index.rst b/Documentation/arch/mips/index.rst
index 037f85a08fe3..703e195b933d 100644
--- a/Documentation/arch/mips/index.rst
+++ b/Documentation/arch/mips/index.rst
@@ -12,10 +12,3 @@ MIPS-specific Documentation
    ingenic-tcu
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/openrisc/index.rst b/Documentation/arch/openrisc/index.rst
index 6879f998b87a..79fe8b0c2c41 100644
--- a/Documentation/arch/openrisc/index.rst
+++ b/Documentation/arch/openrisc/index.rst
@@ -11,10 +11,3 @@ OpenRISC Architecture
    todo
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/parisc/index.rst b/Documentation/arch/parisc/index.rst
index 240685751825..15ccc787fd4f 100644
--- a/Documentation/arch/parisc/index.rst
+++ b/Documentation/arch/parisc/index.rst
@@ -11,10 +11,3 @@ PA-RISC Architecture
    registers
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 1be2ee3f0361..40419bea8e10 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -40,10 +40,3 @@ powerpc
     vpa-dtl
 
     features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/riscv/index.rst b/Documentation/arch/riscv/index.rst
index eecf347ce849..830fde0c8aa3 100644
--- a/Documentation/arch/riscv/index.rst
+++ b/Documentation/arch/riscv/index.rst
@@ -16,10 +16,3 @@ RISC-V architecture
     cmodx
 
     features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/arch/s390/index.rst b/Documentation/arch/s390/index.rst
index e75a6e5d2505..769434f0625b 100644
--- a/Documentation/arch/s390/index.rst
+++ b/Documentation/arch/s390/index.rst
@@ -22,10 +22,3 @@ s390 Architecture
     text_files
 
     features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
index 0c63b0c5c143..51ea41c6a20d 100644
--- a/Documentation/core-api/kho/index.rst
+++ b/Documentation/core-api/kho/index.rst
@@ -9,5 +9,3 @@ Kexec Handover Subsystem
 
    concepts
    fdt
-
-.. only::  subproject and html
diff --git a/Documentation/driver-api/80211/index.rst b/Documentation/driver-api/80211/index.rst
index af210859d3e1..62305e9c3113 100644
--- a/Documentation/driver-api/80211/index.rst
+++ b/Documentation/driver-api/80211/index.rst
@@ -8,10 +8,3 @@ Linux 802.11 Driver Developer's Guide
    cfg80211
    mac80211
    mac80211-advanced
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/coco/index.rst b/Documentation/driver-api/coco/index.rst
index af9f08ca0cfd..783c8b033547 100644
--- a/Documentation/driver-api/coco/index.rst
+++ b/Documentation/driver-api/coco/index.rst
@@ -8,5 +8,3 @@ Confidential Computing
    :maxdepth: 1
 
    measurement-registers
-
-.. only::  subproject and html
diff --git a/Documentation/driver-api/crypto/iaa/index.rst b/Documentation/driver-api/crypto/iaa/index.rst
index aa6837e27264..463f7da569c5 100644
--- a/Documentation/driver-api/crypto/iaa/index.rst
+++ b/Documentation/driver-api/crypto/iaa/index.rst
@@ -11,10 +11,3 @@ API.
    :maxdepth: 1
 
    iaa-crypto
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/crypto/index.rst b/Documentation/driver-api/crypto/index.rst
index fb9709b98bea..bba669014cb2 100644
--- a/Documentation/driver-api/crypto/index.rst
+++ b/Documentation/driver-api/crypto/index.rst
@@ -11,10 +11,3 @@ configuration.
    :maxdepth: 1
 
    iaa/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/cxl/index.rst b/Documentation/driver-api/cxl/index.rst
index c1106a68b67c..ec8aae9ec0d4 100644
--- a/Documentation/driver-api/cxl/index.rst
+++ b/Documentation/driver-api/cxl/index.rst
@@ -50,5 +50,3 @@ that have impacts on each other.  The docs here break up configurations steps.
    allocation/page-allocator
    allocation/reclaim
    allocation/hugepages.rst
-
-.. only::  subproject and html
diff --git a/Documentation/driver-api/dmaengine/index.rst b/Documentation/driver-api/dmaengine/index.rst
index bdc45d8b4cfb..e74677c664ac 100644
--- a/Documentation/driver-api/dmaengine/index.rst
+++ b/Documentation/driver-api/dmaengine/index.rst
@@ -46,10 +46,3 @@ This book adds some notes about PXA DMA
    :maxdepth: 1
 
    pxa_dma
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/driver-model/index.rst b/Documentation/driver-api/driver-model/index.rst
index 4831bdd92e5c..abeb4b36636b 100644
--- a/Documentation/driver-api/driver-model/index.rst
+++ b/Documentation/driver-api/driver-model/index.rst
@@ -14,10 +14,3 @@ Driver Model
    overview
    platform
    porting
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/early-userspace/index.rst b/Documentation/driver-api/early-userspace/index.rst
index 149c1822f06d..ff459471258f 100644
--- a/Documentation/driver-api/early-userspace/index.rst
+++ b/Documentation/driver-api/early-userspace/index.rst
@@ -9,10 +9,3 @@ Early Userspace
 
     early_userspace_support
     buffer-format
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/firmware/index.rst b/Documentation/driver-api/firmware/index.rst
index 9d2c19dc8e36..86a3dd4bc3f8 100644
--- a/Documentation/driver-api/firmware/index.rst
+++ b/Documentation/driver-api/firmware/index.rst
@@ -10,10 +10,3 @@ Linux Firmware API
    request_firmware
    fw_upload
    other_interfaces
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/memory-devices/index.rst b/Documentation/driver-api/memory-devices/index.rst
index 28101458cda5..3b6308113611 100644
--- a/Documentation/driver-api/memory-devices/index.rst
+++ b/Documentation/driver-api/memory-devices/index.rst
@@ -9,10 +9,3 @@ Memory Controller drivers
 
     ti-emif
     ti-gpmc
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/pci/index.rst b/Documentation/driver-api/pci/index.rst
index a38e475cdbe3..fd73bd44d5a9 100644
--- a/Documentation/driver-api/pci/index.rst
+++ b/Documentation/driver-api/pci/index.rst
@@ -10,10 +10,3 @@ The Linux PCI driver implementer's API guide
 
    pci
    p2pdma
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/phy/index.rst b/Documentation/driver-api/phy/index.rst
index 69ba1216de72..579cfe3b7b82 100644
--- a/Documentation/driver-api/phy/index.rst
+++ b/Documentation/driver-api/phy/index.rst
@@ -8,11 +8,3 @@ Generic PHY Framework
 
    phy
    samsung-usb2
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/driver-api/pm/index.rst b/Documentation/driver-api/pm/index.rst
index c2a9ef8d115c..4d6c32e32a72 100644
--- a/Documentation/driver-api/pm/index.rst
+++ b/Documentation/driver-api/pm/index.rst
@@ -10,10 +10,3 @@ CPU and Device Power Management
    devices
    notifiers
    types
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/serial/index.rst b/Documentation/driver-api/serial/index.rst
index 03a55b987a1d..610744df5e8d 100644
--- a/Documentation/driver-api/serial/index.rst
+++ b/Documentation/driver-api/serial/index.rst
@@ -18,10 +18,3 @@ Serial drivers
 
     serial-iso7816
     serial-rs485
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/soundwire/index.rst b/Documentation/driver-api/soundwire/index.rst
index ef8d90dfbdde..f7abf4a95be7 100644
--- a/Documentation/driver-api/soundwire/index.rst
+++ b/Documentation/driver-api/soundwire/index.rst
@@ -11,10 +11,3 @@ SoundWire Documentation
    locking
    bra
    bra_cadence
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/surface_aggregator/clients/index.rst b/Documentation/driver-api/surface_aggregator/clients/index.rst
index 30160513afa5..c32313b8f3b7 100644
--- a/Documentation/driver-api/surface_aggregator/clients/index.rst
+++ b/Documentation/driver-api/surface_aggregator/clients/index.rst
@@ -14,10 +14,3 @@ on how to write client drivers.
    cdev
    dtx
    san
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/surface_aggregator/index.rst b/Documentation/driver-api/surface_aggregator/index.rst
index 6f3e1094904d..f0128fe59a32 100644
--- a/Documentation/driver-api/surface_aggregator/index.rst
+++ b/Documentation/driver-api/surface_aggregator/index.rst
@@ -12,10 +12,3 @@ Surface System Aggregator Module (SSAM)
    clients/index
    ssh
    internal
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/usb/index.rst b/Documentation/driver-api/usb/index.rst
index fcb24d0500d9..a32819963b99 100644
--- a/Documentation/driver-api/usb/index.rst
+++ b/Documentation/driver-api/usb/index.rst
@@ -22,10 +22,3 @@ Linux USB API
    typec
    typec_bus
    usb3-debug-port
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/driver-api/xilinx/index.rst b/Documentation/driver-api/xilinx/index.rst
index 13f7589ed442..c95bda55da6f 100644
--- a/Documentation/driver-api/xilinx/index.rst
+++ b/Documentation/driver-api/xilinx/index.rst
@@ -7,10 +7,3 @@ Xilinx FPGA
     :maxdepth: 1
 
     eemi
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/input/devices/index.rst b/Documentation/input/devices/index.rst
index 95a453782bad..6de4365ad288 100644
--- a/Documentation/input/devices/index.rst
+++ b/Documentation/input/devices/index.rst
@@ -10,10 +10,3 @@ Linux kernel, their protocols, and driver details.
    :glob:
 
    *
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/atm/index.rst b/Documentation/networking/device_drivers/atm/index.rst
index 7b593f031a60..724552ca0be4 100644
--- a/Documentation/networking/device_drivers/atm/index.rst
+++ b/Documentation/networking/device_drivers/atm/index.rst
@@ -11,10 +11,3 @@ Contents:
    cxacru
    fore200e
    iphase
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/can/index.rst b/Documentation/networking/device_drivers/can/index.rst
index 6a8a4f74fa26..af4369989522 100644
--- a/Documentation/networking/device_drivers/can/index.rst
+++ b/Documentation/networking/device_drivers/can/index.rst
@@ -13,10 +13,3 @@ Contents:
    can327
    ctu/ctucanfd-driver
    freescale/flexcan
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/cellular/index.rst b/Documentation/networking/device_drivers/cellular/index.rst
index fc1812d3fc70..9690c3ba08ef 100644
--- a/Documentation/networking/device_drivers/cellular/index.rst
+++ b/Documentation/networking/device_drivers/cellular/index.rst
@@ -9,10 +9,3 @@ Contents:
    :maxdepth: 2
 
    qualcomm/rmnet
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/ethernet/index.rst b/Documentation/networking/device_drivers/ethernet/index.rst
index 7cfcd183054f..76864a5f2db4 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -63,10 +63,3 @@ Contents:
    wangxun/txgbevf
    wangxun/ngbe
    wangxun/ngbevf
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/index.rst b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/index.rst
index 581a91caa579..56f3966de3f0 100644
--- a/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/mellanox/mlx5/index.rst
@@ -16,10 +16,3 @@ Contents:
    switchdev
    tracepoints
    counters
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/fddi/index.rst b/Documentation/networking/device_drivers/fddi/index.rst
index 0b75294e6c8b..c7cf2347e215 100644
--- a/Documentation/networking/device_drivers/fddi/index.rst
+++ b/Documentation/networking/device_drivers/fddi/index.rst
@@ -10,10 +10,3 @@ Contents:
 
    defza
    skfp
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/hamradio/index.rst b/Documentation/networking/device_drivers/hamradio/index.rst
index 7e731732057b..6af481c5b020 100644
--- a/Documentation/networking/device_drivers/hamradio/index.rst
+++ b/Documentation/networking/device_drivers/hamradio/index.rst
@@ -10,10 +10,3 @@ Contents:
 
    baycom
    z8530drv
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/index.rst b/Documentation/networking/device_drivers/index.rst
index a254af25b7ef..1df51c9f7827 100644
--- a/Documentation/networking/device_drivers/index.rst
+++ b/Documentation/networking/device_drivers/index.rst
@@ -16,10 +16,3 @@ Contents:
    hamradio/index
    wifi/index
    wwan/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/wifi/index.rst b/Documentation/networking/device_drivers/wifi/index.rst
index fb394f5de4a9..29ba9ea64b25 100644
--- a/Documentation/networking/device_drivers/wifi/index.rst
+++ b/Documentation/networking/device_drivers/wifi/index.rst
@@ -10,10 +10,3 @@ Contents:
 
    intel/ipw2100
    intel/ipw2200
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/device_drivers/wwan/index.rst b/Documentation/networking/device_drivers/wwan/index.rst
index 370d8264d5dc..b768ae89f723 100644
--- a/Documentation/networking/device_drivers/wwan/index.rst
+++ b/Documentation/networking/device_drivers/wwan/index.rst
@@ -10,10 +10,3 @@ Contents:
 
    iosm
    t7xx
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/networking/diagnostic/index.rst b/Documentation/networking/diagnostic/index.rst
index 86488aa46b48..592263a2713a 100644
--- a/Documentation/networking/diagnostic/index.rst
+++ b/Documentation/networking/diagnostic/index.rst
@@ -8,10 +8,3 @@ Networking Diagnostics
    :maxdepth: 2
 
    twisted_pair_layer1_diagnostics.rst
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
index 387d33d16f5e..357243e184e1 100644
--- a/Documentation/process/debugging/index.rst
+++ b/Documentation/process/debugging/index.rst
@@ -15,8 +15,6 @@ general guides
    kgdb
    userspace_debugging_guide
 
-.. only::  subproject and html
-
 subsystem specific guides
 -------------------------
 
@@ -25,13 +23,6 @@ subsystem specific guides
 
    media_specific_debugging_guide
 
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
 General debugging advice
 ========================
 
diff --git a/Documentation/tools/rtla/index.rst b/Documentation/tools/rtla/index.rst
index 05d2652e4072..7664d6d0cb27 100644
--- a/Documentation/tools/rtla/index.rst
+++ b/Documentation/tools/rtla/index.rst
@@ -18,10 +18,3 @@ behavior on specific hardware.
    rtla-timerlat-hist
    rtla-timerlat-top
    rtla-hwnoise
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/tools/rv/index.rst b/Documentation/tools/rv/index.rst
index 64ba2efe2e85..fd42b0017d07 100644
--- a/Documentation/tools/rv/index.rst
+++ b/Documentation/tools/rv/index.rst
@@ -16,10 +16,3 @@ Runtime verification (rv) tool
    rv-mon-wip
    rv-mon-wwnr
    rv-mon-sched
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/arch/loongarch/index.rst b/Documentation/translations/zh_CN/arch/loongarch/index.rst
index 4bd24f5ffed1..78633c82809e 100644
--- a/Documentation/translations/zh_CN/arch/loongarch/index.rst
+++ b/Documentation/translations/zh_CN/arch/loongarch/index.rst
@@ -18,10 +18,3 @@ LoongArch体系结构
    irq-chip-model
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/arch/mips/index.rst b/Documentation/translations/zh_CN/arch/mips/index.rst
index 2a34217119ea..079d8979ba8d 100644
--- a/Documentation/translations/zh_CN/arch/mips/index.rst
+++ b/Documentation/translations/zh_CN/arch/mips/index.rst
@@ -20,10 +20,3 @@ MIPS特性文档
    ingenic-tcu
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/arch/openrisc/index.rst b/Documentation/translations/zh_CN/arch/openrisc/index.rst
index da21f8ab894b..bdecc3bf88d7 100644
--- a/Documentation/translations/zh_CN/arch/openrisc/index.rst
+++ b/Documentation/translations/zh_CN/arch/openrisc/index.rst
@@ -22,11 +22,3 @@ OpenRISC 体系架构
 
 Todolist:
     features
-
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/arch/parisc/index.rst b/Documentation/translations/zh_CN/arch/parisc/index.rst
index 9f69283bd1c9..cba3a5d2e74c 100644
--- a/Documentation/translations/zh_CN/arch/parisc/index.rst
+++ b/Documentation/translations/zh_CN/arch/parisc/index.rst
@@ -22,10 +22,3 @@ PA-RISC体系架构
 Todolist:
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/arch/riscv/index.rst b/Documentation/translations/zh_CN/arch/riscv/index.rst
index 96573459105e..eb36009874e5 100644
--- a/Documentation/translations/zh_CN/arch/riscv/index.rst
+++ b/Documentation/translations/zh_CN/arch/riscv/index.rst
@@ -21,11 +21,3 @@ RISC-V 体系结构
     boot-image-header
     vm-layout
     patch-acceptance
-
-
-.. only::  subproject and html
-
-   目录
-   ====
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/driver-api/phy/index.rst b/Documentation/translations/zh_CN/driver-api/phy/index.rst
index 2cdce17b74a9..d6e4f729fac0 100644
--- a/Documentation/translations/zh_CN/driver-api/phy/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/phy/index.rst
@@ -11,10 +11,3 @@ PHY 通用框架
 Todolist:
 
 *   samsung-usb2
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_TW/arch/loongarch/index.rst b/Documentation/translations/zh_TW/arch/loongarch/index.rst
index 7281e050fe1c..ee3e01d99891 100644
--- a/Documentation/translations/zh_TW/arch/loongarch/index.rst
+++ b/Documentation/translations/zh_TW/arch/loongarch/index.rst
@@ -18,11 +18,3 @@ LoongArch體系結構
    irq-chip-model
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/translations/zh_TW/arch/mips/index.rst b/Documentation/translations/zh_TW/arch/mips/index.rst
index 4b7d28806489..ee0cf95e69ff 100644
--- a/Documentation/translations/zh_TW/arch/mips/index.rst
+++ b/Documentation/translations/zh_TW/arch/mips/index.rst
@@ -20,11 +20,3 @@ MIPS特性文檔
    ingenic-tcu
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/translations/zh_TW/arch/openrisc/index.rst b/Documentation/translations/zh_TW/arch/openrisc/index.rst
index 7585960783fc..f830fb830e38 100644
--- a/Documentation/translations/zh_TW/arch/openrisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/openrisc/index.rst
@@ -22,12 +22,3 @@ OpenRISC 體系架構
 
 Todolist:
     features
-
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/translations/zh_TW/arch/parisc/index.rst b/Documentation/translations/zh_TW/arch/parisc/index.rst
index 35941bf68c88..8f75e2439738 100644
--- a/Documentation/translations/zh_TW/arch/parisc/index.rst
+++ b/Documentation/translations/zh_TW/arch/parisc/index.rst
@@ -22,11 +22,3 @@ PA-RISC體系架構
 Todolist:
 
    features
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/userspace-api/gpio/index.rst b/Documentation/userspace-api/gpio/index.rst
index f258de4ef370..ac9c6ff9875c 100644
--- a/Documentation/userspace-api/gpio/index.rst
+++ b/Documentation/userspace-api/gpio/index.rst
@@ -9,10 +9,3 @@ GPIO
 
     Character Device Userspace API <chardev>
     Obsolete Userspace APIs <obsolete>
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/wmi/devices/index.rst b/Documentation/wmi/devices/index.rst
index c08735a9d7df..b0a9b4229add 100644
--- a/Documentation/wmi/devices/index.rst
+++ b/Documentation/wmi/devices/index.rst
@@ -13,10 +13,3 @@ the Linux kernel, their protocols and driver details.
    :glob:
 
    *
-
-.. only:: subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-- 
2.47.3

