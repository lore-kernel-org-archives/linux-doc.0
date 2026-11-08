Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115007;
	b=WrjT/a1SOzCj72umur1/19T2Sq73Mefy1XgglszeHEOHUVvvqVB1wq3Ty6Aq7QVvHRp9
	 PfpNDIjFozLlTg68it4TscDXSoTSoCLmXpV+j+qKvzhTnXe57fa+PGaXDV9b3oHvQh9zh
	 j3bOf4FR+tF2uc2zWUS7G+Va7kKlLlHdr9yw6UT6EsHZaCNqRCUraIKUNZUZGjdJJaN4Y
	 7xdtScxclSHIMR+UsyVwrJ9GPDDP9rBukUGRQdJjGuwslffoKITQVWX/tOj4O/QnDYUjE
	 dYeQoyKq3rLMTGHTHIKKZ5p54Un4/VPm1faYcVP/TI7DP/Dtyod0UG2pN9XLJftTcpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
	b=aduII3PEOJqiOHmlLwie2tbEc5PdejYiUWJM0qfSanMdOW7NVBz1Vssy6Eq/CyB5Ia86
	 zKu/08h8OjLw7qL61TWpJeGFowvkCbRAm0JldWFWIvt5GzdDR8f+DTdPKMd2oeBb+qjoq
	 MHjqsWmAhqt8dFdkTr/Zb5OdeD4qSV7kJSRoqkTT7Fj7AoDYVLZEqj+HOWwOLuMT6sEYp
	 H2G22v5NwYhvBGRClQaoddmlBd+aqQ+0Kf96x1D58o4b6cWj7yTmtNXNRBvUDiXnH7Jnn
	 PGj3QtW15SX5nT/m0zT2VWkwAlfDiOSAXIggk7n5yC8PIRnB/YQPoozr9Z+inh1UOzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwDELTk;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F6606A31A
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 05:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8F6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BJwDELTk
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3720addb068so287688eec.1
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 21:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115006; x=1794719806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
        b=BJwDELTk5bFmfKz4wGiI/wQwGfx4TBarUQkqKdWNVtVhANdMOnr9/qrd+Wv+QBBrse
         iTRzq1dgnB8Nv+sbO8MNSnWpPjOcQ0WhElCXoBqdnghVhmDySrnJld4jC69O13NcBq/W
         UbrFurh2G8sW3YVB6EDd6EQVnoaA94UgPxCwifk8BPPRYDCOWDD4sCq1eIKks7bq5V8j
         Et8oTdWkOIHzCT3yHx6Aq8DdOYht3av/kW76Uzvh51ta0oitd4hFz/TVlH6GxDZvdNnQ
         sLS8S6P4dhdtjgKbLit2mqJXttUfffK+bxRJjGdYDUzOQ7ljske9eLQ8MXju6FfYlrxO
         YeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115006; x=1794719806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVx8EibVSDmqX/AcJMPqICHqAKqCDOESNCCkjO2gyzE=;
        b=dT4VGtwRXiLkLoJKPKopjLThYu2iztofMlus+2N7Iu1NPdjPTSnojNyTkxCOvh2GeL
         5psa29CfftOtwrVFXSGnsJrM7rEs6z1e0aN1u90N3bJhmzVSBtZOdtC/DPEjHiHNGSx2
         zsj8uDjqsd+mSg1ohHO21uHidmjEDGQwpnCH29X1ai7y11OWaAujDcoMglvjVweEryT/
         Ue2X2Q/u8ymojEleI4DMw2ni79wJvXTIGVt+UT0hLEufUrMazA1bFpVWt+4OyzlfeI0G
         9KuomKHxmUnf2Q0f/qFLt/aT49VbwHqPLN/fwCkPG8BcOEUk6Vff9KmWtY/cUsgtwR4S
         tmDQ==
X-Forwarded-Encrypted: i=1; AL+hErEyC00cfx2o6p7pTuUV8KaHd324eoyMX8usLbTyjOIme2m1PjPb5cktY4uMZXRzUtPKVRnLr4lvzTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TzVRTtdjuLKZJ1A6lOWkOUkjls9pQk2Z9poBsqdmF43vTxVKI
	1Mr6EPur/VrVmU5wEOGMJSqaFE1sy/AWesHtyilRegQEapFPcsh2eBXp
