Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E272E18757D
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725564008; cv=none; b=d4Wc+p428Uezgf86jDEn1T9PdAvJLy/sP532sampt4Fb9bK0U9hWVVFfRUg5cQDRR24QL4EEfjr9Vl2qrsWEfasflzK0yUjTO+Gor15K3SxITqZvLfG0j4PFObNeCUPH4gpv8NEUugGGNrJY3a+UgRYXcYO144m0Cx0Z2syRrzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725564008; c=relaxed/simple;
	bh=I9K/rGUfnASFSwImay9mojckkVU5ATEslob5G2G2gZ8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U9miuASjK78tLrw+XhegB0J4Hm4ZlBsTXU3GtcPzCHy3tF+3NzAR6sXT8tTx5KMpyhvxQNfnNPgtlNGJzemM0zBZpnVl4A0EW9F3pPFATcm8+MIqNh5R8LQalIgOlMH0CAnAmNStQsKpCfZsKLDyZnO6suuRm3hIt0rn7LQKSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+JvSlNH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+JvSlNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725564006; x=1757100006;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=I9K/rGUfnASFSwImay9mojckkVU5ATEslob5G2G2gZ8=;
  b=e+JvSlNHPmC5f+zoMqZcelel+oAJ3XmE6U8sWz8u8Ns6t2/X8mPWzvMT
   5A9CGpxAO6Yd8lCLq5hzbTaZHFJO1wxNR4qGw+zhRYp4pAPAwc69tIAxp
   kMPSZFZmhJAJq+Su6l+MLa+vwsI9jLpgGdFVokQK4Vdn7RIRW2pnWc/Xh
   YzMOqQ7jYrB6LpxwvCxlWh0G7fC9Ix+ZzwaFpPxRMNFKfmoztZMLOH2gy
   sfTp13KYBwz6Vd6BYlV7X93O6lGI4P73Mw0UhGfly10qf+HIhkFFx1Gcu
   kep01e3L/OZtT/Mg5OW4jd9iZdHtRKj7l+nyecHnInaXjmRrmi+/R4U5d
   A==;
X-CSE-ConnectionGUID: AJ7ixuSuQDO6Gg0e8vbcgQ==
X-CSE-MsgGUID: bxvvsClLRralPXzb4EL3fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="27229165"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="27229165"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:20:05 -0700
X-CSE-ConnectionGUID: qRBq0fMDScivvb6UPkyHIA==
X-CSE-MsgGUID: 4vHoHBZETAmyMTZ1A+/Kog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65728594"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.216])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 12:20:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, "Bernhard M. Wiedemann"
 <bwiedemann@suse.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <87wmjqndyk.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
 <87y146p7tp.fsf@intel.com> <87ed5yj7ye.fsf@trenco.lwn.net>
 <87wmjqndyk.fsf@intel.com>
Date: Thu, 05 Sep 2024 22:19:59 +0300
Message-ID: <87o751oqlc.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 05 Sep 2024, Jonathan Corbet <corbet@lwn.net> wrote:
>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>>
>>>> However my patch for sphinx -j1 did give good test results, too.
>>>> Maybe in your case that would result in 8 sphinx calls with 1 thread 
>>>> each, which would be more appropriate for your machine.
>>>
>>> The right thing to do is to have one sphinx-build process and pass -j<N>
>>> to that.
>>
>> [I wouldn't have minded being CC'd on this conversation...]
>
> Yes, sorry about that.
>
>> I, too, have never seen the behavior Jani reports.
>>
>> I, too, would like to get rid of as much of the makefile hackery as
>> possible, but it all did end up there for a reason.
>>
>> The business around parallelism was intended to make sphinx play well
>> with other targets being built in the same make invocation.  If you do a
>> "make -j8 this that theother htmldocs" and there are five processes
>> working on this, that, and theother, then sphinx should not create more
>> than three.  See 51e46c7a4007 for more.
>>
>> In Jani's case, it sounds like the job-slot reservation isn't working
>> right somehow?
>
> Looking at the -j<N> results on an unrelated project, PEBKAC is a
> distinct possibility here, and this part may be a red herring. I'll need
> to look into it.

And just so there's no confusion, this is purely about my comments. The
problem with reproducible builds Bernhard presents is still a problem.

One of the key questions is whether we end up launching multiple
sphinx-build processes ourselves (but maybe some other way than I
speculated), making this a duplicate of [1], or whether plain single
sphinx-build -j<N> on its own *also* has parallel build issues. And if
the latter, can they be caused by our extensions incorrectly indicating
parallel_read_safe = True or parallel_write_safe = True in their setup()
functions, or is it something inherently in Sphinx.

BR,
Jani.


[1] https://github.com/sphinx-doc/sphinx/issues/2946

-- 
Jani Nikula, Intel
