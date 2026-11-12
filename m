Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524353;
	b=j47GDv09ZKw8E1lsE2eNkyYf+PNueSbapXXfoNmib9a3rc6qCoLmLJ+O+PetKaBVZpHe
	 M0pA9TEaS7TtuyPQxqDDSjcHpiNJVTYnsQewNySQWveBS0rins94DjVPmiWCcjh6n6zBl
	 /MUSPprX6Os9tPqxX5Z71VmQH8jGfj7IJm4WN4hAp4lIddmP3SIM337BEFYoH7fRhDwB/
	 JEFsEmbbdYPIQVtsE307Ixktc6ldlXjHEk+1jJ7a6dpQFsbVmoYyr1gkIgJDPu5KuUidv
	 0CAbX2qOMYlV4gSBw8Ad6eGQxDE0gtWb7W78WzL2VCPnhlL5iStLUqeuIYGM0/4zkAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524353;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4xpeSCzbdtgpV+wabu6FimfaTfSr38PgllCPL0OdJGU=;
	b=rzqhAbe6EfnRChJ46pnloiyUnIKRR76xzCWGnUpcGXpZDVsIyEqn2ZNSSLgThnB/4DWA
	 hthfVy+lesu/A/CDb/P752O+mOTjHpJiEQ08gbzb/IO0RVX/akbrqHMZaxJuW1G0AyJzT
	 tWwlIa8/sMUulmWbWm/+5uxZqI+GrvZlKtTZLZ3CamiWSVXnUbKKgcSp2tIZrz+EWAXEv
	 dwbACiLfuOO7kYprTpseKA5K0uy3xTvOWmbTbaiJJrT9dI7rUDDUVqdFOGmqe0cYshb10
	 /hPhp4ehRD8uZ+QdC+D5nPS+xfndr3crpuUfYDttfcZCoHLWCjVryLMXCsRykJI76Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE47606A8B3
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 22:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FE47606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b33de9d2b1so3043177b3.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 14:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524352; x=1795129152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xpeSCzbdtgpV+wabu6FimfaTfSr38PgllCPL0OdJGU=;
        b=ofsXYnDGid/8DUnD9MWcHNsmo9eSAoBI1RpXjPvEZ2adbG1F2mZ/2OEGkcUM0ztloZ
         6ge6aB2n+8cea9CaUTqVY2TbrunCoVqvoiKpoXtKHTjyp0KmHignAX4rWQKKAxUK+oEA
         DyMxTCLYM5KjSt/yyu28m1+azWSyI1VR2ayVgx36i2aSKs+JNNT4GXmuQD84XMuvEzM2
         XlP3RX60/DBVE7wGIWcmBqBfmibP3/TYWL2gk42Eewg9THdlSSNczBmQ3uQ+fhifPRzt
         67/70WeVtRLwwxUMKwoCGqA+Ba2mCspSKEJp3+DLZBrfNLge5sw/zIi29a07xp74Y1f7
         RTnQ==
X-Forwarded-Encrypted: i=1; AL+hErE/VMZMHIFiF11J7bh/GeO/ile4s6Il7nWQPsWYYxNYBaGeHVwRdtGjTvpRi9mXAjytBaPXbGQLFK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xMdl3+zE8FnwmwPagoza+hAWc6f2laz70vMCU4DF0gUg6GFYq
	50aiy5EIJ/HW5YcBCv8fJc/mw8+wDSwMsb7Gcp6V+a7mAmsXU9GPyMru
X-Gm-Gg: AYBFou1a+EkhLr+K+PUyVw8vsG8ClaZEqFdC2PYfRw1s5X2nXYwry35hGrPeDTTLwmz
	7aIahY9neEuEB+79qOatNMdmlOskzzqN1MK0kdYJjTQadkjG4rInSGou2ZkoWH5pwfdjs266oUY
	E3ljmShk/zRB8VaFiWaYOVetFwxkKzbmeFKRBle1A0CU3XnObbuDfCDyxliFI53y0VDXPKXyVEf
	o/yULMwoX7DlQrCPe3bhsR/sKgNeG08yuMtKGo0UpQbGT4DNFYjjA3kocsqu+ZuMJ7Q7TqkVzPQ
	k1/CQJzdNZsp+W6rherkRsEGO79qH8+OpKbD7YoYy8DS1yXbNCpFWrCYcWWjZ6C4cxoidsHqWnA
	8yqJbrZMv+9bJ0+APR9pLlef26VgcxDL3T+m630oBmgO4u6tO5RLJ66oUAMZaaILIR7PyCx2qsf
	mCr0Ysv8l6FQOeJIj5y6jqx7PFn027RntDw2RXoPyRRiebWwPzF8MY4Uu6obUl3d+veC81i06vL
	KqufJzNCYiPdlCe90BD7qilAaYxeDPBKEydt7cSbpJK706nTknMAN7n9xii2rjCahBZKI3JYFaC
	AMZIAU7u/Hbo18ed+s39/HhClq7w2r+AoDO0k4e250Q2vXut8Qp5IxbwWStRkO4CEoYZt9I6t8S
	NzN+ct7ISCCOw72hic3dpHCeswIuA2hXozd/cT7PTz5q4JbQ/8smepARwS2uVKndCSfB7fi8fQc
	44xgVA+Jjkq4Rh8NIsfuyI82+g
