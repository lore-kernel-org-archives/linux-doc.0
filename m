Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51353451A6
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235679; cv=none; b=cRr3LRSrz1beo1TKbKg4doPpGTC9vcAtvg32dOAjK6F1P1Y+uX2dkRfKKcwOOuaYhkWg7MUOOK4eCNd55WKrhC8bgbxqPeDQrbW8lMpwt+FLpZkFOafBvqs6IZAHbDzzKFjS94+IC1ela0twwPhs3R7VqtKITlY4ousNRuyT3iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235679; c=relaxed/simple;
	bh=cojI/gwaZHr93LDbN4OO8ZbULbP2R4eNiodl6E7Ecs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NjvS+FMgDEzOc+/QSpZxdZhirRrJ93BTfQ9cRgT2hmePrQvhvWBfM6VJIDXvFQx1VdR86KFs9YeiST4aX4JQu+8O7QmBYnGfikxQoHmA3vqtQkm2FNVQlA8ok/7dB3lcwiwyiKXBPOm1qt98q2U1bWOmENx1g7HNOlCrvuPCds4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BxNcf+7K; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BxNcf+7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778235677; x=1809771677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cojI/gwaZHr93LDbN4OO8ZbULbP2R4eNiodl6E7Ecs4=;
  b=BxNcf+7KPpkDRXqpD/ChH3la2iuG9f5h0qYqnWuk1oIJ2Yk2e8d7qiQc
   gvuCycZ/jajMZUTjAGgNUauxaE201R1xdrigxwrMmsKIav4j9eBhYykgp
   nr9xne5+shzZ8iyKFDaKVrmEaG7TIk3Vtpo9/9IKitmmuIizoxghzQJ7Z
   oMR+coIG8fck/ZOz0+BdKkJ+eDO179xKdSLXM2oHhFIwVE8queTIX1vvy
   PhExG7Ahugo6rRezcetDwaUAeMRP4/IV2hb5x0HpRYkULDA225EK1gw5H
   9+C6GYKmeHDE1aFHegSnGuuvtwnrnajs9I+U7ARRe064Gh7I6BUb+eLXX
   A==;
X-CSE-ConnectionGUID: HciTI64ZTdmMZ8/WBy3P+w==
X-CSE-MsgGUID: bx+BI2K5Qw+weg/zp9ExOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79055467"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="79055467"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:21:17 -0700
X-CSE-ConnectionGUID: fJX+Tc7oTtaTIOHJU2ZKJA==
X-CSE-MsgGUID: Idp2DgbXTYKlAbYWVe7f0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="230333933"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.40])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 03:21:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Cc: rodrigo.vivi@intel.com,
	Matthew Brost <matthew.brost@intel.com>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	joonas.lahtinen@linux.intel.com,
	tursulin@ursulin.net,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 3/3] Documentation/gpu: add remaining DOC: comments to Intel display documentation
Date: Fri,  8 May 2026 13:20:49 +0300
Message-ID: <589c46cf9a46763f4fbb7e1756656e6d71ba1431.1778235406.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778235406.git.jani.nikula@intel.com>
References: <cover.1778235406.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not all of the overview DOC: comments in the display driver are
incorporated into the documentation. Add the missing ones, including
some function documentation.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 Documentation/gpu/intel-display/atomic.rst   | 11 +++++++++++
 Documentation/gpu/intel-display/casf.rst     |  8 ++++++++
 Documentation/gpu/intel-display/cmtg.rst     |  8 ++++++++
 Documentation/gpu/intel-display/index.rst    |  4 ++++
 Documentation/gpu/intel-display/snps-phy.rst |  8 ++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 Documentation/gpu/intel-display/atomic.rst
 create mode 100644 Documentation/gpu/intel-display/casf.rst
 create mode 100644 Documentation/gpu/intel-display/cmtg.rst
 create mode 100644 Documentation/gpu/intel-display/snps-phy.rst

diff --git a/Documentation/gpu/intel-display/atomic.rst b/Documentation/gpu/intel-display/atomic.rst
new file mode 100644
index 000000000000..43a473181e7a
--- /dev/null
+++ b/Documentation/gpu/intel-display/atomic.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: MIT
+.. Copyright © 2026 Intel Corporation
+
+Atomic Modeset Support
+======================
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_atomic.c
+   :doc: atomic modeset support
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_atomic.c
+   :internal:
diff --git a/Documentation/gpu/intel-display/casf.rst b/Documentation/gpu/intel-display/casf.rst
new file mode 100644
index 000000000000..406778ccd94c
--- /dev/null
+++ b/Documentation/gpu/intel-display/casf.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: MIT
+.. Copyright © 2026 Intel Corporation
+
+Content Adaptive Sharpness Filter (CASF)
+========================================
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_casf.c
+   :doc: Content Adaptive Sharpness Filter (CASF)
diff --git a/Documentation/gpu/intel-display/cmtg.rst b/Documentation/gpu/intel-display/cmtg.rst
new file mode 100644
index 000000000000..04edd0bd165d
--- /dev/null
+++ b/Documentation/gpu/intel-display/cmtg.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: MIT
+.. Copyright © 2026 Intel Corporation
+
+Common Primary Timing Generator (CMTG)
+======================================
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_cmtg.c
+   :doc: Common Primary Timing Generator (CMTG)
diff --git a/Documentation/gpu/intel-display/index.rst b/Documentation/gpu/intel-display/index.rst
index 8d40363b8f90..01c3d1e576b7 100644
--- a/Documentation/gpu/intel-display/index.rst
+++ b/Documentation/gpu/intel-display/index.rst
@@ -24,8 +24,11 @@ driver. The display driver isn't an independent driver in that sense.
    :caption: Detailed display topics
 
    async-flip
+   atomic
    audio
+   casf
    cdclk
+   cmtg
    dmc
    dpio
    dpll
@@ -37,4 +40,5 @@ driver. The display driver isn't an independent driver in that sense.
    hotplug
    plane
    psr
+   snps-phy
    vbt
diff --git a/Documentation/gpu/intel-display/snps-phy.rst b/Documentation/gpu/intel-display/snps-phy.rst
new file mode 100644
index 000000000000..c9e333fa7f62
--- /dev/null
+++ b/Documentation/gpu/intel-display/snps-phy.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: MIT
+.. Copyright © 2026 Intel Corporation
+
+Synopsis PHY support
+====================
+
+.. kernel-doc:: drivers/gpu/drm/i915/display/intel_snps_phy.c
+   :doc: Synopsis PHY support
-- 
2.47.3

