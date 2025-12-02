Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630D030FC0D
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764673273; cv=none; b=GbWQ6ln0lwWQCPoZ97pJbxMQ6zw6zLIMGXIjNhRFIpt7ahWXa8GALWv2szR/o3MYTMnZkEiFdT1A07plO3W8YCsDFyQ6Mub3qFZ1HbP6Gt3MSpN1H+IkCAzbJRdn+M2FfAmThw7F5EXXHTEsDnvLi8/ZVWyOwLCMi1wQe0LZuEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764673273; c=relaxed/simple;
	bh=UL5WSICHbrlwxiyX7VlmSeM5u21hG6WjocJkeBe/R60=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mbi2MzguvwVY9iDVRup72azWjPtavyBTAxdp4nvan5EgvnKft2n/puSsLdXaPJ/Ko7pIb3m9zrkxqm3MRozA8JkHiyzkNIii9gerTZEBrfvOJLEbTBZdbdd1OiWiwaP2pqlGROEZWaZlzi0ML18klvUomLFwc559HodsGx+Hdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=iwPw4qQK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="iwPw4qQK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42e2e445dbbso1148969f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1764673268; x=1765278068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3pXRkvL+3EKC42zHA7TH8eep1dhxLz7bXYCNktMuQXQ=;
        b=iwPw4qQKxQZ1OdbE8IrZuhR4naFal/XuoGLVf0++hXpzGED6+jhJUKQyYWjHvR03io
         0jye2/FSOHm0CBE+N5DkpWDnH/ps6V610sDE9pDLoLGp01Vr9Z/1nGiGWyM/nNSIzz9r
         0ECcsWn4RXenGBt2oM/4HOScAqT5R74dy75L16VYTqvs5Hi5hffjDH4FLLp4Kvbw5GuV
         cLEb6qnBsQEKXzf/jMkenQkEPAhl2S+3h1DLWNpVd79h37taDbiXGU4+83LUerxpTjMQ
         4bgJx+kRQn1sElwK9M/KowYACboDJ+yRkI9KMedOzYVj/seg+/xjvXcvUMUlpYMd6Dbj
         ACDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764673268; x=1765278068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pXRkvL+3EKC42zHA7TH8eep1dhxLz7bXYCNktMuQXQ=;
        b=hsKfzP4PGifP3bH/Cco394N5SOC2ZGXzC1I3BBsLqf9xpsBlXdDj1vGw/1zlO9gkBf
         OrSTPlTBkM26DFaAVxARLcyXvXCfNJ45zamHTgjtVYkyCRXBLTXRK7jnLGJ/X9kO98TE
         o75XZ0ZA97C8V4rrleMajBRKjBbq+VU4C8wHxhZUCzqQLlP15ZLrJuPTwYbnZKEDkEkO
         SzlOOhI14vCMntbGjX5M6f1IaFO9sAVHoPe/19NHa/w9SYjjFhGbrcN7Bx+b1frfe33D
         RxKvSM/0lHjZSHbEePUCttJ1awT3mMSgZt8saI9PLRJYA3pw1FyLOLG2ynzVfCfqeakm
         WZpg==
X-Forwarded-Encrypted: i=1; AJvYcCWuy/1SpHKrdCuwzmQKNlQIhlnZzuxWzSpLzK3UOddW06Kzokj522WS5JKrSdtujwkJYpOZ78PlEgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAKYWBYD10zaPtoDNjajtHjPxAD/jxdAroaHateLIKRDrGm0Y1
	lxyWd8WfUrRul/1NBvSTERV6ROCcWWcAszKt7ZTqksJGgtvKXzLR5stFtAEpU67Lr8g=
