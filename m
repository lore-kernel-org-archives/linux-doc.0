Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792737615;
	b=CyHAqWoclA72nFpRn9MweAeEvcUU2bDRdWSsn4OQ7OTGrcfuVaxNveF4q+ORVD4lBjnN
	 J6A5gJUYkiU/j3YuNTNEptj9ULz76oZLgGHFQgh45e8mPLxvs55L6XKmOUI84/poqy2iF
	 KBHPO7MTaEa3rQiWpIZv/6NgoQ47WZ8z/OuxXfbaP7BE2UKtX0tDiR2swXKbraXVOjhkI
	 mpSI2qmmAElT7BBufJhDIIcbWE2IMS6bLkxEzWasppdBkVHhZa2AjfTuGgvRrkAcZnvaG
	 UkDdJ0xMijqJLrx4TdX4yjAHf3/Cs4ogj7s8KeZKYWEaiFXX7uwqk14EWvjbVrQ65PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792737615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=6LiMwTF7m7J2yPk0NYgzUy+jDJY7B4f/PUnX5iV/T+E=;
	b=nZ91EzjvEF45P3Qm62hTlnMhN9ORkwe/t25dJWPQLVo6yyhe0oTpmrOf21nL8KEqo3Ou
	 /JZsXEg2Cl8DLru97g3RuyAR0HlcIuAjPi7xNmRYIedS6kK6KnoXKKm6ARS5R0R37J/Ak
	 IGd6DWbIlYkkBR7hRc+lyC3anXqaKrPunuKqh7nI14uIe9htqu1YnKU/6viHqcGESdL4j
	 3ydofCXDrFEP3GJ2CgN/oKuxa92Pgr50s1XoC4W/1FCyOKHskkfUw6pjCDTgwlR9HTwb7
	 PomnSjg8E/uTGkDW6LWHD7e33v/jy21uQFjGWv8AS7Hp3RXQGeGjWFI0xcEkrTheIag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ABD+b6QJ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF685606A330
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 06:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF685606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ABD+b6QJ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so230848f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737613; x=1793342413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LiMwTF7m7J2yPk0NYgzUy+jDJY7B4f/PUnX5iV/T+E=;
        b=ABD+b6QJOS2jAHFXPInPnD5fje4uTcmYlBh3jA/WAwTunCSZrKGoeAOcV1a/sBE9wv
         zy9FZnPJ8WKEx0tFNzJ2AMKD+pvgJ0pQKofUWywp260+BUbbN6tqFSO8IX8O1Y5WZFbI
         GWoY2ldDElw+eZAcra4v6tMV3K2mQZzzMqISVRY6W0bI4k22cmrXiGcAZjWDlkMi7gWU
         ugmP9xFvwUGqtHMUZniO7Hv8SDvtcbmVo66oiDMrQkPLcGIYoTjDHN+cHektdhTr1hPn
         Om/vABMLpxVXr+OXQq3wrGq2jHEFucJP/yz/1bdwH9WSNZ6xYjo0F4zuoZ2a7flYP3OX
         XM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737613; x=1793342413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LiMwTF7m7J2yPk0NYgzUy+jDJY7B4f/PUnX5iV/T+E=;
        b=MWUo0RmoGEyq9++J9mcoXxXtpAFIu+RI7mELI2YaKCb+s0/rhJzBZ6K3iGsilLqVKW
         YWxPNa522mwR3joFUvt0z84m9Q1lx98tL/oEqCYyFL2Thqwrn9fHjL0+t1ZyHbvFSUC4
         Rzk7unr+Esz+h6x4V4rvacpZdDGZgyhE6de3Fu01sioEWrtHgf4ymAqbb2dNZx7K2Nxj
         azehd98aNP4mMatrt2QbDbk/oJoXYJZaQHhZ6aiMjJmHh4v7qK11CMetMZ7yH/22VA8J
         E0Ko6gwZNiN+R9byj3/sqlRR5/kw6KP8+uUId5geBXY6gCjohOOxwMWbiM+lQHHfenRu
         K+ng==
X-Forwarded-Encrypted: i=1; AKwUvBwC7kc3ykdyzcvo/Q9N+dYLDDagLB29K7Cbc90d3fwQYzhRIrZBW8OSXeJYRishd3vdlGxxxm6Ifd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3+wNp37R4llFVO4YK3gKkrPifIAmejrOLX+zwxm3MoWkVw7hL
	OSXIZJXCfEzK4DCtCW2rTzGad7Spt30g0Q9BO3lHUHxUKMRv6Y5YRSU7
