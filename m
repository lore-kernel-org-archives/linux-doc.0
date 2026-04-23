Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0203E6DC4;
	Thu, 23 Apr 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776947695; cv=pass; b=R2G9QYPAMd+caTeCUqgDN/CiKG7q5wEsIYmuEaDdGDuhJfpvAPmPQ+cvtKgOubotgZYdPJ/nWfPcpte3z+UT4YzMOr/lnYYWayo1S2a6ZUEoCCTaRrdVIaIvSgZ+sqjQizv/0TfIm6Yv0FPUiuxWpo0kaKr1Vz93xunvZH3jIdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776947695; c=relaxed/simple;
	bh=oJnyIuvMZ+h5ORfuuDuwZmZ2YHJg3bcgyvaz0l5ixgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7u1cFNmqLtV+q/hL2meV0BoCGtWoNa7Y4CyGf1fpcK0UQdCFNuf/sT3gdbqx9Ix9O7QEDfU2kDQEfPUqWttJf6i9XNDBSVoJGLADIRZYKwLrYMxCj1ifx6YfgXHPhGxgpRU76UGOn55ZY2ujEPTMQJDeZJ2erybXiiB1z0Iawc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=VLQesL2O; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="VLQesL2O"
ARC-Seal: i=1; a=rsa-sha256; t=1776947662; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dHWAXh02Zb7VWL1LiKmwgjnkO0/lwJgsxulhaztj7cxmVPRrNgeFtx+Is/WbkMi1yy0uCUi39w4Q+VkVJ++941yGVGUmJimzb1CPFFSyMVuRV7TsjVvXA0uExoCJXZZd17S0epX851MjMmEwFK5UJH4euYLvKUBOSWJZSUnZNhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776947662; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xsfRAqHAApYeHG8s9ttaTMNDEymekND0yRwYOCR0oIQ=; 
	b=bTepMZR2zoqgO6MbOspq5npu45Hq+nl2FCwcqqDdQ2cQSzzLcKAAVCZTIC93lW6//mK87Po4PLe4HdL3Z7dYKToJbhDLem5BZGIpk0aX+CqZVWHhAlMXPHOYLoZ8Z4sRqqg3gnVpylwK9s8ei1UPUHpMkP+PlJXAHgkLg7TZ4W4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776947661;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=xsfRAqHAApYeHG8s9ttaTMNDEymekND0yRwYOCR0oIQ=;
	b=VLQesL2OjVwgd7Ft+CGqny8QU+WxXZ4Wp6MBf7lUGvbaV1fn5tFEfOSvtHYWOAGD
	yK2+BIObqscNS0QzHrYSV148RLMJ/fFI9/4y/MlCYYl/X/1Ic+nYjEyEZuiA284rzw7
	AlnaAqTwnpMYnCLaKAmox5s1yrz1+LZNsrljg/l8=
Received: by mx.zohomail.com with SMTPS id 1776947660089152.30004218235365;
	Thu, 23 Apr 2026 05:34:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 14:33:54 +0200
Subject: [PATCH v3 1/3] drm/fdinfo: Add "evicted" memory accounting
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-panthor-bo-reclaim-observability-v3-1-60af32164a4f@collabora.com>
References: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
In-Reply-To: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Currently, there's no way to know for certain how much GPU memory was
swapped out. The difference between total and resident memory would
include newly allocated pages, which are not resident, but also aren't
swapped out.

Add a new drm_gem_object_status so drivers can signal when an object has
been evicted to swap, and add a new "evicted" counter to
drm_memory_stats.

Due to how the supported_flags bitmask is determined, the "evicted"
count won't be printed to fdinfo if there's no swapped out pages.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/gpu/drm-usage-stats.rst | 6 ++++++
 drivers/gpu/drm/drm_file.c            | 8 ++++++++
 include/drm/drm_file.h                | 2 ++
 include/drm/drm_gem.h                 | 2 ++
 4 files changed, 18 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 24d3012ca7a6..11570976095e 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -200,6 +200,12 @@ One practical example of this could be the presence of unsignaled fences in a
 GEM buffer reservation object. Therefore, the active category is a subset of the
 resident category.
 
+- drm-evicted-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that have been evicted and are currently in swap
+space. Only present if there are buffers that are currently swapped out, and the
+driver implements reporting of this type of memory.
+
 Implementation Details
 ======================
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..5078172976c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -868,6 +868,7 @@ int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
 		stats->private == 0 &&
 		stats->resident == 0 &&
 		stats->purgeable == 0 &&
+		stats->evicted == 0 &&
 		stats->active == 0);
 }
 EXPORT_SYMBOL(drm_memory_stats_is_zero);
@@ -901,6 +902,10 @@ void drm_print_memory_stats(struct drm_printer *p,
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
 		drm_fdinfo_print_size(p, prefix, "purgeable", region,
 				      stats->purgeable);
+
+	if (supported_status & DRM_GEM_OBJECT_EVICTED)
+		drm_fdinfo_print_size(p, prefix, "evicted", region,
+				      stats->evicted);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
@@ -954,6 +959,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 
 		if (s & DRM_GEM_OBJECT_PURGEABLE)
 			status.purgeable += add_size;
+
+		if (s & DRM_GEM_OBJECT_EVICTED)
+			status.evicted += add_size;
 	}
 	spin_unlock(&file->table_lock);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..213dfecac342 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -500,6 +500,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
  * @resident: Total size of GEM objects backing pages
  * @purgeable: Total size of GEM objects that can be purged (resident and not active)
  * @active: Total size of GEM objects active on one or more engines
+ * @evicted: Total size of GEM objects that have been evicted to swap
  *
  * Used by drm_print_memory_stats()
  */
@@ -509,6 +510,7 @@ struct drm_memory_stats {
 	u64 resident;
 	u64 purgeable;
 	u64 active;
+	u64 evicted;
 };
 
 enum drm_gem_object_status;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 86f5846154f7..b42ea2e582cf 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -53,6 +53,7 @@ struct drm_gem_object;
  * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
  * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
  * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
+ * @DRM_GEM_OBJECT_EVICTED: object is evicted to swap
  *
  * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
  * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
@@ -67,6 +68,7 @@ enum drm_gem_object_status {
 	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
 	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
 	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
+	DRM_GEM_OBJECT_EVICTED   = BIT(3),
 };
 
 /**

-- 
2.53.0

