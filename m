Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8862D838C
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 14:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769178748; cv=none; b=TQ9fnYLSu2wT2RoEEQMgUyRsp0CFTQt8uH46khVE3RY15RjCxN8A7uDGDz0cgorgpto1UO6pBSsZ6qTmtm1FKiSspKNgtJhx/W4LfNwi/LGE+tk35lNQWdBTmkOzutj/uRwbXMHi0FDgv7YgLg7pCxRdXikVVOHFia5zGyHnnV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769178748; c=relaxed/simple;
	bh=IuaLRGomPS1yif598ImyN3TKMFH1BRadGSMwkSaNmbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJ20hJ2snjQ540btfCJCyGqeZ1PYO9SUq6N4+DyESwurNax0P5wpEB34aDLBF229SgGyXBVrsOn1aa51HNSgZuIffVejiu89sQgnfu6dIpXBN9IlzTvX1O4kPW9IIUAINMkeeGh9ryJm4rH6Z/5ciNyLqDSeV8tBkPaWku2hj+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/IlYSOf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/IlYSOf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769178745; x=1800714745;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IuaLRGomPS1yif598ImyN3TKMFH1BRadGSMwkSaNmbU=;
  b=X/IlYSOf9rlPeVMr1sCwD51fiAyNafrTKMuom3PBMp0NvNP2mhulQi6Y
   FGcqHED20/qvGrHKOP7St08aGTTAzd2SMWiEhvJmAEOwH03oZf8GoDI/N
   mne6Y2P7lUt577um1Ti+FKbhIXJPNu8F+ZIzirktYHPPkVRvDQLcsdZrM
   zo76OMOyawGYFVjmsEgr7t8huzlRTmhn4jPJ8F17oIGhlQdjUXKnpiKvm
   QltORzOpazcVlu3a75qWI+GLvtz9iR/z+qR7AcR/ABYGymYbrz19U6A3q
   qkwBXuYEcqAquFiWs3vlOrSfh+7G/ca2sO7RDtonL2S6Rqm+KMLVbbzMA
   w==;
X-CSE-ConnectionGUID: RI4erq5nQc+7urr9zm3qVw==
X-CSE-MsgGUID: n1jzJnNoQ+qlPcE4u6dKFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81542852"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81542852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:32:24 -0800
X-CSE-ConnectionGUID: w46TlUYNQ1q3eeoaDbBaoQ==
X-CSE-MsgGUID: j18hO3uWRNuGucIfSijnRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207382743"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.2])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 06:31:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: use a source-read extension for the index link boilerplate
Date: Fri, 23 Jan 2026 16:31:49 +0200
Message-ID: <20260123143149.2024303-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

The root document usually has a special :ref:`genindex` link to the
generated index. This is also the case for Documentation/index.rst. The
other index.rst files deeper in the directory hierarchy usually don't.

For SPHINXDIRS builds, the root document isn't Documentation/index.rst,
but some other index.rst in the hierarchy. Currently they have a
".. only::" block to add the index link when doing SPHINXDIRS html
builds.

This is obviously very tedious and repetitive. The link is also added to
all index.rst files in the hierarchy for SPHINXDIRS builds, not just the
root document.

Put the boilerplate in a sphinx-includes/subproject-index.rst file, and
include it at the end of the root document for subproject builds in an
ad-hoc source-read extension defined in conf.py.

