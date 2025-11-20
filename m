Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BC92EFD81
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763631602; cv=none; b=HUWDyNNeozmrV0B92+lnuO4GVvvpw4bGh8TQNomTGb+7qhNcM6D6ZNHaTkFvgtdHoTl/Kb4IqaMSiSjBS/Ij4dVPwdY4eYo7gVaDvKSkVk3e1nl9HSePK4KEd0lXBP3gl6hes4+b1JLEuTIUJCc3kgemJn2Bo5F+KR2BEj3b+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763631602; c=relaxed/simple;
	bh=XRIm53lTNUExQrKIh1qRbgIX2Ho6+aEArpJeEjw1/bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BE3XeVxJvNFADwKHlVrX6Pfj+eD+QtTfFrNHVoxYxoSw/uNZvvKxvrJd4IiW7tvs8L3f5u5nZyHAUidMmy8ADU+b6gxfJr9GFFODf/Nv8HbF7Myd+sbAl2WCtJ83RV8OX7G0CmzA6O5hIaqBjPwHR6VDZavPn8HMH7p5W8CKbkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=Uw5KYbtJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="Uw5KYbtJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477aa218f20so4083645e9.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1763631597; x=1764236397; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6D2T/swrfGwwYIubUbU67Re0aJ0OQCaQcEzYhgb7k8=;
        b=Uw5KYbtJtdiQySRG8WX1zbOGksRLaTBRdFyPeEbrxuHeCaGy686LXcH81Mm3AlJcnc
         uTF8675ZwIBbtRe4PSJOb9Y/QIgY9kNZJypEmZ3dlWxngRD9RNwQ/zczz6kJFIzPHBpA
         P7jV59K+fHSpZLrsKgiB8ohTg9CLtePAxQQ+2xUSKe3JTIcdAsO+bUP5oaHxpnR+keTB
         XWxKJ3JIgP7uoTY+uptHctMB/+SgQjV7adNlMZCj2YRDXFvSpnbe6kUrZD0mrW1iLVrC
         90HKJjV8OUgScXhv3Cp3mtRXJjcQsNlNmj8H6STY9J25kQu+G/82pQPyo/fJaLCB92Ih
         mFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631597; x=1764236397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6D2T/swrfGwwYIubUbU67Re0aJ0OQCaQcEzYhgb7k8=;
        b=km115wGbMpvkO/EdqtUkYDQTp4rJMfHnL2HgQ/VhwjZ9afIQ/HL9ByEf6aVP8393nx
         mdqYKiP22Vl9HXfEwDz64z4IEe1UzXxdtNwAzT3gZUYLSjtfcJZTKDfT2Zg5JS8/UNqQ
         ji5rRFTi/P26s+68TwS3b+opgJ26iwcB945X+csIBBNG/vC5Qm5vxGBlUPRANLg26rKX
         fcfoOsuSt+rH7ldcIw+LzQkqr7B0K8CTIMCFOGoqFC7fxG9NX84Vka+KMcQ/xlMX52dz
         L8a72jYQpH9iVCnrhsZgGT6H6xKqZkU/EdmZc5wXHzGFJuAfj78mWTvFayDekr86ktIs
         WUPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwsO1rYCzQhpVy5vrEQPKvl0sySrvUH1SMBGidFNgS3kXzicUKGxrCnjAUbTkLiSONNhJmQGCoGvU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKV34QTEg9RkvLqQhSOg3JcrGLGjKV++Sc5DNK/gXMa2HlqEv8
	mGX36ccTPgV7qGbMd2V2wuqEI5bcJE6M6WZhRwtrfjr1bsIvO1r8KLRY3SElmZlTiLI=
X-Gm-Gg: ASbGncuHHVVaDA7KaLndo6Y9kWCHd+2oF+ibZAAJd4fMryEFNlGi7QQSprSXo3+y70X
	7HmQ/YyiTtbMSrt0MbfApxcHmLfjUI88E+p7LRgXs0m9HpcElPzrqmypiyGE+Sr2GhwGqfG3DTP
	xN/M4GjVZoqZUT3SJGpCz9H/GtNpEIlwe42LolGw9/5xS+Pbd52JLl5EPwc4OtG6v4P7WUmgGVg
	wxq7b/FV7VoWQyRRhPwSq4Rk2URrUKrBwdtnpcrovvrPz4xuYgQFJ112IeITMwDoagElqVHW87G
	f4FaaOCFkAXVea+ZAOJgoIpBZFQM10yoVsTSI78rQfgS4p8t56M3BBPz1Mtb7z3lleuktt1EQue
	MmiBflk312QuXOUxLOD4Wz9/sqLjbUOwJQI4Q3N+yfEmuE3pC0RSP0fcYmjcWwrc+el52iJ8mkh
	S7PSbScqdlX1ahaMEf4uOBQ0na6onmol6arrBjSMKEOZ0=
