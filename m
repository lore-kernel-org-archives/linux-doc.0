Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246D3D6F
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 09:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952812; cv=none; b=IpDGZdq2GksUfBKwpdyek4q3FgRy8uRtMp6i5Bj04YS/2AYPiksTVMvKQlhCldn2nwmPAj7qIJQ9XX3c4y4TEov/jywPPuAebuT2MLGXS2apRKmX+IowsjhlCj1Cd8Jf6pZydcYPLOdYcXxtBYgadhpHfywrj9lz090qKxSRcII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952812; c=relaxed/simple;
	bh=q7KMqZysh+a3liEOjxIZ5pRAbK2zhPglz1suWJYgrtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNomvYX8hdja4Q9PYaBncTPW1PekmXfLt1tPQJn11GiWUcR3jnUWpxznbi8CnGxv2EivYL629Sns8GJysnUi2c5SgxUinjOgXo4Lcc4mCKc0+dkVLxfGn2BghMPbGDW7WDdaXFNOk1Q/kF1JmGRXXbG1Z7lpvaPUPCFnhOsNkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=g5+Fz/4W; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="g5+Fz/4W"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47117f92e32so24881225e9.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 02:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1760952809; x=1761557609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=35P1VBGXpvybu0O/QguU3+ECEHWeEOmbTTq+p+G5dt8=;
        b=g5+Fz/4WhZLjOD6z2nzvpci2WZ3fFSZSzKZsBfNcwBrhBV0Hz5hZ8x3xaWHZDocA1A
         1bSV7l8ZSYKhTWwihvNV3ly8iaHspaBtgWWK62DdIfdWvecejuXg0V04mfhnLZgL5HhN
         MVDwKj3ydQb/1oVH7o4xRRDE54LwhSNsN0KinbAb/nliGvFAebDzX3bq8ljOJXvtbdgd
         875xrRMCEBRPaydmY8btpFEUGtz2TmDu4ADwpHOAa1MufhJaeHwc9yKPO9oO2+oESZZd
         SJ+NNH3BFkp0sNGqc3keTbXNgNjaLfI7PIo1nDG0TN3TXsBjs2bSNc7lwI5lIddt5qWk
         c85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952809; x=1761557609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=35P1VBGXpvybu0O/QguU3+ECEHWeEOmbTTq+p+G5dt8=;
        b=QPW8Md8GZw53YHwB/NHFhftZipRIyOkrHyJP0Ce2iLWIImHHTF/oiuCdQFYEcybCcV
         Hs3fuuC5f3ip3N55twZ3L128vJY+RrLAfwNAW0mHXMNRyYISf+EfVCIm5/lNo1KUxz6M
         lT0vybELNW6aPKhNXCkwWjBe2QhDcbDyosri1VKnbQi89r2HNsHTfxyKXqenFqvaEde2
         FatwzmpR2uO8NrT741pMX9SnhH8xSQwNX/hJ7BfEdRbmdPj/WzwvYsEJu97fyd10tHbv
         rdFyD53fCE1u9qvcRQnl8ZmhMqWq+LFF9hhF/qboUGYemBoUvKA70mG353dEMiNDkbtA
         JcIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHkXcAVQZRONWSGMVGtnmRrMgQOXuMZsjn3w148wS7ifeFZyNjyCX4+tP5R8jx3C1DFHHxKR/fnU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2M8FwFzDNmxB8G/brKPkABRWarfCcDefdjZScTBPqOi0LWg0I
	+gBQZELBUvw25UMHmulDxMOqibngl1iiGZGyACEeFmpogEP+0dZ+57FE2WRc5smJQko=
X-Gm-Gg: ASbGnctnUMNIqYAJgJyIdCl3yXy5zB7DBxQljgpQDOvW3GvTqM8yf6Om18miqjRo1Ni
	JX2GAGPqnhhWGzUJzlps+Ev3pzGG517abHRtgdU+poBHPTZfJZHks27VRbHGQrJO5SROOUFf2Jw
	bCH4bdVQKI++eFsjm05RYHHILzx6Msp/djNlOPgitg0J9krz2XawSOGLvrsb+3I8KHJhbr/Y0TU
	2+MbxidGaswm+qS/tkcqWB5mo9OKz8w3slyCvxRxPGcNb90XI4LXT/Mq+/BsoR7Lxq+E6BY0SLh
	ortUVvR58EQayXwbaBSPceAMw4SrEsg9Aj8gsdT0Fiu4UcWikVPBbn8Z1Hui21+U5EqgcWN0xZB
	Kzk+1NhKZdL48+3HQ2byj69XTpxQrYKWseRFNKAsFisMTdlhD5Ogiz6ofIOlVXjv3fwn+D+EZr2
	rhy6gSFiZLUlNWWxpxSR6xy+spZw==
X-Google-Smtp-Source: AGHT+IGUDMR8mkIoFpUlAAdUP/6zPdVHLyL+h1bB5WDQD3WBZIgLWI1xtBdpKBPhcrO0v8yIyFyufw==
X-Received: by 2002:a05:600d:41cc:b0:471:13dd:baef with SMTP id 5b1f17b1804b1-4711791beadmr80450325e9.26.1760952808602;
        Mon, 20 Oct 2025 02:33:28 -0700 (PDT)
