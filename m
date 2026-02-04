Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7A3ACEED
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 11:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770203190; cv=none; b=P4sMScRoWbq49SH6i/3j/7ctXnWeA6NPgrub7fSKEITTz1YZyoO55FfovNg2raMyVQAT5F/XgL8pUcUaQo3nPjkmtgH5TvierVbJLB59NSxmsn6B+WJHokANI3CR6DtN/eXh8+LbotmOMAYw/IXkSW1Cv9fO0ExRK1FCXOcqtoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770203190; c=relaxed/simple;
	bh=Rm+Rcc1fyjlfMzyEB5y89fwjTnN9y1aD7W9Fg45LmZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KvcurIIAJ3hlYDktFjM+HnKvXDRtAdIpYbFNEJFoDFOsmC9sXoFwyJ5ReFjNx4wSFm6SZVyqsV9kyFK0jNBpqjG4rGbP/cvhf6ZTijMlqMjd4JtbFGKAsrQkTvwXykEUeNsrf2uLzJ+vAU7aGT+sztXv11c/uU5syQ8tlatidFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0SfGhjt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0SfGhjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770203190; x=1801739190;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Rm+Rcc1fyjlfMzyEB5y89fwjTnN9y1aD7W9Fg45LmZc=;
  b=Q0SfGhjtB/giBa/X8xrAVOlmA0pTbvApaCy9wjmj1xmFqCjHvm8ctWAB
   4ChM5aA3em5sYD1hdZKV/WaXx2Yw49Z9WcIfn1xcsQJKheP/MfYdu4f6d
   iLibdyQ/QLc1ZSGIGOfcFZDmQS3iO/y758vKRyuJ1mPeGIBcS0DoQELdX
   7eNgINWw0E8dUqgQ7I8U8oshrjyBGRnoVHLLHy2iM/MUtiwM46JN5Uz5f
   yKspil9KobdLtcAyYpKLoaFdzYYyEdsB47EAkBVCghSECZoiVr+Keni8Q
   nfuulr2bOtqVblG2HJ6aIW50A5mEGLvkQkZ0ntSxmQa1ucyLImqyraQAx
   Q==;
X-CSE-ConnectionGUID: OxVFtY4tR6WCguXOKtDyBA==
X-CSE-MsgGUID: MWd03ROnSrew9/2pW9+Aiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71116698"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71116698"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:06:30 -0800
X-CSE-ConnectionGUID: kE6diqJbSWik61FY/ZI86w==
X-CSE-MsgGUID: 6Nd2KMAnRi+20xa6kLp2vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="210168304"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.7])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 03:06:27 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 0/3] Some kernel-doc fixes
In-Reply-To: <20260203160536.41c30f47@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1769500383.git.mchehab+huawei@kernel.org>
 <87bji7rsf9.fsf@trenco.lwn.net> <20260202191506.0aaee18e@foz.lan>
 <0499f2060a181fa9997b32e2cd6ec88109159751@intel.com>
 <20260203160536.41c30f47@foz.lan>
Date: Wed, 04 Feb 2026 13:06:24 +0200
Message-ID: <97e595a4082cc79ecec698cda1fb3dbaf6e94c70@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 03 Feb 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> ... pyyaml output is not user-friendly. Maybe there are ways
> to make it use a more compact/nicer notation, but digging
> into its documentation is not easy:
>
> 	https://pyyaml.org/wiki/PyYAMLDocumentation
>
> and it is not complete.

Side note, I really like using StrictYAML [1] with a schema for parsing
YAML. It's maybe slower, and probably won't help with the output either,
but the YAML type safety and validation are such nice features. (See the
Norway Problem.)

BR,
Jani.


[1] https://hitchdev.com/strictyaml/

-- 
Jani Nikula, Intel
