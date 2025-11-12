Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC43164BD
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948637; cv=none; b=po7otahyR3j6QvJAL8mXe6anKpLuVoN3QSm5wmyspBMWpsVmiNxj1jrVzqBp/4PqbeCg8kgAgUvjaS+p/YKO3RmLfrr3yh1x94FPwjQtJ3VzctmzJ7007Q5mfr9hFJ01L3xlhzOxDZcE+nmNxULq4xJyN6Kivru2QkAT3gSws0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948637; c=relaxed/simple;
	bh=D/bIticwweXferJCAO7No15FIU+heVOfUyFMAfS0OKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPGtSTFPGlPTvTrMbhxIeGcpwq2rgsL4pZmv7ckQqjoqOeBeUyWaJFewn8IJQAP2aZycWn/j5kCUg6hi68mFOeMZw21nBz7svOhbUV9FxX+sYO5bv6Bc6zjk3Dpjc3HwxcYcET/anCNtHbov5lxkq0e8JNvHAHPBncsTT9fB5gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNndu5pG; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNndu5pG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948636; x=1794484636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D/bIticwweXferJCAO7No15FIU+heVOfUyFMAfS0OKY=;
  b=TNndu5pGQrbje5ERpTMF831fTqR+Vus4wN4ypUBtuxxHIeOu1EtLrbau
   gUTo0OjKRRiPKsf92eGb27CThoVIuhz1NMOAGire6F9eAOJkMGmIW9mny
   f6/bY0ZhQoot7B+YT6OFfHgGay4e3O3uPQR8aT02TKBF26WqjbGNM08nL
   UKo/9AScJooFE4J4WNSGiUdlioVPubj9FBYMdTJD+ejGg2Imv18yxlPJp
   QfsIfqEvW5t/in3uB7cUM52he95Am2aTS8QKFtaVJ5GfGBNhKgFtMitGP
   HO0xwKpPn7H+O7Svgy3fCdCrKwWpwi12c3I1y8VdIsaaZU/NwjrsYWsbD
   A==;
X-CSE-ConnectionGUID: 1HfpQrcqRnqBrbgksliZlw==
X-CSE-MsgGUID: PWdgq1HkS0i0L95b/Z7Afw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467809"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76467809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:16 -0800
X-CSE-ConnectionGUID: AO7VPVV8TqSyOHMyTBKh1g==
X-CSE-MsgGUID: 2NXq9kp5QrSpwLHNktKMdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193323622"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 3/4] Documentation: include the boilerplate for SPHINXDIRS index link
Date: Wed, 12 Nov 2025 13:56:53 +0200
Message-ID: <87e4998a80a32d447555d35940bee77aa14a6813.1762948491.git.jani.nikula@intel.com>
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

Repeating the index link boilerplate everywhere is tedious. Put it in a
subproject-index.rst snippet in a new sphinx-includes directory, and
include it.

