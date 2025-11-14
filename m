Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6FC2D662D;
	Fri, 14 Nov 2025 17:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140892; cv=none; b=eTPtk4qPLbqHy+hMJ/QZg64jPgrdCku9sDYNFB2lLECdyuQ/hhmnKGVpQYaEcdhs5ax2rBZAYeGK/2uuTGYI942CX6BU6vA+ZfMo9QQB9YmdCJvAjxE36DPbuHM58mwN3alurmuahuXfI0+vEGmm3HkhUZYNjiJ1E71foo/PcVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140892; c=relaxed/simple;
	bh=oj7XvIjYe1pE+bYy9IlB8i4bQFjMilLPQjx7YB4+1fA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gd92FIpKwPFC05ReQ5zuoscBvpND+y0TmTj4batJBcZYdXjtd4y/bXUSCXZr8xhZf5lPysy2WCPEub7xC57UMZ9NpjATcXum9vTGci/1CoYERSJL4jcTJRcQ2DXM24TE+Qx+Fo8gpLuaclV7kk4nUn5ZqV459MSW+mg5DdsErfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=aZEWjh2W; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aZEWjh2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763140888;
	bh=oj7XvIjYe1pE+bYy9IlB8i4bQFjMilLPQjx7YB4+1fA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aZEWjh2Wv997fvjzfjYyiNTQsFctnvqof5bgUkdK3o3MvxxU3L95EO36ZFtvaekJS
	 bZAOmQW3lf4woB4mnn3aD5fFsnOqaiwBr6Unx6D28n/OhmaUMcto0pQ09uGJFMv32Q
	 THqCeF0gelYBNeFeiWVOPdzmBRhLCKoGCqx90SlnQw4cIoeNxTu3IEmqa7QDlKImSY
	 AYkUwTK58gic2wO1WcZDsdSqxvedDR/kGjwS6x3W8gdDro4c+P5vsMEAtppXec2FjI
	 QazQ6Ew3Qv4PS3ZhA2FcGOa8jYwJWTS2znHOiR3JtY/3AXrMIoI9xYNIna7rXnbfkb
	 13A8uW35xzEEA==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: loicmolinari)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59A9117E01EB;
	Fri, 14 Nov 2025 18:21:27 +0100 (CET)
Message-ID: <95ce7e6d-a2f3-4dff-adaf-22455f78a836@collabora.com>
Date: Fri, 14 Nov 2025 18:21:17 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/11] drm/v3d: Use huge tmpfs mountpoint helpers
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Andrew Morton <akpm@linux-foundation.org>, Al Viro
 <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251114170303.2800-1-loic.molinari@collabora.com>
 <20251114170303.2800-7-loic.molinari@collabora.com>
 <20251114181144.51b44c8b@fedora>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <20251114181144.51b44c8b@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/2025 18:11, Boris Brezillon wrote:
> On Fri, 14 Nov 2025 18:02:57 +0100
> Loïc Molinari <loic.molinari@collabora.com> wrote:
> 
>> Make use of the new drm_gem_huge_mnt_create() and
>> drm_gem_get_huge_mnt() helpers to avoid code duplication. Now that
>> it's just a few lines long, the single function in v3d_gemfs.c is
>> moved into v3d_gem.c.
>>
>> v3:
>> - use huge tmpfs mountpoint in drm_device
>> - move v3d_gemfs.c into v3d_gem.c
>>
>> v4:
>> - clean up mountpoint creation error handling
>>
>> v5:
>> - fix CONFIG_TRANSPARENT_HUGEPAGE check
>> - use drm_gem_has_huge_mnt() helper
>>
>> v8:
>> - don't access huge_mnt field with CONFIG_TRANSPARENT_HUGEPAGE=n
>>
>> v9:
>> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
>>
>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>> ---
>>   drivers/gpu/drm/v3d/Makefile    |  3 +-
>>   drivers/gpu/drm/v3d/v3d_bo.c    |  9 +++--
>>   drivers/gpu/drm/v3d/v3d_drv.c   |  2 +-
>>   drivers/gpu/drm/v3d/v3d_drv.h   | 11 +-----
>>   drivers/gpu/drm/v3d/v3d_gem.c   | 27 ++++++++++++--
>>   drivers/gpu/drm/v3d/v3d_gemfs.c | 62 ---------------------------------
>>   6 files changed, 34 insertions(+), 80 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
>>
>> diff --git a/drivers/gpu/drm/v3d/Makefile b/drivers/gpu/drm/v3d/Makefile
>> index fcf710926057..b7d673f1153b 100644
>> --- a/drivers/gpu/drm/v3d/Makefile
>> +++ b/drivers/gpu/drm/v3d/Makefile
>> @@ -13,8 +13,7 @@ v3d-y := \
>>   	v3d_trace_points.o \
>>   	v3d_sched.o \
>>   	v3d_sysfs.o \
>> -	v3d_submit.o \
>> -	v3d_gemfs.o
>> +	v3d_submit.o
>>   
>>   v3d-$(CONFIG_DEBUG_FS) += v3d_debugfs.o
>>   
>> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
>> index d9547f5117b9..211578abf9b6 100644
>> --- a/drivers/gpu/drm/v3d/v3d_bo.c
>> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
>> @@ -114,7 +114,7 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
>>   	if (IS_ERR(sgt))
>>   		return PTR_ERR(sgt);
>>   
>> -	if (!v3d->gemfs)
>> +	if (!drm_gem_get_huge_mnt(obj->dev))
>>   		align = SZ_4K;
>>   	else if (obj->size >= SZ_1M)
>>   		align = SZ_1M;
>> @@ -150,12 +150,15 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file *file_priv,
>>   			     size_t unaligned_size)
>>   {
>>   	struct drm_gem_shmem_object *shmem_obj;
>> -	struct v3d_dev *v3d = to_v3d_dev(dev);
>>   	struct v3d_bo *bo;
>>   	int ret;
>>   
>> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>   	shmem_obj = drm_gem_shmem_create_with_mnt(dev, unaligned_size,
>> -						  v3d->gemfs);
>> +						  dev->huge_mnt);
>> +#else
>> +	shmem_obj = drm_gem_shmem_create(dev, unaligned_size);
>> +#endif
> 
> Why not drop the ifdef and go for
> 
> 	shmem_obj = drm_gem_shmem_create_with_mnt(dev,
> 						  unaligned_size,
> 						  drm_gem_get_huge_mnt(obj->dev));
> 
> ?

Oops, I overlooked that one.

> 
>>   	if (IS_ERR(shmem_obj))
>>   		return ERR_CAST(shmem_obj);
>>   	bo = to_v3d_bo(&shmem_obj->base);

