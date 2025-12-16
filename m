Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E722940D
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 13:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765892904; cv=none; b=KsRQXsmDZDiZDCg0A2ZfrlgYhW0lw7g0GZb4RkrZH8NLpXxMmLGG51aAvE5nwchxjZrQX2G5A8ek7DWTBGA4Luq+pve6AGhyLznsDOrsWoMB173KyNr7H0VFO1vjhjnVRTNr0WP0Ajbuqpjw5vr5HcuyCbuc5eFnidcIfNy2nCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765892904; c=relaxed/simple;
	bh=ngiLwWOAcuL1Tg7RnoUR1jXzSaV0yuJVciviFjVjVwo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j6/fLhDyq/AB4K5eQX7Pfp5jQfxiqTMfqyuytR6hi3WC9Q0vdMLwMz2w+F9N/J3Y7C1e8FNPuJjQw5feqy2mrT99Q1UgLR6NQTHlZbcrNH31VkMwp1Hf511JGP9tYv/LZNgV/slaEhk/MwSQ0vqsUPAupUjCR90hcplSjZ6WTv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B5IDQG6A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B5IDQG6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765892901; x=1797428901;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ngiLwWOAcuL1Tg7RnoUR1jXzSaV0yuJVciviFjVjVwo=;
  b=B5IDQG6AY6DYwWOjoKPOKdqqWOtXEOQHA20lvL7Yu7ES+rQGGbWiyRxs
   jOy/+N4oefLJqTdgjtIxdf/usQI6EmUYVC8nrE4bJQsHr/UtKr1PCvErx
   yM3c3rIWSy4onk2RUYawBaBNcUrYa92GHnK397umLzTBT7UQc+UOTvJHs
   C/Ss/DQm7T0YYgSpkWiyPsSlJZHu0k87LuhnpvLXb7kIXJn2/bHu3E8ll
   J5YM46FNqdWYp7NmZL932GtWepBPFL+nN77VKZs0gLq/iQc++yJsXFIOi
   F3SgeF3E/oCDsOb68gt5JfMs4wuyhlawYfjxkvVNW8XMSOZVl0i2G52ex
   Q==;
X-CSE-ConnectionGUID: TRub19ldQ7WblGxW7UMvBQ==
X-CSE-MsgGUID: kMHPT1c0RtSN4O/GvYd4Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78447550"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78447550"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:48:20 -0800
X-CSE-ConnectionGUID: BXu3hGRCQzKGUZEFizqORA==
X-CSE-MsgGUID: vjnituMCTSe/CV2nh6iK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="202434967"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.246.153])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:48:18 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, intel-gfx@lists.freedesktop.org
Cc: linux-doc@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] drm/i915/wakeref: clean up INTEL_WAKEREF_PUT_* flag macros
In-Reply-To: <76482fc4-7989-41ad-a244-3de4bca44043@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251215120908.3515578-1-jani.nikula@intel.com>
 <76482fc4-7989-41ad-a244-3de4bca44043@infradead.org>