X-Gm-Gg: AYBFou0e8s1vLva00FKymGSES8l5YGCVZF57PYeXRank/O8bm6rtdUiyHURSm/aVWop
	JJSAJ2RDi/4ze7hHR3whQF6gQQmCdKHBz5B60kZgWOvcnZtQ/EsLFky+MPtQLrf7jMzQ0413IVO
	WKOLHTAplZskWA1eY8ZCNA98ZvGzOw2wVsMv5ICIIHM0hSjREAJ6td/qaYEVYpoSPPhqL21TqKR
	V6YmVYcSefEJno9ltRIIo4AdRjgdpvUYwIpbBWDekGEI2hZSd6uZ/W49D3f0fjy1Kw70AyNsfML
	ivpEbpfVbpuTpfUqlugNAYxKsOkp4qwgzCfMU1f29bYyXf1CT7ytp8f1tqh4cGm5k1tZrOREbJR
	Q8tyoIPnRmARXHzQp8Mfkpv7Tn6Ow4Dz6qbHqYhP+gXBXeVIjppzScBpx0SAn9ootwUQcqY5mqz
	NgMxYecIsA8rTdWF3Ksi7EzhE5NAjpabh3uFQ2Y13meFDYnHzZUlWYIhLuUofZvVVv5pfquzVua
	3oDkvHojSAUiiuFN8dsFA/kLW1J5grmt3GjXtbK6GjFv7LfDdKEkdB2n365cZ+Q7lxK++SVpbDC
	Ha1BneWgfJzSf6CF54Sm7QKrLrzSNqMOa2rtwcEdpM68gLPQgnVMHtq1bfEVfF/iOBgY+6vhNzX
	HXQk=
X-Received: by 2002:a5d:5f03:0:b0:487:8ba:8aa4 with SMTP id ffacd0b85a97d-48e387d5ff3mr1468313f8f.38.1792737613172;
        Thu, 22 Oct 2026 23:40:13 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:12 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:36 +0200
Subject: [PATCH v3 11/16] accel/thames: Add IOCTL for memory
 synchronization
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
Message-Id: <20261023-thames-v3-11-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2

These DSP cores have their own access to the memory bus, and it isn't
cache coherent with the CPUs.

Add IOCTLs so userspace can mark when the caches need to be flushed, and
wait for every Job still using a buffer, readers included, before the
CPU accesses it.

Initially based on the same IOCTLs from the Etnaviv driver.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>

---

v2:
- Add thames_accel.h UAPI header (Robert Nelson).
---
 drivers/accel/thames/thames_drv.c |  3 ++
 drivers/accel/thames/thames_gem.c | 63 +++++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h |  4 +++
 include/uapi/drm/thames_accel.h   | 56 ++++++++++++++++++++++++++++++++++
 4 files changed, 126 insertions(+)

diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index 5f704cbfe1d0..798b4743f336 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -252,6 +252,7 @@ static int thames_ioctl_##func##_entered(struct drm_device *dev, void *data,	\
 
 THAMES_IOCTL_ENTERED(bo_create)
 THAMES_IOCTL_ENTERED(bo_mmap_offset)
+THAMES_IOCTL_ENTERED(bo_fini)
 THAMES_IOCTL_ENTERED(dev_query)
 THAMES_IOCTL_ENTERED(job_create)
 THAMES_IOCTL_ENTERED(job_submit)
@@ -262,6 +263,8 @@ static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 #define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
 	THAMES_IOCTL(BO_CREATE, bo_create_entered),
 	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset_entered),
+	THAMES_IOCTL(BO_PREP, bo_prep),
+	THAMES_IOCTL(BO_FINI, bo_fini_entered),
 	THAMES_IOCTL(DEV_QUERY, dev_query_entered),
 	THAMES_IOCTL(JOB_CREATE, job_create_entered),
 	THAMES_IOCTL(JOB_SUBMIT, job_submit_entered),
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index c9fd08c7aaf4..5a4dc497768f 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -942,3 +942,66 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_
 	return 0;
 }
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_prep *args = data;
+	struct thames_gem_object *bo;
+	struct drm_gem_object *gem_obj;
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
+	ret = dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_READ, true, timeout);
+	if (ret == 0)
+		ret = timeout ? -ETIMEDOUT : -EBUSY;
+	else if (ret > 0)
+		ret = 0;
+
+	bo = to_thames_bo(gem_obj);
+	if (bo->flags & DRM_THAMES_BO_CONTIGUOUS)
+		dma_sync_single_for_cpu(ddev->dev, bo->base.dma_addr, gem_obj->size,
+					DMA_BIDIRECTIONAL);
+	else
+		dma_sync_sgtable_for_cpu(ddev->dev, bo->shmem.sgt, DMA_BIDIRECTIONAL);
+	/* Order the cache maintenance before the CPU reads. */
+	mb();
+
+	drm_gem_object_put(gem_obj);
+
+	return ret;
+}
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_fini *args = data;
+	struct thames_gem_object *bo;
+	struct drm_gem_object *gem_obj;
+
+	if (args->reserved != 0)
+		return -EINVAL;
+
+	gem_obj = drm_gem_object_lookup(file, args->handle);
+	if (!gem_obj)
+		return -ENOENT;
+
+	bo = to_thames_bo(gem_obj);
+	if (bo->flags & DRM_THAMES_BO_CONTIGUOUS) {
+		dma_sync_single_for_device(ddev->dev, bo->base.dma_addr, gem_obj->size,
+					   DMA_BIDIRECTIONAL);
+	} else {
+		dma_sync_sgtable_for_device(ddev->dev, bo->shmem.sgt, DMA_BIDIRECTIONAL);
+	}
+
+	/* Order the cache maintenance before the return. */
+	mb();
+
+	drm_gem_object_put(gem_obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
index c9d0e170dad3..7c9d375d1ebd 100644
--- a/drivers/accel/thames/thames_gem.h
+++ b/drivers/accel/thames/thames_gem.h
@@ -51,6 +51,10 @@ int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file
 
 int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
 
+int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm_file *file);
+
 int thames_ioctl_bo_bind(struct drm_device *ddev, void *data, struct drm_file *file);
 
 int thames_context_create(struct thames_file_priv *priv);