X-Google-Smtp-Source: AGHT+IGOpmCt7r6aMgv0PofyN+s+ybvbGGWrGxrluj7E2hm4OOsNHntjgzS2fQRDmHRVqJS0JlWLYQ==
X-Received: by 2002:a05:600c:3550:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-477b9ddd8c4mr18898435e9.4.1763631596107;
        Thu, 20 Nov 2025 01:39:56 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffd37bsm100308375e9.3.2025.11.20.01.39.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:39:55 -0800 (PST)
Message-ID: <75cf65a0-8967-4e39-8bfe-aa284f8242b3@ursulin.net>
Date: Thu, 20 Nov 2025 09:39:54 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] drm/v3d: Use huge tmpfs mountpoint helpers
To: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251114170303.2800-1-loic.molinari@collabora.com>
 <20251114170303.2800-7-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251114170303.2800-7-loic.molinari@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/11/2025 17:02, Loïc Molinari wrote:
> Make use of the new drm_gem_huge_mnt_create() and
> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
> it's just a few lines long, the single function in v3d_gemfs.c is
> moved into v3d_gem.c.
> 
> v3:
> - use huge tmpfs mountpoint in drm_device
> - move v3d_gemfs.c into v3d_gem.c
> 
> v4:
> - clean up mountpoint creation error handling
> 
> v5:
> - fix CONFIG_TRANSPARENT_HUGEPAGE check
> - use drm_gem_has_huge_mnt() helper
> 
> v8:
> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
> 
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> ---
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c    |  9 +++--
>   drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 11 +-----
>   drivers/gpu/drm/v3d/v3d_gem.c   | 27 ++++++++++++--
>   drivers/gpu/drm/v3d/v3d_gemfs.c | 62 ---------------------------------
>   6 files changed, 34 insertions(+), 80 deletions(-)
>   delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
> 
> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
> index fcf710926057..b7d673f1153b 100644
> --- a/drivers/gpu/drm/v3d/Makefile
> +++ b/drivers/gpu/drm/v3d/Makefile
> @@ -13,8 +13,7 @@ v3d-y := \
>   	v3d_trace_points.o \
>   	v3d_sched.o \
>   	v3d_sysfs.o \
> -	v3d_submit.o \
> -	v3d_gemfs.o
> +	v3d_submit.o
>   
>   v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
>   
> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index d9547f5117b9..211578abf9b6 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -114,7 +114,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> -	if (!v3d->gemfs)
> +	if (!drm_gem_get_huge_mnt(obj->dev))
>   		align = SZ_4K;
>   	else if (obj->size >= SZ_1M)
>   		align = SZ_1M;
> @@ -150,12 +150,15 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> -	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
>   	int ret;
>   
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  v3d->gemfs);
> +						  dev->huge_mnt);
> +#else
> +	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
> +#endif

Don't you want to use the same pattern not requiring #ifdef as you did 
in i915?

The rest looks good to me on a glance. Only functional change appears to 
be that you are adding a new error message, scrolling down..