For now, keep having the boilerplate in translations, because this
approach currently doesn't cover translated index link headers.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/RCU/index.rst                   |  7 ------
 Documentation/accel/index.rst                 |  7 ------
 Documentation/admin-guide/aoe/index.rst       |  7 ------
 .../admin-guide/auxdisplay/index.rst          |  7 ------
 Documentation/admin-guide/cgroup-v1/index.rst |  7 ------
 Documentation/admin-guide/cifs/index.rst      |  7 ------
 .../admin-guide/device-mapper/index.rst       |  7 ------
 Documentation/admin-guide/gpio/index.rst      |  7 ------
 Documentation/admin-guide/index.rst           |  7 ------
 Documentation/admin-guide/kdump/index.rst     |  7 ------
 Documentation/arch/arc/index.rst              |  7 ------
 Documentation/arch/arm/index.rst              |  8 -------
 Documentation/arch/arm64/index.rst            |  7 ------
 Documentation/arch/loongarch/index.rst        |  7 ------
 Documentation/arch/m68k/index.rst             |  7 ------
 Documentation/arch/mips/index.rst             |  7 ------
 Documentation/arch/openrisc/index.rst         |  7 ------
 Documentation/arch/parisc/index.rst           |  7 ------
 Documentation/arch/powerpc/index.rst          |  7 ------
 Documentation/arch/riscv/index.rst            |  7 ------
 Documentation/arch/s390/index.rst             |  7 ------
 Documentation/bpf/index.rst                   |  7 ------
 Documentation/cdrom/index.rst                 |  7 ------
 Documentation/conf.py                         | 24 ++++++++++++++++++-
 Documentation/core-api/index.rst              |  7 ------
 Documentation/core-api/kho/index.rst          |  2 --
 Documentation/dev-tools/index.rst             |  8 -------
 Documentation/doc-guide/index.rst             |  7 ------
 Documentation/driver-api/80211/index.rst      |  7 ------
 Documentation/driver-api/coco/index.rst       |  2 --
 Documentation/driver-api/crypto/iaa/index.rst |  7 ------
 Documentation/driver-api/crypto/index.rst     |  7 ------
 Documentation/driver-api/cxl/index.rst        |  2 --
 Documentation/driver-api/dmaengine/index.rst  |  7 ------
 .../driver-api/driver-model/index.rst         |  7 ------
 .../driver-api/early-userspace/index.rst      |  7 ------
 Documentation/driver-api/firmware/index.rst   |  7 ------
 Documentation/driver-api/index.rst            |  7 ------
 .../driver-api/memory-devices/index.rst       |  7 ------
 Documentation/driver-api/pci/index.rst        |  7 ------
 Documentation/driver-api/phy/index.rst        |  8 -------
 Documentation/driver-api/pm/index.rst         |  7 ------
 Documentation/driver-api/serial/index.rst     |  7 ------
 Documentation/driver-api/soundwire/index.rst  |  7 ------
 .../surface_aggregator/clients/index.rst      |  7 ------
 .../driver-api/surface_aggregator/index.rst   |  7 ------
 Documentation/driver-api/usb/index.rst        |  7 ------
 Documentation/driver-api/xilinx/index.rst     |  7 ------
 Documentation/fault-injection/index.rst       |  7 ------
 Documentation/fb/index.rst                    |  7 ------
 Documentation/fpga/index.rst                  |  7 ------
 Documentation/gpu/drivers.rst                 |  7 ------
 Documentation/gpu/index.rst                   |  7 ------
 Documentation/hwmon/index.rst                 |  7 ------
 Documentation/i2c/index.rst                   |  7 ------
 Documentation/infiniband/index.rst            |  7 ------
 Documentation/input/devices/index.rst         |  7 ------
 Documentation/input/index.rst                 |  7 ------
 Documentation/isdn/index.rst                  |  7 ------
 Documentation/kbuild/index.rst                |  7 ------
 Documentation/livepatch/index.rst             |  7 ------
 Documentation/locking/index.rst               |  7 ------
 Documentation/mhi/index.rst                   |  7 ------
 Documentation/netlabel/index.rst              |  7 ------
 .../networking/device_drivers/atm/index.rst   |  7 ------
 .../networking/device_drivers/can/index.rst   |  7 ------
 .../device_drivers/cellular/index.rst         |  7 ------
 .../device_drivers/ethernet/index.rst         |  7 ------
 .../ethernet/mellanox/mlx5/index.rst          |  7 ------
 .../networking/device_drivers/fddi/index.rst  |  7 ------
 .../device_drivers/hamradio/index.rst         |  7 ------
 .../networking/device_drivers/index.rst       |  7 ------
 .../networking/device_drivers/wifi/index.rst  |  7 ------
 .../networking/device_drivers/wwan/index.rst  |  7 ------
 Documentation/networking/diagnostic/index.rst |  7 ------
 Documentation/networking/index.rst            |  7 ------
 Documentation/pcmcia/index.rst                |  7 ------
 Documentation/peci/index.rst                  |  7 ------
 Documentation/power/index.rst                 |  7 ------
 Documentation/process/debugging/index.rst     |  9 -------
 Documentation/process/index.rst               |  7 ------
 Documentation/rust/index.rst                  |  7 ------
 Documentation/scheduler/index.rst             |  7 ------
 Documentation/sound/index.rst                 |  7 ------
 .../sphinx-includes/subproject-index.rst      |  7 ++++++
 Documentation/spi/index.rst                   |  7 ------
 Documentation/target/index.rst                |  7 ------
 Documentation/tee/index.rst                   |  7 ------
 Documentation/timers/index.rst                |  7 ------
 Documentation/tools/index.rst                 |  7 ------
 Documentation/tools/rtla/index.rst            |  7 ------
 Documentation/tools/rv/index.rst              |  7 ------
 Documentation/trace/index.rst                 |  7 ------
 Documentation/usb/index.rst                   |  7 ------
 Documentation/userspace-api/gpio/index.rst    |  7 ------
 Documentation/userspace-api/index.rst         |  7 ------
 Documentation/virt/index.rst                  |  7 ------
 Documentation/w1/index.rst                    |  7 ------
 Documentation/watchdog/index.rst              |  7 ------
 Documentation/wmi/devices/index.rst           |  7 ------
 Documentation/wmi/index.rst                   |  8 -------
 101 files changed, 30 insertions(+), 685 deletions(-)
 create mode 100644 Documentation/sphinx-includes/subproject-index.rst

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index ef26c78507d3..035871687ee2 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -28,10 +28,3 @@ RCU Handbook
    Design/Expedited-Grace-Periods/Expedited-Grace-Periods
    Design/Requirements/Requirements
    Design/Data-Structures/Data-Structures
