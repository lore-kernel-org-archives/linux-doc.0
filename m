Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B723385B6
	for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 16:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777046477; cv=none; b=clVnsajGVpTaIyEq+N7hDEonuICLiYhBTi8pEmRZg9F+aepLSHMhRNhWqT0hk2EwLpMGLYW1NquCgy/uZIooBQgfLfstUYnHkX884wJivFe0rvCbUclh0EWO0C/mkkTwLEP6o8PURwYv0odjU86Kc1qCmCPKmHV8imPAaKppXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777046477; c=relaxed/simple;
	bh=wcQlAwHJLxHRjvhjFQuKAKKCgdb/ZvFIVTKDuMjfPIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iNhrJ6bLzOmTeYUIDdT6c7lqXYWgwtDAejb7ICrbv+Vt23nLQ4DuPZ4qz5sc4bDso1Kf3mplb0Xz6KYSg85J3S4sULiXuSedXKLoIPrzAEiI9kEFMBfVV8R3JbRhJtxBlJNdZClLbXHXdoP+gtZreYq50iDncW2wMB6nz7BDOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=px0L+fPi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="px0L+fPi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso55435735e9.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2026 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1777046473; x=1777651273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qARNYk1xmAI7/1amvsRMfp//VfnZGwb0pgC/2wWQOCc=;
        b=px0L+fPipCUUgm8KVCEMKWJU9Vj4+YFIXfFjf2A/EQUvmvedK2mqeHaOTt1Y9qmh67
         A4BDUWg1Rxconvdpq9dVVPr9kcDjaZpLE6djEZJz+njU1qxnQCIV494SZCEdBDA7YXfG
         g/H1/20vHLCeJnVri8iPfsxZ22bs1ab59iH6raqQTEVs3MQUwTQjkaP1HoFUEqL4n+1p
         HLsJ+2k7+GzUNEnCdoo2gQXoqps7Q/ShPH0eF3riiNoDVtldMckGXJueSsKDCUpbOdMx
         rlcM8MJ5wwaNGTU7lUHu//sRIAUXWYUxLHF8yMoa+meviDAqNP4AUelbrvjeoUTpDd3p
         Udxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777046473; x=1777651273;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qARNYk1xmAI7/1amvsRMfp//VfnZGwb0pgC/2wWQOCc=;
        b=somGl1VviyJXZ5X65PrIZ8sGnV/wzd6bzrVeeQchkn9Si5KLp+NMmyosnTBR3RfiZp
         SWZu7jzTlDlVCLOI9WeyqA1b0KV6dlPzu+UAY0bJrdsI/IGxgm8tPKF7gLsABvOzjMmY
         vYnPhdf31W/ikTnoaWBFCGsLyYmb9sybSKJxgxlwk57t/truGIoJvD+lGnneUKYGsQ9d
         2lu99hGBx2Jb9UFECXUrSfao1dMGdlac90L4q815VKXuHU+fX0v+s97HbDHGjdfXFeaY
         f0p5DWgxdbGWQkcmn831OVviQo0iLdDIq0CJkcHe/fM4Lit6YIlkEbJUcSIGVSELKrJy
         B/5A==
X-Forwarded-Encrypted: i=1; AFNElJ8XEQylJJt/y6t5cYDuaW+wdirzdw7WOUcAWVVikFLo8vUD9n5MG4xfYRYL0k5U1IO5MjDexzLPPSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVHMKisjkHSn9sTSsNEQLuSQPlKQqo/gQdGmrfRWBflNooiqf
	aTEnRWP/ziP28OXYNmjI3wrDBP8nV10Ch82jBXryyo5SHuoW2Q33zikqvxLaYBjIOb4=
X-Gm-Gg: AeBDieuqhY3ntekQ62rvHMC4fokLYOUk2MV0R9xYbxN/+tCDfuYbJjL7w0mdtEqN0c1
	MPoLCSpIDm6nA+8wEr6GCTAwtnoRbr2v8mirCOsyJso8+nNgLYztp7kcuPzOLzkOGG7sZ7z8/YV
	4LbPldD+fKNoZQ4mbdvaPvtY6yc9ubJyYdEJ+l8QOXJB4+Fqy8zS33Dzc3B1L5nJ+7ls8gsjET4
	fubJYZHqgXgRtCAXRxWnXdEgX/I6zs1ixPkjCQ3uQQbYmQxS/SfQoc8jAUbZ11/zzzETYOG3eR8
	FX2tPtDkMASFNhUSdlky9g49C5rMui5QIUtiZijDiUk41qYE86HjbB5kCnkvx6xr2Rn7RZXuNSp
	PjjGZCxq38pXCOkGDG+lAMcmoXjKkrUgJupOL0RGhlsTpYj4sgYYzDZRXbMMgNukDQeR1sBbXMZ
	iRdRkx8ZI6lgjNaBnZESGIeSAuYIdCQ9nbc39V9Iapc/DE3JK903lNmXhXxzJMcPDSng==
