Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B9521883C
	for <linux-doc@vger.kernel.org>; Thu,  9 Jan 2025 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736427953; cv=none; b=WsDLH2l4qy1hm/A6hl+3EdZrFximOtMgn6gxQB+9dGRRO5GvB+2WDgg0hO5PvrDer0BZabE1e5v6h3hPMVm6tMA332aeBFEo4YOHFbkBwS8mtFNfCocTg57PoXcdCzYbvfYxMoMp2An0RLWPtfjMTO0Ey3XsCITJuFXl63YRu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736427953; c=relaxed/simple;
	bh=LgIulNb4/rcrCUHIr2AAjBU0qHVjN0qbB8NevRuFDlA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DmkoOebqz3XC+E6UR6xl2yCqMuI6+pk2wJcP9j1+KVtbQUuBh7eNFBQ5WB3kZjE8AVc70kf2dljjaJZV3QNYGxLNkwqVmkIInmF6yIawoULH72lsVhkaLT/T4X0/BNpYyFYZlJELHJTotsbJzVho9iro/G+h3nlrdHI7Eaiy3LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=UzqOIajc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="UzqOIajc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4362f61757fso9374485e9.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jan 2025 05:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1736427950; x=1737032750; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZntOPOaaA1KTWghoiY1A0OP9ir37MoWCNX6fFHP2fJE=;
        b=UzqOIajcASXQ2sQ4vQv0be8T9WI4pUvCeLerpgNYMZC8Bk4388Da19H3HebR7A5tUd
         92XrMNxZgGsF2vm6XayyUNZ7lL/M+TPClePcKc4/1QDgvfN3osDcxaBQojXa3djXO+O1
         7R86cG/5nniE3ed3d3WPNKjACqeu0aopSOtwdfD9NX2Qg8JxSO2qLXpEkH0ST2Y7m/QQ
         mKjgDMf3ezcjJ9D4TQ3Vx98w0WGjYQK+X97Y6ucgQ3tTKgE9OXLoFqpowYvA5A+MRz+I
         67ds9Zu8bDRQiwfUl4PUGcqgiOHt1bIZlJ6K13XK7DiRUzsoLzs9iAFGeWUhW0GBn1vU
         cO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736427950; x=1737032750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZntOPOaaA1KTWghoiY1A0OP9ir37MoWCNX6fFHP2fJE=;
        b=XHB4t3rjsncYCMftS+gV8sKfMmdNacBYJqtKY0ZwMj9rYhsJN8UUJPLPfvNDpf81GS
         RHEorTgdHRuFidweyqwCkRoj0ELbgxFMul1XOrlzfvJWL0wwyDQfXMzcJ+exnEGeKjR/
         k1MgqT1WGxzRkN0Fq4X8ID6SfWd8NES3hd4VCzQjkGIY9vUczIZXfYkh7vVz5e+1QYsR
         FzpRWpwgg3YoIlJG0BbP/BznS2DRRFaoVKf/qgQGPYhFUmqOjih7yrfWjDNMgRHLdQ0X
         aB6qhS/cj5LRH2ueyj6mQr0Wi22/Myo4f+q0fnwQ1xsAytkLKYEXahLypfGGxkVWXzzc
         awUA==
X-Forwarded-Encrypted: i=1; AJvYcCVdoQSFbsMsLkz5G2YkeT6PLu6RyTxtRHhSHUQqXNm1+KyFdtBn7uKJfPsrz08cbwfqOqzrTsAenb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPrJf+K6hA36R6qK+C/nS+lGcDygp0Nq6cKSP4g2F/T64icAfm
	JlwAaaSld163BHeDDMteOpECWcDe+38huMegZNtRPHtQNNYL/pUq6QjdXLG5sIY=