-
-.. only:: subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index d8fa332d60a8..cbc7d4c3876a 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -11,10 +11,3 @@ Compute Accelerators
    amdxdna/index
    qaic/index
    rocket/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
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
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 259d79fbeb94..b734f8a2a2c4 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -189,10 +189,3 @@ A few hard-to-categorize and generally obsolete documents.
 
    ldm
    unicode
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
diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 0bb5cb8157f1..0d5c6f659266 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -34,12 +34,5 @@ that goes into great technical depth about the BPF Architecture.
    other
    redirect
 
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
 .. Links:
 .. _BPF and XDP Reference Guide: https://docs.cilium.io/en/latest/bpf/
diff --git a/Documentation/cdrom/index.rst b/Documentation/cdrom/index.rst
index 3ac4f716612f..50050e219910 100644
--- a/Documentation/cdrom/index.rst
+++ b/Documentation/cdrom/index.rst
@@ -8,10 +8,3 @@ CD-ROM
     :maxdepth: 1
 
     cdrom-standard
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/conf.py b/Documentation/conf.py
index cea4213baa88..f438c38ab528 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -40,7 +40,7 @@ exclude_patterns = []
 
 # List of patterns that contain directory names in glob format.
 dyn_include_patterns = []
-dyn_exclude_patterns = ["output"]
+dyn_exclude_patterns = ["output", "sphinx-includes"]
 
 # Currently, only netlink/specs has a parser for yaml.
 # Prefer using include patterns if available, as it is faster