Received: from [192.168.0.101] ([90.242.12.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715520dd65sm134062965e9.15.2025.10.20.02.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:33:28 -0700 (PDT)
Message-ID: <0130b962-6cd7-4f2c-8fd0-809a21495e03@ursulin.net>
Date: Mon, 20 Oct 2025 10:33:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/v3d: Use huge tmpfs mount point helper
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
References: <20251015153018.43735-1-loic.molinari@collabora.com>
 <20251015153018.43735-8-loic.molinari@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20251015153018.43735-8-loic.molinari@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 15/10/2025 16:30, Loïc Molinari wrote:
> Make use of the new drm_gem_huge_mnt_create() helper to avoid code
> duplication. Now that it's just a few lines long, the single function
> in v3d_gemfs.c is moved into v3d_gem.c.
> 
> v3:
> - use huge tmpfs mountpoint in drm_device
> - move v3d_gemfs.c into v3d_gem.c
> 
> v4:
> - clean up mountpoint creation error handling
> 
> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
> ---
>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>   drivers/gpu/drm/v3d/v3d_bo.c    |  5 ++-
>   drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h   | 11 +-----
>   drivers/gpu/drm/v3d/v3d_gem.c   | 27 +++++++++++++--
>   drivers/gpu/drm/v3d/v3d_gemfs.c | 60 ---------------------------------
>   6 files changed, 30 insertions(+), 78 deletions(-)
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
> index c41476ddde68..6b9909bfce82 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -112,7 +112,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>   	if (IS_ERR(sgt))
>   		return PTR_ERR(sgt);
>   
> -	if (!v3d->gemfs)
> +	if (!obj->dev->huge_mnt)

Maybe it would be a good idea to add a helper for this check. Keeping 
aligned with drm_gem_huge_mnt_create() something like 
drm_gem_has_huge_mnt()? That would then hide the optional drm_device 
struct member if you decide to go for that.

>   		align = SZ_4K;
>   	else if (obj->size >= SZ_1M)
>   		align = SZ_1M;
> @@ -148,12 +148,11 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>   			     size_t unaligned_size)
>   {
>   	struct drm_gem_shmem_object *shmem_obj;
> -	struct v3d_dev *v3d = to_v3d_dev(dev);
>   	struct v3d_bo *bo;
>   	int ret;
>   
>   	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  v3d->gemfs);
> +						  dev->huge_mnt);

Okay this one goes away by the end of the series.

>   	if (IS_ERR(shmem_obj))
>   		return ERR_CAST(shmem_obj);
>   	bo = to_v3d_bo(&shmem_obj->base);
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index c5a3bbbc74c5..19ec0ea7f38e 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -106,7 +106,7 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
>   		args->value = v3d->perfmon_info.max_counters;
>   		return 0;
>   	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
> -		args->value = !!v3d->gemfs;
> +		args->value = !!dev->huge_mnt;
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
> index bb110d35f749..635ff0fabe7e 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -258,6 +258,30 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
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
> +	if (super_pages)
> +		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");

If it is this patch that is creating the build failure then the two 
should be squashed.

Then in "drm/v3d: Fix builds with CONFIG_TRANSPARENT_HUGEPAGE=n" this 
ends up a bit ugly:

#ifdef CONFIG_TRANSPARENT_HUGEPAGE
  	if (super_pages)
#endif
  		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");

Does this not work:

  	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && super_pages)
  		err = drm_gem_huge_mnt_create(&v3d->drm, "within_size");

?

Regards,

Tvrtko

> +
> +	if (v3d->drm.huge_mnt)
> +		drm_info(&v3d->drm, "Using Transparent Hugepages\n");
> +	else if (err)
> +		drm_warn(&v3d->drm, "Can't use Transparent Hugepages (%d)\n",
> +			 err);
> +	else
> +		drm_notice(&v3d->drm,
> +			   "Transparent Hugepage support is recommended for optimal performance on this platform!\n");
> +}
> +
>   int
>   v3d_gem_init(struct drm_device *dev)
>   {
> @@ -309,7 +333,7 @@ v3d_gem_init(struct drm_device *dev)
>   	v3d_init_hw_state(v3d);
>   	v3d_mmu_set_page_table(v3d);
>   
> -	v3d_gemfs_init(v3d);
> +	v3d_huge_mnt_init(v3d);
>   
>   	ret = v3d_sched_init(v3d);
>   	if (ret) {
> @@ -329,7 +353,6 @@ v3d_gem_destroy(struct drm_device *dev)
>   	enum v3d_queue q;
>   
>   	v3d_sched_fini(v3d);
> -	v3d_gemfs_fini(v3d);
>   
>   	/* Waiting for jobs to finish would need to be done before
>   	 * unregistering V3D.
> diff --git a/drivers/gpu/drm/v3d/v3d_gemfs.c b/drivers/gpu/drm/v3d/v3d_gemfs.c
> deleted file mode 100644
> index c1a30166c099..000000000000
> --- a/drivers/gpu/drm/v3d/v3d_gemfs.c
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/* Copyright (C) 2024 Raspberry Pi */
> -
> -#include <linux/fs.h>
> -#include <linux/mount.h>
> -#include <linux/fs_context.h>
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

