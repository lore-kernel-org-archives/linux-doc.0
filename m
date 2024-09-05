Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F061A2570
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 12:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538852; cv=none; b=skrmDGR/Ixcyr/xvanQcJb5K5boSLqYfHHkYr1nv+r6h4tf6M0xMKKaVYpHTzIm7ipuj8T6ys/LyGqmE5MWO9NZvx2Cy1Cc81UCTe9q43aOnnDcJjj1vi8+jRMEmGmqxpO1tF3s5unPOqb69tSm/Yu5qkKJu7lyl/9Jw76A9m0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538852; c=relaxed/simple;
	bh=edhhjQ8EWhG+zOMTEE9w13COt9ker4VTPe7c56B1cHs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G8B9n8Tbe16c5BlnDo71qCx+XRDR/mqVjCoUQd1YGUy+qt/7nPXrqDfs1x1lbEfk5MyxrlzKBthzQ15knypCZ2lzg9Zb0DdKWevUppyKXd03GLCQGIY93/Xg2K/bJLeirTuVrfNzHFHBKOQ0YMjvsGvNczX9fk2kitF3vCctiME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fM8nj0Pz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fM8nj0Pz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725538850; x=1757074850;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=edhhjQ8EWhG+zOMTEE9w13COt9ker4VTPe7c56B1cHs=;
  b=fM8nj0PzIkRvo3v03ITK4ZmTZUWddXxKaRgeqrl2DEnGi2hImoQ8RMMX
   PuCdynMiTSfmWKqfLkln4pLqLTW8aV9g6jPdbPU6A49K6MtnGP6UyL/K8
   nZclN4eOShuFbCdAm/0wJK/t3idK7rbnan46WgyAFneYHWORbRGvT5R8t
   ak6FFti1Ky/ZXaiZFR3+3cBmIZN6REOrOSBIXr5YLy6ISIB9wP79c9Uoa
   EkPD2Crmwccf904DF9y8HtEWuO4++w6HJ1JSBQFaa3eFRY6d0AIPsTtkw
   Ad85pGPLRObekmba2zZlpytIEGlyLG4wif0amCHSOPQrb8zjmHKqrkPRI
   g==;
X-CSE-ConnectionGUID: ACxLp95sQyqAJr0vPsBM/A==
X-CSE-MsgGUID: 9ikTw7Q7TSqui84TVB1BOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34916167"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="34916167"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:20:49 -0700
X-CSE-ConnectionGUID: b4KDMjy5S1GLMnkIFQ4oWQ==
X-CSE-MsgGUID: JCCPP161QZWGOnW17yMqBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; 
   d="scan'208";a="65926938"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 05:20:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: bernhard+linux-doc@lsmod.de, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-doc@vger.kernel.org
Cc: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
Subject: Re: [PATCH] docs: Build kernel docs deterministically
In-Reply-To: <878qw6qpbu.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240905113531.65375-1-bernhard+linux-doc@lsmod.de>
 <878qw6qpbu.fsf@intel.com>
Date: Thu, 05 Sep 2024 15:20:44 +0300
Message-ID: <874j6uqokj.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 05 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 05 Sep 2024, bernhard+linux-doc@lsmod.de wrote:
>> From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
>>
>> Because we want reproducible builds
>> and https://github.com/sphinx-doc/sphinx/issues/6714
>> did not receive any love from Sphinx devs in five years,
>> let's disable parallel doc builds until that Sphinx issue is fixed.
>
> You mention in [1] that this is likely a duplicate of [2] i.e. multiple
> Sphinx instances running in parallel and racing in doctree access.
>
> In kernel, does the issue then boil down to:
>
> htmldocs:
> 	@$(srctree)/scripts/sphinx-pre-install --version-check
> 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
>
> i.e. multiple Sphinx invocations instead of just one?
>
> Broken record, I still think we should axe the Makefile hacks out of the
> Sphinx build altogether, and let Sphinx handle everything, via
> extensions if necessary.

Indeed. On my machine, 'make htmldocs' spawns eight sphinx-build
processes, each running with -j8, and each racing for the same
doctrees. And the whole thing is apparently parallelized to 64 threads,
which is unlikely to be the most efficient.

There's no reason to blame Sphinx upstream before we get our end
together, and run Sphinx as it was designed.


BR,
Jani.


>
> BR,
> Jani.
>
>
> [1] https://github.com/sphinx-doc/sphinx/issues/6714#issuecomment-1848975385
> [2] https://github.com/sphinx-doc/sphinx/issues/2946
>
>>
>> This patch was done while working on reproducible builds for openSUSE,
>> sponsored by the NLnet NGI0 fund.
>>
>> Signed-off-by: Bernhard M. Wiedemann <bwiedemann@suse.de>
>> ---
>>  Documentation/sphinx/parallel-wrapper.sh | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/Documentation/sphinx/parallel-wrapper.sh b/Documentation/sphinx/parallel-wrapper.sh
>> index e54c44ce117d..cb93626bd86e 100644
>> --- a/Documentation/sphinx/parallel-wrapper.sh
>> +++ b/Documentation/sphinx/parallel-wrapper.sh
>> @@ -10,6 +10,9 @@ sphinx="$1"
>>  shift || true
>>  
>>  parallel="$PARALLELISM"
>> +# Because of issues in Sphinx(https://github.com/sphinx-doc/sphinx/issues/6714)
>> +# we disable parallel doc generation to get deterministic build results
>> +parallel=1
>>  if [ -z "$parallel" ] ; then
>>  	# If no parallelism is specified at the top-level make, then
>>  	# fall back to the expected "-jauto" mode that the "htmldocs"

-- 
Jani Nikula, Intel
