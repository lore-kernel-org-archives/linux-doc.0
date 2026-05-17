Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2473C13EC;
	Sun, 17 May 2026 17:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039047; cv=none; b=qEl+M6KknM4yOtGXBi/WvksqTZsC1VzY/9mHbir4RYV5eD+hJrKRAJVbqePAK5cMgCEeVJcdVYnKyVxu0S6CmSJs53zWvTikHvhUyjIy1G4xbCRo59y3lMq0CzgH6lWRJvzqf3cAaQBsgoI3GRw7jpS60Ndi9gmk+yEihKU6WIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039047; c=relaxed/simple;
	bh=DRSfUrqAJXJbVTIdqxweCtFIaNZnQGpoE7tqg4FrNO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLKRjgXeKIIgfPTnVGyTyhvSbfDyxwnKdYNY1nwLf3QH0wnKH0kvKWhDck8xfJCuO7tTuai9EvTnd2hsZ/X6vLMfwju2VHfiOfYEwxhbPvhJtNdePTsr+xYeZDQmK8D9RzDtDalJiSSlZ0UPFQRWO+7JJiHIqdwnCDXpJP6H5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=4ELVILYo; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="4ELVILYo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=do72l8TBC+8Jj9AHwbmpNhWmI6qpXHRcwH0HVceqiQo=; b=4ELVILYolYp0dDoclVtxjrfzkh
	y2JUBaVKoaZYEVtU36+OkI7tKqClQn4ulgJXL4ktpUYIbCXpl9IW0LHJJQdBrkMpstxRI+zdtU1X6
	uxRNR4o7ojvxY207YOSWtAtnga1cecOBw0CT2/86aBM8Zi6DTyG0QTe9kcpmec8F63dRX/QkXN5/C
	V+1QJNa6erJI/CMMX51LevHoVweaRCEllmt9SVZcbE5lRAxBJBX5cjnm4C3TgDXOKSIMr5fr6tt5e
	3QmDRkhCdpToyPh3sHhgTLy7NlFM55AUPv456ueGgcUeCREyxsy182VDEjoR6HpuK/8YDFlLSVz20
	XknKmy/Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOeSk-0000000D28F-3YTd;
	Sun, 17 May 2026 16:35:34 +0000
Message-ID: <9cee25bf-c2ec-4e1c-9c21-bfe043dc6720@infradead.org>
Date: Sun, 17 May 2026 09:35:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: gpu: fix spelling errors and remove duplicate
 sentence
To: Elliot Tester <elliotctester1@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net
Cc: skhan@linuxfoundation.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260517134122.38389-1-elliotctester1@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260517134122.38389-1-elliotctester1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/17/26 6:41 AM, Elliot Tester wrote:
> Fix various spelling errors in GPU docs:
> - indicies -> indices (userq.rst)
> - umap -> unmap (userq.rst)
> - pre-empt -> preempt (drm-compute.rst)
> - buffer-leaks -> buffer leaks (drm-uapi.rst)
> - Additionally to -> In addition to (drm-uapi.rst)
> - unpriviledged -> unprivileged (drm-uapi.rst)
> - fucntions -> functions (todo.rst)
> - varios -> various (todo.rst)
> - implementions -> implementations (todo.rst)
> - complection -> completion (todo.rst)
> 
> Ale remove a duplicated sentance and stray "uff." in the todo.rst, add
> missing period after drm_ioctl.c reference, and add missing newline at
> end of drm-uapi.rst. Fixing this would make reading the docs just a
> little bit easier.
> 
> Signed-off-by: Elliot Tester <elliotctester1@gmail.com>

