Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DAE3803CF
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380451; cv=none; b=sfVJEtc/NoXexBPxc0X0FjkoyX7nscSfOXCLOcO+9vGju0017tB2xkIwfoxdWd/Fwrp7kDUKGRUY4qkW9ZfjDOKYWkU+hi749gIVV4qvfjw1/hvmrLWIHTgJ/gHbYi2Y550TvRuRc45v0KVy7n116wMle3Oe6/DXykOY7EA8UtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380451; c=relaxed/simple;
	bh=S790a5X3uzkW8n3YiCxdxC5d6m+cBugOxTOqMxpwGQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H3+oUVmVYyarKayZ83UU8jvZcG95eWhJXidNCMZ60IQ71XBbuihpVuEUo9psNcVD0/LBWNY32y7bFj9aNeBaaPLAGKOMoUi+PdxTeTPKejO4TptpZS3VCPI8NyZUXb/wl1NBAkfcjo+lWKyL1a77ls0ARokIGeus7EKEX2ZMQmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tomeuvizoso.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64b4b35c812so13738722a12.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 00:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380445; x=1768985245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MFgbGKta1WWetg8kikPQgA/0YVVbzxRzodQq2Gmv8S8=;
        b=TPMxKw1fQRZAu9FDTOFkv5gLBxJGVC8+8RlNPzjLVZ8JLOoO+JYZQ/Ob/UdXQB0FiG
         ud4DXTW/+WtTS0UTM57ppN/jNXKv07Y7lTo3+T38IvdGy17dfEJA3QjXiu/X7VN/dPah
         MY+pngAdFadJ7mf2CgvF6PjNvAAqQb4ph49tNz8S2XPy7As9HPAWuCoHCcbi8YD6SVrq
         bGyK8kuJBqCQ3uvnCZ3I7md49QmlhDamU3O+3fvKRkfdUjoLLQnNQL/w7yRvuKNZc5PR
         PZ5DQqAKevVX6UL7CdsQFh+JMRztp0ZfY8mPD438X/GPLBaXSSYg9x9qXY9Us9in62fw
         aZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCWjUWmKMmqnN7GuTuSdADJwcXv7ifqHjxH3K3A0WRAGzHMQoSPqCMXkCpk+RNFRLAoHX9qn0faLUrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5Psrvmhzd4Xb3dr0aUK7DmuCqh0IRA+gQaRqQNLVtSaMfW59
	JckASiix3bOtIbiF0ppWUJUMQZKbUQqDp0xEm/viuhDlUKEzfAQWMxVA
X-Gm-Gg: AY/fxX6I7QdcbTbZgGZo82X7PW1ihlap0EZX2+qMaxKbXkCv45j2Wjw1nLrlLhLItXN
	6HEvNTTcoqxZOUCX9MAuoqeH/CT3mHQLa3IUyhwLhpO8u0QLEcTZwoitD7MHmOLu+/85o0rFkt0
	BpBKUp52qywZgXl7h+C8/jtLaa62WzFEyagtIfWBfGxOl0BMMx3kSHsp+r4aQntDw8w6TvefNao
	kDnFf3UTcYu8gZCTsoKojf26EGPAX24R9i40j4jtqFM1xjGxR+g7cFyl01ebRm5Q40DoZLvILU8
	JWNqbfNvteAvhaEXdDVZwoWcsErsNrrXSmuGCCmEcbi1YZ22A0V9Sa8xHhLnyj8N/B6dyM99582
	5nLLvUS1QUbdy95LZqgO+6Yge7JZGoB5Ne0vQdKsRLVV2Bl9FiqcPkcLeXyHzCmJAAdDAqIlOv0
	R5XXKrUxeQ2zypWlSiTOsaYUjrejpGgAtYbbx+mbYBiGDslOb28Qf4Dtp4
X-Received: by 2002:a05:6402:790:b0:640:e75a:f95d with SMTP id 4fb4d7f45d1cf-653ec12583bmr1081734a12.15.1768380445470;
        Wed, 14 Jan 2026 00:47:25 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:47:25 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:52 +0100
Subject: [PATCH v2 5/5] accel/thames: Add IOCTL for memory synchronization
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-5-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2

The DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
also when a writer job needs to be waited for before the buffer can be
accessed from the CPU.