X-Gm-Gg: AYBFou07jHpepfZPc4/MGvhTEf3hlNmitQJ2u0HZwiLZCL29jrd4gcXhaiY0eaXPVYT
	kHZ3Qan257eLe/pVlVY4LuodKB4uUE+/+axesauFpGK9StpW+TC0wxcMIJxDKqh3HUVaiir8qcK
	MS85cXFaUqrhrrZqsfudWcmOodysTaXelqzdUcdIcQCG9nPSmvUqvvFrkqye4bcO5nJjUOviHPi
	bd7wTzbkDUJCaAjxC78PUnaTyx8JVzZ2C8i4nLcBKoCqOMXX78gQCg6Q89ZIv45Tj9KxSOWCXaX
	pXSqX3C4oInU9ARYdtnQP648Ihej0rC5So8NIZRTddSFh23j3rffRNImSNO79QWgO330Gk1MZwx
	764OqUF0oqFTUFgnWi+EpOnzegSgphqdk2bOeDfRrwk4nOKJZka8IrJxJdV+0geZ1fZeb8j2NZS
	5VL5c0QY/q3Fe58CeILHoIZb9PlbgvuMOBhynb51z54l4tn70WPkV5I0bLYNx0V600uCArw8l/J
	F500+DzfjkZihV4npgyATx1R7qhQJ7acewk7wKWhsufbeNmrW3niGTNtOZzvzKy2tNZbpQf9Miq
	fZY8QZhPazV4DhCXsTEhnXuEKw==
X-Received: by 2002:a05:7301:430c:b0:36e:97b4:1071 with SMTP id 5a478bee46e88-37257aa2df0mr1675347eec.14.1794115006342;
        Sat, 07 Nov 2026 21:16:46 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:45 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Date: Sun, 08 Nov 2026 14:16:23 +0900
Subject: [PATCH v2 1/6] drm/imagination: Switch the GPUVM to immediate mode
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
Message-Id: <20261108-pvr-vm-bind-v2-1-730103d2cc9a@gmail.com>
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

Use DRM_GPUVM_IMMEDIATE_MODE so that each GEM's GPUVA list is protected
by its gpuva.lock instead of its dma_resv. This prepares for
asynchronous VM_BIND, whose run_job() will update the GPUVA lists
before signalling its fence. That section imposes three rules:

1. No dma_resv: another thread may hold it while waiting for the job's
   fence, directly or through a dependency.
   -> Protect the lists with gpuva.lock, and take it around
      drm_gpuva_link().

2. No allocation under a lock run_job() takes: reclaim may wait for a
   fence that depends on the job.
   -> Allocate the vm_bo before taking gpuva.lock:
      drm_gpuvm_bo_obtain_locked() becomes drm_gpuvm_bo_create() +
      drm_gpuvm_bo_obtain_prealloc().

3. No freeing of GEM objects: that takes their dma_resv, and under
   gpuva.lock would free the held lock too.
   -> Defer it: drm_gpuva_unlink() and drm_gpuvm_bo_put() become
      drm_gpuva_unlink_defer() and drm_gpuvm_bo_put_deferred(), and
      drm_gpuvm_bo_deferred_cleanup() frees once the locks are dropped.

This also fixes an unlocked GPUVA list update: when a map fails,
pvr_vm_bind_op_fini() drops the last vm_bo reference without holding
the object's dma_resv.