Date: Tue, 16 Dec 2025 15:48:15 +0200
Message-ID: <707d40a5b84853a6403e537163c6cb97c3474792@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 15 Dec 2025, Randy Dunlap <rdunlap@infradead.org> wrote:
> On 12/15/25 4:09 AM, Jani Nikula wrote:
>> Commit 469c1c9eb6c9 ("kernel-doc: Issue warnings that were silently
>> discarded") started emitting warnings for cases that were previously
>> silently discarded. One such case is in intel_wakeref.h:
>> 
>> Warning: drivers/gpu/drm/i915/intel_wakeref.h:156 expecting prototype
>>   for __intel_wakeref_put(). Prototype was for INTEL_WAKEREF_PUT_ASYNC()
>>   instead
>> 
>> Arguably kernel-doc should be able to handle this, as it's valid C, but
>> having the flags defined between the function declarator and the body is
>> just asking for trouble. Move the INTEL_WAKEREF_PUT_* macros away from
>> there, making kernel-doc's life easier.
>> 
>> While at it, reduce the unnecessary abstraction levels by removing the
>> enum, and append _MASK to INTEL_WAKEREF_PUT_DELAY for clarity.
>> 
>> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.

Thanks, pushed to drm-intel-next.

BR,
Jani.

>
>> 
>> ---
>> 
>> Curiously, kernel-doc does not return non-zero exit status for these
>> warnings even with the -Werror parameter!
>> ---
>>  drivers/gpu/drm/i915/intel_wakeref.c |  2 +-
>>  drivers/gpu/drm/i915/intel_wakeref.h | 14 +++++---------
>>  2 files changed, 6 insertions(+), 10 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/intel_wakeref.c b/drivers/gpu/drm/i915/intel_wakeref.c
>> index b1883dccc22a..98e7cee4e1dc 100644
>> --- a/drivers/gpu/drm/i915/intel_wakeref.c
>> +++ b/drivers/gpu/drm/i915/intel_wakeref.c
>> @@ -80,7 +80,7 @@ void __intel_wakeref_put_last(struct intel_wakeref *wf, unsigned long flags)
>>  	/* Assume we are not in process context and so cannot sleep. */
>>  	if (flags & INTEL_WAKEREF_PUT_ASYNC || !mutex_trylock(&wf->mutex)) {
>>  		mod_delayed_work(wf->i915->unordered_wq, &wf->work,
>> -				 FIELD_GET(INTEL_WAKEREF_PUT_DELAY, flags));
>> +				 FIELD_GET(INTEL_WAKEREF_PUT_DELAY_MASK, flags));
>>  		return;
>>  	}
>>  
>> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/intel_wakeref.h
>> index a2894a56e18f..81308bac34ba 100644
>> --- a/drivers/gpu/drm/i915/intel_wakeref.h
>> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
>> @@ -128,17 +128,16 @@ intel_wakeref_get_if_active(struct intel_wakeref *wf)
>>  	return atomic_inc_not_zero(&wf->count);
>>  }
>>  
>> -enum {
>> -	INTEL_WAKEREF_PUT_ASYNC_BIT = 0,
>> -	__INTEL_WAKEREF_PUT_LAST_BIT__
>> -};
>> -
>>  static inline void
>>  intel_wakeref_might_get(struct intel_wakeref *wf)
>>  {
>>  	might_lock(&wf->mutex);
>>  }
>>  
>> +/* flags for __intel_wakeref_put() and __intel_wakeref_put_last */
>> +#define INTEL_WAKEREF_PUT_ASYNC		BIT(0)
>> +#define INTEL_WAKEREF_PUT_DELAY_MASK	GENMASK(BITS_PER_LONG - 1, 1)
>> +
>>  /**
>>   * __intel_wakeref_put: Release the wakeref
>>   * @wf: the wakeref
>> @@ -154,9 +153,6 @@ intel_wakeref_might_get(struct intel_wakeref *wf)
>>   */
>>  static inline void
>>  __intel_wakeref_put(struct intel_wakeref *wf, unsigned long flags)
>> -#define INTEL_WAKEREF_PUT_ASYNC BIT(INTEL_WAKEREF_PUT_ASYNC_BIT)
>> -#define INTEL_WAKEREF_PUT_DELAY \
>> -	GENMASK(BITS_PER_LONG - 1, __INTEL_WAKEREF_PUT_LAST_BIT__)
>>  {
>>  	INTEL_WAKEREF_BUG_ON(atomic_read(&wf->count) <= 0);
>>  	if (unlikely(!atomic_add_unless(&wf->count, -1, 1)))
>> @@ -181,7 +177,7 @@ intel_wakeref_put_delay(struct intel_wakeref *wf, unsigned long delay)
>>  {
>>  	__intel_wakeref_put(wf,
>>  			    INTEL_WAKEREF_PUT_ASYNC |
>> -			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY, delay));
>> +			    FIELD_PREP(INTEL_WAKEREF_PUT_DELAY_MASK, delay));
>>  }
>>  
>>  static inline void

-- 
Jani Nikula, Intel