X-Received: by 2002:a05:690c:6987:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b4aa25cab2mr5540957b3.41.1794524352554;
        Thu, 12 Nov 2026 14:59:12 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:11 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 17:58:53 -0500
Subject: [PATCH RFC 03/13] drm/gma500: Export GEM objects as dma-bufs
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-powervr-sgx-v1-3-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
To: dri-devel@lists.freedesktop.org, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
 Gabriel Gama <operatingsystemsdepression@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

A render GPU next to gma500 draws into gma500's scanout buffers: on
Cedarview the SGX545, driven by powervr_sgx through gma500's auxiliary
device, renders while gma500 scans out. Mesa's kmsro allocates the
buffers on the display device and imports them into the render device,
which needs gma500 to export them.

Add the pin, unpin, get_sg_table, vmap and vunmap hooks the PRIME
helpers need. An export pins the object's pages, write-combined as for a
framebuffer, but doesn't insert them into the GTT: the importer maps the
pages itself, and powervr_sgx takes a write-combined kernel mapping of
an import for its cache maintenance. (A CPU mmap through
dma_buf_mmap() still goes through psb_gem_fault(), which pins the object
into the GTT.) A use count shares the pages between GTT pins, exports
and kernel mappings. Objects in stolen memory have no struct pages and
can't be exported.

The PRIME helpers call pin and unpin with the object's reservation lock
held, and psb_gem_pin() and psb_gem_unpin() take that lock themselves.
Split each into a variant that expects the lock held.

The importer's CPU mapping, dma_buf_mmap(), goes through the object's
fake mmap offset, which a dumb buffer only gets from MAP_DUMB, and Mesa's
kmsro never calls that for the buffers it exports. Create the offset at
export.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpu/drm/gma500/gem.c | 182 ++++++++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/gma500/gem.h |   1 +
 2 files changed, 153 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4a4ecfb7b..9eff7a739 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -11,11 +11,14 @@
  *		accelerated operations on a GEM object)
  */
 
+#include <linux/iosys-map.h>
 #include <linux/pagemap.h>
+#include <linux/vmalloc.h>
 
 #include <asm/set_memory.h>
 
 #include <drm/drm.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
@@ -26,71 +29,104 @@
  * PSB GEM object
  */
 
-int psb_gem_pin(struct psb_gem_object *pobj)
+/*
+ * The object's pages, write-combined, for a GART pin or a PRIME export: an
+ * exported object needs them, not a slot in the small GTT aperture.
+ */
+static int psb_gem_get_pages_locked(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	struct page **pages;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (pobj->pages_use++)
+		return 0;
+	pages = drm_gem_get_pages(obj);
+	if (IS_ERR(pages)) {
+		pobj->pages_use--;
+		return PTR_ERR(pages);
+	}
+	set_pages_array_wc(pages, obj->size / PAGE_SIZE);
+	pobj->pages = pages;
+	return 0;
+}
+
+static void psb_gem_put_pages_locked(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (WARN_ON(!pobj->pages_use) || --pobj->pages_use)
+		return;
+	/* Reset caching flags */
+	set_pages_array_wb(pobj->pages, obj->size / PAGE_SIZE);
+	drm_gem_put_pages(obj, pobj->pages, true, false);
+	pobj->pages = NULL;
+}
+
+static int psb_gem_pin_locked(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
 	struct drm_device *dev = obj->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
-	struct page **pages;
 	unsigned int npages;
 	int ret;
 
-	ret = dma_resv_lock(obj->resv, NULL);
-	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
-		return ret;
+	dma_resv_assert_held(obj->resv);
 
 	if (pobj->in_gart || pobj->stolen)
 		goto out; /* already mapped */
 
-	pages = drm_gem_get_pages(obj);
-	if (IS_ERR(pages)) {
-		ret = PTR_ERR(pages);
-		goto err_dma_resv_unlock;
-	}
+	ret = psb_gem_get_pages_locked(pobj);
+	if (ret)
+		return ret;
 
 	npages = obj->size / PAGE_SIZE;
 
-	set_pages_array_wc(pages, npages);
-
-	psb_gtt_insert_pages(dev_priv, &pobj->resource, pages);
+	psb_gtt_insert_pages(dev_priv, &pobj->resource, pobj->pages);
 	if (dev_priv->mmu)
-		psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
+		psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pobj->pages,
 				     (gpu_base + pobj->offset), npages, 0, 0,
 				     PSB_MMU_CACHED_MEMORY);
 