X-Gm-Gg: ASbGncsIJ4TKjBHkWuv7greqpcNLWb+c1O1JHqzPARmi0FoTx9JatoK1eDbfVkqHx8F
	omjZGFEumAzB7yiTf+cbY4Ig5eQEiRX3+S8ZyygA+yMwPhOlc6LIInag8jLQtpsYLag4bBtEzHG
	v7bw8FpbXjJNqyrSO4Z8AQje0SzZ94VAMA0dJCweVZjhWmgSUHT9uT9p7rrRVWNhgylBMz4gHJT
	SpMULIUzSbEUJxgK0GV8P1Mq+95D0CSm2INaAfrVNSlBDywRHN5nKXGZpiFGqn5cUf3m2qaMGzG
	xwHYQzixBMRP3Wc8g6H4YK+s9R7QBH+jyeRu6NniRH4z/XTvzPZ3Si9LwdgBqNuldpbrY+gHNVG
	4WbAH5Giba/zPelguJjINDbwIyQD63+Qj1FnnckelglyYmmVA7+e/i5VeKX01t/90hkLe1Decbe
	Zra4GhGPRgGAoSvDf1McWnB3DISrUSWUqb
X-Google-Smtp-Source: AGHT+IFAG5uHEhKGtESUOPxceOxz41Vbw8T+eCL6cDBq81BKt4lQ3T8lUorv36zH1Q8hKyeWit7L/g==
X-Received: by 2002:a05:6000:4012:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42cc1d1999dmr46866026f8f.40.1764673266852;
        Tue, 02 Dec 2025 03:01:06 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm33688483f8f.10.2025.12.02.03.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 03:01:05 -0800 (PST)
Message-ID: <0a233d0d-17a2-4f5b-85bb-a33451ec6e9f@ursulin.net>
Date: Tue, 2 Dec 2025 11:01:04 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/11] drm/i915: Use huge tmpfs mountpoint helpers
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
 <20251114170303.2800-6-loic.molinari@collabora.com>
 <fee6476e-3168-4f4f-ae2f-3ef65fe209b0@ursulin.net>
 <240d0dce-bbc4-4c82-9f9f-7f4625da8315@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <240d0dce-bbc4-4c82-9f9f-7f4625da8315@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 28/11/2025 18:41, Loïc Molinari wrote:
