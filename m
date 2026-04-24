Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECA22F745E;
	Fri, 24 Apr 2026 15:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043963; cv=none; b=LwK/yHLoNLSFOV2hTSzcvj3vQsy4BF8bBr/GqEEAC4A+jifwU7Zdtm67/AVTW2KSxBZjK64SguzUn49dFkLmwqUD5gluEZyG9g3kWp1Cn2RtwM/8C5UIiCqzYm6KsV1pocabSnKePT77gK8iNCnFE630GNt0I8pa7hdQua482ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043963; c=relaxed/simple;
	bh=1U+D2/ulLO2m9XxDYsxI4AkPmZKaPsYWbcs7Lwd6+Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlzPIw6hQ/rm+uHffrPRfIVrWENg/oTNif5q4quxPzbEUy+YuR3Vm/dKItqCclIHNMlmCuGgmejLtJ/BbU61hWmjZ1ptevtx1oBadV3s9lrGEPaKyvJlLHOGy8TLYFxxajtwxTCrG+a/ZHiuyUhjS1T9AWQJJzCmBwnc/BEfvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=i7+g2NFX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="i7+g2NFX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15603358C;
	Fri, 24 Apr 2026 08:19:10 -0700 (PDT)
Received: from [10.1.26.15] (e122027.cambridge.arm.com [10.1.26.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4846A3F7B4;
	Fri, 24 Apr 2026 08:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777043955; bh=1U+D2/ulLO2m9XxDYsxI4AkPmZKaPsYWbcs7Lwd6+Zs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i7+g2NFX3JBVEAd2hYmH8Pg2H00qOdLa0dlMbqYrH00XqFyg1lye2mPIpNm0OD1s4
	 x0rWamnF+6uUSEsdhM1MU+l/3+QtCgt0A3Aur1QeWJHm/2G8sOHMGaBr9CPldZvZUb
	 W4bsMW/y6YPzoG3Ap5UmSz8Ecsr9LEaoGtCGd3mM=
Message-ID: <171ced70-8c59-4c34-92f4-f103ccf5e973@arm.com>
Date: Fri, 24 Apr 2026 16:19:07 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/panthor: Reduce padding in gems debugfs for
 refcount
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-doc@vger.kernel.org
References: <20260423-panthor-bo-reclaim-observability-v3-0-60af32164a4f@collabora.com>
 <20260423-panthor-bo-reclaim-observability-v3-3-60af32164a4f@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260423-panthor-bo-reclaim-observability-v3-3-60af32164a4f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2026 13:33, Nicolas Frattaroli wrote:
> The "gems" debugfs file is getting a little too wide for comfort. While
> a lot of this is unavoidable due to the theoretical upper limits of
> numbers here (e.g. size needs to be 16 chars because 2**48-1 in decimal
> is 15 digits, plus one space for separation), the refcount column has a
> decent 5 characters to be saved, as it can only ever contain a 10-digit
> decimal number.
> 
> Reduce the refcount column's width to 11, which fulfils this requirement
> with an additional space for separation.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
> index b6fe20b7e6d0..462a9d2ce319 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -1644,7 +1644,7 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
>  
>  	snprintf(creator_info, sizeof(creator_info),
>  		 "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.creator.tgid);
> -	seq_printf(m, "%-32s%-16d%-16d%-11d%-16zd%-16zd0x%-16lx",
> +	seq_printf(m, "%-32s%-16d%-11d%-11d%-16zd%-16zd0x%-16lx",
>  		   creator_info,
>  		   bo->base.name,
>  		   refcount,
> @@ -1681,8 +1681,8 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>  
>  	panthor_gem_debugfs_print_flag_names(m);
>  
> -	seq_puts(m, "created-by                      global-name     refcount        evictions  size            resident-size   file-offset       state      usage       label\n");
> -	seq_puts(m, "---------------------------------------------------------------------------------------------------------------------------------------------------------\n");
> +	seq_puts(m, "created-by                      global-name     refcount   evictions  size            resident-size   file-offset       state      usage       label\n");
> +	seq_puts(m, "----------------------------------------------------------------------------------------------------------------------------------------------------\n");
>  
>  	scoped_guard(mutex, &ptdev->gems.lock) {
>  		list_for_each_entry(bo, &ptdev->gems.node, debugfs.node) {
> @@ -1690,7 +1690,7 @@ static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
>  		}
>  	}
>  
> -	seq_puts(m, "=========================================================================================================================================================\n");
> +	seq_puts(m, "====================================================================================================================================================\n");
>  	seq_printf(m, "Total size: %zd, Total resident: %zd, Total reclaimable: %zd\n",
>  		   totals.size, totals.resident, totals.reclaimable);
>  }
> 

