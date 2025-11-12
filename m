Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCEE31DD90
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948632; cv=none; b=HC2gepaXDiE7bjb+Y5YsQ53vz5NfnOHEKqDx7BPOxkHydvvbYYUWToh1ADvNHa8k320HnbVJluSPthEdwaTPg+PtQnWLh95q0fM+c+kgpv0syvXgzbQlJdx/tAt2cMpAqphfMTEyG8jhrzbHA7/U+78WIXQQbOrWv5jCHhVCxEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948632; c=relaxed/simple;
	bh=Y3N5NbebNgavybitw+ZjPiftuXrgJQXPozh0NAPqzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HXgI/NbMYl/5lL9X0YYHaAS5UYbm/zyFVY2kenK0XCgYNPcwq7F+69p2cIyFsNDkJu3frPmHiQEKXz5Rt5Hf4Z/x57viJPJ1RgY0ostlBnnhhRU1ELcQqzNf82okX955OmNLodPaRE3G1zHlT4nzEIfJY+zzySXMvxpgWmpLBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JQyInO5o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JQyInO5o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762948631; x=1794484631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y3N5NbebNgavybitw+ZjPiftuXrgJQXPozh0NAPqzV8=;
  b=JQyInO5o9JM3WBLC/ni8RUlFu3EVbfBOe7vJBG03qFS8PPYEUok2KpH/
   hep5pExVN4BuMYmpLHEtEVpw6bpjVo5UdKh2hbJAIhl5E0KYTZBjgdPHw
   DKiSlZm851Xd21Ka6UgUnvyQwzmVQhlGndafZcp48bl8DDIuLUFIvk/sQ
   qUCJaH5oK1YyOOLVDLahLgRZsAQRwNMXAetQiOI6e+XlRfRNR9+egfGfW
   o2KB1BYQdNWkdr/Y2q4JhRcDZV86Bufdf2LSQP7Q+azUz16n57BY/RQOj
   X7jxFQOhTOUs5mjZ1YC5gzT0bYH62xUkAjVmIX0lKICQ9UXzmvKU48HHm
   A==;
X-CSE-ConnectionGUID: MX1QUMTBQEu4yxGqbqLmWw==
X-CSE-MsgGUID: 5IaFKAq3QdeAqfsOkHijRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76467803"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="76467803"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:11 -0800
X-CSE-ConnectionGUID: 5PZBBC8GQPq4iNUnuAHRwQ==
X-CSE-MsgGUID: y0gfqhx0RFSEsJ31CUEZJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; 
   d="scan'208";a="193323598"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.54])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 03:57:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 2/4] Documentation: streamline subproject index link in translations
Date: Wed, 12 Nov 2025 13:56:52 +0200
Message-ID: <643adf4e5bc0d7638b4f51d2542c7983cf5cff69.1762948491.git.jani.nikula@intel.com>
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

Remove index links deep inside the translations structure. We'll want:

- Top level index link at the translations index.rst when doing
  SPHINXDIRS builds. Add this.

- Language specific top level index links when doing HTML builds. This
  should not depend on SPHINXDIRS. Most translations have it already,
  add one for Italian, the remaining ones I'm not capable of adding.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/translations/index.rst                     | 7 +++++++
 Documentation/translations/it_IT/RCU/index.rst           | 7 -------
 Documentation/translations/it_IT/core-api/index.rst      | 7 -------
 Documentation/translations/it_IT/doc-guide/index.rst     | 7 -------
 Documentation/translations/it_IT/i2c/index.rst           | 7 -------
 Documentation/translations/it_IT/index.rst               | 7 +++++++
 Documentation/translations/it_IT/locking/index.rst       | 7 -------
 Documentation/translations/it_IT/process/index.rst       | 7 -------
 Documentation/translations/zh_CN/admin-guide/index.rst   | 7 -------
 Documentation/translations/zh_CN/core-api/index.rst      | 7 -------
 Documentation/translations/zh_CN/doc-guide/index.rst     | 7 -------
 Documentation/translations/zh_CN/driver-api/index.rst    | 7 -------
 Documentation/translations/zh_CN/infiniband/index.rst    | 9 ---------
 Documentation/translations/zh_CN/kbuild/index.rst        | 8 --------
 Documentation/translations/zh_CN/locking/index.rst       | 7 -------
 Documentation/translations/zh_CN/networking/index.rst    | 7 -------
 Documentation/translations/zh_CN/peci/index.rst          | 7 -------
 Documentation/translations/zh_CN/power/index.rst         | 7 -------
 Documentation/translations/zh_CN/process/index.rst       | 7 -------
 Documentation/translations/zh_CN/rust/index.rst          | 7 -------
 Documentation/translations/zh_CN/scheduler/index.rst     | 7 -------
 Documentation/translations/zh_CN/sound/index.rst         | 7 -------
 Documentation/translations/zh_CN/userspace-api/index.rst | 7 -------
 Documentation/translations/zh_CN/virt/index.rst          | 7 -------
 Documentation/translations/zh_TW/admin-guide/index.rst   | 8 --------
 Documentation/translations/zh_TW/process/index.rst       | 8 --------
 26 files changed, 14 insertions(+), 173 deletions(-)

