Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AAE23BD17
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768310822; cv=none; b=slbrElkczYbmevsWBykI7zXYvctnq+sMlIKhSafmiYhJX9i5bcICjnV+7xPUuL9uFE27ZLiwVrw5RFEXt6+mGekRrkb34BNZaJIluBxe/CMdaZgnPeuYqp0i9lgm/APnmiuGL3ZjccdNWkhZPKeG+X0iScTEZ3kFZBRMqP8V08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768310822; c=relaxed/simple;
	bh=+Pa+VjrSTZp+uc4bOfrQnQ+8p55J9vc+37uduEZVmEM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i6VVHomqpyeqUw3bMdEvA54TQ5vSoZ/ssXX0subIGML0S2zpF0DWHHuQ3+HCS1xBSl2R+8xwPDB6mbkf5KVhn4BKwTAC0y32PiS8+adWBNhiVbkUCv4F/sJGvl4jkEHUseamhfYsPjGXCbmzElODhaMAYvUgordlTD0EprGcdSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEgRRLJN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEgRRLJN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768310821; x=1799846821;
  h=from:to:subject:in-reply-to:references:date:message-id:
   mime-version;
  bh=+Pa+VjrSTZp+uc4bOfrQnQ+8p55J9vc+37uduEZVmEM=;
  b=AEgRRLJNMeG9IR1ijzQ9CIn/J1wjO67r0Os8n7QY4HR+F4ghVR1U0Des
   e7LxZO1hCtvyOe36Z0UWZOtiWGXmZrxA2TtKWqffRVjf7ktesJxjzjvLh
   6zU99JkUz460auiaJXd202CSMqP0RqiRuZZNnI4R7AjZa2pedn51QV3Bc
   EQq4/PJXphK0md2VAeN4U8ulEct5kbla5mVqSFCWZbeQvFIX+syZWd4a4
   /9V7AJiETi96X+WzQz1iyNAapxQzh+AewHKpkRCZd1Fyv3bqXINDDH39m
   wVjJEOEUSoWFgefcLKQWwscwk3UWJ+JIWLnyIBaxhqeqkEcHtlkUvn1cl
   g==;
X-CSE-ConnectionGUID: dW1cq2ecRpqWZ7oQfQDQzg==
X-CSE-MsgGUID: SNQF0k8tQaa7O7xUeLfjHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73436149"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="73436149"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:27:00 -0800
X-CSE-ConnectionGUID: Uo8CojGdQ6uQm3QVhOlPNg==
X-CSE-MsgGUID: NjQH3I94Qp6fp9pE+rwB4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="235095427"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.36])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 05:26:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Petr Vorel <pvorel@suse.cz>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: Links to sources in docs
In-Reply-To: <20260113123203.GA320708@pevik>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109173112.GA105682@pevik>
 <7b0539f874af71c899c21acfd71288fe7a2d8246@intel.com>
 <20260112132613.GA266368@pevik> <20260113123203.GA320708@pevik>
Date: Tue, 13 Jan 2026 15:26:55 +0200
Message-ID: <5e697ed9df17a93570dabcf4728c6d5d2132598b@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 Jan 2026, Petr Vorel <pvorel@suse.cz> wrote:
>> > On Fri, 09 Jan 2026, Petr Vorel <pvorel@suse.cz> wrote:
>> > > Hi Jonathan, all,
>
>> > > I wonder how links in sources work.
>
>> > > Documentation/userspace-api/check_exec.rst has:
>
>> > > `samples/check-exec/inc.c`_ example.
>
>> > There's this bit at the end of check_exec.rst that defines the link:
>
>> > .. _samples/check-exec/inc.c:
>> >    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/samples/check-exec/inc.c
>
>> > The content within the backticks is just the link text, and has no
>> > filename semantics. See [1] for details.
>
>> Thanks for a hint, I overlooked it.
>
> And I also wonder what does clickable links (e.g. [1]) in
> Documentation/process/adding-syscalls.rst [2]
>
>     - commit 75069f2b5bfb ("vfs: renumber FMODE_NONOTIFY and add to uniqueness
>       check")
>     - commit 12ed2e36c98a ("fanotify: FMODE_NONOTIFY and __O_SYNC in sparc
>       conflict")
>     - commit bb458c644a59 ("Safer ABI for O_TMPFILE")
>
> I haven't found anything in the document itself, nor in conf.py.

It's the automarkup extension, configured in conf.py extensions, and
implemented in Documentation/sphinx/automarkup.py.

BR,
Jani.

>
> Kind regards,
> Petr
>
> [1] https://git.kernel.org/torvalds/c/75069f2b5bfb
> [2] https://docs.kernel.org/process/adding-syscalls.html#references-and-sources
> ...

-- 
Jani Nikula, Intel
