Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926C0320A34
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948642; cv=none; b=rePlik+yKAt28692Vm4HZDZ1JIsVQYBe5BWqtmpsWJiEQWqJ0+uGQBgj1tuV+cpF5Y0Gvhma6sxyXMMIldB3Z/KeBIbEmEnp8KqC6IUI7KCSneJja2gUHNzm+ajewY6xoZPRnfDTQIdiDBMvHVlEccWKQ2GErMRhXkmHVoXu2Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948642; c=relaxed/simple;
	bh=7yXsloASG19xEZXexezlMswV0zbaIIX1xTyn+6en74o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CzBILW/Pot4fYJ1DLGlHPyOt9CikwaTKDANMNsTCK1UCE46UM3YKomZXaVm4w3JCmzAymba+fkvL1UX1CyUnRfL0v2ssSUQ+ZvV/4RmnNza1FxbV6uGUxdiSRPVAxMQS6qZ/Qs5V3tpSZNPEvxnkxgG8CcQcGKW8rMoHeCUKXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRVwKAHL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRVwKAHL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948641; x=1794484641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7yXsloASG19xEZXexezlMswV0zbaIIX1xTyn+6en74o=;
  b=QRVwKAHLyn7Fy0k+ytmtqqNMfuMA00xkqgrrv84YCxt9jbvFMdcFXFEg
   ClOW/BjFJYJh0P7biL3/w08G18xQo0OFofU+d8D5jmWOgOH+Ajaz9lnCL
   FFnRipYl1Gh+bx1gB+aN107fKKuOpTW9Ex5Z5Mctywp6ErsHFHpo1Lg7h
   USzxy9Vb1hrxXvVPaiASj+TFsfFZqyYX9vEeZvI8841QDjTusTIQCJ4PN
   xSz5K3w1qJWR4ehzgiWOP1L54Tuon47wgL0VelUblHtpt5vM5wQhngufB
   xQE70peQNQYzXYYNg3dHjvPSr30E3aeKmo9XJIbBnVrOaFO9Gr2kTvNhB
   A==;
X-CSE-ConnectionGUID: opS+aH8cQU2prErG+srUNg==
X-CSE-MsgGUID: XRNRhANdSb+usW3PiEBNqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467815"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76467815"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:21 -0800
X-CSE-ConnectionGUID: eeXp+mSCRl6SNGTOEp5OzQ==
X-CSE-MsgGUID: t4/bxsGoS8uSY+iwn1OYeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193323627"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/4] Documentation: use a source-read extension to include the index boilerplate
Date: Wed, 12 Nov 2025 13:56:54 +0200
Message-ID: <e404d14ad5e9ed0ddc3f8920efb5d156dff99021.1762948491.git.jani.nikula@intel.com>
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
Content-Transfer-Encoding: 8bit

Reduce boilerplate all over the place by adding a small ad hoc extension
in conf.py that adds the ../sphinx-includes/subproject-index.rst include
to all SPHINXDIRS builds.