X-Gm-Gg: ASbGncvwac2FKRRrqu1/gEwW9uC+b+kxjHhLzevcvw0MBL/sKc0Y715aWdBfAwG1sny
	+JVTdzGPKNV/PbnzZE6BB2qx48uPNDrXdf9nc6jvIynyXjFyt/9DXsaaE2tvtCuhdb8oVUJehNS
	q4ervS8Nsbe16Zx8XLob2uDf5yunQNUFVSgUNc6VB8bLnO+qHKs7tHTPN9nOlqKqrqc00GLKrmg
	ROOsN3FAN7mIzHDXs81pU0hf82PPQJGBFH4+B0dRWs/eyNrVOoCprvOmBc4Chsd3L8XbVfi
X-Google-Smtp-Source: AGHT+IHrwtN9KtgRMUgEzUWhO2m+63o2vxrZXrrRFUfcS7sI0MePb+8cRfgT1OcYLJ37G0Xk6QCsXg==
X-Received: by 2002:a05:600c:1c88:b0:431:93d8:e1a1 with SMTP id 5b1f17b1804b1-436e271d10fmr54201305e9.27.1736427949789;
        Thu, 09 Jan 2025 05:05:49 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b81e4sm1807182f8f.64.2025.01.09.05.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:05:49 -0800 (PST)
Message-ID: <a4775792-f193-4694-82c2-c5c4c13e3cea@ursulin.net>
Date: Thu, 9 Jan 2025 13:05:48 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] drm/file: Add driver-specific memory region key
 printing helper
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
 <20250108210259.647030-3-adrian.larumbe@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250108210259.647030-3-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 08/01/2025 21:02, Adrián Larumbe wrote:
> This is motivated by the desire of some dirvers (eg. Panthor) to print the
> size of internal memory regions with a prefix that reflects the driver
> name, as suggested in the previous documentation commit.
> 
> That means a minor refactoring of print_size() was needed so as to make it
> more generic in the format of key strings it takes as input.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> ---
>   drivers/gpu/drm/drm_file.c | 60 +++++++++++++++++++++++++++++++++-----
>   include/drm/drm_file.h     |  2 ++
>   2 files changed, 54 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..5deae4cffa79 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -830,8 +830,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>   }
>   EXPORT_SYMBOL(drm_send_event);
>   
> -static void print_size(struct drm_printer *p, const char *stat,
> -		       const char *region, u64 sz)
> +static void print_size(struct drm_printer *p, const char *key, u64 sz)
>   {
>   	const char *units[] = {"", " KiB", " MiB"};
>   	unsigned u;
> @@ -842,9 +841,54 @@ static void print_size(struct drm_printer *p, const char *stat,
>   		sz = div_u64(sz, SZ_1K);
>   	}
>   
> -	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
> +	drm_printf(p, "%s:\t%llu%s\n", key, sz, units[u]);
>   }
>   
> +#define KEY_LEN 1024
> +#define DRM_PREFIX "drm"
> +
> +static void
> +print_size_region(struct drm_printer *p, const char *stat,
> +		  const char *region, u64 sz)
> +{
> +	char key[KEY_LEN+1] = {0};

A kilobyte of stack makes me a bit uneasy.

Would it not work to make print_size take a prefix and also avoid string 
operations? Something like, not compile tested:

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 2289e71e2fa2..efa4593babbc 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,12 @@ void drm_send_event(struct drm_device *dev, struct 
drm_pending_event *e)
  }
  EXPORT_SYMBOL(drm_send_event);

-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+static void
+drm_fdinfo_print_size(struct drm_printer *p,
+		      const char *prefix,
+		      const char *stat,
+		      const char *region,
+		      u64 sz)
  {
  	const char *units[] = {"", " KiB", " MiB"};
  	unsigned u;
@@ -842,8 +846,10 @@ static void print_size(struct drm_printer *p, const 
char *stat,
  		sz = div_u64(sz, SZ_1K);
  	}

-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s-%s-%s:\t%llu%s\n",
+		   prefix, stat, region, sz, units[u]);
  }
