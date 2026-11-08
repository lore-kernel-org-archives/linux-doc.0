Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115029;
	b=P4LEHVmPmOPps/As9ufEuWW8bbpL1JVfOsPcxHRyVuWu2qKDW2zlEujyTHHbqy+etB5c
	 uhBeOOpVUqmy4BrVFT9yMRhSq42K/0NwRsA+NzKPiYP9XVwekNI7dZXFd5SUdmpvj/E2/
	 TAP56pRx68WdOq6CAfKdInuLZRVg7jHhexM0TzaJLA8X7Bv0UZ3gV4zMScmNYeUFQC8We
	 vngjd/2r4YXr+ko0b4YWFH8Fx0qYTiUYnjreL0mYs8fcMKc+0WsXJ6QLdF69wuI98khVg
	 7/scJ0Nm09xI/u1wwh+DXykCPC6wB6NrULYAEL2ErOn2HRSAZLPRGPRbhPyaBGkwsUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hpFZi/vtl7LBX9oOLKqmOJOTPbReJ2rE1h+tVICvcYw=;
	b=zKYRi+6d5nug4y59nJymqnW3ZATx8ScHifQ0IKttABqKO/CH5OgiQ/edxLLXraoVL7Mx
	 JcvaqWA+nBsm/NS4c9111FzFTDRrcGpeoFOuL8GOxHCfT9w9UzDcpNVdJvkDC4rwJxP2A
	 y0OnODSgMVV0aBsfSgIi8JslIOEARpAcAo7SssEUGCzz167zTPd7J3ROmmO/VRIraHPPy
	 Zzz38DapANSWNKnWL0+vGsxBxFn2Rr5WbRRspT6+nbXUuVRcvNPj/245NUCplifxkWEuZ
	 Pi8Rt4AMgpkqBfTOnYKM5boMz39RA9+r1bAZLC5HDhgVqu2AVFOAVZcjBoPOwGbJUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZgnnDKL;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1FF606A333
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 05:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1FF606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dZgnnDKL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so532326eec.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 21:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115028; x=1794719828; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hpFZi/vtl7LBX9oOLKqmOJOTPbReJ2rE1h+tVICvcYw=;
        b=dZgnnDKLt+wUhHhXkcXnTlV4wHaWPT2wrKCFaGEtg1nnCczCRc2I6AUTs9UIAdLX1q
         6qii1zc71WFXHI8l1vRbMfkIsDfbMI9j2RC0ouLN5iiC+O2CkX+zyBjeED0BIKJxOAhM
         crqyl9oJNuose56G8G5V1wvRQy3K5JEfX8rIYRKXClaXVEwq7KJTwxa0/1zyxmFsD99S
         qnZdW1kC7WawQoVF9rWk2adlC/E5SWhcxalz5oyfu64A39LfsZuN8SXaMAFdln7628OQ
         G5x5729UeCRVfoCI0yyisLkSMxBxRyw2S3Y+I4qm6UaoxyNf+d6VAvp1ZTkuJ5o2bATe
         SAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115028; x=1794719828;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hpFZi/vtl7LBX9oOLKqmOJOTPbReJ2rE1h+tVICvcYw=;
        b=p6kKKKWD9PvWUJxHVnV2pLrFBKpv5x8p+GdP4AWRYPAQkvsrs5hU2BbuXNQo+OnkWO
         xW7X7PAUVjEwTluLf1+eSYtRtJlY/is6WmofKM9Y0Lue6rIFyVPVOdX67ogGDl16mBck
         /srf04iolqTCpRRO/tBhXWEiEIWFKNUJxXHg+kqX08cWyEDix6v2IVX+0fly9v9CMLMn
         9ltnfsH9s76h/ICMWm89hG9eWyKyCJLmba+qJm0LvcNpuAfzS3+yH/MIJEDc3XSJR1x3
         hCYuX8olDJ/5AcaL+nGuR5xkvCSKfapVvE8J3Yr785mSB5QDmoiAijOM7VJ+4sWdPfYO
         JiGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6PZgo0W3a1d+QSsrdDBIN2bu7LX95HoKBb819/ScPG1GrcPkbtdPrII30RGOmSRK1wHqNs9ZVeMA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OPaMNhUdF5SWfeOphIV7+Wa9eCaBIRf6CIM9Z649isopGMg7X
	jR59W8kF0U+cOVnhPhWF42AaONqYbbGPQhfwadrtiti5NeHJ54v2HVxX