Note that the docname is just 'index', because the SPHINXDIRS builds
happen in the subdirectories.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/RCU/index.rst             | 4 ----
 Documentation/accel/index.rst           | 4 ----
 Documentation/admin-guide/index.rst     | 4 ----
 Documentation/bpf/index.rst             | 4 ----
 Documentation/cdrom/index.rst           | 4 ----
 Documentation/conf.py                   | 6 ++++++
 Documentation/core-api/index.rst        | 4 ----
 Documentation/dev-tools/index.rst       | 5 -----
 Documentation/doc-guide/index.rst       | 4 ----
 Documentation/driver-api/index.rst      | 4 ----
 Documentation/fault-injection/index.rst | 4 ----
 Documentation/fb/index.rst              | 4 ----
 Documentation/fpga/index.rst            | 4 ----
 Documentation/gpu/drivers.rst           | 4 ----
 Documentation/gpu/index.rst             | 4 ----
 Documentation/hwmon/index.rst           | 4 ----
 Documentation/i2c/index.rst             | 4 ----
 Documentation/infiniband/index.rst      | 4 ----
 Documentation/input/index.rst           | 4 ----
 Documentation/isdn/index.rst            | 4 ----
 Documentation/kbuild/index.rst          | 4 ----
 Documentation/livepatch/index.rst       | 4 ----
 Documentation/locking/index.rst         | 4 ----
 Documentation/mhi/index.rst             | 4 ----
 Documentation/netlabel/index.rst        | 4 ----
 Documentation/networking/index.rst      | 4 ----
 Documentation/pcmcia/index.rst          | 4 ----
 Documentation/peci/index.rst            | 4 ----
 Documentation/power/index.rst           | 4 ----
 Documentation/process/index.rst         | 4 ----
 Documentation/rust/index.rst            | 4 ----
 Documentation/scheduler/index.rst       | 4 ----
 Documentation/sound/index.rst           | 4 ----
 Documentation/spi/index.rst             | 4 ----
 Documentation/target/index.rst          | 4 ----
 Documentation/tee/index.rst             | 4 ----
 Documentation/timers/index.rst          | 4 ----
 Documentation/tools/index.rst           | 4 ----
 Documentation/trace/index.rst           | 4 ----
 Documentation/translations/index.rst    | 4 ----
 Documentation/usb/index.rst             | 4 ----
 Documentation/userspace-api/index.rst   | 4 ----
 Documentation/virt/index.rst            | 4 ----
 Documentation/w1/index.rst              | 4 ----
 Documentation/watchdog/index.rst        | 4 ----
 Documentation/wmi/index.rst             | 4 ----
 46 files changed, 6 insertions(+), 181 deletions(-)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 5a981a21f035..035871687ee2 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -28,7 +28,3 @@ RCU Handbook
    Design/Expedited-Grace-Periods/Expedited-Grace-Periods
    Design/Requirements/Requirements
    Design/Data-Structures/Data-Structures
-
-.. only:: subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index 80039349c9c1..cbc7d4c3876a 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -11,7 +11,3 @@ Compute Accelerators
    amdxdna/index
    qaic/index
    rocket/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index dcc9a597ea1b..b734f8a2a2c4 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -189,7 +189,3 @@ A few hard-to-categorize and generally obsolete documents.
 
    ldm
    unicode
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index d7032e0b2797..0d5c6f659266 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -34,9 +34,5 @@ that goes into great technical depth about the BPF Architecture.
    other
    redirect
 
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
-
 .. Links:
 .. _BPF and XDP Reference Guide: https://docs.cilium.io/en/latest/bpf/
diff --git a/Documentation/cdrom/index.rst b/Documentation/cdrom/index.rst
index 902ee9181786..50050e219910 100644
--- a/Documentation/cdrom/index.rst
+++ b/Documentation/cdrom/index.rst
@@ -8,7 +8,3 @@ CD-ROM
     :maxdepth: 1
 
     cdrom-standard
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/conf.py b/Documentation/conf.py
index b9a43ee32a00..cb0936a71d52 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -589,8 +589,14 @@ kerneldoc_srctree = ".."
 # ------------------------------------------------------------------------------
 loadConfig(globals())
 
+# Add index link to SPHINXDIRS builds
+def add_subproject_index(app, docname, source):
+    if app.builder.tags.has('subproject') and app.builder.tags.has('html'):
+        if docname == 'index':
+            source[0] += '\n.. include:: ../sphinx-includes/subproject-index.rst\n'
 
 def setup(app):
     """Patterns need to be updated at init time on older Sphinx versions"""
 
     app.connect('config-inited', config_init)
+    app.connect("source-read", add_subproject_index)
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 203dc3605e04..cb04a579a4b7 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -139,7 +139,3 @@ Documents that don't fit elsewhere or which have yet to be categorized.
 
    librs
    netlink
-
-.. only:: subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index f74ac0caba75..4fc9d15f91d0 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -38,8 +38,3 @@ Documentation/process/debugging/index.rst
    gpio-sloppy-logic-analyzer
    autofdo
    propeller