> On 20/11/2025 10:31, Tvrtko Ursulin wrote:
>>
>> On 14/11/2025 17:02, Loïc Molinari wrote:
>>> Make use of the new drm_gem_huge_mnt_create() and
>>> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
>>> it's just a few lines long, the single function in i915_gemfs.c is
>>> moved into v3d_gem_shmem.c.
>>>
>>> v3:
>>> - use huge tmpfs mountpoint in drm_device
>>> - move i915_gemfs.c into i915_gem_shmem.c
>>>
>>> v4:
>>> - clean up mountpoint creation error handling
>>>
>>> v5:
>>> - use drm_gem_has_huge_mnt() helper
>>>
>>> v7:
>>> - include <drm/drm_print.h> in i915_gem_shmem.c
>>>
>>> v8:
>>> - keep logging notice message with CONFIG_TRANSPARENT_HUGEPAGE=n
>>> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
>>>
>>> v9:
>>> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
>>> - remove useless ternary op test in selftests/huge_pages.c
>>>
>>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>>> ---
>>>   drivers/gpu/drm/i915/Makefile                 |  3 +-
>>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c     | 48 +++++++++----
>>>   drivers/gpu/drm/i915/gem/i915_gemfs.c         | 71 -------------------
>>>   drivers/gpu/drm/i915/gem/i915_gemfs.h         | 14 ----
>>>   .../gpu/drm/i915/gem/selftests/huge_pages.c   | 16 +++--
>>>   drivers/gpu/drm/i915/i915_drv.h               |  5 --
>>>   6 files changed, 47 insertions(+), 110 deletions(-)
>>>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
>>>   delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h
>>>
>>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/ 
>>> Makefile
>>> index 84ec79b64960..b5a8c0a6b747 100644
>>> --- a/drivers/gpu/drm/i915/Makefile
>>> +++ b/drivers/gpu/drm/i915/Makefile
>>> @@ -169,8 +169,7 @@ gem-y += \
>>>       gem/i915_gem_ttm_move.o \
>>>       gem/i915_gem_ttm_pm.o \
>>>       gem/i915_gem_userptr.o \
>>> -    gem/i915_gem_wait.o \
>>> -    gem/i915_gemfs.o
>>> +    gem/i915_gem_wait.o
>>>   i915-y += \
>>>       $(gem-y) \
>>>       i915_active.o \
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/ 
>>> drm/i915/gem/i915_gem_shmem.c
>>> index 26dda55a07ff..15c2c6fde2ac 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>>> @@ -9,14 +9,16 @@
>>>   #include <linux/uio.h>
>>>   #include <drm/drm_cache.h>
>>> +#include <drm/drm_gem.h>
>>> +#include <drm/drm_print.h>
>>>   #include "gem/i915_gem_region.h"
>>>   #include "i915_drv.h"
>>>   #include "i915_gem_object.h"
>>>   #include "i915_gem_tiling.h"
>>> -#include "i915_gemfs.h"
>>>   #include "i915_scatterlist.h"
>>>   #include "i915_trace.h"
>>> +#include "i915_utils.h"
>>>   /*
>>>    * Move folios to appropriate lru and release the batch, 
>>> decrementing the
>>> @@ -497,6 +499,7 @@ static int __create_shmem(struct drm_i915_private 
>>> *i915,
>>>                 resource_size_t size)
>>>   {
>>>       unsigned long flags = VM_NORESERVE;
>>> +    struct vfsmount *huge_mnt;
>>>       struct file *filp;
>>>       drm_gem_private_object_init(&i915->drm, obj, size);
>>> @@ -515,9 +518,9 @@ static int __create_shmem(struct drm_i915_private 
>>> *i915,
>>>       if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
>>>           return -E2BIG;
>>> -    if (i915->mm.gemfs)
>>> -        filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
>>> -                         flags);
>>> +    huge_mnt = drm_gem_get_huge_mnt(&i915->drm);
>>> +    if (huge_mnt)
>>> +        filp = shmem_file_setup_with_mnt(huge_mnt, "i915", size, 
>>> flags);
>>>       else
>>>           filp = shmem_file_setup("i915", size, flags);
>>>       if (IS_ERR(filp))
>>> @@ -644,21 +647,40 @@ i915_gem_object_create_shmem_from_data(struct 
>>> drm_i915_private *i915,
>>>   static int init_shmem(struct intel_memory_region *mem)
>>>   {
>>> -    i915_gemfs_init(mem->i915);
>>> -    intel_memory_region_set_name(mem, "system");
>>> +    struct drm_i915_private *i915 = mem->i915;
>>> -    return 0; /* We have fallback to the kernel mnt if gemfs init 
>>> failed. */
>>> -}
>>> +    /*
>>> +     * By creating our own shmemfs mountpoint, we can pass in
>>> +     * mount flags that better match our usecase.
>>> +     *
>>> +     * One example, although it is probably better with a per-file
>>> +     * control, is selecting huge page allocations 
>>> ("huge=within_size").
>>> +     * However, we only do so on platforms which benefit from it, or to
>>> +     * offset the overhead of iommu lookups, where with latter it is 
>>> a net
>>> +     * win even on platforms which would otherwise see some performance
>>> +     * regressions such a slow reads issue on Broadwell and Skylake.
>>> +     */
>>> -static int release_shmem(struct intel_memory_region *mem)
>>> -{
>>> -    i915_gemfs_fini(mem->i915);
>>> -    return 0;
>>> +    if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
>>> +        goto no_thp;
>>> +
>>> +    drm_gem_huge_mnt_create(&i915->drm, "within_size");
>>> +    if (drm_gem_get_huge_mnt(&i915->drm))
>>> +        drm_info(&i915->drm, "Using Transparent Hugepages\n");
>>> +    else
>>> +        drm_notice(&i915->drm,
>>> +               "Transparent Hugepage support is recommended for 
>>> optimal performance%s\n",
>>> +               GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
>>> +                              " when IOMMU is enabled!");
>>> +
>>> + no_thp:
>>> +    intel_memory_region_set_name(mem, "system");
>>> +
>>> +    return 0; /* We have fallback to the kernel mnt if huge mnt 
>>> failed. */
>>>   }
>>>   static const struct intel_memory_region_ops shmem_region_ops = {
>>>       .init = init_shmem,
>>> -    .release = release_shmem,
>>>       .init_object = shmem_object_init,
>>>   };
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.c b/drivers/gpu/drm/ 
>>> i915/gem/i915_gemfs.c
>>> deleted file mode 100644
>>> index 1f1290214031..000000000000
>>> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.c
>>> +++ /dev/null
>>> @@ -1,71 +0,0 @@
>>> -// SPDX-License-Identifier: MIT
>>> -/*
>>> - * Copyright © 2017 Intel Corporation
>>> - */
>>> -
>>> -#include <linux/fs.h>
>>> -#include <linux/mount.h>
>>> -#include <linux/fs_context.h>
>>> -
>>> -#include <drm/drm_print.h>
>>> -
>>> -#include "i915_drv.h"
>>> -#include "i915_gemfs.h"
>>> -#include "i915_utils.h"
>>> -
>>> -void i915_gemfs_init(struct drm_i915_private *i915)
>>> -{
>>> -    struct file_system_type *type;
>>> -    struct fs_context *fc;
>>> -    struct vfsmount *gemfs;
>>> -    int ret;
>>> -
>>> -    /*
>>> -     * By creating our own shmemfs mountpoint, we can pass in
>>> -     * mount flags that better match our usecase.
>>> -     *
>>> -     * One example, although it is probably better with a per-file
>>> -     * control, is selecting huge page allocations 
>>> ("huge=within_size").
>>> -     * However, we only do so on platforms which benefit from it, or to
>>> -     * offset the overhead of iommu lookups, where with latter it is 
>>> a net
>>> -     * win even on platforms which would otherwise see some performance
>>> -     * regressions such a slow reads issue on Broadwell and Skylake.
>>> -     */
>>> -
>>> -    if (GRAPHICS_VER(i915) < 11 && !i915_vtd_active(i915))
>>> -        return;
>>> -
>>> -    if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
>>> -        goto err;
>>> -
>>> -    type = get_fs_type("tmpfs");
>>> -    if (!type)
>>> -        goto err;
>>> -
>>> -    fc = fs_context_for_mount(type, SB_KERNMOUNT);
>>> -    if (IS_ERR(fc))
>>> -        goto err;
>>> -    ret = vfs_parse_fs_string(fc, "source", "tmpfs");
>>> -    if (!ret)
>>> -        ret = vfs_parse_fs_string(fc, "huge", "within_size");
>>> -    if (!ret)
>>> -        gemfs = fc_mount_longterm(fc);
>>> -    put_fs_context(fc);
>>> -    if (ret)
>>> -        goto err;
>>> -
>>> -    i915->mm.gemfs = gemfs;
>>> -    drm_info(&i915->drm, "Using Transparent Hugepages\n");
>>> -    return;
>>> -
>>> -err:
>>> -    drm_notice(&i915->drm,
>>> -           "Transparent Hugepage support is recommended for optimal 
>>> performance%s\n",
>>> -           GRAPHICS_VER(i915) >= 11 ? " on this platform!" :
>>> -                          " when IOMMU is enabled!");
>>> -}
>>> -
>>> -void i915_gemfs_fini(struct drm_i915_private *i915)
>>> -{
>>> -    kern_unmount(i915->mm.gemfs);
>>> -}
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gemfs.h b/drivers/gpu/drm/ 
>>> i915/gem/i915_gemfs.h
>>> deleted file mode 100644
>>> index 16d4333c9a4e..000000000000
>>> --- a/drivers/gpu/drm/i915/gem/i915_gemfs.h
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -/* SPDX-License-Identifier: MIT */
>>> -/*
>>> - * Copyright © 2017 Intel Corporation
>>> - */
>>> -
>>> -#ifndef __I915_GEMFS_H__
>>> -#define __I915_GEMFS_H__
>>> -
>>> -struct drm_i915_private;
>>> -
>>> -void i915_gemfs_init(struct drm_i915_private *i915);
>>> -void i915_gemfs_fini(struct drm_i915_private *i915);
>>> -
>>> -#endif
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/ 
>>> drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> index bd08605a1611..28aef75630a2 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>>> @@ -1316,7 +1316,7 @@ typedef struct drm_i915_gem_object *
>>>   static inline bool igt_can_allocate_thp(struct drm_i915_private *i915)
>>>   {
>>> -    return i915->mm.gemfs && has_transparent_hugepage();
>>> +    return !!drm_gem_get_huge_mnt(&i915->drm);
>>>   }
>>>   static struct drm_i915_gem_object *
>>> @@ -1761,7 +1761,9 @@ static int igt_tmpfs_fallback(void *arg)
>>>       struct drm_i915_private *i915 = arg;
>>>       struct i915_address_space *vm;
>>>       struct i915_gem_context *ctx;
>>> -    struct vfsmount *gemfs = i915->mm.gemfs;
>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> +    struct vfsmount *huge_mnt = i915->drm.huge_mnt;
>>> +#endif
>>>       struct drm_i915_gem_object *obj;
>>>       struct i915_vma *vma;
>>>       struct file *file;
>>> @@ -1782,10 +1784,12 @@ static int igt_tmpfs_fallback(void *arg)
>>>       /*
>>>        * Make sure that we don't burst into a ball of flames upon 
>>> falling back
>>>        * to tmpfs, which we rely on if on the off-chance we encounter 
>>> a failure
>>> -     * when setting up gemfs.
>>> +     * when setting up a huge mountpoint.
>>>        */
>>> -    i915->mm.gemfs = NULL;
>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> +    i915->drm.huge_mnt = NULL;
>>> +#endif
>>>       obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
>>>       if (IS_ERR(obj)) {
>>> @@ -1819,7 +1823,9 @@ static int igt_tmpfs_fallback(void *arg)
>>>   out_put:
>>>       i915_gem_object_put(obj);
>>>   out_restore:
>>> -    i915->mm.gemfs = gemfs;
>>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>> +    i915->drm.huge_mnt = huge_mnt;
>>> +#endif
>>
>> Apart from this layering violation in the selftest, this version looks 
>> good to me. I am just wondering if we could somehow improve this 
>> aspect. I was thinking a self-test builds only special version of 
>> i915_gem_object_create_shmem. Call chain is deep but there are flags 
>> passed on:
>>
>> i915_gem_object_create_shmem
>>    i915_gem_object_create_region
>>      __i915_gem_object_create_region
>>        err = mem->ops->init_object(
>>
>> So we could add a new helper like:
>>
>> selftests_create_shmem
>>    i915_gem_object_create_region(...flags = 
>> I915_BO_ALLOC_SELFTESTS_NOTHP...)
>>
>> And in __create_shmem we just make it:
>>
>> ...
>> huge_mnt = drm_gem_get_huge_mnt(&i915->drm) &&
>> if (IS_ENABLED(..SELFTESTS..) &&
>>      (flags & I915_BO_ALLOC_SELFTESTS_NOTHP))
>>      huge_mnt = NULL;
>> ...
>>
>> It would avoid the ifdef and needing to play games with the DRM 
>> internals.
>>
>> How does that sound to you?
> 
> That sounds better to me but I'm not very familiar with the i915 testing 
> process. Would you be ready to accept the currect ifdef'd version for 
> now and let me take a better look at that proposal later for a follow-up 
> patch series?

I would rather we do it in one go. I assume you are compile testing the 
i915 part? I so, would you be happy to integrate something like this in 
your patch (adjusted for your changes):

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 465ce94aee76..4dbd61280c93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -348,12 +348,14 @@ struct drm_i915_gem_object {
   */
  #define I915_BO_ALLOC_GPU_ONLY	  BIT(6)
  #define I915_BO_ALLOC_CCS_AUX	  BIT(7)
+#define I915_BO_ALLOC_NOTHP 	  BIT(8)
  /*
   * Object is allowed to retain its initial data and will not be 
cleared on first
   * access if used along with I915_BO_ALLOC_USER. This is mainly to keep
   * preallocated framebuffer data intact while transitioning it to 
i915drmfb.
   */
-#define I915_BO_PREALLOC	  BIT(8)
+#define I915_BO_PREALLOC	  BIT(9)
+
  #define I915_BO_ALLOC_FLAGS (I915_BO_ALLOC_CONTIGUOUS | \
  			     I915_BO_ALLOC_VOLATILE | \
  			     I915_BO_ALLOC_CPU_CLEAR | \
@@ -362,10 +364,12 @@ struct drm_i915_gem_object {
  			     I915_BO_ALLOC_PM_EARLY | \
  			     I915_BO_ALLOC_GPU_ONLY | \
  			     I915_BO_ALLOC_CCS_AUX | \
+			     I915_BO_ALLOC_NOTHP | \
  			     I915_BO_PREALLOC)
-#define I915_BO_READONLY          BIT(9)
-#define I915_TILING_QUIRK_BIT     10 /* unknown swizzling; do not 
release! */
-#define I915_BO_PROTECTED         BIT(11)
+#define I915_BO_READONLY          BIT(10)
+#define I915_TILING_QUIRK_BIT     11 /* unknown swizzling; do not 
release! */
+#define I915_BO_PROTECTED         BIT(12)
+
  	/**
  	 * @mem_flags - Mutable placement-related flags
  	 *
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c 
b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
index 26dda55a07ff..a1e876ce7bb9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
@@ -494,7 +494,8 @@ const struct drm_i915_gem_object_ops 
i915_gem_shmem_ops = {

  static int __create_shmem(struct drm_i915_private *i915,
  			  struct drm_gem_object *obj,
-			  resource_size_t size)
+			  resource_size_t size,
+			  unsigned int flags)
  {
  	unsigned long flags = VM_NORESERVE;
  	struct file *filp;
@@ -515,7 +516,7 @@ static int __create_shmem(struct drm_i915_private *i915,
  	if (BITS_PER_LONG == 64 && size > MAX_LFS_FILESIZE)
  		return -E2BIG;

-	if (i915->mm.gemfs)
+	if (!(flags & I915_BO_ALLOC_NOTHP) && i915->mm.gemfs)
  		filp = shmem_file_setup_with_mnt(i915->mm.gemfs, "i915", size,
  						 flags);
  	else
@@ -548,7 +549,7 @@ static int shmem_object_init(struct 
intel_memory_region *mem,
  	gfp_t mask;
  	int ret;

-	ret = __create_shmem(i915, &obj->base, size);
+	ret = __create_shmem(i915, &obj->base, size, flags);
  	if (ret)
  		return ret;

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c 
b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index bd08605a1611..c296af381007 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1787,7 +1787,8 @@ static int igt_tmpfs_fallback(void *arg)

  	i915->mm.gemfs = NULL;

-	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
+	obj = i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_SMEM],
+					    PAGE_SIZE, 0, I915_BO_ALLOC_NOTHP);
  	if (IS_ERR(obj)) {
  		err = PTR_ERR(obj);
  		goto out_restore;


If it compiles I would take that and will handle any CI fall out.

Regards,

Tvrtko


> Regards,
> 
> Loïc
> 
>> Regards,
>>
>> Tvrtko
>>
>>>       i915_vm_put(vm);
>>>   out:
>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/ 
>>> i915_drv.h
>>> index 95f9ddf22ce4..93a5af3de334 100644
>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>> @@ -141,11 +141,6 @@ struct i915_gem_mm {
>>>        */
>>>       atomic_t free_count;
>>> -    /**
>>> -     * tmpfs instance used for shmem backed objects
>>> -     */
>>> -    struct vfsmount *gemfs;
>>> -
>>>       struct intel_memory_region *regions[INTEL_REGION_UNKNOWN];
>>>       struct notifier_block oom_notifier;
> 