Initially based on the same IOCTLs from the Etnaviv driver.

v2:
- Add thames_accel.h UAPI header (Robert Nelson).

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_drv.c |  2 ++
 drivers/accel/thames/thames_gem.c | 52 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 include/uapi/drm/thames_accel.h   | 31 +++++++++++++++++++++++
 4 files changed, 89 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index 1ff01428e6c80765cb741ae45c67971b7b0f28c8..6993d503139d3aaef830cdf5cfcf38476c5f9d99 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -76,6 +76,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 	THAMES_IOCTL(BO_CREATE, bo_create),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 	THAMES_IOCTL(SUBMIT, submit),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a01ddaeb2448117d400a79e53d2c6123ecb5390..4ded8fab0f3ff6f75a1446c5661fdbc68f1f2ac7 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -351,3 +351,55 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 
 	return 0;
 }
+
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct drm_gem_object *gem_obj;
+	struct drm_gem_shmem_object *shmem_obj;
+	unsigned long timeout = drm_timeout_abs_to_jiffies(args->timeout_ns);
+	long ret = 0;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_WRITE, true, timeout);
+	if (!ret)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+
+	shmem_obj = &to_thames_bo(gem_obj)->base;
+
+	dma_sync_sgtable_for_cpu(ddev->dev, shmem_obj->sgt, DMA_FROM_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct drm_gem_shmem_object *shmem_obj;
+	struct thames_gem_object *thames_obj;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	thames_obj = to_thames_bo(gem_obj);
+	shmem_obj = &thames_obj->base;
+
+	dma_sync_sgtable_for_device(ddev->dev, shmem_obj->sgt, DMA_TO_DEVICE);
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index 785843c40a89a9e84ab634aad77e9ec46111693e..e5a8278e98c578c2903cf23aea1bf887be0389e8 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -29,6 +29,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_context_create(struct thames_file_priv *priv);
 
 void thames_context_destroy(struct thames_file_priv *priv);
diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
index 5b35e50826ed95bfcc3709bef33416d2b6d11c70..07477087211c14721298ff52a1f3d253a6e65d58 100644
--- a/include/uapi/drm/thames_accel.h
+++ b/include/uapi/drm/thames_accel.h
@@ -31,6 +31,12 @@ enum drm_thames_ioctl_id {
 
 	/** @DRM_THAMES_SUBMIT: Submit a job and BOs to run. */
 	DRM_THAMES_SUBMIT,
+
+	/** @DRM_THAMES_BO_PREP: Prepare a BO for CPU access after DSP writes. */
+	DRM_THAMES_BO_PREP,
+
+	/** @DRM_THAMES_BO_FINI: Finish CPU access and prepare BO for DSP access. */
+	DRM_THAMES_BO_FINI,
 };
 
 /**
@@ -127,6 +133,27 @@ struct drm_thames_submit {
 	__u32 pad;
 };
 
+/**
+ * struct drm_thames_bo_prep - ioctl argument for preparing a BO for CPU access.
+ *
+ * This invalidates CPU caches and waits for pending DSP operations to complete.
+ */
+struct drm_thames_bo_prep {
+	__u32 handle;
+	__u32 reserved;
+	__s64 timeout_ns;	/* absolute */
+};
+
+/**
+ * struct drm_thames_bo_fini - ioctl argument for finishing CPU access to a BO.
+ *
+ * This flushes CPU caches to make CPU writes visible to the DSP.
+ */
+struct drm_thames_bo_fini {
+	__u32 handle;
+	__u32 reserved;
+};
+
 /**
  * DRM_IOCTL_THAMES() - Build a thames IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -149,6 +176,10 @@ enum {
 		DRM_IOCTL_THAMES(WR, BO_MMAP_OFFSET, bo_mmap_offset),
 	DRM_IOCTL_THAMES_SUBMIT =
 		DRM_IOCTL_THAMES(WR, SUBMIT, submit),
+	DRM_IOCTL_THAMES_BO_PREP =
+		DRM_IOCTL_THAMES(WR, BO_PREP, bo_prep),
+	DRM_IOCTL_THAMES_BO_FINI =
+		DRM_IOCTL_THAMES(WR, BO_FINI, bo_fini),
 };
 
 #if defined(__cplusplus)

-- 
2.52.0