-	pobj->pages = pages;
-
 out:
 	++pobj->in_gart;
-	dma_resv_unlock(obj->resv);
-
 	return 0;
+}
+
+int psb_gem_pin(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	int ret;
 
-err_dma_resv_unlock:
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(obj->dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return ret;
+	ret = psb_gem_pin_locked(pobj);
 	dma_resv_unlock(obj->resv);
+
 	return ret;
 }
 
-void psb_gem_unpin(struct psb_gem_object *pobj)
+static void psb_gem_unpin_locked(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
 	struct drm_device *dev = obj->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
 	unsigned long npages;
-	int ret;
 
-	ret = dma_resv_lock(obj->resv, NULL);
-	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
-		return;
+	dma_resv_assert_held(obj->resv);
 
 	WARN_ON(!pobj->in_gart);
 
 	--pobj->in_gart;
 
 	if (pobj->in_gart || pobj->stolen)
-		goto out;
+		return;
 
 	npages = obj->size / PAGE_SIZE;
 
@@ -99,13 +135,18 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 				     (gpu_base + pobj->offset), npages, 0, 0);
 	psb_gtt_remove_pages(dev_priv, &pobj->resource);
 
-	/* Reset caching flags */
-	set_pages_array_wb(pobj->pages, npages);
+	psb_gem_put_pages_locked(pobj);
+}
 
-	drm_gem_put_pages(obj, pobj->pages, true, false);
-	pobj->pages = NULL;
+void psb_gem_unpin(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	int ret;
 
-out:
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(obj->dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return;
+	psb_gem_unpin_locked(pobj);
 	dma_resv_unlock(obj->resv);
 }
 
@@ -133,8 +174,89 @@ static const struct vm_operations_struct psb_gem_vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
+/*
+ * PRIME export, for a render GPU to draw into scanout buffers. Only objects
+ * with pages can be shared: stolen memory has none. An export pins the pages,
+ * write-combined, and doesn't insert them into the GTT. The PRIME helpers
+ * call pin and unpin with the reservation lock held.
+ */
+static int psb_gem_prime_pin(struct drm_gem_object *obj)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+
+	if (pobj->stolen)
+		return -EINVAL;
+	return psb_gem_get_pages_locked(pobj);
+}
+
+static void psb_gem_prime_unpin(struct drm_gem_object *obj)
+{
+	psb_gem_put_pages_locked(to_psb_gem_object(obj));
+}
+
+static struct sg_table *psb_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+
+	if (!pobj->pages)
+		return ERR_PTR(-EINVAL);
+	return drm_prime_pages_to_sg(obj->dev, pobj->pages, obj->size >> PAGE_SHIFT);
+}
+
+/*
+ * A kernel mapping for an importer, write-combined like the pages. It holds
+ * the pages as a PRIME pin does. The PRIME helpers call it with the
+ * reservation lock held.
+ */
+static int psb_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+	void *vaddr;
+	int ret;
+
+	if (pobj->stolen)
+		return -EINVAL;
+	ret = psb_gem_get_pages_locked(pobj);
+	if (ret)
+		return ret;
+	vaddr = vmap(pobj->pages, obj->size >> PAGE_SHIFT, VM_MAP,
+		     pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr) {
+		psb_gem_put_pages_locked(pobj);
+		return -ENOMEM;
+	}
+	iosys_map_set_vaddr(map, vaddr);
+	return 0;
+}
+
+static void psb_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	vunmap(map->vaddr);
+	psb_gem_put_pages_locked(to_psb_gem_object(obj));
+}
+
+/*
+ * dma_buf_mmap() maps through the object's fake offset (drm_gem_prime_mmap()),
+ * which a dumb buffer only gets from MAP_DUMB: make sure it has one.
+ */
+static struct dma_buf *psb_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	int ret;
+
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		return ERR_PTR(ret);
+	return drm_gem_prime_export(obj, flags);
+}
+
 static const struct drm_gem_object_funcs psb_gem_object_funcs = {
 	.free = psb_gem_free_object,
+	.export = psb_gem_prime_export,
+	.pin = psb_gem_prime_pin,
+	.unpin = psb_gem_prime_unpin,
+	.get_sg_table = psb_gem_prime_get_sg_table,
+	.vmap = psb_gem_prime_vmap,
+	.vunmap = psb_gem_prime_vunmap,
 	.vm_ops = &psb_gem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 27df6ff4e..539f8f20a 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -27,6 +27,7 @@ struct psb_gem_object {
 	bool stolen;			/* Backed from stolen RAM */
 	bool mmapping;			/* Is mmappable */
 	struct page **pages;		/* Backing pages if present */
+	unsigned int pages_use;		/* GART pins and PRIME pins of @pages */
 };
 
 static inline struct psb_gem_object *to_psb_gem_object(struct drm_gem_object *obj)

-- 
2.50.1

