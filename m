Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD6F15F3FB
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 18:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725561499; cv=none; b=bPFTbrFJNjdIoPBwyEM5wWx4tz4FDTQddSN04Fm6ydYvfjnxHGPtBRnF6vn31UptrN71Tq+rZFlksxT5x+yDENbVpiU33f3i5C7r5z5v1BB/10CpzBGEjFt7frDpZBrVpjS4po0F2acT6P18v91oT8C9w/mnyVLw7Um0mFkUNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725561499; c=relaxed/simple;
	bh=1JfP/XFFGmfPfhnMawDphPt9pvxCF+aNnm+8UBhY7q8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VCMJCoaj+OfZcquAgpky5jtuAmEiS0q+KCCnhK9LdeiaZstJFOUaJDnSR2zC0rapRwmrO7v7tDqdS91v2l5AJUNsL54v3JCO1BdE6FXVPFXj032Rk3IWeTHZaWxRLW/MPr500+isc14sBmV5bQ/W/jo9NOpg2F9ZwqznJFiMis4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DVH5+8Dl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DVH5+8Dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725561498; x=1757097498;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=1JfP/XFFGmfPfhnMawDphPt9pvxCF+aNnm+8UBhY7q8=;
  b=DVH5+8Dl/YRPHx/UrMoiZQx2rv9NmSb9ZD9lcN/CSQkL5GAgNnQXUI3A
   45g8HYPjqHfPDl8uEJSi4dTdGKqQ+6bhwXxUwb14/MgPPBDiEHUF3aLt7
   F0hPI67AKVp3PUiX6pqYm/KsDGBPNUQG+b9SuWMs+/6wmv9WDAsJW3QXS
   iJu36wzsXTkUDcqecwH13yYs5DbFfI2KCd6pvfQc6Nr0j1VyGlXaL640Y
   ENaMopR2D9wF6z3Hnk7M+AgawprQMVg1222zEpLYktvpJ8yDQvH/fMdRl
   xZU4aX7THq4nM6bv+dbzxi4wL3AYx8gfZubP7gcxmfQBk+Ifjy4DTUtJI
   Q==;
X-CSE-ConnectionGUID: 1tdmh1SvR1Gf+Tc0e/EZFg==
X-CSE-MsgGUID: iFyAQa/6R2OPIU1t1uPkgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="28092763"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="28092763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 11:38:17 -0700
X-CSE-ConnectionGUID: adt+VdcpQNqTfjjmbGbUgQ==
X-CSE-MsgGUID: yj/VuknFSBeKAfpeDaDtDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65541174"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.216])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 11:38:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jonathan Corbet <corbet@lwn.net>, "Bernhard M. Wiedemann"
 <bwiedemann@suse.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <87ed5yj7ye.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <18f6aafd-3a96-42fc-9a65-b1b03ab8ae2a@suse.de>
 <87y146p7tp.fsf@intel.com> <87ed5yj7ye.fsf@trenco.lwn.net>
Date: Thu, 05 Sep 2024 21:38:11 +0300
Message-ID: <87wmjqndyk.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, Jonathan Corbet <corbet@lwn.net> wrote:
> Jani Nikula <jani.nikula@linux.intel.com> writes:
>
>>> However my patch for sphinx -j1 did give good test results, too.
>>> Maybe in your case that would result in 8 sphinx calls with 1 thread 
>>> each, which would be more appropriate for your machine.
>>
>> The right thing to do is to have one sphinx-build process and pass -j<N>
>> to that.
>
> [I wouldn't have minded being CC'd on this conversation...]

Yes, sorry about that.

> I, too, have never seen the behavior Jani reports.
>
> I, too, would like to get rid of as much of the makefile hackery as
> possible, but it all did end up there for a reason.
>
> The business around parallelism was intended to make sphinx play well
> with other targets being built in the same make invocation.  If you do a
> "make -j8 this that theother htmldocs" and there are five processes
> working on this, that, and theother, then sphinx should not create more
> than three.  See 51e46c7a4007 for more.
>
> In Jani's case, it sounds like the job-slot reservation isn't working
> right somehow?

Looking at the -j<N> results on an unrelated project, PEBKAC is a
distinct possibility here, and this part may be a red herring. I'll need
to look into it.

BR,
Jani.


-- 
Jani Nikula, Intel