We'll have to use the relative include, because a) includes are relative
to the source file, b) top level include with
/sphinx-includes/subproject-index.rst does not work with SPHINXDIRS
builds, because the root is the subdirectory in that case.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/RCU/index.rst                        | 5 +----
 Documentation/accel/index.rst                      | 5 +----
 Documentation/admin-guide/index.rst                | 5 +----
 Documentation/bpf/index.rst                        | 5 +----
 Documentation/cdrom/index.rst                      | 5 +----
 Documentation/conf.py                              | 2 +-
 Documentation/core-api/index.rst                   | 5 +----
 Documentation/dev-tools/index.rst                  | 5 +----
 Documentation/doc-guide/index.rst                  | 5 +----
 Documentation/driver-api/index.rst                 | 5 +----
 Documentation/fault-injection/index.rst            | 5 +----
 Documentation/fb/index.rst                         | 5 +----
 Documentation/fpga/index.rst                       | 5 +----
 Documentation/gpu/drivers.rst                      | 5 +----
 Documentation/gpu/index.rst                        | 5 +----
 Documentation/hwmon/index.rst                      | 5 +----
 Documentation/i2c/index.rst                        | 5 +----
 Documentation/infiniband/index.rst                 | 5 +----
 Documentation/input/index.rst                      | 5 +----
 Documentation/isdn/index.rst                       | 5 +----
 Documentation/kbuild/index.rst                     | 5 +----
 Documentation/livepatch/index.rst                  | 5 +----
 Documentation/locking/index.rst                    | 5 +----
 Documentation/mhi/index.rst                        | 5 +----
 Documentation/netlabel/index.rst                   | 5 +----
 Documentation/networking/index.rst                 | 5 +----
 Documentation/pcmcia/index.rst                     | 5 +----
 Documentation/peci/index.rst                       | 5 +----
 Documentation/power/index.rst                      | 5 +----
 Documentation/process/index.rst                    | 5 +----
 Documentation/rust/index.rst                       | 5 +----
 Documentation/scheduler/index.rst                  | 5 +----
 Documentation/sound/index.rst                      | 5 +----
 Documentation/sphinx-includes/subproject-index.rst | 4 ++++
 Documentation/spi/index.rst                        | 5 +----
 Documentation/target/index.rst                     | 5 +----
 Documentation/tee/index.rst                        | 5 +----
 Documentation/timers/index.rst                     | 5 +----
 Documentation/tools/index.rst                      | 5 +----
 Documentation/trace/index.rst                      | 5 +----
 Documentation/translations/index.rst               | 5 +----
 Documentation/usb/index.rst                        | 5 +----
 Documentation/userspace-api/index.rst              | 5 +----
 Documentation/virt/index.rst                       | 5 +----
 Documentation/w1/index.rst                         | 5 +----
 Documentation/watchdog/index.rst                   | 5 +----
 Documentation/wmi/index.rst                        | 6 +-----
 47 files changed, 50 insertions(+), 182 deletions(-)
 create mode 100644 Documentation/sphinx-includes/subproject-index.rst

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index ef26c78507d3..5a981a21f035 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -31,7 +31,4 @@ RCU Handbook
 
 .. only:: subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index d8fa332d60a8..80039349c9c1 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -14,7 +14,4 @@ Compute Accelerators
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 259d79fbeb94..dcc9a597ea1b 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -192,7 +192,4 @@ A few hard-to-categorize and generally obsolete documents.
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 0bb5cb8157f1..d7032e0b2797 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -36,10 +36,7 @@ that goes into great technical depth about the BPF Architecture.
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
 
 .. Links:
 .. _BPF and XDP Reference Guide: https://docs.cilium.io/en/latest/bpf/
diff --git a/Documentation/cdrom/index.rst b/Documentation/cdrom/index.rst
index 3ac4f716612f..902ee9181786 100644
--- a/Documentation/cdrom/index.rst
+++ b/Documentation/cdrom/index.rst
@@ -11,7 +11,4 @@ CD-ROM
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 574896cca198..b9a43ee32a00 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -38,7 +38,7 @@ else:
 doctree = os.path.abspath(".")
 
 # Exclude of patterns that don't contain directory names, in glob format.
-exclude_patterns = []
+exclude_patterns = ['sphinx-includes/*']
 
 # List of patterns that contain directory names in glob format.
 dyn_include_patterns = []
diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
index 6cbdcbfa79c3..203dc3605e04 100644
--- a/Documentation/core-api/index.rst
+++ b/Documentation/core-api/index.rst
@@ -142,7 +142,4 @@ Documents that don't fit elsewhere or which have yet to be categorized.
 
 .. only:: subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 4b8425e348ab..f74ac0caba75 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -42,7 +42,4 @@ Documentation/process/debugging/index.rst
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/doc-guide/index.rst b/Documentation/doc-guide/index.rst
index 24d058faa75c..3c9e509684c7 100644
--- a/Documentation/doc-guide/index.rst
+++ b/Documentation/doc-guide/index.rst
@@ -16,7 +16,4 @@ How to write kernel documentation
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 3e2a270bd828..6f2caed77490 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -150,7 +150,4 @@ Subsystem-specific APIs
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fault-injection/index.rst b/Documentation/fault-injection/index.rst
index a6ea1d190222..91d5a8a0a8ab 100644
--- a/Documentation/fault-injection/index.rst
+++ b/Documentation/fault-injection/index.rst
@@ -14,7 +14,4 @@ Fault-injection
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index e2f7488b6e2e..ce3b80494124 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -53,7 +53,4 @@ Driver documentation
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/fpga/index.rst b/Documentation/fpga/index.rst
index 43c968871d99..5977004b6ea0 100644
--- a/Documentation/fpga/index.rst
+++ b/Documentation/fpga/index.rst
@@ -11,7 +11,4 @@ FPGA
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 78b80be17f21..6e17e0cdcde6 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -29,7 +29,4 @@ GPU Driver Documentation
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: sphinx-includes/subproject-index.rst
diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index 7dcb15850afd..7a2ad0dc58cd 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -25,7 +25,4 @@ GPU Driver Developer's Guide
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 51a5bdf75b08..be636db256d8 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -279,7 +279,4 @@ Hardware Monitoring Kernel Drivers
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/i2c/index.rst b/Documentation/i2c/index.rst
index 2b213d4ce89c..41b194532b36 100644
--- a/Documentation/i2c/index.rst
+++ b/Documentation/i2c/index.rst
@@ -69,7 +69,4 @@ Legacy documentation
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/infiniband/index.rst b/Documentation/infiniband/index.rst
index 5b4c24125f66..7fa5dfec0cdd 100644
--- a/Documentation/infiniband/index.rst
+++ b/Documentation/infiniband/index.rst
@@ -18,7 +18,4 @@ InfiniBand
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
index 35581cd18e91..bbf458cc539f 100644
--- a/Documentation/input/index.rst
+++ b/Documentation/input/index.rst
@@ -13,7 +13,4 @@ Contents:
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/isdn/index.rst b/Documentation/isdn/index.rst
index 9622939fa526..4b95621f0caf 100644
--- a/Documentation/isdn/index.rst
+++ b/Documentation/isdn/index.rst
@@ -15,7 +15,4 @@ ISDN
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/kbuild/index.rst b/Documentation/kbuild/index.rst
index 3731ab22bfe7..89a458f422a3 100644
--- a/Documentation/kbuild/index.rst
+++ b/Documentation/kbuild/index.rst
@@ -27,7 +27,4 @@ Kernel Build System
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/livepatch/index.rst b/Documentation/livepatch/index.rst
index cebf1c71d4a5..1e1db6f3f89f 100644
--- a/Documentation/livepatch/index.rst
+++ b/Documentation/livepatch/index.rst
@@ -18,7 +18,4 @@ Kernel Livepatching
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/locking/index.rst b/Documentation/locking/index.rst
index 6a9ea96c8bcb..ef6b2d5cdb70 100644
--- a/Documentation/locking/index.rst
+++ b/Documentation/locking/index.rst
@@ -27,7 +27,4 @@ Locking
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/mhi/index.rst b/Documentation/mhi/index.rst
index 1d8dec302780..2cbfe3546a56 100644
--- a/Documentation/mhi/index.rst
+++ b/Documentation/mhi/index.rst
@@ -12,7 +12,4 @@ MHI
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/netlabel/index.rst b/Documentation/netlabel/index.rst
index 984e1b191b12..950da3009cad 100644
--- a/Documentation/netlabel/index.rst
+++ b/Documentation/netlabel/index.rst
@@ -15,7 +15,4 @@ NetLabel
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index c775cababc8c..5e59b14d9e4e 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -140,7 +140,4 @@ Contents:
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/pcmcia/index.rst b/Documentation/pcmcia/index.rst
index 8067236c51ab..36373e6b9eb1 100644
--- a/Documentation/pcmcia/index.rst
+++ b/Documentation/pcmcia/index.rst
@@ -14,7 +14,4 @@ PCMCIA
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/peci/index.rst b/Documentation/peci/index.rst
index 930e75217c33..eb9aff64abbd 100644
--- a/Documentation/peci/index.rst
+++ b/Documentation/peci/index.rst
@@ -10,7 +10,4 @@ PECI Subsystem
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/power/index.rst b/Documentation/power/index.rst
index a0f5244fb427..cabf2841e8d9 100644
--- a/Documentation/power/index.rst
+++ b/Documentation/power/index.rst
@@ -40,7 +40,4 @@ Power Management
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/process/index.rst b/Documentation/process/index.rst
index aa12f2660194..cfc86f67630c 100644
--- a/Documentation/process/index.rst
+++ b/Documentation/process/index.rst
@@ -111,7 +111,4 @@ developers:
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
index ec62001c7d8c..7400f5076764 100644
--- a/Documentation/rust/index.rst
+++ b/Documentation/rust/index.rst
@@ -61,7 +61,4 @@ You can also find learning materials for Rust in its section in
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/scheduler/index.rst b/Documentation/scheduler/index.rst
index 5dd53e47bc0c..88f957a9b515 100644
--- a/Documentation/scheduler/index.rst
+++ b/Documentation/scheduler/index.rst
@@ -28,7 +28,4 @@ Scheduler
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index 51cd736f65b5..1bc480b65369 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -18,7 +18,4 @@ Sound Subsystem Documentation
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/sphinx-includes/subproject-index.rst b/Documentation/sphinx-includes/subproject-index.rst
new file mode 100644
index 000000000000..4113bf1c3085
--- /dev/null
+++ b/Documentation/sphinx-includes/subproject-index.rst
@@ -0,0 +1,4 @@
+Indices
+=======
+
+* :ref:`genindex`
diff --git a/Documentation/spi/index.rst b/Documentation/spi/index.rst
index 824ce42ed4f0..3fd67d4ec3fa 100644
--- a/Documentation/spi/index.rst
+++ b/Documentation/spi/index.rst
@@ -15,7 +15,4 @@ Serial Peripheral Interface (SPI)
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/target/index.rst b/Documentation/target/index.rst
index 4b24f81f747e..518a2dae2073 100644
--- a/Documentation/target/index.rst
+++ b/Documentation/target/index.rst
@@ -13,7 +13,4 @@ TCM Virtual Device
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/tee/index.rst b/Documentation/tee/index.rst
index 62afb7ee9b52..fd438e69a035 100644
--- a/Documentation/tee/index.rst
+++ b/Documentation/tee/index.rst
@@ -15,7 +15,4 @@ TEE Subsystem
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/timers/index.rst b/Documentation/timers/index.rst
index 4e88116e4dcf..5db11fbcb4b3 100644
--- a/Documentation/timers/index.rst
+++ b/Documentation/timers/index.rst
@@ -16,7 +16,4 @@ Timers
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index 80488e290e10..b6059307f413 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -15,7 +15,4 @@ more additions are needed here:
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/trace/index.rst b/Documentation/trace/index.rst
index b4a429dc4f7a..38bb76ad751a 100644
--- a/Documentation/trace/index.rst
+++ b/Documentation/trace/index.rst
@@ -98,7 +98,4 @@ tracing tool and framework.
 
 .. only:: subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
