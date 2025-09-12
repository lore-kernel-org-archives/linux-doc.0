Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602BD2D593F;
	Fri, 12 Sep 2025 09:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669026; cv=none; b=IEvy2OFK/Tw+Zhfm6h/z0OkTL+2teJ0C/i8NToDwFVAnCjH/EM3IPOFf/uoUcqvsAWEEBHNDyWZgNkwLn/qsUmPfSETOPzTnqsYRHkt+6dAr8EhzViNqksV6Sa5D+jNJTEDZEZTNFIJN+okDnX/p+qxvn81BjqG2pY0lG3bM0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669026; c=relaxed/simple;
	bh=lai77bJDzPFtz0dUrhqo0rWWPZ9PGqJKeSBRFZyk7BA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oS0SUycEd7xs2n7AoLGRwADZRig+ZAtP/8ykjkQNUzFPNscUtvbvqS+57fbr3ONNiFBINDHn4oltfLLqmPExK8mDaX+YNFfZ7ljABfyNyZkHRm99srR5VpxiyKtzSMsm+PNqIgs4qVi4KLZ8BszS1KArhlNZI2ujrWjCwPlZ1AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HJpVMAA9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HJpVMAA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757669024; x=1789205024;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lai77bJDzPFtz0dUrhqo0rWWPZ9PGqJKeSBRFZyk7BA=;
  b=HJpVMAA9pn19EO4bY8RI3tmRVKq5x8GQboBGhmqDqONfJbIYbvgLYd3+
   zksTTHvSyIJLIOgNbaKPDlkHpgOrEpf8fuML94KQdefPgyqwYsF1gMJN/
   xh0xw68ufi6JlRLDt3WAOtG+qp1TGmzBxmoWnKlMt/uimHagdIHIovn5l
   TjznJgKePBYj3yyplnTBIvTRFbqv/0ORFgdE/F087V3zi2fhFzuOW3C88
   L+C09J55SAhHQ16wsPrJmbodNqcHm60mxrfF6n15ygXwGjvBs2BxwVZ/D
   7inoOZNxv090CcdNzxs+F7uYAslfKc4DEfCM8a2lhfT88Udu9G0JJkug4
   g==;
X-CSE-ConnectionGUID: P7+FaJbpQGWwVP4oIQgCPA==
X-CSE-MsgGUID: GD2bBOmDTdat8HA5M4k3OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="59050908"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="59050908"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 02:23:43 -0700
X-CSE-ConnectionGUID: A8DpKq00SjyebyC4A8lvIA==
X-CSE-MsgGUID: HPt0v/19RoqxW744QXSE4w==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.177])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 02:23:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 12/19] docs: Makefile: document latex/PDF PAPER=
 parameter
In-Reply-To: <20250912105618.10e7953e@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1756969623.git.mchehab+huawei@kernel.org>
 <52411bce7bf0d068bfc8e33b35db3259c3ae0c64.1756969623.git.mchehab+huawei@kernel.org>
 <d20b612ee510c65dcd60183eda5068b164294759@intel.com>
 <20250912105618.10e7953e@foz.lan>
Date: Fri, 12 Sep 2025 12:23:38 +0300
Message-ID: <afdbf04ade2d9bc0eb9b83639b31ffe65e0ad2c7@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 12 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Em Wed, 10 Sep 2025 13:54:07 +0300
> Jani Nikula <jani.nikula@linux.intel.com> escreveu:
>
>> On Thu, 04 Sep 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> > While the build system supports this for a long time, this was
>> > never documented. Add a documentation for it.
>> >
>> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> > ---
>> >  Documentation/Makefile | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/Documentation/Makefile b/Documentation/Makefile
>> > index 4736f02b6c9e..0e1d8657a5cc 100644
>> > --- a/Documentation/Makefile
>> > +++ b/Documentation/Makefile
>> > @@ -126,4 +126,6 @@ dochelp:
>> >  	@echo
>> >  	@echo  '  make DOCS_CSS={a .css file} adds a DOCS_CSS override file for html/epub output.'
>> >  	@echo
>> > +	@echo  '  make PAPER={a4|letter} Specifies the paper size used for LaTeX/PDF output.'
>> > +	@echo
>> >  	@echo  '  Default location for the generated documents is Documentation/output'  
>> 
>> The Sphinx make mode 'sphinx-build -M help' provides all of this and
>> more...
>
> So? Relying on a help message from sphinx-build would just make
> our makefile fragile.
>
> btw, it didn't work here:
>
> 	$ ./sphinx_latest/bin/sphinx-build --version
> 	sphinx-build 8.2.3
>
> 	 $ ./sphinx_latest/bin/sphinx-build  -M help
> 	Error: at least 3 arguments (builder, source dir, build dir) are required.

'sphinx-build -M help . .'

>
> Thanks,
> Mauro

-- 
Jani Nikula, Intel
