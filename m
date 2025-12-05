Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6530B33971D;
	Fri,  5 Dec 2025 09:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925961; cv=none; b=gebKvaVMaPhSQBKky07O5NCKGJjhQ+WBz/Zb3Q6qB9SwDyOuEJsoUPbxITS5+VlpzNoVumTMbDosValzvziQp20T+ERV4bgeztJe/9K9mUTpuz5VxxQFqmQ8xXzv1kC6d4jMtKlELlrQ9s2DgAU5gU9SKbsX/EFXiP/aTV88X4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925961; c=relaxed/simple;
	bh=gYX/y+Q9NsyC9DrjRWsLnYa/A4w67M9CU3SA88eKex4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=goHFM+1MjNIysPhVl6976nCgTl6eD1qkCixIEu2R+x4w8fboh/SWI9+LWORfPHBQrhw60RH6HDEaT4QH5KpX3b6y+O3RhWJdRZlWBBQ/7rzOXbtgbG6B78+yte9Dc0ELaKUMB71lb5MotLD+OvkLWA/P4yn0wV4wMv7I8xDWuiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RzhskPBD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RzhskPBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764925952;
	bh=gYX/y+Q9NsyC9DrjRWsLnYa/A4w67M9CU3SA88eKex4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RzhskPBD2kPI53nxPhn8+DV9ztXVPXIG9YWLxyu/uxrbda88SOMuiUdTJpq1X/icu
	 MGW98cw5rSin9flg9xLG3TW2+bH9ymVPRg3Y+s1B5SvmcWZB4dfU6pciXYb8wYfhD8
	 JxhqYchHJeYevq5tatQ/SjHa0mlzTn6eJU373JBpjAA7qNsmcn4TnVb7+q16et/1WJ
	 9QtyyZQlEhvnOC5bOjIzNoBf7CX6zeeetwnyvY2AGW8om2drW/ynnqzYWEO/xBRKH8
	 LwjNwKKsWaW8F6HJSGb9iG7uItQThYBOpwzVpDl56P1Nx7CSxSPfr4aK7JyUcDuebF
	 hNpR5+H2vg37w==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: loicmolinari)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54B8C17E1428;
	Fri,  5 Dec 2025 10:12:31 +0100 (CET)
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
Subject: [PATCH v12 10/10] Documentation/gpu/drm-mm: Add THP paragraph to GEM mapping section
Date: Fri,  5 Dec 2025 10:12:16 +0100
Message-ID: <20251205091216.150968-11-loic.molinari@collabora.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251205091216.150968-1-loic.molinari@collabora.com>
References: <20251205091216.150968-1-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a paragraph to the GEM Objects Creation section about the
drm_gem_huge_mnt_create() helper and to the GEM objects mapping
section explaining how transparent huge pages are handled by GEM.

v4:
- fix wording after huge_pages handler removal

v6:
- fix wording after map_pages handler removal

v11:
- mention drm_gem_huge_mnt_create() helper
- add Boris and Maíra R-bs

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Maíra Canal <mcanal@igalia.com>
---
 Documentation/gpu/drm-mm.rst | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index d55751cad67c..f22433470c76 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -155,7 +155,12 @@ drm_gem_object_init() will create an shmfs file of the
 requested size and store it into the struct :c:type:`struct
 drm_gem_object <drm_gem_object>` filp field. The memory is
 used as either main storage for the object when the graphics hardware
-uses system memory directly or as a backing store otherwise.
+uses system memory directly or as a backing store otherwise. Drivers
+can call drm_gem_huge_mnt_create() to create, mount and use a huge
+shmem mountpoint instead of the default one ('shm_mnt'). For builds
+with CONFIG_TRANSPARENT_HUGEPAGE enabled, further calls to
+drm_gem_object_init() will let shmem allocate huge pages when
+possible.
 
 Drivers are responsible for the actual physical pages allocation by
 calling shmem_read_mapping_page_gfp() for each page.
@@ -290,15 +295,27 @@ The open and close operations must update the GEM object reference
 count. Drivers can use the drm_gem_vm_open() and drm_gem_vm_close() helper
 functions directly as open and close handlers.
 
-The fault operation handler is responsible for mapping individual pages
-to userspace when a page fault occurs. Depending on the memory
-allocation scheme, drivers can allocate pages at fault time, or can
-decide to allocate memory for the GEM object at the time the object is
-created.
+The fault operation handler is responsible for mapping pages to
+userspace when a page fault occurs. Depending on the memory allocation
+scheme, drivers can allocate pages at fault time, or can decide to
+allocate memory for the GEM object at the time the object is created.
 
 Drivers that want to map the GEM object upfront instead of handling page
 faults can implement their own mmap file operation handler.
 
+In order to reduce page table overhead, if the internal shmem mountpoint
+"shm_mnt" is configured to use transparent huge pages (for builds with
+CONFIG_TRANSPARENT_HUGEPAGE enabled) and if the shmem backing store
+managed to allocate a huge page for a faulty address, the fault handler
+will first attempt to insert that huge page into the VMA before falling
+back to individual page insertion. mmap() user address alignment for GEM
+objects is handled by providing a custom get_unmapped_area file
+operation which forwards to the shmem backing store. For most drivers,
+which don't create a huge mountpoint by default or through a module
+parameter, transparent huge pages can be enabled by either setting the
+"transparent_hugepage_shmem" kernel parameter or the
+"/sys/kernel/mm/transparent_hugepage/shmem_enabled" sysfs knob.
+
 For platforms without MMU the GEM core provides a helper method
 drm_gem_dma_get_unmapped_area(). The mmap() routines will call this to get a
 proposed address for the mapping.
-- 
2.47.3