>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index e8a46c8bad8a..8faa9382846f 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -107,7 +107,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>   		args->value = v3d->perfmon_info.max_counters;
>   		return 0;
>   	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
> -		args->value = !!v3d->gemfs;
> +		args->value = !!drm_gem_get_huge_mnt(dev);
>   		return 0;
>   	case DRM_V3D_PARAM_GLOBAL_RESET_COUNTER:
>   		mutex_lock(&v3d->reset_lock);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 1884686985b8..99a39329bb85 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -158,11 +158,6 @@ struct v3d_dev {
>   	struct drm_mm mm;
>   	spinlock_t mm_lock;
>   
> -	/*
> -	 * tmpfs instance used for shmem backed objects
> -	 */
> -	struct vfsmount *gemfs;
> -
>   	struct work_struct overflow_mem_work;
>   
>   	struct v3d_queue_state queue[V3D_MAX_QUEUES];
> @@ -569,6 +564,7 @@ extern const struct dma_fence_ops v3d_fence_ops;
>   struct dma_fence *v3d_fence_create(struct v3d_dev *v3d, enum v3d_queue q);
>   
>   /* v3d_gem.c */
> +extern bool super_pages;
>   int v3d_gem_init(struct drm_device *dev);
>   void v3d_gem_destroy(struct drm_device *dev);
>   void v3d_reset_sms(struct v3d_dev *v3d);
> @@ -576,11 +572,6 @@ void v3d_reset(struct v3d_dev *v3d);
>   void v3d_invalidate_caches(struct v3d_dev *v3d);
>   void v3d_clean_caches(struct v3d_dev *v3d);
>   
> -/* v3d_gemfs.c */
> -extern bool super_pages;
> -void v3d_gemfs_init(struct v3d_dev *v3d);
> -void v3d_gemfs_fini(struct v3d_dev *v3d);
> -
>   /* v3d_submit.c */
>   void v3d_job_cleanup(struct v3d_job *job);
>   void v3d_job_put(struct v3d_job *job);
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 5a180dc6c452..62532a89dd14 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -259,6 +259,30 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
>   	v3d_invalidate_slices(v3d, 0);
>   }
>   
> +static void
> +v3d_huge_mnt_init(struct v3d_dev *v3d)
> +{
> +	int err = 0;
> +
> +	/*
> +	 * By using a huge shmemfs mountpoint when the user wants to
> +	 * enable Super Pages, we can pass in mount flags that better
> +	 * match our usecase.
> +	 */
> +
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
> +		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");
> +
> +	if (drm_gem_get_huge_mnt(&v3d->drm))
> +		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +	else if (err)
> +		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n",
> +			 err);

.. here, but that looks acceptable to me.

Regards,

Tvrtko

> +	else
> +		drm_notice(&v3d->drm,
> +			   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> +}
> +
>   int
>   v3d_gem_init(struct drm_device *dev)
>   {
> @@ -310,7 +334,7 @@ v3d_gem_init(struct drm_device *dev)
>   	v3d_init_hw_state(v3d);
>   	v3d_mmu_set_page_table(v3d);
>   
> -	v3d_gemfs_init(v3d);
> +	v3d_huge_mnt_init(v3d);
>   
>   	ret = v3d_sched_init(v3d);
>   	if (ret) {
> @@ -330,7 +354,6 @@ v3d_gem_destroy(struct drm_device *dev)
>   	enum v3d_queue q;
>   
>   	v3d_sched_fini(v3d);
> -	v3d_gemfs_fini(v3d);
>   
>   	/* Waiting for jobs to finish would need to be done before
>   	 * unregistering V3D.
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> deleted file mode 100644
> index bf351fc0d488..000000000000
> --- a/drivers/gpu/drm/v3d/v3d_gemfs.c
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (C) 2024 Raspberry Pi */
> -
> -#include <linux/fs.h>
> -#include <linux/mount.h>
> -#include <linux/fs_context.h>
> -
> -#include <drm/drm_print.h>
> -
> -#include "v3d_drv.h"
> -
> -void v3d_gemfs_init(struct v3d_dev *v3d)
> -{
> -	struct file_system_type *type;
> -	struct fs_context *fc;
> -	struct vfsmount *gemfs;
> -	int ret;
> -
> -	/*
> -	 * By creating our own shmemfs mountpoint, we can pass in
> -	 * mount flags that better match our usecase. However, we
> -	 * only do so on platforms which benefit from it.
> -	 */
> -	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
> -		goto err;
> -
> -	/* The user doesn't want to enable Super Pages */
> -	if (!super_pages)
> -		goto err;
> -
> -	type = get_fs_type("tmpfs");
> -	if (!type)
> -		goto err;
> -
> -	fc = fs_context_for_mount(type, SB_KERNMOUNT);
> -	if (IS_ERR(fc))
> -		goto err;
> -	ret = vfs_parse_fs_string(fc, "source", "tmpfs");
> -	if (!ret)
> -		ret = vfs_parse_fs_string(fc, "huge", "within_size");
> -	if (!ret)
> -		gemfs = fc_mount_longterm(fc);
> -	put_fs_context(fc);
> -	if (ret)
> -		goto err;
> -
> -	v3d->gemfs = gemfs;
> -	drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> -
> -	return;
> -
> -err:
> -	v3d->gemfs = NULL;
> -	drm_notice(&v3d->drm,
> -		   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> -}
> -
> -void v3d_gemfs_fini(struct v3d_dev *v3d)
> -{
> -	if (v3d->gemfs)
> -		kern_unmount(v3d->gemfs);
> -}

