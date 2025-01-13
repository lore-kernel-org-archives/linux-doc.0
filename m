Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872EF22A4C9;
	Mon, 13 Jan 2025 12:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736770611; cv=none; b=laNUvsK2qPTDFwmerxh7LP8uteacQxJOcChgHUUA+HGp6/mz51jGENp6Hw9/Ve657sMLE1c5nG8FmIBuqD4c2nhTvJLtK/rwMdcOg6Wma3QgzEi1cA7mVVrqPIT+jXm9I3VzNqgLwyMJyEzucd0wAwLaEob0K5QXovA+IsK5Oyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736770611; c=relaxed/simple;
	bh=4fuHOOqf4fX5zuPqzSNqPphlWuKcCa9nQDQp1wHF7Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iswz7lEja6K18GuUWgKcfZ1f8A3sti+3/fqg3YuUmj5Wjha1Mp9Ssph9yIvSmBGyvotY8zuftygmzMv4n0xXGmT2G88shhRRiz1UXOXC93avJU98cGdF2NxsK9hVUCspORy4o9iO65Ei2+lk0FGks4nQhneIgwe/A8U49g2d1x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZY9yAr0M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZY9yAr0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736770610; x=1768306610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=4fuHOOqf4fX5zuPqzSNqPphlWuKcCa9nQDQp1wHF7Ps=;
  b=ZY9yAr0MbP0+zxj0otfOM7foUjtvPrxy3V8L5CiiZmBPnFfEZSjrwhIG
   09nvhFHNL7FWxwyqv7+QdCs4pD4AmIl+K+9nj+7UOsQhg3F0M0rMoZApx
   mpGnrHfIDlZrRV6SdvjATczwlU/Swa4DFbD9ozpdB9lVT258KcR1ZBkNJ
   XgvuNTJoKNvMw2ihrNoMAGEA5oNYCmLj0Aafi8l85Npe/5D1YGaIHuWnH
   ioDpIjQ5fjkMyoF3NNk1Tpx4mRcgiTYa2aUxcJmj35m+3pPjsG+J1aLy3
   f2zEs6CRfUecJ4umZe5nTsZ4hbsY6ItMnkRCFlFZ/wodVzbFb60B8ze5q
   A==;
X-CSE-ConnectionGUID: BhKhzdPhSoat8UJcRJqxZA==
X-CSE-MsgGUID: Wg7wkUxuQkm4gZrwHI6fyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="47694994"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="47694994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:16:48 -0800
X-CSE-ConnectionGUID: hQ1gSaCqT8qIgy9J96Nm8A==
X-CSE-MsgGUID: a6O12/auQgWoYwFmGoMBgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104348429"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:16:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXJN4-00000000SCK-13ep;
	Mon, 13 Jan 2025 14:16:42 +0200
Date: Mon, 13 Jan 2025 14:16:42 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hexdump: Allow skipping identical lines
Message-ID: <Z4UEKtKwUg1LRaK5@smile.fi.intel.com>
References: <20240826162416.74501-1-miquel.raynal@bootlin.com>
 <Zsy8JPaiGknBypw9@smile.fi.intel.com>
 <20240827110147.29a7481a@xps-13>
 <Zs3UrlufPJ9wVyep@smile.fi.intel.com>
 <87frmdnvkl.fsf@bootlin.com>
 <Z2rYBc7QTTvviT3s@smile.fi.intel.com>
 <87ed1p2yjm.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed1p2yjm.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Dec 30, 2024 at 12:35:57PM +0100, Miquel Raynal wrote:
> On 24/12/2024 at 17:49:25 +02, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Dec 24, 2024 at 12:56:26PM +0100, Miquel Raynal wrote:
> >> On 27/08/2024 at 16:29:18 +03, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> >> > On Tue, Aug 27, 2024 at 11:01:47AM +0200, Miquel Raynal wrote:
> >> >> andriy.shevchenko@linux.intel.com wrote on Mon, 26 Aug 2024 20:32:20
> >> >> +0300:
> >> >> > On Mon, Aug 26, 2024 at 06:24:14PM +0200, Miquel Raynal wrote:

...

> >> >> > Also here is the formal NAK till the series gains the test cases.
> >> >> 
> >> >> What test cases are you talking about?
> >> >
> >> > Anything meaningful you come up with to show that the printed data is
> >> > what it's expected. The module has a complimentary test case,
> >> > lib/test_hexdump.c. Without changes in that file, there is no go
> >> > to what ever golden ideas you have.
> >> 
> >> I had a look. The tests never test the content of the kernel buffer,
> >> while this is the only part that my changes have an impact on.
> >
> > So, it means that after your change there will be a deviation between the core
> > function that dumps into a buffer and one that prints message into the kernel
> > buffer.
> 
> No, it's always been like that. The formatting of the prefixes have
> always been totally different in this function, probably because filling
> a memory buffer and sending these messages to dmesg is fundamentally
> different and we may want a different behaviour *when sending to the
> kernel buffer*.