diff --git a/Documentation/translations/index.rst b/Documentation/translations/index.rst
index b826c34791c0..fbd7efd80507 100644
--- a/Documentation/translations/index.rst
+++ b/Documentation/translations/index.rst
@@ -57,3 +57,10 @@ in a different form.
 If you need to communicate with the Linux community but you do not feel
 comfortable writing in English, you can ask the translation's maintainers
 for help.
+
+.. only:: subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/RCU/index.rst b/Documentation/translations/it_IT/RCU/index.rst
index 22adf1d58752..e06588ccb11d 100644
--- a/Documentation/translations/it_IT/RCU/index.rst
+++ b/Documentation/translations/it_IT/RCU/index.rst
@@ -10,10 +10,3 @@ Concetti su RCU
    :maxdepth: 3
 
    torture
-
-.. only:: subproject and html
-
-   Indici
-   ======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/core-api/index.rst b/Documentation/translations/it_IT/core-api/index.rst
index dad20402d11b..44320f33feb7 100644
--- a/Documentation/translations/it_IT/core-api/index.rst
+++ b/Documentation/translations/it_IT/core-api/index.rst
@@ -21,10 +21,3 @@ sul tema.
    :maxdepth: 1
 
    ../RCU/index
-
-.. only:: subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/doc-guide/index.rst b/Documentation/translations/it_IT/doc-guide/index.rst
index 9fffff626711..76553a9970d0 100644
--- a/Documentation/translations/it_IT/doc-guide/index.rst
+++ b/Documentation/translations/it_IT/doc-guide/index.rst
@@ -15,10 +15,3 @@ Come scrivere la documentazione del kernel
    sphinx
    kernel-doc
    parse-headers
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/i2c/index.rst b/Documentation/translations/it_IT/i2c/index.rst
index 14fbe3d78299..931a8403f831 100644
--- a/Documentation/translations/it_IT/i2c/index.rst
+++ b/Documentation/translations/it_IT/i2c/index.rst
@@ -37,10 +37,3 @@ Argomenti avanzati
 
 .. toctree::
    :maxdepth: 1
-
-.. only::  subproject and html
-
-   Indici
-   ======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/index.rst b/Documentation/translations/it_IT/index.rst
index afa680607750..fb10549bc729 100644
--- a/Documentation/translations/it_IT/index.rst
+++ b/Documentation/translations/it_IT/index.rst
@@ -135,3 +135,10 @@ Documentazione varia
 Ci sono documenti che sono difficili da inserire nell'attuale organizzazione
 della documentazione; altri hanno bisogno di essere migliorati e/o convertiti
 nel formato *reStructuredText*; altri sono semplicamente troppo vecchi.
+
+.. only:: html
+
+   Indici
+   ======
+
+   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/locking/index.rst b/Documentation/translations/it_IT/locking/index.rst
index 19963d33e84d..3106466230d2 100644
--- a/Documentation/translations/it_IT/locking/index.rst
+++ b/Documentation/translations/it_IT/locking/index.rst
@@ -11,10 +11,3 @@ Sincronizzazione
     lockdep-design
     lockstat
     locktorture
-
-.. only::  subproject and html
-
-   Indici
-   ======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/it_IT/process/index.rst b/Documentation/translations/it_IT/process/index.rst
index 5a5214f5fd72..d3c3354bc2c3 100644
--- a/Documentation/translations/it_IT/process/index.rst
+++ b/Documentation/translations/it_IT/process/index.rst
@@ -98,10 +98,3 @@ degli sviluppatori:
    :maxdepth: 1
 
    kernel-docs
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/admin-guide/index.rst b/Documentation/translations/zh_CN/admin-guide/index.rst
index 15d9ab5993a7..33d20c58fae9 100644
--- a/Documentation/translations/zh_CN/admin-guide/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/index.rst
@@ -123,10 +123,3 @@ Todolist:
 *   vga-softcursor
 *   video-output
 *   xfs
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 453a02cd1f44..7baccf4a4640 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -139,10 +139,3 @@ Todolist:
 Todolist:
 
    librs
-
-.. only:: subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Documentation/translations/zh_CN/doc-guide/index.rst
index 0ac1fc9315ea..faa3e4b8c518 100644
--- a/Documentation/translations/zh_CN/doc-guide/index.rst
+++ b/Documentation/translations/zh_CN/doc-guide/index.rst
@@ -19,10 +19,3 @@
    contributing
    maintainer-profile
    checktransupdate
-
-.. only::  subproject and html
-
-   目录
-   ====
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 4050a2fb51c6..c2acb8211df5 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -120,10 +120,3 @@ Todolist:
 *   xillybus
 *   zorro
 *   hte/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Documentation/translations/zh_CN/infiniband/index.rst
