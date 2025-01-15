Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253C922F830
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 08:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736928517; cv=none; b=LKnc7Aa4bgQORSm3j4iWI1HZO4JNltp94bHdIsfNvuURKaFLH+VpF1vW1ljVbhgaic+xn94DojzCqilWPYIxsmgK5cyNdC+ppaJypGUyZNdmCJ3VV6DwC+b31xoEpJEMUpYBoup2f3gHEZCBetKmM4XvzUju2iWYFB0fwXrzBws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736928517; c=relaxed/simple;
	bh=FKuuD5eu0mDOAMgJm88pAIaDgVcu13hR66eVnBswqoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrbHMuwFyaHyIt0mV0hkXmrTd+uNzY6orrU6x2YI4W+y1BjyRERg0DoHfcjqCsefLltkThC0d+xOJZFNqOR7tEDgCtVPAPXFtQml4F2ehgW2FWYXBtnmiVJzSvcKUMZdApLpiBHOY95kHmsWsVbck6ztHnDH9vugEv7+uocfMWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=VVub65Q1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="VVub65Q1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso45101835e9.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736928513; x=1737533313; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TKs6VTiYoGGpokppBC12jXWmchUx26icqsF8+IlZzI=;
        b=VVub65Q1BE1bAHQqTEZb7sSikZdJ8bbR0qNH2HoAHh25e9W3FnppXnoz6HA9CAhj00
         hXtuy152tcXD8CwKMXLCIEpbGGxa7t3ukmCPAWyyxVmkjomt+GfDVAV/V0YqktIdnwt7
         Qly4cwWBQKXvgeWu5VHWWZpbVz/wKZk03EJRhfio8thTISHhMuCDN0yhzHkVjhnvbJIi
         nuDR4OL49T0v+qWebtfG8t+oDUtP3GIWj6vVxUulA9xBjI3pRvbjeVuiNkw7yjJ6JBrh
         WxAQ8u0S5kwkAm5LbaIrfpAaqNQQeCswGpPBPPtIGqxsEsjyFnB4bhGzzWiwKl6DhPPv
         sBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736928513; x=1737533313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TKs6VTiYoGGpokppBC12jXWmchUx26icqsF8+IlZzI=;
        b=YxIB3Jjhv/BgIDWesKBkW+L+gdBQwWY4GmIfXMF52ub240x1nnS3+ja928cRMfp9oT
         JnJbnMPWDBFWV2uv1QwCoqG9DETNvcoJm6y9ZeWwPjSH/T13PTojqVHfBklmKIRlzNsJ
         dyBBCJjQExSPz9RsXDHqhE3aGj0COnB9SMgzS8LmL9QEt4C9AFWhAcQZxuaVI7hgo3Uk
         z7FSyZ42XBw6+JRX+4/WD8TKXCQXa+4o8UsJhW8V9R/jGrkhXcOhHiRXhYpLQ+21Hde6
         LqFzqMEHyZvk/qbmLpL7yOXW+KrEwL5IcB5TcyD9xvrVmSlO3PFPCnfRd+Mm3CSGzK0r
         JUXg==
X-Forwarded-Encrypted: i=1; AJvYcCXbgFQVKb8Elbm5b1ErXYbpfhbwR53XrkTVytOuGe+IYdU2X5yPIAVrzRaJtCjZYOWQp2LNiEcEdE8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1DJBrZpV4+Vki6sUOzR/wIHcXq5VyJSrdTKUj9xvuAbqqYBX
	OOT8Ahyt61LYyHSh9q0wKyWjSfAqjvkV1k8pRuFjVFpIBR3p3rFbQXJ5LyS7ITw=
X-Gm-Gg: ASbGncsHh0KtrWMifdYo1y8lDya+AY2TB84Cnd4ZBqPr4ywvuxDbdZ/VBCGaNcTNd5n
	Tv2MwAjKiexlZdIIIQTTh7CXUllD5k6vMlcvOL041dVhoDm1NaK8H6Goa2E/VoM9UQm4kVWyLaM
	K8Ooqi9Q01AubELWlIeR4cvRxG05TyH7gdhP5ZioswHTVfa1uax0PFBXLYYecb5lIGTx16YBL6S
	W5oMxOjoY7rUMKCOiZ1ZpmImGYQTpTNXMa9xM9lHcttuhsnyjYtNCfGlWvCiy78Tgdpl4b+
X-Google-Smtp-Source: AGHT+IGw5gYLx2t/yCDqQg7Q14Y8RhIh6+teFkP1OnWysoAZUxt7UwGTks5/Pp48T2Eg8MlJgQe0JA==
X-Received: by 2002:a05:600c:3b86:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-436e26bde73mr278911525e9.18.1736928513174;
        Wed, 15 Jan 2025 00:08:33 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c5bb5sm14382305e9.22.2025.01.15.00.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 00:08:32 -0800 (PST)
Message-ID: <2c62137a-70d5-421e-ae8d-e3bb7c86d0b2@ursulin.net>
Date: Wed, 15 Jan 2025 08:08:31 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/4] drm/file: Add fdinfo helper for printing regions
 with prefix
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250114173406.3060248-1-adrian.larumbe@collabora.com>
 <20250114173406.3060248-3-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250114173406.3060248-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 14/01/2025 17:34, Adrián Larumbe wrote:
> This is motivated by the desire of some drivers (eg. Panthor) to print the
> size of internal memory regions with a prefix that reflects the driver
> name, as suggested in the previous documentation commit.
> 
> That means adding a new argument to print_size and making it available for
> DRM users.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   drivers/gpu/drm/drm_file.c | 27 +++++++++++++++++++--------
>   include/drm/drm_file.h     |  5 +++++
>   2 files changed, 24 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..f584abcd13cb 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +
> +void drm_fdinfo_print_size(struct drm_printer *p,
> +			   const char *prefix,
> +			   const char *stat,
> +			   const char *region,
> +			   u64 sz)
>   {
>   	const char *units[] = {"", " KiB", " MiB"};
>   	unsigned u;
> @@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const char *stat,
>   		sz = div_u64(sz, SZ_1K);
>   	}
>   
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
> +		   prefix, stat, region, sz, units[u]);
>   }
> +EXPORT_SYMBOL(drm_fdinfo_print_size);
>   
>   /**
>    * drm_print_memory_stats - A helper to print memory stats
> @@ -858,15 +864,20 @@ void drm_print_memory_stats(struct drm_printer *p,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region)
>   {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +	const char *prefix = "drm";
> +
> +	drm_fdinfo_print_size(p, prefix, "total", region,
> +			      stats->private + stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);
> +	drm_fdinfo_print_size(p, prefix, "active", region, stats->active);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		drm_fdinfo_print_size(p, prefix, "resident", region,
> +				      stats->resident);
>   
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		drm_fdinfo_print_size(p, prefix, "purgeable", region,
> +				      stats->purgeable);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..001ae553e8c3 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -494,6 +494,11 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +void drm_fdinfo_print_size(struct drm_printer *p,
> +				  const char *prefix,
> +				  const char *stat,
> +				  const char *region,
> +				  u64 sz);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,

If I can get away with a sneaky:

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko
