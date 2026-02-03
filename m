Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A462EA490;
	Tue,  3 Feb 2026 19:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770147505; cv=none; b=nFQNqRQxGiaieXEFmk1Zs7gwlq/Q2LzXO9hMxTEvIOp27eqPR+I+8bDE90mriNbAsrgSQVvo6ak6g4hXcyUR6TEiGgLjV1bUN0Ia7ow3uXuUyYgC8KjSOiautik9FUG/g4AkJUdyY7UP2mkK658luTs+zdfWvN4KS3e0otJFSvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770147505; c=relaxed/simple;
	bh=prF0HdvAItJ09b4TcmhbRmm+vrtyhNWg8nCqivamja4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fvJxTqnGYCBSvCM5oXrWju1ImDGPrN4C49ET/6dO6SBzYBSWdC7Lxhr9aO2d+mYkTXNvdXZkNuhJHiJUhnDCPjdTgyy2OaLg3sAkEw79lbHJtWo0GMy5gdefEgF0+akdwe0Tq8Bre1VOGGK5TE8u4qwCAMvcBZw9q0eI08PfIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fau8gLzE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fau8gLzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770147504; x=1801683504;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prF0HdvAItJ09b4TcmhbRmm+vrtyhNWg8nCqivamja4=;
  b=Fau8gLzEaRNdyNdq+tBF8e0SIu4bTz9dscAZID0jhHFTYhNLZtMG6lza
   dcY2jpC6nqIjYSIwjdMbiDalXuqiHOzrtyE6Z9V1IO1zK3rJiyIsfO6do
   9R4gABp4S2Ll8oBfuM/rQheydym8mGu8UFIdKZZR7f8dqCe5I3+cbufGD
   0oaHhPhlHc4AbYRjeLoivUtuVbHQo6jSC/QD8bMMU1eNX4wx6RxMX2Ame
   5p4zBHQuBt78HXrv2olZBEhatVE0dgGSLwFs/IcTvpdppk0UYAuCEsbFE
   hMQ60mtCEmqW4W9cs9QhDdRN9bOxToQLYThkwvYf2Xew9uOQMcYD2hbff
   A==;
X-CSE-ConnectionGUID: 2ozm6TqQTgKgJajcaq4ltg==
X-CSE-MsgGUID: O/n4mi2eQ/mmSmfL0kpNjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88903176"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="88903176"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 11:38:23 -0800
X-CSE-ConnectionGUID: QJPgL9FQTCiv0DQDm+k30w==
X-CSE-MsgGUID: MW+isEBEQrep/kRSxHNMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="210036897"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 11:38:23 -0800
Date: Tue, 3 Feb 2026 11:44:29 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	nh-open-source@amazon.com,
	Nicolas Saenz Julienne <nsaenz@amazon.es>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Filippo Sironi <sironi@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Jan =?iso-8859-1?Q?Sch=F6nherr?= <jschoenh@amazon.de>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
Message-ID: <20260203194429.GA30254@ranerica-svr.sc.intel.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com>
 <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com>
 <878qd94zjo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qd94zjo.ffs@tglx>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Feb 03, 2026 at 04:28:11PM +0100, Thomas Gleixner wrote:
> On Tue, Feb 03 2026 at 13:36, Alexander Graf wrote:
> > On 03.02.26 11:32, Thomas Gleixner wrote:
> >> On Mon, Feb 02 2026 at 17:48, Alexander Graf wrote:
> >>> (Disclaimer: Some of this code was written with the help of Kiro, an AI
> >>> coding assistant)
> >> You could have sent your change log through AI too so it conforms with
> >> the change log rules ...
> >
> > Maybe we should introduce an AGENTS.md file in Linux that tells the AI 
> > tool to do that automatically? These tools usually don't read README 
> > files. :)
> 
> I don't care what tools do, but I very much care about what the people
> who use the tools do.
> 
> >>> +     if (panic_in_progress())
> >>> +             return NMI_HANDLED;
> >>> +
> >>> +     /* Check if this NMI is from our HPET timer by comparing counter value */
> >>> +     now = hpet_readl(HPET_COUNTER);
> >> And both you and your AI assistant failed to read through the previous
> >> discussions on that topic and the 10+ failed attempts to make it work
> >> correctly.  Otherwise you would have figured out that reading HPET in
> >> the NMI handler is a patently bad idea.
> >>
> >> I'm not reiterating any of it as it's well documented in the LKML archive.
> >
> >
> > Thanks a bunch for the pointer. I had indeed missed the previous patch 
> > set submissions on the same topic. Those look a lot more sophisticated 
> > than the quick hacky version I built. Nice! Oh well, at least I 
> > (re)learned a few things about the HPET along the way.
> >
> > Looking at the latest submission [1] (v7), I see patches but no reviews, 
> > no acks and no merges. Those patches also seem to address most of your 
> > concerns (obviously, since you reviewed them before :)). Reading the 
> > side conversation about it [2], it sounds like the buddy hardlockup 
> > detector is trying to fill the same gap as the HPET one and hence after 
> > that got merged, interest faded?
> 
> I don't remember. That thing clearly fell through the cracks.

My impression at the time was that the buddy hardlockup detector met the
goal of freeing the PMU counter and there was little interest on using the
HPET.

> Let me find it again and reply to that.

Does this mean that there is renewed interest for this?