@@ -584,7 +584,29 @@ pdf_documents = [
 
 kerneldoc_srctree = ".."
 
+# Add index link at the end of the root document for SPHINXDIRS builds.
+def add_subproject_index(app, docname, content):
+    # Only care about root documents
+    if docname != master_doc:
+        return
+
+    # Add the index link at the root of translations, but not at the root of
+    # individual translations. They have their own language specific links.
+    rel = os.path.relpath(app.srcdir, start=doctree).split('/')
+    if rel[0] == 'translations' and len(rel) > 1:
+        return
+
+    # Only add the link for SPHINXDIRS HTML builds
+    if not app.builder.tags.has('subproject') or not app.builder.tags.has('html'):
+        return
+
+    # The include directive needs a relative path from the srcdir
+    rel = os.path.relpath(os.path.join(doctree, 'sphinx-includes/subproject-index.rst'), start=app.srcdir)
+
+    content[0] += f'\n.. include:: {rel}\n\n'
+
 def setup(app):
     """Patterns need to be updated at init time on older Sphinx versions"""
 
     app.connect('config-inited', config_init)
+    app.connect('source-read', add_subproject_index)
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 5eb0fbbbc323..51958aee20b2 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -140,10 +140,3 @@ Documents that don't fit elsewhere or which have yet to be categorized.
    librs
    liveupdate
    netlink
-
-.. only:: subproject and html
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
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 4b8425e348ab..4fc9d15f91d0 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -38,11 +38,3 @@ Documentation/process/debugging/index.rst
    gpio-sloppy-logic-analyzer
    autofdo
    propeller
-
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
index 24d058faa75c..f078baddf0b7 100644
--- a/Documentation/doc-guide/index.rst
+++ b/Documentation/doc-guide/index.rst
@@ -13,10 +13,3 @@ How to write kernel documentation
    contributing
    maintainer-profile
    checktransupdate
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
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
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 1833e6a0687e..eaf7161ff957 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -149,10 +149,3 @@ Subsystem-specific APIs
    wmi
    xilinx/index
    zorro
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
index 9e1b801d0f74..1abfbecf6ce6 100644
--- a/Documentation/driver-api/pci/index.rst
+++ b/Documentation/driver-api/pci/index.rst
@@ -11,10 +11,3 @@ The Linux PCI driver implementer's API guide
    pci
    p2pdma
    tsm
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
diff --git a/Documentation/fault-injection/index.rst b/Documentation/fault-injection/index.rst
index a6ea1d190222..2a9e30b4202c 100644
--- a/Documentation/fault-injection/index.rst
+++ b/Documentation/fault-injection/index.rst
@@ -11,10 +11,3 @@ Fault-injection
     notifier-error-inject
     nvme-fault-injection
     provoke-crashes
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index e2f7488b6e2e..fe9ca3570941 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -50,10 +50,3 @@ Driver documentation
    vesafb
    viafb
    vt8623fb
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/fpga/index.rst b/Documentation/fpga/index.rst
index 43c968871d99..c5a876165dab 100644
--- a/Documentation/fpga/index.rst
+++ b/Documentation/fpga/index.rst
@@ -8,10 +8,3 @@ FPGA
     :maxdepth: 1
 
     dfl
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 78b80be17f21..2e13e0ad7e88 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -26,10 +26,3 @@ GPU Driver Documentation
    panthor
    zynqmp
    nova/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 7dcb15850afd..2fafa1f35ef3 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -22,10 +22,3 @@ GPU Driver Developer's Guide
    implementation_guidelines
    todo
    rfc/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 85d7a686883e..fc9d39b098ef 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -281,10 +281,3 @@ Hardware Monitoring Kernel Drivers
    xdpe12284
    xdpe152c4
    zl6100
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 2b213d4ce89c..ccf13718ce70 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -66,10 +66,3 @@ Legacy documentation
    :maxdepth: 1
 
    old-module-parameters
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/infiniband/index.rst b/Documentation/infiniband/index.rst
index 5b4c24125f66..c11049d25703 100644
--- a/Documentation/infiniband/index.rst
+++ b/Documentation/infiniband/index.rst
@@ -15,10 +15,3 @@ InfiniBand
    ucaps
    user_mad
    user_verbs
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
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 35581cd18e91..fbde5bc9f641 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -10,10 +10,3 @@ Contents:
    input_uapi
    input_kapi
    devices/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/isdn/index.rst b/Documentation/isdn/index.rst
index 9622939fa526..d1125a16a746 100644
--- a/Documentation/isdn/index.rst
+++ b/Documentation/isdn/index.rst
@@ -12,10 +12,3 @@ ISDN
    m_isdn
 
    credits
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 3731ab22bfe7..f46233be82b9 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -24,10 +24,3 @@ Kernel Build System
     gendwarfksyms
 
     bash-completion
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/livepatch/index.rst b/Documentation/livepatch/index.rst
index cebf1c71d4a5..d2e7aa0f7f89 100644
--- a/Documentation/livepatch/index.rst
+++ b/Documentation/livepatch/index.rst
@@ -15,10 +15,3 @@ Kernel Livepatching
     system-state
     reliable-stacktrace
     api
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/locking/index.rst b/Documentation/locking/index.rst
index 6a9ea96c8bcb..9278d95b7dcb 100644
--- a/Documentation/locking/index.rst
+++ b/Documentation/locking/index.rst
@@ -24,10 +24,3 @@ Locking
     percpu-rw-semaphore
     robust-futexes
     robust-futex-ABI
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
index 1d8dec302780..0aa00482aa2e 100644
--- a/Documentation/mhi/index.rst
+++ b/Documentation/mhi/index.rst
@@ -9,10 +9,3 @@ MHI
 
    mhi
    topology
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/netlabel/index.rst b/Documentation/netlabel/index.rst
index 984e1b191b12..bb6ba7d5c200 100644
--- a/Documentation/netlabel/index.rst
+++ b/Documentation/netlabel/index.rst
@@ -12,10 +12,3 @@ NetLabel
     lsm_interface
 
     draft_ietf
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
index bcc02355f828..142ac0bf781b 100644
--- a/Documentation/networking/device_drivers/ethernet/index.rst
+++ b/Documentation/networking/device_drivers/ethernet/index.rst
@@ -64,10 +64,3 @@ Contents:
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
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 75db2251649b..0f72de94b881 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -134,10 +134,3 @@ Contents:
    xfrm/index
    xdp-rx-metadata
    xsk-tx-metadata
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/pcmcia/index.rst b/Documentation/pcmcia/index.rst
index 8067236c51ab..89c004816140 100644
--- a/Documentation/pcmcia/index.rst
+++ b/Documentation/pcmcia/index.rst
@@ -11,10 +11,3 @@ PCMCIA
     devicetable
     locking
     driver-changes
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
index 930e75217c33..1443c31a0d18 100644
--- a/Documentation/peci/index.rst
+++ b/Documentation/peci/index.rst
@@ -7,10 +7,3 @@ PECI Subsystem
 .. toctree::
 
    peci
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index ea70633d9ce6..b4581e4ae785 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -38,10 +38,3 @@ Power Management
     regulator/machine
     regulator/overview
     regulator/regulator
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
 
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index 9d1a73329007..7bea184b7338 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -110,10 +110,3 @@ developers:
 
    kernel-docs
    deprecated
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index ec62001c7d8c..7a31843cd4a3 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -58,10 +58,3 @@ more details.
 
 You can also find learning materials for Rust in its section in
 :doc:`../process/kernel-docs`.
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 5dd53e47bc0c..17ce8d76befc 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -25,10 +25,3 @@ Scheduler
     sched-debug
 
     text_files
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 51cd736f65b5..c075ca6e11eb 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -15,10 +15,3 @@ Sound Subsystem Documentation
    cards/index
    codecs/index
    utimers
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/sphinx-includes/subproject-index.rst b/Documentation/sphinx-includes/subproject-index.rst
new file mode 100644
index 000000000000..efffdb5fb017
--- /dev/null
+++ b/Documentation/sphinx-includes/subproject-index.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. This file is included in subproject root documents in conf.py
+
+Indices
+=======
+
+* :ref:`genindex`
diff --git a/Documentation/spi/index.rst b/Documentation/spi/index.rst
index 824ce42ed4f0..20d4a4185ab9 100644
--- a/Documentation/spi/index.rst
+++ b/Documentation/spi/index.rst
@@ -12,10 +12,3 @@ Serial Peripheral Interface (SPI)
    butterfly
    spi-lm70llp
    spi-sc18is602
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/target/index.rst b/Documentation/target/index.rst
index 4b24f81f747e..51fa8ebc652e 100644
--- a/Documentation/target/index.rst
+++ b/Documentation/target/index.rst
@@ -10,10 +10,3 @@ TCM Virtual Device
     tcmu-design
     tcm_mod_builder
     scripts
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 62afb7ee9b52..10c3cecde85d 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -12,10 +12,3 @@ TEE Subsystem
    amd-tee
    ts-tee
    qtee
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/timers/index.rst b/Documentation/timers/index.rst
index 4e88116e4dcf..c8352756b480 100644
--- a/Documentation/timers/index.rst
+++ b/Documentation/timers/index.rst
@@ -13,10 +13,3 @@ Timers
     no_hz
     timekeeping
     delay_sleep_functions
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index 80488e290e10..27488bd3eb91 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -12,10 +12,3 @@ more additions are needed here:
 
    rtla/index
    rv/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
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
diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index b4a429dc4f7a..cfd8128ac56d 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -95,10 +95,3 @@ Additional Resources
 
 For more details, refer to the respective documentation of each
 tracing tool and framework.
-
-.. only:: subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
index 826492c813ac..605233febd7a 100644
--- a/Documentation/usb/index.rst
+++ b/Documentation/usb/index.rst
@@ -31,10 +31,3 @@ USB support
 
     usb-help
     text_files
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
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
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 8a61ac4c1bf1..6f0235ecc572 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -68,10 +68,3 @@ Everything else
    futex2
    perf_ring_buffer
    ntsync
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 7fb55ae08598..c1f0bbc37315 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -16,10 +16,3 @@ Virtualization Support
    coco/sev-guest
    coco/tdx-guest
    hyperv/index
-
-.. only:: html and subproject
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/w1/index.rst b/Documentation/w1/index.rst
index 156279f17553..2e7bd8afea84 100644
--- a/Documentation/w1/index.rst
+++ b/Documentation/w1/index.rst
@@ -12,10 +12,3 @@
    w1-netlink.rst
    masters/index
    slaves/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 4603f2511f58..1cea24681e6b 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -16,10 +16,3 @@ Watchdog Support
     watchdog-pm
     wdt
     convert_drivers_to_kernel_api
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
diff --git a/Documentation/wmi/index.rst b/Documentation/wmi/index.rst
index fec4b6ae97b3..56016078fc79 100644
--- a/Documentation/wmi/index.rst
+++ b/Documentation/wmi/index.rst
@@ -10,11 +10,3 @@ WMI Subsystem
    acpi-interface
    driver-development-guide
    devices/index
-
-.. only::  subproject and html
-
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-- 
2.47.3