X-Gm-Gg: AYBFou3+GOTJWKlrZfrprSJbCDzw3+oy1vlhS0gunxuq+Hxgrs7mYFz04uxHvr+mAnn
	HL5U0jtdQD76OTpsn6RrL7gzNVqBnfETaa+IZAaRXghRpEFmN1dpJlORBV26ed7zfyTN4C3B1jg
	hBr3xe9392uBlq7Oy6X6BIKuVa/vznWtOEug84/yTjPzS/wg5TtPuoxBfKPXBPBhCo5NgpnuRJW
	rIR8cuQQsrdH/jyFVY/19Y/3Wl0hzQvNyFLVYwNJCNnffQMjPbI06FwohG6bYAGKr4wtf3WoOEs
	dMMRzjVXX7327LKZ7gGo1TUabwU95jG9fhFf9CZmfyXpNhoF7ly0601PGPncZFwoPrc4xRHwtv6
	qJGFjwmVVNe5kxPqBWcqNOKfjLL9pueT/mn7gYE1WDDErFAZCGiQG3Ww/gcx7X1y3NgBCn8HJFD
	U4Ggf3SRGjP7M2sAmIZj/zJg+JzNzs17nrmnKPNusTymF3JNgRT9RRMCugEyOk4eJQS0DlYFhU5
	xVSAlDqpjxpClnmKdJY5LIfIbyuE6ioBHUf5t73PVQMCGkJoXATlqYivR1R5HVTulVIOnzQO3Be
	aeLVsGS1gDG8/wXF001fg6qRXg==
X-Received: by 2002:a05:7301:7305:b0:369:d779:bcb8 with SMTP id 5a478bee46e88-3724fd69ac0mr1729876eec.0.1794115028233;
        Sat, 07 Nov 2026 21:17:08 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:17:07 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:28 +0900
Subject: [PATCH v2 6/6] drm/imagination: Add MAP_SPARSE to VM_BIND
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
Message-Id: <20261108-pvr-vm-bind-v2-6-730103d2cc9a@gmail.com>
References: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
In-Reply-To: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Vulkan sparse residency requires that an access to an unbound part of a
sparse resource does not fault, so a range has to be mappable without
naming any buffer object.

Add DRM_PVR_VM_BIND_OP_MAP_SPARSE, which maps one dummy object over and
over across the range.

To save memory, one dummy is shared by all sparse mappings, but per file
rather than per device: writes to a sparse range land in the dummy, so
per file keeps clients isolated from each other.