diff --git a/include/uapi/drm/thames_accel.h b/include/uapi/drm/thames_accel.h
index d193967485cb..ae43885bdcb5 100644
--- a/include/uapi/drm/thames_accel.h
+++ b/include/uapi/drm/thames_accel.h
@@ -54,6 +54,12 @@ enum drm_thames_ioctl_id {
 	 */
 	DRM_THAMES_BO_MMAP_OFFSET,
 
+	/** @DRM_THAMES_BO_PREP: Prepare a BO for CPU access after DSP writes. */
+	DRM_THAMES_BO_PREP,
+
+	/** @DRM_THAMES_BO_FINI: Finish CPU access and prepare BO for DSP access. */
+	DRM_THAMES_BO_FINI,
+
 	/** @DRM_THAMES_DEV_QUERY: Query the device's capabilities. */
 	DRM_THAMES_DEV_QUERY,
 
@@ -143,6 +149,52 @@ struct drm_thames_bo_mmap_offset {
 	__u64 offset;
 };
 
+/**
+ * struct drm_thames_bo_prep - ioctl argument for preparing a BO for CPU access.
+ *
+ * Waits for the DSP to be done with the buffer and invalidates the CPU caches,
+ * so that what the DSP wrote is visible to the CPU.  The DSP is not coherent
+ * with the CPU, and the wait and the cache invalidation are deliberately the
+ * same operation: userspace has no way of skipping the wait and keeping the
+ * invalidation, so a mapping is never handed out with stale cache lines.
+ *
+ * Returns 0 once the buffer is ready for CPU access, -ETIMEDOUT if
+ * &drm_thames_bo_prep.timeout_ns passed before the DSP was done with it, or
+ * -EBUSY if that timestamp was not in the future at the call, 0 included, and
+ * the buffer is still in use.  It must never return -EAGAIN: userspace reaches
+ * this ioctl through drmIoctl(), which restarts on both -EINTR and -EAGAIN and
+ * would spin forever.
+ */
+struct drm_thames_bo_prep {
+	/** @handle: Handle of the buffer to prepare for CPU access. */
+	__u32 handle;
+
+	/** @reserved: MBZ. */
+	__u32 reserved;
+
+	/**
+	 * @timeout_ns: Absolute CLOCK_MONOTONIC timestamp at which the wait
+	 * gives up.  A timestamp in the past, 0 included, makes the ioctl
+	 * return without blocking.
+	 */
+	__s64 timeout_ns;
+};
+
+/**
+ * struct drm_thames_bo_fini - ioctl argument for finishing CPU access to a BO.
+ *
+ * Flushes the CPU caches, so that what the CPU wrote is visible to the DSP.
+ * Userspace has to call this after writing to a mapping and before the buffer
+ * is used by a job, as the DSP is not coherent with the CPU.
+ */
+struct drm_thames_bo_fini {
+	/** @handle: Handle of the buffer the CPU is done writing to. */
+	__u32 handle;
+
+	/** @reserved: MBZ. */
+	__u32 reserved;
+};
+
 /**
  * struct drm_thames_obj_array - An array of versioned objects passed by pointer.
  *
@@ -768,6 +820,10 @@ enum {
 		DRM_IOCTL_THAMES(WR, BO_CREATE, bo_create),
 	DRM_IOCTL_THAMES_BO_MMAP_OFFSET =
 		DRM_IOCTL_THAMES(WR, BO_MMAP_OFFSET, bo_mmap_offset),
+	DRM_IOCTL_THAMES_BO_PREP =
+		DRM_IOCTL_THAMES(WR, BO_PREP, bo_prep),
+	DRM_IOCTL_THAMES_BO_FINI =
+		DRM_IOCTL_THAMES(WR, BO_FINI, bo_fini),
 	DRM_IOCTL_THAMES_DEV_QUERY =
 		DRM_IOCTL_THAMES(WR, DEV_QUERY, dev_query),
 	DRM_IOCTL_THAMES_JOB_CREATE =

-- 
2.54.0

