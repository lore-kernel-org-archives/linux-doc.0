Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1463D7D910
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Jun 2019 08:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFIUm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Jun 2019 04:20:42 -0400
Received: from mga04.intel.com ([192.55.52.120]:7384 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbfFFIUm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:20:42 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Jun 2019 01:20:40 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2019 01:20:38 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Mika Kuoppala <mika.kuoppala@linux.intel.com>,
        intel-gfx@lists.freedesktop.org
Cc:     linux-doc@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 1/2] Documentation/i915: Fix kernel-doc references to moved gem files
In-Reply-To: <87d0jss4uo.fsf@gaia.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190605095657.23601-1-jani.nikula@intel.com> <87d0jss4uo.fsf@gaia.fi.intel.com>
Date:   Thu, 06 Jun 2019 11:23:44 +0300
Message-ID: <871s072kbz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 05 Jun 2019, Mika Kuoppala <mika.kuoppala@linux.intel.com> wrote:
> Jani Nikula <jani.nikula@intel.com> writes:
>
>> The error messages could be more descriptive, but fix these caused by
>> file moves:
>>
>> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal
>>     ./drivers/gpu/drm/i915/i915_gem_shrinker.c' failed with return code 2
>> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function
>>     User command execution ./drivers/gpu/drm/i915/i915_gem_execbuffer.c'
>>     failed with return code 1
>> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -internal
>>     ./drivers/gpu/drm/i915/i915_gem_tiling.c' failed with return code 2
>> WARNING: kernel-doc './scripts/kernel-doc -rst -enable-lineno -function
>>     buffer object tiling ./drivers/gpu/drm/i915/i915_gem_tiling.c'
>>     failed with return code 1
>>
>> Fixes: 10be98a77c55 ("drm/i915: Move more GEM objects under gem/")
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> /o\
>
> Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

Thanks for the reviews, I took the liberty of pushing these to dinq with
just BAT results, as these are purely documentation/comment changes.

BR,
Jani.

>
>> ---
>>  Documentation/gpu/i915.rst | 11 ++++-------
>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
>> index 6c75380b2928..f98ee95da90f 100644
>> --- a/Documentation/gpu/i915.rst
>> +++ b/Documentation/gpu/i915.rst
>> @@ -349,7 +349,7 @@ of buffer object caches. Shrinking is used to make main memory
>>  available. Note that this is mostly orthogonal to evicting buffer
>>  objects, which has the goal to make space in gpu virtual address spaces.
>>  
>> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_shrinker.c
>> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>>     :internal:
>>  
>>  Batchbuffer Parsing
>> @@ -373,7 +373,7 @@ Batchbuffer Pools
>>  User Batchbuffer Execution
>>  --------------------------
>>  
>> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_execbuffer.c
>> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>     :doc: User command execution
>>  
>>  Logical Rings, Logical Ring Contexts and Execlists
>> @@ -382,9 +382,6 @@ Logical Rings, Logical Ring Contexts and Execlists
>>  .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_lrc.c
>>     :doc: Logical Rings, Logical Ring Contexts and Execlists
>>  
>> -.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_lrc.c
>> -   :internal:
>> -
>>  Global GTT views
>>  ----------------
>>  
>> @@ -415,10 +412,10 @@ Hardware Tiling and Swizzling Details
>>  Object Tiling IOCTLs
>>  --------------------
>>  
>> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_tiling.c
>> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>>     :internal:
>>  
>> -.. kernel-doc:: drivers/gpu/drm/i915/i915_gem_tiling.c
>> +.. kernel-doc:: drivers/gpu/drm/i915/gem/i915_gem_tiling.c
>>     :doc: buffer object tiling
>>  
>>  WOPCM
>> -- 
>> 2.20.1

-- 
Jani Nikula, Intel Open Source Graphics Center