The dummy is 2MiB, so pvr_mmu_map() runs once per 2MiB, but the mapping
itself is still done per page.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_device.h | 10 ++++
 drivers/gpu/drm/imagination/pvr_drv.c    | 63 +++++++++++++++++++++++--
 drivers/gpu/drm/imagination/pvr_vm.c     | 81 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.h     |  8 ++++
 include/uapi/drm/pvr_drm.h               | 21 +++++++--
 5 files changed, 169 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index c246122b4ca..c8a7a949fdc 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -380,6 +380,16 @@ struct pvr_file {
 	 */
 	struct xarray hwrt_handles;
 
+	/**
+	 * @sparse_dummy_bo: Object the file's sparse mappings repeat. Pins its
+	 * pages, so it is created on first use, under @sparse_dummy_lock. Per
+	 * file, so that sparse writes stay out of other clients' view.
+	 */
+	struct pvr_gem_object *sparse_dummy_bo;
+
+	/** @sparse_dummy_lock: Serialises the creation of @sparse_dummy_bo. */
+	struct mutex sparse_dummy_lock;
+
 	/**
 	 * @vm_ctx_handles: Array of VM contexts belonging to this file. Array
 	 * members are of type "struct pvr_vm_context *".
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index c35d437aef7..377fa8d936a 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1137,6 +1137,37 @@ pvr_ioctl_vm_unmap(struct drm_device *drm_dev, void *raw_args,
 	return err;
 }
 
+/**
+ * pvr_file_get_sparse_dummy() - Get a file's sparse dummy object.
+ * @pvr_file: Target PowerVR file.
+ *
+ * Return: The object, with a reference for the caller, or an ERR_PTR on
+ * failure.
+ */
+static struct pvr_gem_object *
+pvr_file_get_sparse_dummy(struct pvr_file *pvr_file)
+{
+	struct pvr_gem_object *dummy;
+
+	mutex_lock(&pvr_file->sparse_dummy_lock);
+
+	dummy = pvr_file->sparse_dummy_bo;
+	if (!dummy) {
+		dummy = pvr_vm_sparse_dummy_create(pvr_file->pvr_dev);
+		if (IS_ERR(dummy))
+			goto err_unlock;
+
+		pvr_file->sparse_dummy_bo = dummy;
+	}
+
+	pvr_gem_object_get(dummy);
+
+err_unlock:
+	mutex_unlock(&pvr_file->sparse_dummy_lock);
+
+	return dummy;
+}
+
 /**
  * pvr_vm_bind_desc_from_uapi() - Translate a userspace bind operation.
  * @desc: Description to fill in.
@@ -1150,6 +1181,8 @@ pvr_vm_bind_desc_from_uapi(struct pvr_vm_bind_desc *desc,
 			   struct pvr_file *pvr_file,
 			   const struct drm_pvr_vm_bind_op *uapi_op)
 {
+	const bool sparse = uapi_op->flags & DRM_PVR_VM_BIND_OP_MAP_SPARSE;
+
 	if (uapi_op->flags & ~DRM_PVR_VM_BIND_OP_FLAGS_MASK)
 		return -EINVAL;
 
@@ -1157,19 +1190,35 @@ pvr_vm_bind_desc_from_uapi(struct pvr_vm_bind_desc *desc,
 		.offset = uapi_op->offset,
 		.device_addr = uapi_op->device_addr,
 		.size = uapi_op->size,
+		.sparse = sparse,
 	};
 
 	switch (uapi_op->flags & DRM_PVR_VM_BIND_OP_TYPE_MASK) {
 	case DRM_PVR_VM_BIND_OP_TYPE_MAP:
 		desc->type = PVR_VM_BIND_TYPE_MAP;
-		desc->obj = pvr_gem_object_from_handle(pvr_file, uapi_op->handle);
-		if (!desc->obj)
-			return -ENOENT;
+
+		if (sparse) {
+			struct pvr_gem_object *dummy;
+
+			if (uapi_op->handle || uapi_op->offset)
+				return -EINVAL;
+
+			dummy = pvr_file_get_sparse_dummy(pvr_file);
+			if (IS_ERR(dummy))
+				return PTR_ERR(dummy);
+
+			desc->obj = dummy;
+		} else {
+			desc->obj = pvr_gem_object_from_handle(pvr_file,
+							       uapi_op->handle);
+			if (!desc->obj)
+				return -ENOENT;
+		}
 
 		return 0;
 
 	case DRM_PVR_VM_BIND_OP_TYPE_UNMAP:
-		if (uapi_op->handle || uapi_op->offset)
+		if (uapi_op->handle || uapi_op->offset || sparse)
 			return -EINVAL;
 
 		desc->type = PVR_VM_BIND_TYPE_UNMAP;
@@ -1615,6 +1664,8 @@ pvr_drm_driver_open(struct drm_device *drm_dev, struct drm_file *file)
 
 	INIT_LIST_HEAD(&pvr_file->contexts);
 
+	mutex_init(&pvr_file->sparse_dummy_lock);
+
 	xa_init_flags(&pvr_file->ctx_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->free_list_handles, XA_FLAGS_ALLOC1);
 	xa_init_flags(&pvr_file->hwrt_handles, XA_FLAGS_ALLOC1);
@@ -1653,6 +1704,10 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 	pvr_destroy_hwrt_datasets_for_file(pvr_file);
 	pvr_destroy_vm_contexts_for_file(pvr_file);
 
+	if (pvr_file->sparse_dummy_bo)
+		pvr_gem_object_put(pvr_file->sparse_dummy_bo);
+	mutex_destroy(&pvr_file->sparse_dummy_lock);
+
 	kfree(pvr_file);
 	file->driver_priv = NULL;
 }
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 4e58ea8c50c..0c22c63e498 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -22,8 +22,10 @@
 #include <linux/errno.h>
 #include <linux/gfp_types.h>
 #include <linux/kref.h>
+#include <linux/minmax.h>
 #include <linux/mutex.h>
 #include <linux/sched.h>
+#include <linux/sizes.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
 #include <linux/workqueue.h>
@@ -188,6 +190,9 @@ struct pvr_vm_bind_op {
 	 */
 	struct pvr_vm_gpuva *next_va;
 
+	/** @sparse: See &pvr_vm_bind_desc.sparse. */
+	bool sparse;
+
 	/** @offset: Offset into @pvr_obj to begin mapping from. */
 	u64 offset;
 
@@ -280,11 +285,19 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 	if (!pvr_device_addr_and_size_are_valid(vm_ctx, desc->device_addr,
 						desc->size) ||
-	    desc->offset & ~PAGE_MASK || desc->size & ~PAGE_MASK ||
-	    desc->offset >= pvr_obj_size || offset_plus_size > pvr_obj_size)
+	    desc->offset & ~PAGE_MASK || desc->size & ~PAGE_MASK)
+		return -EINVAL;
+
+	/*
+	 * A sparse mapping repeats @obj over a range wider than it, so only
+	 * ordinary mappings must fit within @obj.
+	 */
+	if (!desc->sparse &&
+	    (desc->offset >= pvr_obj_size || offset_plus_size > pvr_obj_size))
 		return -EINVAL;
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
+	bind_op->sparse = desc->sparse;
 
 	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj);
 	if (!bind_op->gpuvm_bo)