-
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
index 3c9e509684c7..f078baddf0b7 100644
--- a/Documentation/doc-guide/index.rst
+++ b/Documentation/doc-guide/index.rst
@@ -13,7 +13,3 @@ How to write kernel documentation
    contributing
    maintainer-profile
    checktransupdate
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 6f2caed77490..8c720a913060 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -147,7 +147,3 @@ Subsystem-specific APIs
    wmi
    xilinx/index
    zorro
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fault-injection/index.rst b/Documentation/fault-injection/index.rst
index 91d5a8a0a8ab..2a9e30b4202c 100644
--- a/Documentation/fault-injection/index.rst
+++ b/Documentation/fault-injection/index.rst
@@ -11,7 +11,3 @@ Fault-injection
     notifier-error-inject
     nvme-fault-injection
     provoke-crashes
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index ce3b80494124..fe9ca3570941 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -50,7 +50,3 @@ Driver documentation
    vesafb
    viafb
    vt8623fb
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fpga/index.rst b/Documentation/fpga/index.rst
index 5977004b6ea0..c5a876165dab 100644
--- a/Documentation/fpga/index.rst
+++ b/Documentation/fpga/index.rst
@@ -8,7 +8,3 @@ FPGA
     :maxdepth: 1
 
     dfl
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 6e17e0cdcde6..2e13e0ad7e88 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -26,7 +26,3 @@ GPU Driver Documentation
    panthor
    zynqmp
    nova/index
-
-.. only::  subproject and html
-
-   .. include:: sphinx-includes/subproject-index.rst
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 7a2ad0dc58cd..2fafa1f35ef3 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -22,7 +22,3 @@ GPU Driver Developer's Guide
    implementation_guidelines
    todo
    rfc/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index be636db256d8..c4510e773549 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -276,7 +276,3 @@ Hardware Monitoring Kernel Drivers
    xdpe12284
    xdpe152c4
    zl6100
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 41b194532b36..ccf13718ce70 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -66,7 +66,3 @@ Legacy documentation
    :maxdepth: 1
 
    old-module-parameters
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/infiniband/index.rst b/Documentation/infiniband/index.rst
index 7fa5dfec0cdd..c11049d25703 100644
--- a/Documentation/infiniband/index.rst
+++ b/Documentation/infiniband/index.rst
@@ -15,7 +15,3 @@ InfiniBand
    ucaps
    user_mad
    user_verbs
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index bbf458cc539f..fbde5bc9f641 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -10,7 +10,3 @@ Contents:
    input_uapi
    input_kapi
    devices/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/isdn/index.rst b/Documentation/isdn/index.rst
