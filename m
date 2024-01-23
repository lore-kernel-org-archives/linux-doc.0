Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C231F210E0
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706013049; cv=none; b=azF1aw8hnnQXJZ0WkksxTp5TRRAu8Stcgs4qdC4fF6lQ3WQRuMTvKq8jHe2kKIt//o95ahiykawNnzeEh2CSLb5m21FErcCb+AD7QssG/PWf7+VR60Qlp7Mzzka5C2YzKyUY5S4eW+cjfL9wHNCBvbqCKgKRzfFU11g8iVcyXG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706013049; c=relaxed/simple;
	bh=0av8QbAgaMrfh75XLhRBea5d87Jl3RmmBMGtpAjtqio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VXs2Bd1UvQhs4KTThs9OZhK5xYqQ3Z32W48Be50FEqcedykt1uEChH0R7M4Ltyg3BJwozmJIcynG9yUxsI+qUXudoBRR8WRDnymIXRfZE8GjHPfSaWT8mBK04xPkVPCt8lpmLy6wu8jcQcR4Z2d9li0o+RbH1PeZp9t/8bF1B9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hJtRJCsw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hJtRJCsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706013048; x=1737549048;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=0av8QbAgaMrfh75XLhRBea5d87Jl3RmmBMGtpAjtqio=;
  b=hJtRJCswf9d8fbK6qSq0+3nc6dS9W9SZJdWfqa+Qyp2WDgP48hPr/nyj
   MlUf3L46QhrczV7q/m+SLHZv4gdhCVMVZjhCEyZKWRjqt2uUiBssQqNwv
   BkhlwVWZNPRFyps0sBMY4Btv5k9P5VRRYBDbf+OVixnz6q6ByhKd43yj8
   6lfpTIDfIFSm0EuHFSqEaakICnUnJkyYuCLBAd0pES0jf1W+bteeUkNO9
   u5dCiEob0KwrYfdDy6A3QnQKYbf9WjFpVXR7G3iyk1KvKx1y4hCTtbx31
   G+nuIPLwfbC7oKbC1mGvVUNRnuiEcQYcF2TwsmObBbhR18RscpKPgMvs2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1357281"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="1357281"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 04:30:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929319688"
X-IronPort-AV: E=Sophos;i="6.05,214,1701158400"; 
   d="scan'208";a="929319688"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.40.183])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 04:30:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Vegard Nossum <vegard.nossum@oracle.com>, Akira Yokosawa
 <akiyks@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: docs: requirements.txt has stopped working again
In-Reply-To: <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cb72b3d6-de7a-4c8a-a99c-72d58a23f89c@gmail.com>
 <b0ddcb5d-e735-437c-a828-5e400facb978@oracle.com>
Date: Tue, 23 Jan 2024 14:30:32 +0200
Message-ID: <878r4gnsev.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 23 Jan 2024, Vegard Nossum <vegard.nossum@oracle.com> wrote:
> On 23/01/2024 05:14, Akira Yokosawa wrote:
>> Hi all,
>> 
>> Annoyingly, installing Sphinx 2.4.4 using requirements.txt of v6.8-rc1
>> ends up in a run-time error which looks similar to the one Vegard
>> reported in commit f4cac0f74658 ("Documentation: constrain alabaster
>> package to older versions").
>> 
>> The new error is from sphinxcontrib.applehelp which reads:
>> 
>>      Sphinx version error:
>>      The sphinxcontrib.applehelp extension used by this project needs
>>      at least Sphinx v5.0; it therefore cannot be built with this version.
>> 
>> Do we want to continue whack-a-mole update for Sphinx 2.4.4?
>> 
>>          Thanks, Akira
>
> Can we have requirements(-latest).txt and requirements-2.4.4.txt?
>
> The thing is, we are not using new features of Sphinx in the kernel
> docs. We don't fundamentally require a new version in any of our .rst
> files or markup, these aren't security issues being fixed or bugs that
> we've run into, the problem is purely that we are using a software
> ecosystem that apparently has no restraint when it comes to breaking
> their users.

We do use at least namespacing which was new to Sphinx 3.1. And we could
use more if we weren't so conservative about the versions.

> My issue with _requiring_ newer versions of Sphinx is the fact that they
> have performance regressions: 4.3.2 takes 3x longer to run than 2.4.4 on
> my laptop. You need to go all the way up to 7.x in order to back to
> reasonable performance -- and that will probably be too new to support
> most of the distro-packaged Sphinxes.
>
> If we have two or more requirements*.txt files, we could just freeze ALL
> the dependencies for 2.4.4 at versions that we know to work. That should
> stop the whack-a-mole for that version. And then we don't have to force
> everybody on to newer/slower versions.
>
> I mean, I can also maintain my own requirements-2.4.4.txt on my local
> filesystem but I think it's better to do the right thing out of the box
> for all users, no? Maybe we should also add in warnings about the
> known-slow Sphinx versions.

If you're using distro-packaged Sphinx, or use pip system/user install,
specifying exact package requirements like 2.4.4 does not really make
sense to me. I don't want kernel requirements to interfere with whatever
else I'm doing. You should just specify the minimum Sphinx version using
needs_sphinx in conf.py, maybe based on [1].

On the other hand, if you're using a virtual environment, what's the
point in holding back to a version as old as 2.4.4? You might just as
well go for latest, specifying only the top level dependencies,
i.e. sphinx and pyyaml. Or you could pip freeze all the requirements at
a relatively new known good configuration. That's kind of the idea with
the virtual environment.

That's really the only two (or three) approaches that make sense to
me. Using a virtual environment to use ancient versions is just weird.


BR,
Jani.


[1] https://lore.kernel.org/r/a445d391-4cc9-4d6d-85ad-02d23aa57ebb@gmail.com

-- 
Jani Nikula, Intel
