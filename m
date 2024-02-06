Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1451B12E71
	for <linux-doc@vger.kernel.org>; Tue,  6 Feb 2024 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707244066; cv=none; b=ny4TaTcGPcsX4VHt0X9reaLPfFujtOW+bM5FNjRi7QjAjuD9ScySQG4TNZxqtQF7Ne5Tu10olVt44/0kAuHzRf9AVlhycxtT512JKhE+A0TPM10j2EHOEmihotIR8yf/JKsQfs+JibRoE+6wLxGJUP1oLMH7iZF41oLlj60qF1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707244066; c=relaxed/simple;
	bh=fyuSCUJ+iQTQPsUIC9mk2kpmTbDF8XModpyNWGe53f8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m0zg+XtupF3JM3Gyrq3cz2ZjmndPHNC61WBl7FQ9kl4x89tUYfmzB7DLdluJedeu1K4p0UtGEDDNoIVY9JI1sIy0NbE9kYklkmtM71KUrVqET9PnFwMLE6jZbtj1tjdabd0jUrIpdT1JL7A4F/7k8EJnX18mDiGslqmNXrXPkKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3ipWsL5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3ipWsL5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707244065; x=1738780065;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=fyuSCUJ+iQTQPsUIC9mk2kpmTbDF8XModpyNWGe53f8=;
  b=L3ipWsL5ePD2r85ZRWlATLUYmukBr8fcpU6ZXdRMgIE326B2SSMv0w41
   8dhWYW5kcEkRTapzcVZhSMc8lPswpNbabGqqFxlZcyGXip78rT9kbCfvq
   zj7QCPXevT/lT29glxPglIKxJSTsdWMohieIdsQEy1QdoKM/5Dz+UKLZA
   WA7wdkEmH0gS8dOF5VMIZeNoyCc+9r0iM0oMAHBg6bCet1rYJQCm4ksPJ
   V3CuLxXAVYWSCJtcZKDr/yeZ+9SCv/qsNHk8XHNfNnXkrj/CXbinveEY3
   3YHVZ/hSKSzWXwNUjBG4LxcO2LfkSFKYrYmTeDST2hNvk9k4pcdFQY62v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="3781248"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="3781248"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 10:27:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1135316"
Received: from lgrunert-mobl.ger.corp.intel.com (HELO localhost) ([10.252.42.150])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 10:27:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/8] doc: kfigure.py: convert to sphinx.util.logging
In-Reply-To: <20240206170819.08f3e31a@coco.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240205175133.774271-1-vegard.nossum@oracle.com>
 <20240205175133.774271-7-vegard.nossum@oracle.com>
 <87zfwec6m7.fsf@intel.com> <20240206170819.08f3e31a@coco.lan>
Date: Tue, 06 Feb 2024 20:27:38 +0200
Message-ID: <87mssdcusl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 06 Feb 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Tue, 06 Feb 2024 10:57:36 +0200
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Mon, 05 Feb 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>> > As of commit 3e893e16af55 ("docs: Raise the minimum Sphinx requirement
>> > to 2.4.4"), we can use Sphinx's built-in logging facilities.
>> >
>> > Gotchas:
>> > - remove first argument 'app' from all calls
>> > - instead of (fmt % (args)), use (fmt, args)
>> > - instead of ("<fmt>: " + str) use ("<fmt: %s>", str)  
>> 
>> If you're doing this, why not go directly to f-strings? IMO the above
>> are inferior to it.
>
> Hmm... f-strings require at least python 3.6. Not sure what's the current
> requirement.

[snip]

> Anyway, I would expect that the minimal python version to be listed at:
>
> 	Documentation/process/changes.rst
>
> Apparently, it isn't. IMO, we need to document there that python
> 3.6 is the minimal version required to build the Kernel - or
> at least the documentation.

Yeah, need to document the minimum version, but I'd rather bump it to a
supported version like 3.8 rather than something that reached end of
life two years ago [1].


BR,
Jani.


[1] https://devguide.python.org/versions/


-- 
Jani Nikula, Intel
