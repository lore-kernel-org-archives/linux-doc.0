Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E5341055
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855821; cv=none; b=s7CdMuSr9o+fNkT1Uam1JnIIK8WaZNBoF7LMqCQWzEKisk9BB40F1tNFZwXtzhOcrKbdATKcMyWshVsHw5u9zIt6fj9q4Hot9PTAQwdztzCrvUI8DZSH5DGqR/uMB+xdchirriAy30jcm+5F3kYZWylcwRNpvyIclUxe+uwjynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855821; c=relaxed/simple;
	bh=jzk5OvrfTqOVYrkjHLE8bP5ywZQOaA1yAsdz8DbNHgU=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=daB9LbTyVm7hL/syNitH12m5dcf0WUhkDBUbAHBD0wOdWfFHl+lBc5/t/yQDmd7hFGpEtyt+b+ce9O7X015+7MaYtSpmS4LKQaxi6U5imrxlb1Khcyq0JVfNdoP3z3ue2LAZHF31SwKHNEZmZfHHsRgBTgRwwAYuZmbhO6YK7ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kWcSbXZj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kWcSbXZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764855820; x=1796391820;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=jzk5OvrfTqOVYrkjHLE8bP5ywZQOaA1yAsdz8DbNHgU=;
  b=kWcSbXZjdi4fVCs9AsOFT0ULi8gNLPyBdP/LdE9vZvc3gFD8l1azFRhv
   BegOo3oL8Jp/Y8vLaD5gcIoXaAWHSsk6cudK/TkkBfdqc8I9srdkVibnr
   hdWt9B9GRTiMMjs4jkODgRVlIFpZocu/cMHHlPDWPWjPtLaoCchfaZMAG
   kpyuQ+r/P5UEBDWthRJCaR9xhFXsRiScOPKGzxN/QGwFvJhFeUeP+k7Tt
   0xaocfeC4sUjJOA1fnuQaXp/hq9q91j4RhToRrehw+4UJU9ma0v0roAqf
   0wfUnTmiHPcLXgrCQhTTi0xJ0iTv6vIJ6iNFXaWbtCczjVdptS7uxKBOI
   g==;
X-CSE-ConnectionGUID: H5T87l2gRj6Zvu/v0D2D9g==
X-CSE-MsgGUID: guV3Q9Y4Siem9/jDamA/GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70487516"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="70487516"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:43:40 -0800
X-CSE-ConnectionGUID: j26IayzVTCasZ0OK+U9NQQ==
X-CSE-MsgGUID: 7Pq3+K/aRtGO8zk/RC7U2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; 
   d="scan'208";a="218337598"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.11])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 05:43:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] Documentation: clean up subproject index boilerplate
In-Reply-To: <db45a19716d39b6dd89e3fbc85067673fdb0d335@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762948491.git.jani.nikula@intel.com>
 <87o6p5sxhs.fsf@trenco.lwn.net>
 <db45a19716d39b6dd89e3fbc85067673fdb0d335@intel.com>
Date: Thu, 04 Dec 2025 15:43:35 +0200
Message-ID: <2e29e58cfea8d9865afdf181a8653029095e5b35@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 13 Nov 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> On Thu, 13 Nov 2025, Jonathan Corbet <corbet@lwn.net> wrote:
>> Jani Nikula <jani.nikula@intel.com> writes:
>>
>>> Only very lightly tested.
>>>
>>> Jani Nikula (4):
>>>   Documentation: remove subproject index links deep in the structure
>>>   Documentation: streamline subproject index link in translations
>>>   Documentation: include the boilerplate for SPHINXDIRS index link
>>>   Documentation: use a source-read extension to include the index
>>>     boilerplate
>>
>> That bit of repeated gunk has been on my list to look at for a while,
>> thanks for digging into it.  Looking forward to the second version.
>
> As I said elsewhere, I didn't realize you could use SPHINXDIRS deeper
> than the top level. The implementation is slightly problematic for
> translations/. I don't suppose you want to have English "Indices"
> heading when using, say, SPHINXDIRS=translations/it_IT/doc-guide?
>
> I guess the alternatives are:
>
> 1) Keep having the index links manually in translations/, and don't add
>    the template for files there.
>
> 2) Accept English "Indices" as a tradeoff.
>
> 3) Come up with a system of having multiple language templates for the
>    indices, and use them automatically under translations/.
>
> We could also do 2) first and expand to 3) later.

Jon, any input on this?

BR,
Jani.


-- 
Jani Nikula, Intel