index 5634cc48379f..5c407e727f01 100644
--- a/Documentation/translations/zh_CN/infiniband/index.rst
+++ b/Documentation/translations/zh_CN/infiniband/index.rst
@@ -29,12 +29,3 @@ infiniband
    tag_matching
    user_mad
    user_verbs
-
-
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/kbuild/index.rst b/Documentation/translations/zh_CN/kbuild/index.rst
index 3f9ab52fa5bb..b3e2f70b5959 100644
--- a/Documentation/translations/zh_CN/kbuild/index.rst
+++ b/Documentation/translations/zh_CN/kbuild/index.rst
@@ -26,11 +26,3 @@ TODO:
 - makefiles
 - modules
 - issues
-
-
-.. only::  subproject and html
-
-   目录
-   =====
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/locking/index.rst b/Documentation/translations/zh_CN/locking/index.rst
index f0b10707668d..eab76c1a6ee7 100644
--- a/Documentation/translations/zh_CN/locking/index.rst
+++ b/Documentation/translations/zh_CN/locking/index.rst
@@ -34,10 +34,3 @@ TODOList:
     * percpu-rw-semaphore
     * robust-futexes
     * robust-futex-ABI
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/networking/index.rst b/Documentation/translations/zh_CN/networking/index.rst
index bb0edcffd144..909ce66b2ca3 100644
--- a/Documentation/translations/zh_CN/networking/index.rst
+++ b/Documentation/translations/zh_CN/networking/index.rst
@@ -151,10 +151,3 @@ Todolist:
 *   xfrm_sysctl
 *   xdp-rx-metadata
 *   xsk-tx-metadata
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/peci/index.rst b/Documentation/translations/zh_CN/peci/index.rst
index 4f6694c828fa..53d3ddbf8d4e 100644
--- a/Documentation/translations/zh_CN/peci/index.rst
+++ b/Documentation/translations/zh_CN/peci/index.rst
@@ -17,10 +17,3 @@ Linux PECI 子系统
 
 
    peci
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documentation/translations/zh_CN/power/index.rst
index bc54983ba515..65c1b76ad046 100644
--- a/Documentation/translations/zh_CN/power/index.rst
+++ b/Documentation/translations/zh_CN/power/index.rst
@@ -47,10 +47,3 @@ TODOList:
     * regulator/machine
     * regulator/overview
     * regulator/regulator
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
index 3bcb3bdaf533..c54a732e0e8e 100644
--- a/Documentation/translations/zh_CN/process/index.rst
+++ b/Documentation/translations/zh_CN/process/index.rst
@@ -93,10 +93,3 @@ TODOLIST:
 * adding-syscalls
 * botching-up-ioctls
 * clang-format
-
-.. only::  subproject and html
-
-   目录
-   ====
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index b01f887e7167..c8bfbed908e4 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -19,10 +19,3 @@ Rust
     general-information
     coding-guidelines
     arch-support
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Documentation/translations/zh_CN/scheduler/index.rst
index a8eaa7325f54..e5fe2def2945 100644
--- a/Documentation/translations/zh_CN/scheduler/index.rst
+++ b/Documentation/translations/zh_CN/scheduler/index.rst
@@ -36,10 +36,3 @@ TODOList:
     sched-rt-group
 
     text_files
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/sound/index.rst b/Documentation/translations/zh_CN/sound/index.rst
index 28d5dca34a63..a218856c18ff 100644
--- a/Documentation/translations/zh_CN/sound/index.rst
+++ b/Documentation/translations/zh_CN/sound/index.rst
@@ -13,10 +13,3 @@ Linux 声音子系统文档
    :maxdepth: 2
 
    hd-audio/index
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/userspace-api/index.rst b/Documentation/translations/zh_CN/userspace-api/index.rst
index 5b14721c8264..dfd6590664f8 100644
--- a/Documentation/translations/zh_CN/userspace-api/index.rst
+++ b/Documentation/translations/zh_CN/userspace-api/index.rst
@@ -38,10 +38,3 @@ TODOList:
 * media/index
 * netlink/index
 * vduse
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentation/translations/zh_CN/virt/index.rst
index f8dd13681341..59177de40d3a 100644
--- a/Documentation/translations/zh_CN/virt/index.rst
+++ b/Documentation/translations/zh_CN/virt/index.rst
@@ -29,10 +29,3 @@ TODOLIST:
 
    kvm/index
    uml/user_mode_linux_howto_v2
-
-.. only:: html and subproject
-
-   Indices
-   =======
-
-   * :ref:`genindex`
diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index 9335c0e9105d..74c98c437b91 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -126,11 +126,3 @@ Todolist:
 *   vga-softcursor
 *   video-output
 *   xfs
-
-.. only::  subproject and html
-
-   Indices
-   =======
-
-   * :ref:`genindex`
-
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 65922d9faa20..eb5d8794aa31 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -57,11 +57,3 @@
 
    magic-number
    volatile-considered-harmful
-
-.. only::  subproject and html
-
-   目錄
-   ====
-
-   * :ref:`genindex`
-
-- 
2.47.3