index 4b95621f0caf..d1125a16a746 100644
--- a/Documentation/isdn/index.rst
+++ b/Documentation/isdn/index.rst
@@ -12,7 +12,3 @@ ISDN
    m_isdn
 
    credits
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 89a458f422a3..f46233be82b9 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -24,7 +24,3 @@ Kernel Build System
     gendwarfksyms
 
     bash-completion
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/livepatch/index.rst b/Documentation/livepatch/index.rst
index 1e1db6f3f89f..d2e7aa0f7f89 100644
--- a/Documentation/livepatch/index.rst
+++ b/Documentation/livepatch/index.rst
@@ -15,7 +15,3 @@ Kernel Livepatching
     system-state
     reliable-stacktrace
     api
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/locking/index.rst b/Documentation/locking/index.rst
index ef6b2d5cdb70..9278d95b7dcb 100644
--- a/Documentation/locking/index.rst
+++ b/Documentation/locking/index.rst
@@ -24,7 +24,3 @@ Locking
     percpu-rw-semaphore
     robust-futexes
     robust-futex-ABI
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
index 2cbfe3546a56..0aa00482aa2e 100644
--- a/Documentation/mhi/index.rst
+++ b/Documentation/mhi/index.rst
@@ -9,7 +9,3 @@ MHI
 
    mhi
    topology
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/netlabel/index.rst b/Documentation/netlabel/index.rst
index 950da3009cad..bb6ba7d5c200 100644
--- a/Documentation/netlabel/index.rst
+++ b/Documentation/netlabel/index.rst
@@ -12,7 +12,3 @@ NetLabel
     lsm_interface
 
     draft_ietf
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 5e59b14d9e4e..c322fd1bbe26 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -137,7 +137,3 @@ Contents:
    xfrm_sysctl
    xdp-rx-metadata
    xsk-tx-metadata
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/pcmcia/index.rst b/Documentation/pcmcia/index.rst
index 36373e6b9eb1..89c004816140 100644
--- a/Documentation/pcmcia/index.rst
+++ b/Documentation/pcmcia/index.rst
@@ -11,7 +11,3 @@ PCMCIA
     devicetable
     locking
     driver-changes
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
index eb9aff64abbd..1443c31a0d18 100644
--- a/Documentation/peci/index.rst
+++ b/Documentation/peci/index.rst
@@ -7,7 +7,3 @@ PECI Subsystem
 .. toctree::
 
    peci
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index cabf2841e8d9..ffc38b7c7380 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -37,7 +37,3 @@ Power Management
     regulator/machine
     regulator/overview
     regulator/regulator
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index cfc86f67630c..02936d667b40 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -108,7 +108,3 @@ developers:
 
    kernel-docs
    deprecated
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index 7400f5076764..7a31843cd4a3 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -58,7 +58,3 @@ more details.
 
 You can also find learning materials for Rust in its section in
 :doc:`../process/kernel-docs`.
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 88f957a9b515..17ce8d76befc 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -25,7 +25,3 @@ Scheduler
     sched-debug
 
     text_files
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 1bc480b65369..c075ca6e11eb 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -15,7 +15,3 @@ Sound Subsystem Documentation
    cards/index
    codecs/index
    utimers
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/spi/index.rst b/Documentation/spi/index.rst
index 3fd67d4ec3fa..20d4a4185ab9 100644
--- a/Documentation/spi/index.rst
+++ b/Documentation/spi/index.rst
@@ -12,7 +12,3 @@ Serial Peripheral Interface (SPI)
    butterfly
    spi-lm70llp
    spi-sc18is602
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/target/index.rst b/Documentation/target/index.rst
index 518a2dae2073..51fa8ebc652e 100644
--- a/Documentation/target/index.rst
+++ b/Documentation/target/index.rst
@@ -10,7 +10,3 @@ TCM Virtual Device
     tcmu-design
     tcm_mod_builder
     scripts
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index fd438e69a035..10c3cecde85d 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -12,7 +12,3 @@ TEE Subsystem
    amd-tee
    ts-tee
    qtee
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/timers/index.rst b/Documentation/timers/index.rst
index 5db11fbcb4b3..c8352756b480 100644
--- a/Documentation/timers/index.rst
+++ b/Documentation/timers/index.rst
@@ -13,7 +13,3 @@ Timers
     no_hz
     timekeeping
     delay_sleep_functions
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index b6059307f413..27488bd3eb91 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -12,7 +12,3 @@ more additions are needed here:
 
    rtla/index
    rv/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index 38bb76ad751a..cfd8128ac56d 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -95,7 +95,3 @@ Additional Resources
 
 For more details, refer to the respective documentation of each
 tracing tool and framework.
-
-.. only:: subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
index 8dd6ea1fd670..b826c34791c0 100644
--- a/Documentation/translations/index.rst
+++ b/Documentation/translations/index.rst
@@ -57,7 +57,3 @@ in a different form.
 If you need to communicate with the Linux community but you do not feel
 comfortable writing in English, you can ask the translation's maintainers
 for help.
-
-.. only:: subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
index 1014b07df9fb..605233febd7a 100644
--- a/Documentation/usb/index.rst
+++ b/Documentation/usb/index.rst
@@ -31,7 +31,3 @@ USB support
 
     usb-help
     text_files
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index 7936933fd93b..76805a1052e2 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -67,7 +67,3 @@ Everything else
    futex2
    perf_ring_buffer
    ntsync
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 0e1371664d2e..c1f0bbc37315 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -16,7 +16,3 @@ Virtualization Support
    coco/sev-guest
    coco/tdx-guest
    hyperv/index
-
-.. only:: html and subproject
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/w1/index.rst b/Documentation/w1/index.rst
index 8fc0299aa2cd..2e7bd8afea84 100644
--- a/Documentation/w1/index.rst
+++ b/Documentation/w1/index.rst
@@ -12,7 +12,3 @@
    w1-netlink.rst
    masters/index
    slaves/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 16e72a9bf4de..1cea24681e6b 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -16,7 +16,3 @@ Watchdog Support
     watchdog-pm
     wdt
     convert_drivers_to_kernel_api
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/wmi/index.rst b/Documentation/wmi/index.rst
index 5f0856f8831c..56016078fc79 100644
--- a/Documentation/wmi/index.rst
+++ b/Documentation/wmi/index.rst
@@ -10,7 +10,3 @@ WMI Subsystem
    acpi-interface
    driver-development-guide
    devices/index
-
-.. only::  subproject and html
-
-   .. include:: ../sphinx-includes/subproject-index.rst
-- 
2.47.3

