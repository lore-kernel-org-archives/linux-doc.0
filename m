Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3317E9;
	Tue, 24 Dec 2024 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735055375; cv=none; b=HoWqQmCavQBa1uT9WYFBq9TwA5nDLAJm7DfeGKQPufI5kOCBk4cWFQ+0vmDOudQIfJR+cl+Ljvfrk0np46wcZ5u+p6+FSMwjdMOBmgFkOA02IriXQUj93PdXx815BT6aPpABKLU1giUsTUr6L9R+8cto73uvZEQKCcDCTJSH0FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735055375; c=relaxed/simple;
	bh=aINUzseI66xyn8ej9pTvzl+MMWQBv8ZnrLfWkdCPg9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKmyKnX7r5MxgJmP1kPPBwI0nP+q0hhaocY1UWicMjGZLYa4cAEoHce+ZEKk+YFla74TpTLbkOw7OfRAxBilYeEiK/jbS1knWkoEVOw3EwLcINsKfuX3Y2NcLrs/XbgmyWUpJ8nnLOnfy8v8ag0DLPpTg6w7T4dszJ8Nsa6doPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoKDZi3G; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoKDZi3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735055373; x=1766591373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=aINUzseI66xyn8ej9pTvzl+MMWQBv8ZnrLfWkdCPg9I=;
  b=aoKDZi3G1ZE6FkdYNK9ghkvAchD7/XgA0VcUG/+64+fVSMSnDrFPFgua
   vqMJL2p9UlBbbXwMg3HxSS76/RWsy8odPAPupaGzlBsGROoCTsx4tQ2Sm
   SxOHfx/ZNKzTmEpy+2xQDPYkt3+3hRbe2f/w1zLXwpDkPxe7LVD9S+uBd
   15VAqWCyHD53XF3W1Pt36tPccxHVy6dF7DNzVfyEM1Fol/IxJ3lsh0X5q
   j05W2Z9FEC8ZYfur6HJampWp5qgRybuyMwBNA8TBxO+xWDTWdMlMMA2iy
   Ky08fTpV/nuDiGztthH7TWXyjnSPco7E5Wekjv5V99DDf/BINuOmOv6MU
   w==;
X-CSE-ConnectionGUID: /vTPdiQuSOWo9BayybE1uw==
X-CSE-MsgGUID: T2MNBIvmSc2oPUpSWs5eqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="53056466"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="53056466"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:49:30 -0800
X-CSE-ConnectionGUID: 2O/yXEbAQv+CvqIFe5XCDg==
X-CSE-MsgGUID: JlvJqcRFTC+3UWel3uk8zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="99877638"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:49:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tQ79x-0000000BlCg-1E9Q;
	Tue, 24 Dec 2024 17:49:25 +0200
Date: Tue, 24 Dec 2024 17:49:25 +0200
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
Message-ID: <Z2rYBc7QTTvviT3s@smile.fi.intel.com>
References: <20240826162416.74501-1-miquel.raynal@bootlin.com>
 <Zsy8JPaiGknBypw9@smile.fi.intel.com>
 <20240827110147.29a7481a@xps-13>
 <Zs3UrlufPJ9wVyep@smile.fi.intel.com>
 <87frmdnvkl.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frmdnvkl.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 24, 2024 at 12:56:26PM +0100, Miquel Raynal wrote:
> On 27/08/2024 at 16:29:18 +03, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Aug 27, 2024 at 11:01:47AM +0200, Miquel Raynal wrote:
> >> andriy.shevchenko@linux.intel.com wrote on Mon, 26 Aug 2024 20:32:20
> >> +0300:
> >> > On Mon, Aug 26, 2024 at 06:24:14PM +0200, Miquel Raynal wrote:

...

> >> > Also here is the formal NAK till the series gains the test cases.
> >> 
> >> What test cases are you talking about?
> >
> > Anything meaningful you come up with to show that the printed data is
> > what it's expected. The module has a complimentary test case,
> > lib/test_hexdump.c. Without changes in that file, there is no go
> > to what ever golden ideas you have.
> 
> I had a look. The tests never test the content of the kernel buffer,
> while this is the only part that my changes have an impact on.

So, it means that after your change there will be a deviation between the core
function that dumps into a buffer and one that prints message into the kernel
buffer. Moreover it lefts seq_hex_dump() out of the picture.

I think you need to start from modifying hex_dump_to_buffer() to have a
functionality you want (note, there are cases in the kernel that use
hex_dump_to_buffer() for formatting messages in the kernel buffer and they
might want to have the same functionality to be available.

> These tests verify the hex_dump_to_buffer() logic, but never how it is used
> through the print_hex_dump_*() helpers.

I haven't checked and don't remember for sure, but KUnit rings a bell that it
might be possible to test the actual kernel output. (However, after the above
modifications been made it won't be needed anymore as test_hexdump.c will be
extended to support new feature.)

> In this series I am just enabling a new way to print the content of the
> buffer, like for instance enabling a prefix, which is not directly
> related to the core implementation of hexdump.
> 
> Hence, I am sorry, but I will disregard this request unless someone
> comes up with a working idea which is worth the effort, considering the
> minimum impact of this change and the fact that it is mostly (if not
> only) for debugging purposes and will most likely never reach users.

I'm sorry, but my NAK still stands. No tests — no go.

And it does not matter if it's only for debugging or for ABI, we require test
cases for the lib/ changes. We don't know and don't care much about how these
new features will be utilized (the requirement here is to have a user for it,
so you might need to consider to convert one of the existing user to use a new
feature, besides the [updated] test cases).

-- 
With Best Regards,
Andy Shevchenko