index fbd7efd80507..8dd6ea1fd670 100644
--- a/Documentation/translations/index.rst
+++ b/Documentation/translations/index.rst
@@ -60,7 +60,4 @@ for help.
 
 .. only:: subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/usb/index.rst b/Documentation/usb/index.rst
index 826492c813ac..1014b07df9fb 100644
--- a/Documentation/usb/index.rst
+++ b/Documentation/usb/index.rst
@@ -34,7 +34,4 @@ USB support
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
index b8c73be4fb11..7936933fd93b 100644
--- a/Documentation/userspace-api/index.rst
+++ b/Documentation/userspace-api/index.rst
@@ -70,7 +70,4 @@ Everything else
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/virt/index.rst b/Documentation/virt/index.rst
index 7fb55ae08598..0e1371664d2e 100644
--- a/Documentation/virt/index.rst
+++ b/Documentation/virt/index.rst
@@ -19,7 +19,4 @@ Virtualization Support
 
 .. only:: html and subproject
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/w1/index.rst b/Documentation/w1/index.rst
index 156279f17553..8fc0299aa2cd 100644
--- a/Documentation/w1/index.rst
+++ b/Documentation/w1/index.rst
@@ -15,7 +15,4 @@
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/watchdog/index.rst b/Documentation/watchdog/index.rst
index 4603f2511f58..16e72a9bf4de 100644
--- a/Documentation/watchdog/index.rst
+++ b/Documentation/watchdog/index.rst
@@ -19,7 +19,4 @@ Watchdog Support
 
 .. only::  subproject and html
 
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
diff --git a/Documentation/wmi/index.rst b/Documentation/wmi/index.rst
index fec4b6ae97b3..5f0856f8831c 100644
--- a/Documentation/wmi/index.rst
+++ b/Documentation/wmi/index.rst
@@ -13,8 +13,4 @@ WMI Subsystem
 
 .. only::  subproject and html
 
-
-   Indices
-   =======
-
-   * :ref:`genindex`
+   .. include:: ../sphinx-includes/subproject-index.rst
-- 
2.47.3

