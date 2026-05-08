Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E616362153
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778238745; cv=none; b=Q0eowGCyr8QAgxSLOIkMvtiF3qNFVAdf5cs7J0brCgq3QmF7yrxz6Erp3yMVdRqqvF7OU2+C5jBjKtBBn8IP7ojsteN/olhoKbyhlw6ik28kRHZj2o4omEsnFg6AcBOJJdk3CE5KLOaOEgvajwkITSmCmg56DR2Kj1+apn4U5y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778238745; c=relaxed/simple;
	bh=cuQhzJlt8L3pcG2aKMOAoVwP+8QXeYf/pjasdWUjSiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciXYKYn8MGpwMItU+wOPGWA3l8MJ5kuCBmsWdW9ySYIkCyoE3gqj1h9imv3SuSbYxRM94ZCegU1AfBAvFhBepJb0MEHRHJP2gsmjQYzTtt/3USNzHwbXwhoJg09RNA9TXo9FxNYkAruBKNe4Ii7uy1NDjWwAe3oJ1G/UikKLlmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzMekmZN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzMekmZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778238744; x=1809774744;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cuQhzJlt8L3pcG2aKMOAoVwP+8QXeYf/pjasdWUjSiQ=;
  b=EzMekmZNtkummuR3SCKk3GE7ryqgjhIbSem5fn8O0oKUDLv4P7fxCMPK
   q2zK+FpiY295CEnbMQyF1DgYnYu++1g226Df5UUoxQ0kj76tr0ObJAMdO
   a3HjfR7+SWCtgf1RnYT3SUku2b8g1kDzyTwypO9dzN8O8DZ6++zIlp3O3
   XFQ6en7c58E/Mx5r92AngIFu5DZAMnG0t5I8x7zR/qEJskUCaWnmSd0XC
   4mSJtotbO6CYiJ8B1valgN1UrBIsG+BP2G1cODnwlt27siTOAg9YdwTDI
   EMRBI8bMiwWumkmYPFOVZCrWXhNJAoHfrlD6uSmVtttNf1zlhXrPekkow
   A==;
X-CSE-ConnectionGUID: 4CCJfLJPTzCGltDsdpD7bg==
X-CSE-MsgGUID: L8xhOFQoQwuUJpFdiNvpSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79311810"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79311810"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:24 -0700
X-CSE-ConnectionGUID: 3PJBrEJNQreCfRBcfNv4oQ==
X-CSE-MsgGUID: pECfKQltRJiMYezjfp1law==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="236867147"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 04:12:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: jani.nikula@intel.com
Subject: [PATCH 2/3] Documentation/gpu: add some tables of contents to large documents
Date: Fri,  8 May 2026 14:12:08 +0300
Message-ID: <e3f9357c0e8198cc48e69e2a3b8ca072c7ab92ca.1778238671.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778238671.git.jani.nikula@intel.com>
References: <cover.1778238671.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit

Some of the GPU documentation pages are quite long, with various levels
of details. Add document internal tables of contents to the larger
documents to make them easier to navigate.

The index.rst in the sub-directories have toctrees, which provide
similar overviews.

Fix one missing newline at the end of drm-uapi.rst while at it,
primarily because rst should have it, and secondarily because my editor
rst mode refuses to save the file without it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/driver-uapi.rst     | 2 ++
 Documentation/gpu/drm-internals.rst   | 2 ++
 Documentation/gpu/drm-kms-helpers.rst | 2 ++
 Documentation/gpu/drm-kms.rst         | 2 ++
 Documentation/gpu/drm-mm.rst          | 2 ++
 Documentation/gpu/drm-ras.rst         | 2 ++
 Documentation/gpu/drm-uapi.rst        | 4 +++-
 Documentation/gpu/drm-usage-stats.rst | 2 ++
 Documentation/gpu/introduction.rst    | 2 ++
 9 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 1f15a8ca1265..627fc68c7a21 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -2,6 +2,8 @@
 DRM Driver uAPI
 ===============
 
+.. contents::
+
 drm/i915 uAPI
 =============
 
diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 94f93fd3b8a0..a3ce25a36f1d 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -18,6 +18,8 @@ event handling, memory management, output management, framebuffer
 management, command submission & fencing, suspend/resume support, and
 DMA services.
 
+.. contents::
+
 Driver Initialization
 =====================
 
diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index b4a9e5ae81f6..80453dda33b8 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -33,6 +33,8 @@ There are a few areas these helpers can grouped into:
   pipeline: Planes, handling rectangles for visibility checking and scissoring,
   flip queues and assorted bits.
 
+.. contents::
+
 Modeset Helper Reference for Common Vtables
 ===========================================
 
diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index fbe0583eb84c..d22817fdf9aa 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -15,6 +15,8 @@ be setup by initializing the following fields.
 -  struct drm_mode_config_funcs \*funcs;
    Mode setting functions.
 
+.. contents::
+
 Overview
 ========
 
diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 32fb506db05b..2dea94f77d52 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -25,6 +25,8 @@ share it. GEM has simpler initialization and execution requirements than
 TTM, but has no video RAM management capabilities and is thus limited to
 UMA devices.
 
+.. contents::
+
 The Translation Table Manager (TTM)
 ===================================
 
diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
index 4636e68f5678..83c21853b74b 100644
--- a/Documentation/gpu/drm-ras.rst
+++ b/Documentation/gpu/drm-ras.rst
@@ -24,6 +24,8 @@ Key Goals:
   nodes for different IP blocks, sub-blocks, or other logical subdivisions
   as applicable.
 
+.. contents::
+
 Nodes
 =====
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 32206ce62931..2c2f939322fb 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -16,6 +16,8 @@ management, and output management.
 Cover generic ioctls and sysfs layout here. We only need high-level
 info, since man pages should cover the rest.
 
+.. contents::
+
 libdrm Device Lookup
 ====================
 
@@ -765,4 +767,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 24d3012ca7a6..70b7cfcc194f 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -16,6 +16,8 @@ output is split between common and driver specific parts. Having said that,
 wherever possible effort should still be made to standardise as much as
 possible.
 
+.. contents::
+
 File format specification
 =========================
 
diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index d8f519693fc2..64074ac22d9b 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -16,6 +16,8 @@ found in current kernels.
 
 [Insert diagram of typical DRM stack here]
 
+.. contents::
+
 Style Guidelines
 ================
 
-- 
2.47.3