Why? I mean the prefixes are fine, but the main part should be the same as long
as we use the same backend API, no? This is a lib/ code which should be suitable
for many cases, including ABI, I don't see the good reason why we should
deviate from that.

> That is what I believe is useful. If someone wishes to
> port the feature to the other functions, they can, but it is irrelevant
> to the change brought here.

I disagree on this. When we touch printf() stuff, we consider all aspects of
the formatted strings, and not only kernel buffer for some features. One may
use memory buffer for that, one may rely on kernel message.

> > Moreover it lefts seq_hex_dump() out of the picture.
> 
> seq_hex_dump() has diverged already and is a very specific case that is
> probably under stability constraints, where trimming down the output
> lines is likely much less useful.

If it becomes a part of ABI, why not? seq_printf() also uses limited buffer and
may become quite untrivial to handle when it's bigger (see all those special
cases when seq options are defined to custom callbacks).

> I am not strongly opposed to it, but it is probably a bit useless.
> 
> > I think you need to start from modifying hex_dump_to_buffer() to have a
> > functionality you want (note, there are cases in the kernel that use
> > hex_dump_to_buffer() for formatting messages in the kernel buffer and they
> > might want to have the same functionality to be available.
> 
> No... that is not how these function work nor have been designed for,
> hex_dump_to_buffer is used as a line-oriented helper to fill a kernel
> buffer line which *is* a line-oriented buffer. A prefix gets added to
> it, and I want to skip the printing if it's redundant. Lines are sent
> one after the other using printk anyway. All this logic has nothing to
> do inside hex_dump_to_buffer at all.

I think it has a relation. The use of hex_dump_to_buffer() is often to get list
of lines at the end to be formatted (and printed if required), it usually makes
not much sense for a single line as it's easier to open code and rarely
people would seek for an ASCII representation part for a single line.

> Plus, what you ask for would
> require a new buffer to be allocated, potentially big and unbounded,

I don't think you need it. What you need is a crc32 of the content or another hash.
It will be a new function that takes some kind of context, one field of which is
the hash (of the previous data).

> which would require a GFP flag (yay! a new parameter). And finally the
> implementation itself would be much less obvious if the algorithm was
> not line oriented.
> 
> I am sorry, but I really took the time to understand your request but it
> is simply not working well technically nor conceptually desirable IMO.
> 
> >> These tests verify the hex_dump_to_buffer() logic, but never how it is used
> >> through the print_hex_dump_*() helpers.
> >
> > I haven't checked and don't remember for sure, but KUnit rings a bell that it
> > might be possible to test the actual kernel output. (However, after the above
> > modifications been made it won't be needed anymore as test_hexdump.c will be
> > extended to support new feature.)
> >
> >> In this series I am just enabling a new way to print the content of the
> >> buffer, like for instance enabling a prefix, which is not directly
> >> related to the core implementation of hexdump.
> >> 
> >> Hence, I am sorry, but I will disregard this request unless someone
> >> comes up with a working idea which is worth the effort, considering the
> >> minimum impact of this change and the fact that it is mostly (if not
> >> only) for debugging purposes and will most likely never reach users.
> >
> > I'm sorry, but my NAK still stands. No tests — no go.

> Please Andy, stop asking loads and loads of unachievable changes to fit
> your ideal. I am bringing something that I feel can be useful, just stop
> with your endless list of unrelated (and in this case unreachable)
> wishes. 

Do you want me to take over and show how it should be done? Definitely I can
invest some time into it, but I can't guarantee the quick result though.

> There is nothing testing the prefixes, if there was a suitable
> test case I would improve it, but there is none, because the test suite
> is not used like that.
> 
> > And it does not matter if it's only for debugging or for ABI, we require test
> > cases for the lib/ changes.
> 
> Who's we? Where is this documented?

People (maintainers) who care about lib/ contents.
Mainly I implied Rasmus, but sometimes others also want to see test cases.

> There is no test case checking the kernel buffer printing.

After looking around it seems you are right.

> I'm not skilled enough to write one.

> > We don't know and don't care much about how these
> > new features will be utilized
> 
> And this is typically what I dislike in some of your reviews. There is
> always a context, trying to ignore it is pointless.

I understand your context here, the problem is that this is universal API.

> > (the requirement here is to have a user for it,
> > so you might need to consider to convert one of the existing user to use a new
> > feature, besides the [updated] test cases).
> 
> I know this is generally requested, but once again, dumping pages of
> data where this flag might be useful makes sense during debug sessions
> in very particular places, keeping these debug calls does not seem very
> useful to me, but that's certainly easier to achieve than your previous
> request.

P.S. You probably want to acquire somebody's else tag from PRINTK/PRINTF
maintainers/reviewers pool.

-- 
With Best Regards,
Andy Shevchenko


