Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FE9DF58;
	Fri, 24 Jan 2025 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737735534; cv=none; b=Ys0kA/rlKuyUcI0Ha41Fv8W0YHY9rMe/mCcDR+ekkuXEO1xlxxnkMThGfwI5fnX+JEVcKafIqZLurVbbeilnIQBAOREgVuVk06pm4/tCxqBDxZ1hY5WfM1scmKk6K76zIBxZkRMpJvd8aSpAk/Mk7yj24f6alT+sV3fzD80VJe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737735534; c=relaxed/simple;
	bh=YlDv5z6sXTSSo3haBSMsexqgJ2UkKypFea/LOdIEHEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILLBwoLUfyYnySFDankWWedIjYAAutzJ2mXrPM5xCDRYRqMgy7oRthOF/JZLHIUDa65lvpGT4QCU42vBb3WKn1Ecm3hnnvTUO4qscvZllMYddYlStcqJslIqVAl/rhr/TJMjjQ+9BBxq2xWVcwKO0KZA4wYnV2YJJzapm4lQ13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFC38497;
	Fri, 24 Jan 2025 08:19:18 -0800 (PST)
Received: from [10.1.29.18] (e122027.cambridge.arm.com [10.1.29.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5EDF3F5A1;
	Fri, 24 Jan 2025 08:18:47 -0800 (PST)
Message-ID: <2500738a-5251-4f30-b36a-44dbfcaf0a84@arm.com>
Date: Fri, 24 Jan 2025 16:18:45 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/5] drm/panthor: Fix race condition when gathering
 fdinfo group samples
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel@collabora.com, Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
 <20250123225325.3271764-6-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250123225325.3271764-6-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/01/2025 22:53, Adrián Larumbe wrote:
> Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
> protect access to groups with an xarray lock, which could lead to
> use-after-free errors.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index e6c08a694e41..1d283b4bab86 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  	if (IS_ERR_OR_NULL(gpool))
>  		return;
>  
> +	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
>  		mutex_lock(&group->fdinfo.lock);
>  		pfile->stats.cycles += group->fdinfo.data.cycles;
> @@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
>  		group->fdinfo.data.time = 0;
>  		mutex_unlock(&group->fdinfo.lock);
>  	}
> +	xa_unlock(&gpool->xa);
>  }
>  
>  static void group_sync_upd_work(struct work_struct *work)

