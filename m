Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 956557D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Jun 2019 10:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfFEK3G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Jun 2019 06:29:06 -0400
Received: from mga01.intel.com ([192.55.52.88]:29785 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbfFEK3G (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 5 Jun 2019 06:29:06 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Jun 2019 03:29:05 -0700
X-ExtLoop1: 1
Received: from gaia.fi.intel.com ([10.237.72.169])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jun 2019 03:29:04 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
        id 253875C1F3A; Wed,  5 Jun 2019 13:29:03 +0300 (EEST)
From:   Mika Kuoppala <mika.kuoppala@linux.intel.com>
To:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, jani.nikula@intel.com,
        Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] Documentation/i915: Fix kernel-doc references to moved gem files
In-Reply-To: <20190605095657.23601-1-jani.nikula@intel.com>
References: <20190605095657.23601-1-jani.nikula@intel.com>
Date:   Wed, 05 Jun 2019 13:29:03 +0300
Message-ID: <87d0jss4uo.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jani Nikula <jani.nikula@intel.com> writes:

> The error messages could be more descriptive, but fix these caused by
> file moves:
>
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal
>     ./drivers/gpu/drm/i915/i915_gem_shrinker.c' failed with return code 2
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function
>     User command execution ./drivers/gpu/drm/i915/i915_gem_execbuffer.c'
>     failed with return code 1
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal
>     ./drivers/gpu/drm/i915/i915_gem_tiling.c' failed with return code 2
> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function
>     buffer object tiling ./drivers/gpu/drm/i915/i915_gem_tiling.c'
>     failed with return code 1
>
> Fixes: 10be98a77c55 ("drm/i915: Move more GEM objects under gem/")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

/o\

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  Documentation/gpu/i915.rst | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 6c75380b2928..f98ee95da90f 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -349,7 +349,7 @@ of buffer object caches. Shrinking is used to make main memory
>  available. Note that this is mostly orthogonal to evicting buffer
>  objects, which has the goal to make space in gpu virtual address spaces.
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_shrinker.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>     :internal:
>  
>  Batchbuffer Parsing
> @@ -373,7 +373,7 @@ Batchbuffer Pools
>  User Batchbuffer Execution
>  --------------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_execbuffer.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>     :doc: User command execution
>  
>  Logical Rings, Logical Ring Contexts and Execlists
> @@ -382,9 +382,6 @@ Logical Rings, Logical Ring Contexts and Execlists
>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_lrc.c
>     :doc: Logical Rings, Logical Ring Contexts and Execlists
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_lrc.c
> -   :internal:
> -
>  Global GTT views
>  ----------------
>  
> @@ -415,10 +412,10 @@ Hardware Tiling and Swizzling Details
>  Object Tiling IOCTLs
>  --------------------
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_tiling.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_tiling.c
> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>     :doc: buffer object tiling
>  
>  WOPCM
> -- 
> 2.20.1
