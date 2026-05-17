Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849671C84A2
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 13:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779025299; cv=none; b=WiNvidsYH6S0XsJZUUROkSMVjSYhXpPGyn1bP5d1lgIBJpeJTIH5t93mi6TA+bsWEqrY9tpy9A33LzB0avcM5UTiNKXiV2649d1vXLnE9/vwxHd37CQauYZmi3Op+UJ+U0jqtHfvJrQMUxKIK63r6W7zxOkYr6RMWl7mccHqtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779025299; c=relaxed/simple;
	bh=7Y0ReJXNUS5w7p1PQFhAmWmhyBq6tUOUn6HIe366q6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJz+TZategOvaWjv0kcmUqcJT1fvNoq/y5nTwSPJBjLMpBjKpXudHnkpc1qzm70Ee1GyD31lkCiaBL/W7ddeH2c8ZG9dXk9oqkpgacpstFr0fgcMuvprag+ISpgNerTdXM7JXvqJg5yvjQQoi/eGCZCG/68H38Z/OHZW4RR0Lbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HopwKcDA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HopwKcDA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-453903ee4adso1142602f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779025295; x=1779630095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0Fqrssiq5EKJqOqnUySdSTXrmaCviyXE8eaNVLH4Wo=;
        b=HopwKcDA3I+5h2/tRrvagVhpOEm8GcdxvUs24So0lbYwKzqGNlrKUxAALo8Hdn8WPb
         Vi2beSlEEwiPa9GCKN4gLKEmfY5nmne9CHKO+e7K6t+Ap0k3g9ELC1Omplr8u2pXW4jN
         q43vsW9GHY5TKt6HlkV3Bi4lKJWYscoSRbh+GNfhUl9X25ZdmjM0q1HLfDgPeukdzTWe
         IrEp8DfDmGBcEQbumrgT3f3Ay7wlhECrWtPkgNhnQFF54F2IDg0/TyBuJb/1Q0sSmvxj
         kufAx7ah2Ow8a0KZHyPkl4P3sSpdeL+ND1xW2ur8movBdo/VziFzAVRU7zqE1STEBKr7
         eQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779025295; x=1779630095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0Fqrssiq5EKJqOqnUySdSTXrmaCviyXE8eaNVLH4Wo=;
        b=pk229JQuPor9RUIebMic4S6C3mwQPjOCKlA29Sqsg+mIVre5snfXe2StEQvNsU/R3v
         pwUlg9OlBYyS9gn1ina1r+PKDANnoGdZnOdflJ+JHb7wa46ZbZOhC1kI0DhN8psdrqi9
         AXNiHVW6cjByHaUcS0hyX11tSrFQA9+Sh7v7YcxWMWmtp6ccVpeheZE3b2uq0Yw7GYkO
         Dh5ZDWd8cNOl/ukYu5tXnzEj/7fgvinZdQ0nUIrS1oOk8tWW7E7DA3y1Q3TGHWtIGGqo
         RQuC6Tg3A/U068V9elcBjv/XPKU4BaDBNPGpqYlIBvmz34g/+BI687PEoFEm7cvrfdt8
         hJyw==
X-Forwarded-Encrypted: i=1; AFNElJ+dn4OHLK3bXcUiAYpQRSXxN+Rdf35ARg1xuoYmajPjwmRcIEP5N9lvPkEMGc7EHGnvYIS/ZH6oIoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9mFgKkqpv7t971P2l0eh5qinVeVx3wPQvFatwQmRsuc0oDqji
	nRVMNt6baxDtofRFo71JqtIrRahutp9RNnrzYObPOlOxp/NbxiRcQkqJ
X-Gm-Gg: Acq92OHPKf4+ffuraI21b0e4Mi8YmTWCbRekZC+mOc3VJF5zNGLovWSaxVPhVApQw37
	m5dl2lI1YWQuvq4xj5BiJtNkSqxV0sqtYxWrLAaFIMyvzCye+69dVTtJ3o/3eQfbuVXwMngbdcc
	QdfeBT2DtpOhyMmIhgcBqQ4kH7RHaI/xSHdCVj4E91BSYExfhWro+nNMDr96ew3fPbkPGY/zMh/
	OtdbU7x7oqSkn5RJh/7BWbaCpZbq16dJBi4uG2TJjT6qCErKO1Hg6eyeOFnTUflicSmS5jEbOLj
	tfzK6hTvWW3XqF0SZUyD0IcANwaTC9T9GsuRD+HbemYcW5SKbyIf03fY3VuxoEjshaaCSHLJLM1
	5iuEGedzzgplwB+nKlu7Vxpazb0am+d5ZNGdj8tTZ7fprEoLTZrON9tAM6Tg8H/sZi4G6v94XBA
	5mVCbheUKYor3w/6kpd+4r5bwLyb3oNePOzuhgvGNACav+O/RWluv8Oquo3a7ILIkXGaKhC9FHV
	w==
X-Received: by 2002:a05:6000:4010:b0:43f:df1b:9e07 with SMTP id ffacd0b85a97d-45e5c5a5580mr16862802f8f.42.1779025294346;
        Sun, 17 May 2026 06:41:34 -0700 (PDT)
