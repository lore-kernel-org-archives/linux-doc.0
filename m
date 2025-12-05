Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3097325724;
	Fri,  5 Dec 2025 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958960; cv=none; b=mPozHXl5QDmVc2iQJ6DlvgL9YwXNZ8uKzwIjQgDfcSjszSGuxi+gYXdO81HiAQO0Oh1qvW8EmoDcM5Oh1dUuqJTQVklzupezvqqqo8bnKjyoKiG3uRJ/a9ajXmF100clN0u1i1GbmXNn4JY1GKQJi84Q/yjcqY0vzjhnmBW0TSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958960; c=relaxed/simple;
	bh=Et6YpaCJQxTZg9u5ElaUSynxt3OiFubIAZT3m0KdhxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kFlaEZ6xxoEWtSRR0dhF9yOnI0+wmj/Vjk1p7g0UJeY5mQ2p/1swTHOnXxy7HlV9T3eQsKM0I3oTfXe31vqtdooQPsPM+a1Iwd2WULMIS3P7SKUeVwhMWlFnHURKwsgVGSoq/sG9iB+9WaOSFwPYmb5S9zlrKDJdJOybIGbLR7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=l1OJITzD; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="l1OJITzD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764958956;
	bh=Et6YpaCJQxTZg9u5ElaUSynxt3OiFubIAZT3m0KdhxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l1OJITzDddBfCtq7KhUQ2GPf+0RMahMUnqBaHI+5of0gS/3lgAIhIionM2YRjlUqm
	 eJ/k+tPUed/5sfbdYwTyLeB8VsQhVka5xKk5v6HG/QMiqZIn1IdN3nPQxLTyBn1wyj
	 o9/NRa4O6mleisf8GxPFdD5IonXIX8occXrh0KRvWt4sOT4lJlWfRjgiHEGYtQKp90
	 rojegf1TyKZ8X3q/jjck9IJsQV7i8xOZ2wO4VTbfaU38dKaaP+io6teuC40KeUnSv+
	 3hnS7oE5546WqMCpirjsX2qyaSjluzBtZ6JwZdQRuXpTRWUptWBOFsUsNR1Ma2wL6U
	 ajjq10skkT8fA==
Received: from debian-rockchip-rock5b-rk3588.. (unknown [IPv6:2a01:e0a:5e3:6100:826d:bc07:e98c:84a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: loicmolinari)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1668E17E12D5;
	Fri,  5 Dec 2025 19:22:36 +0100 (CET)
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
Subject: [PATCH v13 02/10] drm/shmem-helper: Map huge pages in fault handler
Date: Fri,  5 Dec 2025 19:22:23 +0100
Message-ID: <20251205182231.194072-3-loic.molinari@collabora.com>
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

Attempt a PMD sized PFN insertion into the VMA if the faulty address
of the fault handler is part of a huge page.

On builds with CONFIG_TRANSPARENT_HUGEPAGE enabled, if the mmap() user
address is PMD size aligned, if the GEM object is backed by shmem
buffers on mountpoints setting the 'huge=' option and if the shmem
backing store manages to allocate a huge folio, CPU mapping would then
benefit from significantly increased memcpy() performance. When these
conditions are met on a system with 2 MiB huge pages, an aligned copy
of 2 MiB would raise a single page fault instead of 4096.

v4:
- implement map_pages instead of huge_fault

v6:
- get rid of map_pages handler for now (keep it for another series
  along with arm64 contpte support)

v11:
- remove page fault validity check helper
- rename drm_gem_shmem_map_pmd() to drm_gem_shmem_try_map_pmd()
- add Boris R-b

v12:
- move up ret var decl in fault handler to minimize diff

Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 35 +++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e47ab3ebb5c2..e67216cbb469 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -567,6 +567,26 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
+static bool drm_gem_shmem_try_map_pmd(struct vm_fault *vmf, unsigned long addr,
+				      struct page *page)
+{
+#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
+	unsigned long pfn = page_to_pfn(page);
+	unsigned long paddr = pfn << PAGE_SHIFT;
+	bool aligned = (addr & ~PMD_MASK) == (paddr & ~PMD_MASK);
+
+	if (aligned &&
+	    pmd_none(*vmf->pmd) &&
+	    folio_test_pmd_mappable(page_folio(page))) {
+		pfn &= PMD_MASK >> PAGE_SHIFT;
+		if (vmf_insert_pfn_pmd(vmf, pfn, false) == VM_FAULT_NOPAGE)
+			return true;
+	}
+#endif
+
+	return false;
+}
+
 static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
@@ -574,8 +594,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
 	vm_fault_t ret;
-	struct page *page;
+	struct page **pages = shmem->pages;
 	pgoff_t page_offset;
+	unsigned long pfn;
 
 	/* Offset to faulty address in the VMA. */
 	page_offset = vmf->pgoff - vma->vm_pgoff;
@@ -586,12 +607,18 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	    drm_WARN_ON_ONCE(obj->dev, !shmem->pages) ||
 	    shmem->madv < 0) {
 		ret = VM_FAULT_SIGBUS;
-	} else {
-		page = shmem->pages[page_offset];
+		goto out;
+	}
 
-		ret = vmf_insert_pfn(vma, vmf->address, page_to_pfn(page));
+	if (drm_gem_shmem_try_map_pmd(vmf, vmf->address, pages[page_offset])) {
+		ret = VM_FAULT_NOPAGE;
+		goto out;
 	}
 
+	pfn = page_to_pfn(pages[page_offset]);
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+
+ out:
 	dma_resv_unlock(shmem->base.resv);
 
 	return ret;
-- 
2.47.3

