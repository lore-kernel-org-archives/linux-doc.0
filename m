Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480711B394F
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176058; cv=none; b=QadQFP7sZVmvBJr/kPYCRkyvvpKZMbuSrR42XDWHZ1sLULmeeT34YD6VSBGO80RV/QkhSAS3Cm8qd/hRi2hgCkgdHs287oOrNtWWsyNJoDPHOZaOGR6k8jPPmSDgmB5Kz1IYtBxrStJQrdacMbfUGBxH8eE5BNkdZg99BZ5Gvdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176058; c=relaxed/simple;
	bh=Jsiv4sbzZUfpagNWCymN85Wf6tQE0x+LTSh0LlUmF+8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KT++35wyTfcd9JukaR2Z9PLUDGI/s3tw/leB2Q2G7cofYq1sUZlhEl1t3HE2TnHJm2eFVpY7QoltaVv56t2L44u2f4nWNusp8ifaSxwWlVXSxAfKovqM/YCUCoiZV0Banu01zwvLA8vVUTJmnyrJyZDrfCZEr52t4wMT6Dir4+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgpdzIrW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgpdzIrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769176055; x=1800712055;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Jsiv4sbzZUfpagNWCymN85Wf6tQE0x+LTSh0LlUmF+8=;
  b=dgpdzIrWm4bk4RgltHmzEW/9z7tTiJqg0OJjLna6RENcyyCxAIXGX5ev
   qozKu514r1mO8tgRspgP9cdwTS3nCVVFZ871jtBj1y1cjBek/om5PZtjN
   152MSIAkXcUDYtX51z7RWxXPPbhM+MLAMmaobVfC1Kj12MdyxCRjiXlsu
   Q5hcDTKByb6bCL1pfqQwU9JHQ/FWDYLMuVMIzBmq5Ku9KX6VLRxJYoni9
   WU7kZuqWmxlVSMUpLjiLqJpukFWr0Bi7C/+vi58+Q5CKvdFTu6dY5ewzR
   ImMilbwz9MGhPhDe1wEpdnsKGazv2aqyglg4CceJOOvEFLxNe8/m95h7h
   w==;
X-CSE-ConnectionGUID: wBlnHIXfT7SFITxVKJBSGQ==
X-CSE-MsgGUID: HpRYZlPrRw+6Ui0pR85ScQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70148502"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70148502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:47:35 -0800
X-CSE-ConnectionGUID: 6Rz7lrEeRDWP+iE1zNgnQg==
X-CSE-MsgGUID: xe2clPcsQqOfc08M8MIIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="207082793"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.2])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:47:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
In-Reply-To: <20260123123215.32f6c40a@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
 <11148f49962022fde99058c15345add4935bbeff@intel.com>
 <20260123123215.32f6c40a@foz.lan>
Date: Fri, 23 Jan 2026 15:47:30 +0200
Message-ID: <233a2366263111e61700da07f3692a029fc51a50@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 23 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> On Fri, 23 Jan 2026 13:06:51 +0200
> Jani Nikula <jani.nikula@intel.com> wrote:
>
>> On Fri, 23 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> > I was trying to get the regular sphinx-build output.
>
> Just do:
>
> 	$ make V=1 htmldocs
>
> or:
> 	$ ./tools/docs/sphinx-build-wrapper -v htmldocs
>
>> > The monster sphinx-build-wrapper thing has this obnoxious and complex
>> > logic of forcing -q unless you specify verbose in SPHINXOPTS. You'd
>> > think those defaults should be specified in the Makefile. But no.
>
> It is like there to mimic what we used to have at Makefile.
>
>> > Anyway, setting SPHINXOPTS in the environment or on the make
>> > command-line doesn't work, because Documentation/Makefile overrides it
>> > to empty.  
>> 
>> Oh, it's more sad than just this. There is no way to use SPHINXOPTS to
>> get sphinx-build to produce the regular non-quiet output (that the
>> wrapper calls verbose).
>>
>> You have to use KBUILD_VERBOSE to make the damn wrapper not pass -q to
>> sphinx-build. 
>
> KBUILD_VERBOSE is the Makefile's env var that handles V=1.
>
>>The wrapper appends the -q overwriting anything the user
>> might want to pass on SPHINXOPTS. Which can't be passed anyway because
>> the Makefile overwrites it.
>
> It is like there to mimic what we used to have at Makefile: it was
> was always passing "-q", except when called with V=1.

I don't want verbose output from e.g. kernel-doc saying "Scanning doc
for function" bla bla blaa, but I do want the regular Sphinx messages on
what phase of the build it's at.

There doesn't seem to be a way to get the regular Sphinx "not quiet, not
verbose" output, without also going verbose on silly kernel-doc
messages.


BR,
Jani.

-- 
Jani Nikula, Intel