Received: from localhost.localdomain (i59F7ABEC.versanet.de. [89.247.171.236])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm28231673f8f.36.2026.05.17.06.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 06:41:33 -0700 (PDT)
From: Elliot Tester <elliotctester1@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Elliot Tester <elliotctester1@gmail.com>
Subject: [PATCH] docs: gpu: fix spelling errors and remove duplicate sentence
Date: Sun, 17 May 2026 15:41:22 +0200
Message-ID: <20260517134122.38389-1-elliotctester1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix various spelling errors in GPU docs:
- indicies -> indices (userq.rst)
- umap -> unmap (userq.rst)
- pre-empt -> preempt (drm-compute.rst)
- buffer-leaks -> buffer leaks (drm-uapi.rst)
- Additionally to -> In addition to (drm-uapi.rst)
- unpriviledged -> unprivileged (drm-uapi.rst)
- fucntions -> functions (todo.rst)
- varios -> various (todo.rst)
- implementions -> implementations (todo.rst)
- complection -> completion (todo.rst)

Ale remove a duplicated sentance and stray "uff." in the todo.rst, add
missing period after drm_ioctl.c reference, and add missing newline at
end of drm-uapi.rst. Fixing this would make reading the docs just a
little bit easier.

Signed-off-by: Elliot Tester <elliotctester1@gmail.com>
---
 Documentation/gpu/amdgpu/userq.rst |  4 ++--
 Documentation/gpu/drm-compute.rst  |  2 +-
 Documentation/gpu/drm-uapi.rst     | 10 +++++-----
 Documentation/gpu/todo.rst         | 11 +++++------
 4 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/Documentation/gpu/amdgpu/userq.rst b/Documentation/gpu/amdgpu/userq.rst
index 88f54393b..94427e18a 100644
--- a/Documentation/gpu/amdgpu/userq.rst
+++ b/Documentation/gpu/amdgpu/userq.rst
@@ -156,9 +156,9 @@ IOCTL Interfaces
 GPU virtual addresses used for queues and related data (rptrs, wptrs, context
 save areas, etc.) should be validated by the kernel mode driver to prevent the
 user from specifying invalid GPU virtual addresses.  If the user provides
-invalid GPU virtual addresses or doorbell indicies, the IOCTL should return an
+invalid GPU virtual addresses or doorbell indices, the IOCTL should return an
 error message.  These buffers should also be tracked in the kernel driver so
-that if the user attempts to unmap the buffer(s) from the GPUVM, the umap call
+that if the user attempts to unmap the buffer(s) from the GPUVM, the unmap call
 would return an error.
 
 INFO
diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-compute.rst
index f90c3e63a..35cc8d654 100644
--- a/Documentation/gpu/drm-compute.rst
+++ b/Documentation/gpu/drm-compute.rst
@@ -7,7 +7,7 @@ seconds. (The time let the user wait before he reaches for the power button).
 This means that other techniques need to be used to manage those workloads,
 that cannot use fences.
 
-Some hardware may schedule compute jobs, and have no way to pre-empt them, or
+Some hardware may schedule compute jobs, and have no way to preempt them, or
 have their memory swapped out from them. Or they simply want their workload
 not to be preempted or swapped out at all.
 
diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 579e87cb9..0ef498bff 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -150,10 +150,10 @@ separate render node called renderD<num>. There will be one render node
 per device. No ioctls except PRIME-related ioctls will be allowed on
 this node. Especially GEM_OPEN will be explicitly prohibited. For a
 complete list of driver-independent ioctls that can be used on render
-nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c  Render
-nodes are designed to avoid the buffer-leaks, which occur if clients
+nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c.  Render
+nodes are designed to avoid the buffer leaks, which occur if clients
 guess the flink names or mmap offsets on the legacy interface.
-Additionally to this basic interface, drivers must mark their
+In addition to this basic interface, drivers must mark their
 driver-dependent render-only ioctls as DRM_RENDER_ALLOW so render
 clients can use them. Driver authors must be careful not to allow any
 privileged ioctls on render nodes.
@@ -568,7 +568,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
@@ -761,4 +761,4 @@ Stable uAPI events
 From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
 
 .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
-   :doc: uAPI trace events
\ No newline at end of file
+   :doc: uAPI trace events
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index bc9f14c8a..b13cd4347 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -55,7 +55,7 @@ There are still drivers that use drm_simple_display_pipe. The task here is to
 convert them to use regular atomic helpers. Search for a driver that calls
 drm_simple_display_pipe_init() and inline all helpers from drm_simple_kms_helper.c
 into the driver, such that no simple-KMS interfaces are required. Please also
-rename all inlined fucntions according to driver conventions.
+rename all inlined functions according to driver conventions.
 
 Contact: Thomas Zimmermann, respective driver maintainer
 
@@ -301,7 +301,7 @@ Various hold-ups:
   valid formats for atomic drivers.
 
 - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
-  version of the varios drm_gem_fb_create functions. Maybe called
+  version of the various drm_gem_fb_create functions. Maybe called
   drm_gem_fb_create/_with_dirty/_with_funcs as needed.
 
 Contact: Simona Vetter
@@ -326,10 +326,9 @@ everything after it has done the write-protect/mkwrite trickery:
 
       vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
 
-- Set the mkwrite and fsync callbacks with similar implementions to the core
+- Set the mkwrite and fsync callbacks with similar implementations to the core
   fbdev defio stuff. These should all work on plain ptes, they don't actually
-  require a struct page.  uff. These should all work on plain ptes, they don't
-  actually require a struct page.
+  require a struct page.
 
 - Track the dirty pages in a separate structure (bitfield with one bit per page
   should work) to avoid clobbering struct page.
@@ -914,7 +913,7 @@ Querying errors from drm_syncobj
 ================================
 
 The drm_syncobj container can be used by driver independent code to signal
-complection of submission.
+completion of submission.
 
 One minor feature still missing is a generic DRM IOCTL to query the error
 status of binary and timeline drm_syncobj.
-- 
2.54.0

