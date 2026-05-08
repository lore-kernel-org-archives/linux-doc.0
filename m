Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E2637FF76
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778264524; cv=none; b=OYkrPT/RM+26rO7ZoKOQMbf6Fuz8Dkk3DWTsIvbDPzoiWnqsWFD/sG73ySkzLu10pH13dnQkcNyAGx6FbuDYQxrrwfPeiW5szLGuvcDNc4e4MP5NCOpH5WcpemyTCCHybroJP2TeUnhXZAH8nRnMifiV/LUIwOSI//uTIAa88YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778264524; c=relaxed/simple;
	bh=r6WsI/eR/R3ZNlnjq6rCybELhEH72kOF5SeXuCp1pkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWPzBYncQomU/FV1yIQFf6bA7rRt4lVrRcPNP4Xg1xYqtotaMl++yZBpbM9eNr0yH+L3tbyjxHJ499RDK/Jqpkg6Pti5K3I/jOfQJR0IdRWEB4bwSrJwtUt6rnd47fw6LQbHWsD/jonVv028wNdkna3BHndogybRq3oHb0EVZBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3oZLkdmP; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3oZLkdmP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=fD79LjbLJzRV4SU5PUp0N6BYWSilqW/UE9YNtO6ZM6w=; b=3oZLkdmPo6NbLo4vBhDBSZkIk5
	mPtsJ0KZOtzO4pfdTFH9DJ9wOKlMzcJnKdAjPANzKGIIkMRUDSGrMFJac5FGznslOQFOZ6kmr4VRL
	uMy5euj+BuFydpcglmgVUwXWlCUYwACPx9exoiZgd7VxNJZtbZr73Xxdzubu0jrZgN2/ZDgcDJ2L3
	rSZ+a7TOg7Qbb+Xi3A9nWyHCz/KrOO7XcEK5UMfR8pc13e7kaEUOkhpE5JgiaWZKnxxKhONo2SajO
	LW/LXDAsnANICdARyu1ldMLQW00aGHneqQcAjOYAaM6QPwYov0M0i4MLHG8OKX/HkkCtYDE0nqxSI
	Iqp8sogw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPpq-00000007FRf-2Pvf;
	Fri, 08 May 2026 18:22:02 +0000
Message-ID: <4aba5b5e-75a5-4800-bedb-8f7cc673c7f7@infradead.org>
Date: Fri, 8 May 2026 11:22:01 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Documentation/gpu: add dedicated documentation for
 Intel display
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Cc: rodrigo.vivi@intel.com, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
References: <cover.1778235406.git.jani.nikula@intel.com>
 <21bfa7777eb0926eadd309d4c6f5c9cf48405cf0.1778235406.git.jani.nikula@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <21bfa7777eb0926eadd309d4c6f5c9cf48405cf0.1778235406.git.jani.nikula@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 5/8/26 3:20 AM, Jani Nikula wrote:
> diff --git a/Documentation/gpu/intel-display/index.rst b/Documentation/gpu/intel-display/index.rst
> new file mode 100644
> index 000000000000..8d40363b8f90
> --- /dev/null
> +++ b/Documentation/gpu/intel-display/index.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: MIT
> +.. Copyright © 2026 Intel Corporation
> +
> +.. _drm/intel-display:
> +
> +====================
> +Intel Display Driver
> +====================
> +
> +The Intel display driver provides the display, or :ref:`drm-kms`, support for
> +both the :ref:`drm/xe <drm/xe>` and :ref:`drm/i915 <drm/i915>` Intel GPU
> +drivers.
> +
> +The source code currently resides under ``drivers/gpu/drm/i915/display`` due to
> +historical reasons, and it's compiled separately into both drm/xe and drm/i915
> +kernel modules.
> +
> +The drm/xe and drm/i915 drivers are the "core" or "parent" drivers for display,
> +as they initialize and own the drm device, and pass that on to the display
> +driver. The display driver isn't an independent driver in that sense.
> +
> +.. toctree::
> +   :maxdepth: 1
> +   :caption: Detailed display topics
> +
> +   async-flip
> +   audio
> +   cdclk
> +   dmc
> +   dpio
> +   dpll
> +   drrs
> +   dsb
> +   fbc
> +   fifo-underrun
> +   frontbuffer
> +   hotplug
> +   plane
> +   psr
> +   vbt

Is this in almost-alphabetical order or just random?  :)

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
