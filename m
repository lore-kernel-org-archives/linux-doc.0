Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFAA346FA2;
	Fri,  5 Dec 2025 18:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958967; cv=none; b=DMIXDiL8HNQ47JrZ14DLmLVR+qN0n8jgG4b1XzbejXwhQNek5ufu8HFEY5oeNjwNxgnoS58HoKA+tNIB4I7lnYpQPll2P8wGy/62K6o4go5YXRwZhqqLMcLLEMYlpCMn6U5Q6ldSQXn4mZJIqEuBsRXP5+uBsR31nDmzdMxjyhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958967; c=relaxed/simple;
	bh=wyWso67v2Pmj9cYL41opZ0W8Md0EXL6qC4U3K6oFpbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=epdPPVtyTGKH+XRqbXFAtljAr0mCuATkspOFyGTzXbacRC/PTX+J72aox4FL3n/9uMVkPzgpRRNIlc1prIpQhyuO/jfGdKqI5Y+W9BWO7TxwREXm1AY/0gRbQkR02CfdDPojpIyqbbl5i8HNX2lURbhub6cXQMSDihrlX1cdXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WXEAP9Dn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WXEAP9Dn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764958964;
	bh=wyWso67v2Pmj9cYL41opZ0W8Md0EXL6qC4U3K6oFpbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXEAP9DnLRAa2VqbVgP1ZI1i9yBdfebg6WUuoo4fS3nTMH8hzfwbTrNaksF1dnBJP
	 PC+4q/E4LEi0jRckWJnB179tP3HvqhZp+fRLL4ZVkfRK4UvbjF+Oy6xQlE2YUbO3vQ
	 UUSFNgsjMrUdbL4s6i8aAov3/1das15BYbja2xy/ZyrnTmY0Wg85GpUp/37eSqi4Ce
	 ETSF/t4SMRl+usFAq0QZkJByyjtf+8IeVbLnxvTWLicBrJe97NDMTFgQpH9ZBgdZ4U
	 H6U7ksB8anBevvLjlKE8J5p4bi8gdLeSjIAimiUF5YIpwB5/wEojVcRxH6Y1ETMNh0
	 3NVMha4k2rS5Q==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: loicmolinari)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E83A17E1546;
	Fri,  5 Dec 2025 19:22:43 +0100 (CET)
From: =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	=?UTF-8?q?Miko=C5=82aj=20Wasiak?= <mikolaj.wasiak@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Christopher Healy <healych@amazon.com>,
	Matthew Wilcox <willy@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v13 09/10] drm/panfrost: Introduce huge tmpfs mountpoint option
Date: Fri,  5 Dec 2025 19:22:30 +0100
Message-ID: <20251205182231.194072-10-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205182231.194072-1-loic.molinari@collabora.com>
References: <20251205182231.194072-1-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce the 'panfrost.transparent_hugepage' boolean module parameter
(false by default). When the parameter is set to true, a new tmpfs
mountpoint is created and mounted using the 'huge=within_size'
option. It's then used at GEM object creation instead of the default
'shm_mnt' mountpoint in order to enable Transparent Hugepage (THP) for
the object (without having to rely on a system wide parameter).

v3:
- use huge tmpfs mountpoint in drm_device

v4:
- fix builds with CONFIG_TRANSPARENT_HUGEPAGE=n
- clean up mountpoint creation error handling
- print negative error value

v5:
- use drm_gem_has_huge_tmp() helper
- get rid of CONFIG_TRANSPARENT_HUGEPAGE ifdefs

v9:
- replace drm_gem_has_huge_tmp() by drm_gem_get_huge_tmp()

v11:
- enable 'panfrost.transparent_hugepage' by default

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  3 +++
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  6 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.h    |  9 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 18 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  2 ++
 5 files changed, 38 insertions(+)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index c61b97af120c..dedc13e56631 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -12,6 +12,7 @@
 #include "panfrost_device.h"
 #include "panfrost_devfreq.h"
 #include "panfrost_features.h"
+#include "panfrost_gem.h"
 #include "panfrost_issues.h"
 #include "panfrost_gpu.h"
 #include "panfrost_job.h"
@@ -267,6 +268,8 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	if (err)
 		goto out_job;
 
+	panfrost_gem_init(pfdev);
+
 	return 0;
 out_job:
 	panfrost_jm_fini(pfdev);
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7d8c7c337606..4f5f19eda587 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -858,6 +858,12 @@ static const struct drm_driver panfrost_drm_driver = {
 #endif
 };
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+bool panfrost_transparent_hugepage = true;
+module_param_named(transparent_hugepage, panfrost_transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#endif
+
 static int panfrost_probe(struct platform_device *pdev)
 {
 	struct panfrost_device *pfdev;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.h b/drivers/gpu/drm/panfrost/panfrost_drv.h
new file mode 100644
index 000000000000..edeb093eb6da
--- /dev/null
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.h
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 Amazon.com, Inc. or its affiliates */
+
+#ifndef __PANFROST_DRV_H__
+#define __PANFROST_DRV_H__
+
+extern bool panfrost_transparent_hugepage;
+
+#endif
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8041b65c6609..c1688a542ec2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
+/* Copyright 2025 Amazon.com, Inc. or its affiliates */
 
 #include <linux/cleanup.h>
 #include <linux/err.h>
@@ -10,9 +11,26 @@
 #include <drm/panfrost_drm.h>
 #include <drm/drm_print.h>
 #include "panfrost_device.h"
+#include "panfrost_drv.h"
 #include "panfrost_gem.h"
 #include "panfrost_mmu.h"
 
+void panfrost_gem_init(struct panfrost_device *pfdev)
+{
+	int err;
+
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
+	    !panfrost_transparent_hugepage)
+		return;
+
+	err = drm_gem_huge_mnt_create(&pfdev->base, "within_size");
+	if (drm_gem_get_huge_mnt(&pfdev->base))
+		drm_info(&pfdev->base, "Using Transparent Hugepage\n");
+	else if (err)
+		drm_warn(&pfdev->base, "Can't use Transparent Hugepage (%d)\n",
+			 err);
+}
+
 #ifdef CONFIG_DEBUG_FS
 static void panfrost_gem_debugfs_bo_add(struct panfrost_device *pfdev,
 					struct panfrost_gem_object *bo)
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8de3e76f2717..1a62529ff06f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -124,6 +124,8 @@ drm_mm_node_to_panfrost_mapping(struct drm_mm_node *node)
 	return container_of(node, struct panfrost_gem_mapping, mmnode);
 }
 
+void panfrost_gem_init(struct panfrost_device *pfdev);
+
 struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t size);
 
 struct drm_gem_object *
-- 
2.47.3