Failing VM_MAP allocations with fail-nth shows
it on a lockdep kernel (real allocation failures under memory pressure
take the same path):

  WARNING: drivers/gpu/drm/drm_gpuvm.c:1661 at drm_gpuvm_bo_put+0x2ec/0x660 [drm_gpuvm]
  Call trace:
   drm_gpuvm_bo_put
   pvr_vm_bind_op_fini
   pvr_vm_map
   pvr_ioctl_vm_map

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 39 +++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index af1f5526a78..d551d9a4ab4 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -214,7 +214,7 @@ static int pvr_vm_bind_op_exec(struct pvr_vm_bind_op *bind_op)
 
 static void pvr_vm_bind_op_fini(struct pvr_vm_bind_op *bind_op)
 {
-	drm_gpuvm_bo_put(bind_op->gpuvm_bo);
+	drm_gpuvm_bo_put_deferred(bind_op->gpuvm_bo);
 
 	kfree(bind_op->new_va);
 	kfree(bind_op->prev_va);
@@ -255,11 +255,11 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
-	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
-	dma_resv_unlock(obj->resv);
-	if (IS_ERR(bind_op->gpuvm_bo))
-		return PTR_ERR(bind_op->gpuvm_bo);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_create(&vm_ctx->gpuvm_mgr, obj);
+	if (!bind_op->gpuvm_bo)
+		return -ENOMEM;
+
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_prealloc(bind_op->gpuvm_bo);
 
 	bind_op->new_va = kzalloc_obj(*bind_op->new_va);
 	bind_op->prev_va = kzalloc_obj(*bind_op->prev_va);
@@ -293,6 +293,8 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 
 err_bind_op_fini:
 	pvr_vm_bind_op_fini(bind_op);
+	/* Drain what fini() deferred. */
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -366,7 +368,11 @@ pvr_vm_gpuva_map(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_map(&ctx->vm_ctx->gpuvm_mgr, &ctx->new_va->base, &op->map);
+
+	mutex_lock(&op->map.gem.obj->gpuva.lock);
 	drm_gpuva_link(&ctx->new_va->base, ctx->gpuvm_bo);
+	mutex_unlock(&op->map.gem.obj->gpuva.lock);
+
 	ctx->new_va = NULL;
 
 	return 0;
@@ -396,7 +402,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 		return err;
 
 	drm_gpuva_unmap(&op->unmap);
-	drm_gpuva_unlink(op->unmap.va);
+	drm_gpuva_unlink_defer(op->unmap.va);
 	kfree(to_pvr_vm_gpuva(op->unmap.va));
 
 	return 0;
@@ -418,6 +424,7 @@ pvr_vm_gpuva_unmap(struct drm_gpuva_op *op, void *op_ctx)
 static int
 pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 {
+	struct drm_gem_object *obj = op->remap.unmap->va->gem.obj;
 	/* The split parts belong to the object of the mapping being split. */
 	struct drm_gpuvm_bo *vm_bo = op->remap.unmap->va->vm_bo;
 	struct pvr_vm_bind_op *ctx = op_ctx;
@@ -435,16 +442,20 @@ pvr_vm_gpuva_remap(struct drm_gpuva_op *op, void *op_ctx)
 	drm_gpuva_remap(&ctx->prev_va->base, &ctx->next_va->base, &op->remap);
 
 	if (op->remap.prev) {
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->prev_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->prev_va = NULL;
 	}
 
 	if (op->remap.next) {
+		mutex_lock(&obj->gpuva.lock);
 		drm_gpuva_link(&ctx->next_va->base, vm_bo);
+		mutex_unlock(&obj->gpuva.lock);
 		ctx->next_va = NULL;
 	}
 
-	drm_gpuva_unlink(op->remap.unmap->va);
+	drm_gpuva_unlink_defer(op->remap.unmap->va);
 	kfree(to_pvr_vm_gpuva(op->remap.unmap->va));
 
 	return 0;
@@ -568,7 +579,8 @@ pvr_vm_create_context(struct pvr_device *pvr_dev, bool is_userspace_context)
 	drm_gem_private_object_init(&pvr_dev->base, &vm_ctx->dummy_gem, 0);
 	drm_gpuvm_init(&vm_ctx->gpuvm_mgr,
 		       is_userspace_context ? "PowerVR-user-VM" : "PowerVR-FW-VM",
-		       0, &pvr_dev->base, &vm_ctx->dummy_gem,
+		       DRM_GPUVM_IMMEDIATE_MODE, &pvr_dev->base,
+		       &vm_ctx->dummy_gem,
 		       0, PVR_PAGE_TABLE_ADDR_SPACE_SIZE, 0, 0, &pvr_vm_gpuva_ops);
 
 	mutex_init(&vm_ctx->lock);
@@ -602,6 +614,7 @@ pvr_vm_context_release(struct kref *ref_count)
 		pvr_fw_object_destroy(vm_ctx->fw_mem_ctx_obj);
 
 	pvr_vm_unmap_all(vm_ctx);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	pvr_mmu_context_destroy(vm_ctx->mmu_ctx);
 	drm_gem_private_object_fini(&vm_ctx->dummy_gem);
@@ -738,7 +751,9 @@ pvr_vm_map(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 
 err_cleanup:
 	mutex_unlock(&vm_ctx->lock);
+
 	pvr_vm_bind_op_fini(&bind_op);
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 
 	return err;
 }
@@ -820,6 +835,8 @@ pvr_vm_unmap_obj(struct pvr_vm_context *vm_ctx, struct pvr_gem_object *pvr_obj,
 	err = pvr_vm_unmap_obj_locked(vm_ctx, pvr_obj, device_addr, size);
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -854,6 +871,8 @@ pvr_vm_unmap(struct pvr_vm_context *vm_ctx, u64 device_addr, u64 size)
 
 	mutex_unlock(&vm_ctx->lock);
 
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
+
 	return err;
 }
 
@@ -889,6 +908,8 @@ pvr_vm_unmap_all(struct pvr_vm_context *vm_ctx)
 	}
 
 	mutex_unlock(&vm_ctx->lock);
+
+	drm_gpuvm_bo_deferred_cleanup(&vm_ctx->gpuvm_mgr);
 }
 
 /* Static data areas are determined by firmware. */

-- 
2.43.0