X-Received: by 2002:a05:600c:c0d6:b0:489:ecee:c4ef with SMTP id 5b1f17b1804b1-489eceec9e3mr227124215e9.13.1777046472224;
        Fri, 24 Apr 2026 09:01:12 -0700 (PDT)
Received: from [192.168.0.101] ([90.240.106.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a525a0b1asm154555995e9.2.2026.04.24.09.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 09:01:11 -0700 (PDT)
Message-ID: <85d22f7e-af44-4a6e-911f-54830c91e339@ursulin.net>
Date: Fri, 24 Apr 2026 17:01:10 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/fdinfo: Add "evicted" memory accounting
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-doc@vger.kernel.org
References: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
 <20260423-panthor-bo-reclaim-observability-v3-1-60af32164a4f@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20260423-panthor-bo-reclaim-observability-v3-1-60af32164a4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/04/2026 13:33, Nicolas Frattaroli wrote:
> Currently, there's no way to know for certain how much GPU memory was
> swapped out. The difference between total and resident memory would
> include newly allocated pages, which are not resident, but also aren't
> swapped out.
> 
> Add a new drm_gem_object_status so drivers can signal when an object has
> been evicted to swap, and add a new "evicted" counter to
> drm_memory_stats.
> 
> Due to how the supported_flags bitmask is determined, the "evicted"
> count won't be printed to fdinfo if there's no swapped out pages.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 6 ++++++
>   drivers/gpu/drm/drm_file.c            | 8 ++++++++
>   include/drm/drm_file.h                | 2 ++
>   include/drm/drm_gem.h                 | 2 ++
>   4 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 24d3012ca7a6..11570976095e 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -200,6 +200,12 @@ One practical example of this could be the presence of unsignaled fences in a
>   GEM buffer reservation object. Therefore, the active category is a subset of the
>   resident category.
>   
> +- drm-evicted-<region>: <uint> [KiB|MiB]
> +
> +The total size of buffers that have been evicted and are currently in swap
> +space. Only present if there are buffers that are currently swapped out, and the
> +driver implements reporting of this type of memory.

Please hold off merging this for a few days, I just noticed it and would 
like to set aside some time next week to think about the semantics, how 
it applies to discrete GPUs where evicted != swapped and some other 
questions.

Regards,

Tvrtko

> +
>   Implementation Details
>   ======================
>   
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index ec820686b302..5078172976c0 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -868,6 +868,7 @@ int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
>   		stats->private == 0 &&
>   		stats->resident == 0 &&
>   		stats->purgeable == 0 &&
> +		stats->evicted == 0 &&
>   		stats->active == 0);
>   }
>   EXPORT_SYMBOL(drm_memory_stats_is_zero);
> @@ -901,6 +902,10 @@ void drm_print_memory_stats(struct drm_printer *p,
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
>   		drm_fdinfo_print_size(p, prefix, "purgeable", region,
>   				      stats->purgeable);
> +
> +	if (supported_status & DRM_GEM_OBJECT_EVICTED)
> +		drm_fdinfo_print_size(p, prefix, "evicted", region,
> +				      stats->evicted);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> @@ -954,6 +959,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>   
>   		if (s & DRM_GEM_OBJECT_PURGEABLE)
>   			status.purgeable += add_size;
> +
> +		if (s & DRM_GEM_OBJECT_EVICTED)
> +			status.evicted += add_size;
>   	}
>   	spin_unlock(&file->table_lock);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 6ee70ad65e1f..213dfecac342 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -500,6 +500,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
>    * @resident: Total size of GEM objects backing pages
>    * @purgeable: Total size of GEM objects that can be purged (resident and not active)
>    * @active: Total size of GEM objects active on one or more engines
> + * @evicted: Total size of GEM objects that have been evicted to swap
>    *
>    * Used by drm_print_memory_stats()
>    */
> @@ -509,6 +510,7 @@ struct drm_memory_stats {
>   	u64 resident;
>   	u64 purgeable;
>   	u64 active;
> +	u64 evicted;
>   };
>   
>   enum drm_gem_object_status;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 86f5846154f7..b42ea2e582cf 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -53,6 +53,7 @@ struct drm_gem_object;
>    * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
>    * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
>    * @DRM_GEM_OBJECT_ACTIVE: object is currently used by an active submission
> + * @DRM_GEM_OBJECT_EVICTED: object is evicted to swap
>    *
>    * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
>    * and drm_show_fdinfo().  Note that an object can report DRM_GEM_OBJECT_PURGEABLE
> @@ -67,6 +68,7 @@ enum drm_gem_object_status {
>   	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>   	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
>   	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
> +	DRM_GEM_OBJECT_EVICTED   = BIT(3),
>   };
>   
>   /**
> 