+EXPORT_SYMBOL(drm_fdinfo_print_size);

  int drm_memory_stats_is_zero(const struct drm_memory_stats *stats)
  {
@@ -868,17 +874,23 @@ void drm_print_memory_stats(struct drm_printer *p,
  			    enum drm_gem_object_status supported_status,
  			    const char *region)
  {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
+	const char *prefix = "drm";
+
+	drm_fdinfo_print_size(p, prefix, "total", region,
+			      stats->private + stats->shared);
+	drm_fdinfo_print_size(p, prefix, "shared", region, stats->shared);

  	if (supported_status & DRM_GEM_OBJECT_ACTIVE)
-		print_size(p, "active", region, stats->active);
+		drm_fdinfo_print_size(p, prefix, "active", region,
+				      stats->active);

  	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		drm_fdinfo_print_size(p, prefix, "resident", region,
+				      stats->resident);

  	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		drm_fdinfo_print_size(p, prefix, "purgeable", region,
+				      stats->purgeable);
  }
  EXPORT_SYMBOL(drm_print_memory_stats);

?

Regards,

Tvrtko

> +
> +	if (strnlen(stat, KEY_LEN) + strnlen(region, KEY_LEN) +
> +	    strlen(DRM_PREFIX) + 2 > KEY_LEN)
> +		return;
> +
> +	snprintf(key, sizeof(key), "%s-%s-%s", DRM_PREFIX, stat, region);
> +	print_size(p, key, sz);
> +}
> +
> +/**
> + * drm_driver_print_size - A helper to print driver-specific k:v pairs
> + * @p: The printer to print output to
> + * @file: DRM file private data
> + * @subkey: Name of the key minus the driver name
> + * @sz: Size value expressed in bytes
> + *
> + * Helper to display key:value pairs where the value is a numerical
> + * size expressed in bytes. It's useful for driver-internal memory
> + * whose objects aren't exposed to UM through a DRM handle.
> + */
> +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> +			   const char *subkey, u64 sz)
> +{
> +	char key[KEY_LEN+1] = {0};
> +	char *drv_name = file->minor->dev->driver->name;
> +
> +	if (strnlen(subkey, KEY_LEN) + strlen(drv_name) + 1 > KEY_LEN)
> +		return;
> +
> +	snprintf(key, sizeof(key), "%s-%s", drv_name, subkey);
> +	print_size(p, key, sz);
> +}
> +EXPORT_SYMBOL(drm_driver_print_size);
> +
> +#undef DRM_PREFIX
> +#undef KEY_LEN
> +
>   /**
>    * drm_print_memory_stats - A helper to print memory stats
>    * @p: The printer to print output to
> @@ -858,15 +902,15 @@ void drm_print_memory_stats(struct drm_printer *p,
>   			    enum drm_gem_object_status supported_status,
>   			    const char *region)
>   {
> -	print_size(p, "total", region, stats->private + stats->shared);
> -	print_size(p, "shared", region, stats->shared);
> -	print_size(p, "active", region, stats->active);
> +	print_size_region(p, "total", region, stats->private + stats->shared);
> +	print_size_region(p, "shared", region, stats->shared);
> +	print_size_region(p, "active", region, stats->active);
>   
>   	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
> -		print_size(p, "resident", region, stats->resident);
> +		print_size_region(p, "resident", region, stats->resident);
>   
>   	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
> -		print_size(p, "purgeable", region, stats->purgeable);
> +		print_size_region(p, "purgeable", region, stats->purgeable);
>   }
>   EXPORT_SYMBOL(drm_print_memory_stats);
>   
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..07da14859289 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -494,6 +494,8 @@ struct drm_memory_stats {
>   
>   enum drm_gem_object_status;
>   
> +void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
> +			   const char *subkey, u64 sz);
>   void drm_print_memory_stats(struct drm_printer *p,
>   			    const struct drm_memory_stats *stats,
>   			    enum drm_gem_object_status supported_status,
