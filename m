Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4622F7ADC
	for <linux-doc@vger.kernel.org>; Thu, 13 Nov 2025 08:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021066; cv=none; b=saOjR+DafyCH3cc5iugtpOMX3XDvi6ySC9gXfP2zYcoz31wnz34dQZcblwz1d2FLT6pjCHW9P+pxWK4eeTi45rKnupglusPeRY6kiIX/IzLLX10AmMNNsPnm0GEOigQX6RZPYl+hvFSSK2Wm8kp6eOb1r14SBtNIVxIO85XgV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021066; c=relaxed/simple;
	bh=9Hfvfw5R+8D6YCoCg4cNtoS+rm4DGgWmbtZZE6KhUUg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RNER5++6cQ1ySkR3bCpt6TjpRnUu72NPIKCJJvA5ITYaEtHhI8rUo/uss+WlEwctmfe7SOqO2fgmAVujvfElPV0uKn2mJwDnggNWPewXaq1swPfz2iMURpUjRfqlt8AeBTtbdCIE36NesKJL7nrbMI+2DWUye+8BGp34hD6Kx4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TK/fLJ9e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TK/fLJ9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763021063; x=1794557063;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=9Hfvfw5R+8D6YCoCg4cNtoS+rm4DGgWmbtZZE6KhUUg=;
  b=TK/fLJ9e4BAIB+N9DUV31LcVMqPLosNNrflSaNsXxQyOgRl/VvVGzLAN
   QG7wvO5zsB+6OapcMFip/wEinWbc3S+8B6REG73OrN63k1cHaiswbhLbo
   ZDJxDF5dyBJFuehwJYLNPPjCYXh6GGdkIhzfzYOYMWxYzXZuit+4XiFG4
   ZMjlEINzCwh0iVwUMbaMUKQScYubtcfX9PozdKKh3RJj82MLOOLj/qq9f
   JM5mDtpbcS2qe3HW92f8nAxsw3qSg5Qa8lkknA5FzJsmcxbGyIrUIfiCu
   +8l+IkCHDi7lMuMwpEV2MowM0PgP/gNCMY7+/dLvR4hMe/MOm80c443d5
   g==;
X-CSE-ConnectionGUID: V40num5JRNWJKgwSyX/1Pg==
X-CSE-MsgGUID: ljaeE4EyROSqpofNDVof8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64979840"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="64979840"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 00:04:23 -0800
X-CSE-ConnectionGUID: Nh7xxo8mSdWXiT3iRqK0DA==
X-CSE-MsgGUID: wMY4IgspTRS6FKtUFJTbFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189620460"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 00:04:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Mauro
 Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: [PATCH 3/4] Documentation: include the boilerplate for
 SPHINXDIRS index link
In-Reply-To: <jhrbxpwu7ef6f72mxxsw4r4xstte2ncydotp4ygmnbwmw7e4lh@hfhaitekjgc3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762948491.git.jani.nikula@intel.com>
 <87e4998a80a32d447555d35940bee77aa14a6813.1762948491.git.jani.nikula@intel.com>
 <jhrbxpwu7ef6f72mxxsw4r4xstte2ncydotp4ygmnbwmw7e4lh@hfhaitekjgc3>
Date: Thu, 13 Nov 2025 10:04:17 +0200
Message-ID: <e5d0dd034919c0d1e9e327be25e47543190310e1@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 12 Nov 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> On Wed, Nov 12, 2025 at 01:56:53PM +0200, Jani Nikula wrote:
>> Repeating the index link boilerplate everywhere is tedious. Put it in a
>> subproject-index.rst snippet in a new sphinx-includes directory, and
>> include it.
>> 
>> We'll have to use the relative include, because a) includes are relative
>> to the source file, b) top level include with
>> /sphinx-includes/subproject-index.rst does not work with SPHINXDIRS
>> builds, because the root is the subdirectory in that case.
>> 
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
>
>> diff --git a/Documentation/conf.py b/Documentation/conf.py
>> index 574896cca198..b9a43ee32a00 100644
>> --- a/Documentation/conf.py
>> +++ b/Documentation/conf.py
>> @@ -38,7 +38,7 @@ else:
>>  doctree = os.path.abspath(".")
>>  
>>  # Exclude of patterns that don't contain directory names, in glob format.
>> -exclude_patterns = []
>> +exclude_patterns = ['sphinx-includes/*']
>
> This doesn't work the way on might expect. The problem also affects
> patch 4.
>
> Basically, when SUBDIRS is used, include and exclude patterns need
> to be dynamically calculated, as, instead of building docs using
>
> Documentation/, the logic builds inside documentation/<directory>
>
> So, instead, you need to do:
>
>     dyn_exclude_patterns.append("sphinx-includes/*")
>
> To ensure that it will pick just the right includes directory.

Sphinx will only look for files within the source directory passed to
sphinx-build. With SPHINXDIRS, the Documentation/ is not it. There's no
need to specifically exclude anything that's outside of the source
directory hierarchy.

The whole dyn_exclude_patterns looks like overkill to me. It should just
look at exclude_patterns, and remove anything that's outside of the
SPHINXDIRS specified, and remove the SPHINXDIRS prefix from the
remaining ones.

In any case, the above exclude_patterns setting will work just fine.


BR,
Jani.


-- 
Jani Nikula, Intel
