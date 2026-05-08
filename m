Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC670CA45
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265427; cv=none; b=QhdgSDJusYjAiSplC+uTw0Xomb8QB3HMdYsT3iaWfkCBB/GIZMm6uRfyC9AitmIpqwad9RteOok+qUzN13yOJyZ66nQk9n/2kXAlLE31BLgQDFJ0P3aOXNQYPMpAoTyJylH35HSmuNJcLJClqoP/0ES2XtqP1s0KVSUM143aDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265427; c=relaxed/simple;
	bh=uK/t8rJKfl1sW/Mi9DsuGH+vFFO9Dx3ZgCKOLKMCbrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lnoAuGLTG5iEQBm5j4HjSt+jtMz4/v6QiL79iWcHAlxhmiVL1Kjk/WQT7o7j3BDCcAFopHfnZ97VBvq2KOPLb8iB7Tm4DiYqxAxvOZVRF4kJKtwJymfQTK0ln1SVhcJ/XpZJiorFz5zxsFxnLLAlK6swWWCc16nYwONbDDWqwb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=raj8EE4G; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="raj8EE4G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=/SZjVUigG8/+NGN867hqbUyea+K3r06olxCwvt8Rf3g=; b=raj8EE4G/VuMuOXNgFjpqXu9U3
	m3+oWuy4mtMjmI75W/UCfBDcl4v52lwQCXqAPSRe22o84Ux1DEXT5g5On1QY/+bWugB/i758n9f19
	usazwOWzhlaNmXsGXzJRCHKlEVsJ8SrX4rloheFGfYN3qXMa9DRyoZaST5w4XsMud2d87cm0bMqYT
	Rzb3JCGN2ChlRaxH77DkV2kBRyS7dPtugHEazG6SndIu7PEXNu8MqjOsxwkmmqraGKAEN+aM+ctEl
	WiAm9ZHoFM6X96DZOB0j255eYgkd7cva1JEvq/1C+gZa7NDBGdnutP25NAmAWA9K2YDzFilszT30n
	/B0ag6bg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLQ4P-00000007H44-02fE;
	Fri, 08 May 2026 18:37:05 +0000
Message-ID: <37ceed4e-f226-4458-a4d0-69c4758c716e@infradead.org>
Date: Fri, 8 May 2026 11:37:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] Documentation/gpu: add some tables of contents to
 large documents
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
References: <cover.1778238671.git.jani.nikula@intel.com>
 <e3f9357c0e8198cc48e69e2a3b8ca072c7ab92ca.1778238671.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <e3f9357c0e8198cc48e69e2a3b8ca072c7ab92ca.1778238671.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/8/26 4:12 AM, Jani Nikula wrote:
> Some of the GPU documentation pages are quite long, with various levels
> of details. Add document internal tables of contents to the larger
> documents to make them easier to navigate.
> 
> The index.rst in the sub-directories have toctrees, which provide
> similar overviews.
> 
> Fix one missing newline at the end of drm-uapi.rst while at it,
> primarily because rst should have it, and secondarily because my editor
> rst mode refuses to save the file without it.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/gpu/driver-uapi.rst     | 2 ++
>  Documentation/gpu/drm-internals.rst   | 2 ++
>  Documentation/gpu/drm-kms-helpers.rst | 2 ++
>  Documentation/gpu/drm-kms.rst         | 2 ++
>  Documentation/gpu/drm-mm.rst          | 2 ++
>  Documentation/gpu/drm-ras.rst         | 2 ++
>  Documentation/gpu/drm-uapi.rst        | 4 +++-
>  Documentation/gpu/drm-usage-stats.rst | 2 ++
>  Documentation/gpu/introduction.rst    | 2 ++
>  9 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> index 1f15a8ca1265..627fc68c7a21 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -2,6 +2,8 @@
>  DRM Driver uAPI
>  ===============
>  
> +.. contents::
> +
>  drm/i915 uAPI
>  =============
>  
> diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
> index 94f93fd3b8a0..a3ce25a36f1d 100644
> --- a/Documentation/gpu/drm-internals.rst
> +++ b/Documentation/gpu/drm-internals.rst
> @@ -18,6 +18,8 @@ event handling, memory management, output management, framebuffer
>  management, command submission & fencing, suspend/resume support, and
>  DMA services.
>  
> +.. contents::
> +
>  Driver Initialization
>  =====================
>  
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index b4a9e5ae81f6..80453dda33b8 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -33,6 +33,8 @@ There are a few areas these helpers can grouped into:
>    pipeline: Planes, handling rectangles for visibility checking and scissoring,
>    flip queues and assorted bits.
>  
> +.. contents::
> +
>  Modeset Helper Reference for Common Vtables
>  ===========================================
>  
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index fbe0583eb84c..d22817fdf9aa 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -15,6 +15,8 @@ be setup by initializing the following fields.
>  -  struct drm_mode_config_funcs \*funcs;
>     Mode setting functions.
>  
> +.. contents::
> +
>  Overview
>  ========
>  
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 32fb506db05b..2dea94f77d52 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -25,6 +25,8 @@ share it. GEM has simpler initialization and execution requirements than
>  TTM, but has no video RAM management capabilities and is thus limited to
>  UMA devices.
>  
> +.. contents::
> +
>  The Translation Table Manager (TTM)
>  ===================================
>  
> diff --git a/Documentation/gpu/drm-ras.rst b/Documentation/gpu/drm-ras.rst
> index 4636e68f5678..83c21853b74b 100644
> --- a/Documentation/gpu/drm-ras.rst
> +++ b/Documentation/gpu/drm-ras.rst
> @@ -24,6 +24,8 @@ Key Goals:
>    nodes for different IP blocks, sub-blocks, or other logical subdivisions
>    as applicable.
>  
> +.. contents::
> +
>  Nodes
>  =====
>  
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 32206ce62931..2c2f939322fb 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -16,6 +16,8 @@ management, and output management.
>  Cover generic ioctls and sysfs layout here. We only need high-level
>  info, since man pages should cover the rest.
>  
> +.. contents::
> +
>  libdrm Device Lookup
>  ====================
>  
> @@ -765,4 +767,4 @@ Stable uAPI events
>  From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>  
>  .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 24d3012ca7a6..70b7cfcc194f 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -16,6 +16,8 @@ output is split between common and driver specific parts. Having said that,
>  wherever possible effort should still be made to standardise as much as
>  possible.
>  
> +.. contents::
> +
>  File format specification
>  =========================
>  
> diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
> index d8f519693fc2..64074ac22d9b 100644
> --- a/Documentation/gpu/introduction.rst
> +++ b/Documentation/gpu/introduction.rst
> @@ -16,6 +16,8 @@ found in current kernels.
>  
>  [Insert diagram of typical DRM stack here]
>  
> +.. contents::
> +
>  Style Guidelines
>  ================
>  

-- 
~Randy
