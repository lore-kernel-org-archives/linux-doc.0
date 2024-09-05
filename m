Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5672119CCEC
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 14:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545289; cv=none; b=A98ZKzu1/7Ycd8MFtBM/XsCcgRVSKFhu5qrtI1J2M/okbGMqsAKO3W1gU09bNL2nwjEsK+tx+rl/3yrmztTincOIctbLUSBm7CTb3xQeVtjwA35VrsAoJnyd0dUroikUvfsMp5cPogP+OaYjOUdU6F6VZW6T5T2S10RnyPnZc4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545289; c=relaxed/simple;
	bh=lwuoKIiGUuursFBBx7Df6U99jVADclS/MWaPHgdVXYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OUJB7PcE0QBqVirO5CfNjMkrgUJJB48FoJDJ49oUB8NTkeC+fdhNwXrNphUbE5muj1c9gb4Z9FdPFL3k1nKbw7wYO97A2sxZqrhth0c42lutx7rMa2Rve6H4W+gwFnbwpVyVVD0durJSEqoaMw/zL1VfIbs5D3v5BFfZy/lX+2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKP/8eAG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKP/8eAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725545288; x=1757081288;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=lwuoKIiGUuursFBBx7Df6U99jVADclS/MWaPHgdVXYM=;
  b=GKP/8eAGt3YrIgXmTGnc/+dA/3jXZoIjpfpUzTRT3rhwgYaLkesC9HzZ
   HpIsLv+H/LtuNrH3w8YbSon/IVW1xQJbQlAPyxezWpqOyeoNZxWDgrHX9
   h2Dxr0PyvmdBfjHlFEfKHwsKLk45al4L9A2WIfDQF09M3+6Q7WbgKcWcm
   ABiblBrRN3B79NtOlK5RvBu1d6dPwMzo1j9IZ8g7CEQF9axP6vuanH0mh
   XB/NPnKLc4cPegzXQ7YJd63982DhtteK4B5csXy2UMEvkGw1Z0fDXz3vT
   jbkSIYd3azbtKiPBpY4ayAt74o/S8zdjqX0U8Uht6oX3uyJq1Jc1mLxSi
   w==;
X-CSE-ConnectionGUID: AJJB9JwiQxKCaQ1JbyI7sA==
X-CSE-MsgGUID: dtzoyLm3SUi0LsioV0CzvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24126053"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="24126053"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:08:07 -0700
X-CSE-ConnectionGUID: I9S6kycbS6qol1nok7LxqA==
X-CSE-MsgGUID: qU8qyvT+TQC8fjdEUxrKIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="96381500"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:08:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, bernhard+linux-doc@lsmod.de,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <a2bda8df-b484-49e6-9e01-92e6cdf4db44@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com> <874j6uqokj.fsf@intel.com>
 <a2bda8df-b484-49e6-9e01-92e6cdf4db44@oracle.com>
Date: Thu, 05 Sep 2024 17:08:01 +0300
Message-ID: <87plpip51a.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> On 05/09/2024 14:20, Jani Nikula wrote:
>> On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>>>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>>>
>>>> Because we want reproducible builds
>>>> and https://github.com/sphinx-doc/sphinx/issues/6714
>>>> did not receive any love from Sphinx devs in five years,
>>>> let's disable parallel doc builds until that Sphinx issue is fixed.
>>>
>>> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
>>> Sphinx instances running in parallel and racing in doctree access.
>>>
>>> In kernel, does the issue then boil down to:
>>>
>>> htmldocs:
>>> 	@$(srctree)/scripts/sphinx-pre-install --version-check
>>> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>>>
>>> i.e. multiple Sphinx invocations instead of just one?
>>>
>>> Broken record, I still think we should axe the Makefile hacks out of the
>>> Sphinx build altogether, and let Sphinx handle everything, via
>>> extensions if necessary.
>> 
>> Indeed. On my machine, 'make htmldocs' spawns eight sphinx-build
>> processes, each running with -j8, and each racing for the same
>> doctrees. And the whole thing is apparently parallelized to 64 threads,
>> which is unlikely to be the most efficient.
>> 
>> There's no reason to blame Sphinx upstream before we get our end
>> together, and run Sphinx as it was designed.
>
> I don't reproduce this here, either with plain 'make htmldocs' or 'make
> -j8 htmldocs' -- in either case the process tree is:
>
> make ... htmldocs
> - make ... htmldocs
>    - make -f ./scripts/Makefile.build obj=Documentation htmldocs
>      - /bin/sh -c make ...
>        - python3 ./scripts/jobserver-exec sh
> ./Documentation/sphinx/parallel-wrapper.sh sphinx-build -b html ...
>          - /usr/bin/python3 /usr/bin/sphinx-build -j... -b html ...
>
> Neither the $(foreach) in the Makefile nor $(call loop_cmd) should
> result in parallel invocations.
>
> Could you double check the process tree once the "Using alabaster theme"
> message has appeared?

$ pstree -A 3457144
bash---make---make---make---make---sh---python3---sphinx-build-+-7*[sphinx-build]
                                                               `-sphinx-build---perl

Maybe try after 'make cleandocs'.

BR,
Jani.

>
>
> Vegard

-- 
Jani Nikula, Intel