LGTM. Thanks.
Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/gpu/amdgpu/userq.rst |  4 ++--
>  Documentation/gpu/drm-compute.rst  |  2 +-
>  Documentation/gpu/drm-uapi.rst     | 10 +++++-----
>  Documentation/gpu/todo.rst         | 11 +++++------
>  4 files changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/gpu/amdgpu/userq.rst b/Documentation/gpu/amdgpu/userq.rst
> index 88f54393b..94427e18a 100644
> --- a/Documentation/gpu/amdgpu/userq.rst
> +++ b/Documentation/gpu/amdgpu/userq.rst
> @@ -156,9 +156,9 @@ IOCTL Interfaces
>  GPU virtual addresses used for queues and related data (rptrs, wptrs, context
>  save areas, etc.) should be validated by the kernel mode driver to prevent the
>  user from specifying invalid GPU virtual addresses.  If the user provides
> -invalid GPU virtual addresses or doorbell indicies, the IOCTL should return an
> +invalid GPU virtual addresses or doorbell indices, the IOCTL should return an
>  error message.  These buffers should also be tracked in the kernel driver so
> -that if the user attempts to unmap the buffer(s) from the GPUVM, the umap call
> +that if the user attempts to unmap the buffer(s) from the GPUVM, the unmap call
>  would return an error.
>  
>  INFO
> diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/drm-compute.rst
> index f90c3e63a..35cc8d654 100644
> --- a/Documentation/gpu/drm-compute.rst
> +++ b/Documentation/gpu/drm-compute.rst
> @@ -7,7 +7,7 @@ seconds. (The time let the user wait before he reaches for the power button).
>  This means that other techniques need to be used to manage those workloads,
>  that cannot use fences.
>  
> -Some hardware may schedule compute jobs, and have no way to pre-empt them, or
> +Some hardware may schedule compute jobs, and have no way to preempt them, or
>  have their memory swapped out from them. Or they simply want their workload
>  not to be preempted or swapped out at all.
>  
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 579e87cb9..0ef498bff 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -150,10 +150,10 @@ separate render node called renderD<num>. There will be one render node
>  per device. No ioctls except PRIME-related ioctls will be allowed on
>  this node. Especially GEM_OPEN will be explicitly prohibited. For a
>  complete list of driver-independent ioctls that can be used on render
> -nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c  Render
> -nodes are designed to avoid the buffer-leaks, which occur if clients
> +nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c.  Render
> +nodes are designed to avoid the buffer leaks, which occur if clients
>  guess the flink names or mmap offsets on the legacy interface.
> -Additionally to this basic interface, drivers must mark their
> +In addition to this basic interface, drivers must mark their
>  driver-dependent render-only ioctls as DRM_RENDER_ALLOW so render
>  clients can use them. Driver authors must be careful not to allow any
>  privileged ioctls on render nodes.
> @@ -568,7 +568,7 @@ ENOSPC:
>  EPERM/EACCES:
>          Returned for an operation that is valid, but needs more privileges.
>          E.g. root-only or much more common, DRM master-only operations return
> -        this when called by unpriviledged clients. There's no clear
> +        this when called by unprivileged clients. There's no clear
>          difference between EACCES and EPERM.
>  
>  ENODEV:
> @@ -761,4 +761,4 @@ Stable uAPI events
>  From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>  
>  .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index bc9f14c8a..b13cd4347 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -55,7 +55,7 @@ There are still drivers that use drm_simple_display_pipe. The task here is to
>  convert them to use regular atomic helpers. Search for a driver that calls
>  drm_simple_display_pipe_init() and inline all helpers from drm_simple_kms_helper.c
>  into the driver, such that no simple-KMS interfaces are required. Please also
> -rename all inlined fucntions according to driver conventions.
> +rename all inlined functions according to driver conventions.
>  
>  Contact: Thomas Zimmermann, respective driver maintainer
>  
> @@ -301,7 +301,7 @@ Various hold-ups:
>    valid formats for atomic drivers.
>  
>  - Many drivers subclass drm_framebuffer, we'd need a embedding compatible
> -  version of the varios drm_gem_fb_create functions. Maybe called
> +  version of the various drm_gem_fb_create functions. Maybe called
>    drm_gem_fb_create/_with_dirty/_with_funcs as needed.
>  
>  Contact: Simona Vetter
> @@ -326,10 +326,9 @@ everything after it has done the write-protect/mkwrite trickery:
>  
>        vma->vm_page_prot = pgprot_wrprotect(vma->vm_page_prot);
>  
> -- Set the mkwrite and fsync callbacks with similar implementions to the core
> +- Set the mkwrite and fsync callbacks with similar implementations to the core
>    fbdev defio stuff. These should all work on plain ptes, they don't actually
> -  require a struct page.  uff. These should all work on plain ptes, they don't
> -  actually require a struct page.
> +  require a struct page.
>  
>  - Track the dirty pages in a separate structure (bitfield with one bit per page
>    should work) to avoid clobbering struct page.
> @@ -914,7 +913,7 @@ Querying errors from drm_syncobj
>  ================================
>  
>  The drm_syncobj container can be used by driver independent code to signal
> -complection of submission.
> +completion of submission.
>  
>  One minor feature still missing is a generic DRM IOCTL to query the error
>  status of binary and timeline drm_syncobj.

-- 
~Randy