@@ -373,6 +386,58 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
 	return err;
 }
 
+/**
+ * pvr_vm_sparse_dummy_create() - Create the object sparse mappings repeat.
+ * @pvr_dev: Target PowerVR device.
+ *
+ * It covers a whole level 0 page table, so that each chunk mapped by
+ * pvr_vm_mmu_map_sparse() fills one.
+ *
+ * Return: The new object, or an ERR_PTR on failure.
+ */
+struct pvr_gem_object *pvr_vm_sparse_dummy_create(struct pvr_device *pvr_dev)
+{
+	return pvr_gem_object_create(pvr_dev, SZ_2M,
+				     DRM_PVR_BO_BYPASS_DEVICE_CACHE);
+}
+
+/**
+ * pvr_vm_mmu_map_sparse() - Map a dummy object over and over across a range.
+ * @mmu_op_ctx: Target MMU op context, created for @dummy.
+ * @dummy: Object to repeat.
+ * @device_addr: Virtual device address at the start of the range.
+ * @size: Size of the range.
+ *
+ * Maps @dummy repeatedly, in chunks aligned to its size, which must be a power
+ * of two.
+ *
+ * Return: 0 on success, or a negative error code with nothing left mapped.
+ */
+static int
+pvr_vm_mmu_map_sparse(struct pvr_mmu_op_context *mmu_op_ctx,
+		      struct pvr_gem_object *dummy, u64 device_addr, u64 size)
+{
+	const u64 dummy_size = pvr_gem_object_size(dummy);
+	u64 mapped = 0;
+	int err;
+
+	while (mapped < size) {
+		const u64 addr = device_addr + mapped;
+		const u64 chunk = min(size - mapped,
+				      dummy_size - (addr & (dummy_size - 1)));
+
+		err = pvr_mmu_map(mmu_op_ctx, chunk, dummy->flags, addr);
+		if (err) {
+			pvr_mmu_unmap(mmu_op_ctx, device_addr, mapped);
+			return err;
+		}
+
+		mapped += chunk;
+	}
+
+	return 0;
+}
+
 /**
  * pvr_vm_gpuva_map() - Insert a mapping into a memory context.
  * @op: gpuva op containing the remap details.
@@ -383,7 +448,7 @@ pvr_vm_bind_op_unmap_init(struct pvr_vm_bind_op *bind_op,
  *
  * Return:
  *  * 0 on success, or
- *  * Any error returned by pvr_mmu_map().
+ *  * Any error returned by pvr_mmu_map() or pvr_vm_mmu_map_sparse().
  */
 static int
 pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
@@ -395,8 +460,12 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 	if ((op->map.gem.offset | op->map.va.range) & ~PVR_DEVICE_PAGE_MASK)
 		return -EINVAL;
 
-	err = pvr_mmu_map(ctx->mmu_op_ctx, op->map.va.range, pvr_gem->flags,
-			  op->map.va.addr);
+	if (ctx->sparse)
+		err = pvr_vm_mmu_map_sparse(ctx->mmu_op_ctx, pvr_gem,
+					    op->map.va.addr, op->map.va.range);
+	else
+		err = pvr_mmu_map(ctx->mmu_op_ctx, op->map.va.range,
+				  pvr_gem->flags, op->map.va.addr);
 	if (err)
 		return err;
 
