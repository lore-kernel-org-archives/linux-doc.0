Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F9718049
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 10:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cbl7hwug"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC08AC0;
	Mon,  6 Nov 2023 02:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699266707; x=1730802707;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=mFmIIGG7adzfu43wmeMMXhqUmLpP5dB3WqHiSnXa6qY=;
  b=cbl7hwugWEm3AYBdfyqjWJnw8sn+2xPfyhLGul2CJzcVdFsaQ1WzRFX7
   oQSZUj4e3DHmOKE1Al7djiUBXxS6dizliNCxujQmPMS6SnbTxegFCdXmb
   4T1QlBigslEtH0QJHu7sz9s4bk+3NsA7TK5ozfU0NaO5ehHMDVnYOhMzi
   Kr/1ELc5rcoLRllsoVhoMpzAKWQKyOWqzQJ6er04Tiv/1P1xbpPfSyYwt
   OGLm+yl/7iiiEXFiVvCOSQsuVqVr0iJvSfHTeqY9aLzMKdzEzeJ3R3Il3
   grQUZgAzlT7VKVSnVThADBmUBictF6lPOWY8LJ+yOcyNTOkHMit8PPhmL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2236697"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="2236697"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:31:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832683907"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="832683907"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost) ([10.252.36.222])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:31:26 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Hunter Chasens
 <hunter.chasens18@ncf.edu>, corbet@lwn.net, Luca Coelho
 <luciano.coelho@intel.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 Linux Documentation <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] docs: gpu: rfc: i915_scheduler.rst remove unused
 directives for namespacing
In-Reply-To: <ZUhvj2uj_PvaDxIM@debian.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231104134708.69432-1-hunter.chasens18@ncf.edu>
 <ZUhvj2uj_PvaDxIM@debian.me>
Date: Mon, 06 Nov 2023 12:31:23 +0200
Message-ID: <8734xj18ck.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Sat, Nov 04, 2023 at 09:47:08AM -0400, Hunter Chasens wrote:
>> diff --git a/Documentation/gpu/rfc/i915_scheduler.rst b/Documentation/gpu/rfc/i915_scheduler.rst
>> index c237ebc024cd..23ba7006929b 100644
>> --- a/Documentation/gpu/rfc/i915_scheduler.rst
>> +++ b/Documentation/gpu/rfc/i915_scheduler.rst
>> @@ -135,13 +135,9 @@ Add I915_CONTEXT_ENGINES_EXT_PARALLEL_SUBMIT and
>>  drm_i915_context_engines_parallel_submit to the uAPI to implement this
>>  extension.
>>  
>> -.. c:namespace-push:: rfc
>> -
>>  .. kernel-doc:: include/uapi/drm/i915_drm.h
>>          :functions: i915_context_engines_parallel_submit
>>  
>> -.. c:namespace-pop::
>> -

What makes the namespacing unnecessary?

$ git grep '.. kernel-doc:: include/uapi/drm/i915_drm.h'
Documentation/gpu/driver-uapi.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h
Documentation/gpu/rfc/i915_scheduler.rst:.. kernel-doc:: include/uapi/drm/i915_drm.h

And you get [1] and [2].

>>  Extend execbuf2 IOCTL to support submitting N BBs in a single IOCTL
>>  -------------------------------------------------------------------
>>  Contexts that have been configured with the 'set_parallel' extension can only
>
> The warnings go away, thanks!

What warnings go away?

BR,
Jani.


[1] https://docs.kernel.org/gpu/driver-uapi.html#c.i915_context_engines_parallel_submit
[2] https://docs.kernel.org/gpu/rfc/i915_scheduler.html#c.rfc.i915_context_engines_parallel_submit

>
> Fixes: f6757dfcfde7 ("drm/doc: fix duplicate declaration warning")
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
Jani Nikula, Intel