@@ -741,7 +810,7 @@ pvr_vm_bind_op_init(struct pvr_vm_bind_op *bind_op,
 		return pvr_vm_bind_op_map_init(bind_op, vm_ctx, desc);
 
 	case PVR_VM_BIND_TYPE_UNMAP:
-		if (WARN_ON(desc->obj))
+		if (WARN_ON(desc->obj || desc->sparse))
 			return -EINVAL;
 
 		return pvr_vm_bind_op_unmap_init(bind_op, vm_ctx, desc);
diff --git a/drivers/gpu/drm/imagination/pvr_vm.h b/drivers/gpu/drm/imagination/pvr_vm.h
index df74b405960..68d5ffa5e88 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.h
+++ b/drivers/gpu/drm/imagination/pvr_vm.h
@@ -80,6 +80,12 @@ struct pvr_vm_bind_desc {
 
 	/** @size: Size of the range. */
 	u64 size;
+
+	/**
+	 * @sparse: Repeat @obj over the range rather than covering it once.
+	 * Map only.
+	 */
+	bool sparse;
 };
 
 int pvr_vm_bind(struct pvr_vm_context *vm_ctx,
@@ -93,6 +99,8 @@ void pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx);
 
 bool pvr_vm_context_is_unusable(struct pvr_vm_context *vm_ctx);
 
+struct pvr_gem_object *pvr_vm_sparse_dummy_create(struct pvr_device *pvr_dev);
+
 dma_addr_t pvr_vm_get_page_table_root_addr(struct pvr_vm_context *vm_ctx);
 struct dma_resv *pvr_vm_get_dma_resv(struct pvr_vm_context *vm_ctx);
 
diff --git a/include/uapi/drm/pvr_drm.h b/include/uapi/drm/pvr_drm.h
index 57c22f5f215..a7c2801cc70 100644
--- a/include/uapi/drm/pvr_drm.h
+++ b/include/uapi/drm/pvr_drm.h
@@ -1333,7 +1333,17 @@ struct drm_pvr_ioctl_submit_jobs_args {
 /**
  * DOC: Flags for VM_BIND operations.
  *
- * Set exactly one operation type in &drm_pvr_vm_bind_op.flags.
+ * Set exactly one operation type in &drm_pvr_vm_bind_op.flags, optionally
+ * ORed with modifiers.
+ *
+ * .. c:macro:: DRM_PVR_VM_BIND_OP_MAP_SPARSE
+ *
+ *    Sparsely map a range without naming a buffer object. Only valid with
+ *    %DRM_PVR_VM_BIND_OP_TYPE_MAP.
+ *
+ *    GPU accesses to the range do not fault. Nothing else is guaranteed:
+ *    reads return undefined values, and writes may become visible through
+ *    other sparse mappings.
  *
  * .. c:macro:: DRM_PVR_VM_BIND_OP_TYPE_MAP
  *
@@ -1349,11 +1359,14 @@ struct drm_pvr_ioctl_submit_jobs_args {
  *
  *    Mask used to extract the operation type.
  */
+#define DRM_PVR_VM_BIND_OP_MAP_SPARSE _BITUL(0)
+
 #define DRM_PVR_VM_BIND_OP_TYPE_MAP (0u << 28)
 #define DRM_PVR_VM_BIND_OP_TYPE_UNMAP (1u << 28)
 #define DRM_PVR_VM_BIND_OP_TYPE_MASK (0xfu << 28)
 
-#define DRM_PVR_VM_BIND_OP_FLAGS_MASK DRM_PVR_VM_BIND_OP_TYPE_MASK
+#define DRM_PVR_VM_BIND_OP_FLAGS_MASK \
+	(DRM_PVR_VM_BIND_OP_MAP_SPARSE | DRM_PVR_VM_BIND_OP_TYPE_MASK)
 
 /**
  * struct drm_pvr_vm_bind_op - A single VM bind operation.
@@ -1366,13 +1379,13 @@ struct drm_pvr_vm_bind_op {
 	 * @handle: [IN] Handle of the target buffer object.
 	 *
 	 * Must be a valid handle returned by %DRM_IOCTL_PVR_CREATE_BO for map
-	 * operations. MBZ for unmap operations.
+	 * operations. MBZ for unmap and sparse map operations.
 	 */
 	__u32 handle;
 
 	/**
 	 * @offset: [IN] Offset into the target buffer object from which to
-	 * begin the mapping. MBZ for unmap operations.
+	 * begin the mapping. MBZ for unmap and sparse map operations.
 	 */
 	__u64 offset;
 

-- 
2.43.0

