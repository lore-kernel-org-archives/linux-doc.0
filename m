Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEE7204582;
	Mon, 13 Jan 2025 10:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762729; cv=none; b=AULoQXr8U4YZ23ihQU+3/RsmxYcogYl8GIy4mxLQLqNH7HBpnPhInoUAonUMWwmVywGsWPlsD+x6r/RRbN66omTMEs40VrlCJJQ08y+R+2BvX9cA7H6th+HHeUWadToK+BLayxvnFqelDWHQePdTle9w+jO4QUv+zWGT65PPGwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762729; c=relaxed/simple;
	bh=LPuHGt9EQTHEui/tdRLi6NngbHDCHcERZ17EcN080yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv1Gs4aD2BjECdF1CiltOoi7tiFmkKZk1mdoUKHKQRU/kAN8u8obESlD4AeAfrE/ms5TVo1wYq0LWz32z5yGG80dGypsn9f72eGHbr9a8MUPciFZiZJj6HK7xI7rzwJmtEQuID78GbNmU8vAT/TgkE2YuDH6dbmaZ9+//98ahd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBuxpns3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBuxpns3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736762728; x=1768298728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LPuHGt9EQTHEui/tdRLi6NngbHDCHcERZ17EcN080yQ=;
  b=PBuxpns3ZBFhYWY+kHrqAKvYJGa7KO+9wEarnqiWTzjsJSbfMDEO2pIA
   LkN2k6b7XLc2i8MB5LpP8UR/KbfmM2ly4vMEK52z8XLr2l3yVJkg2Dk7A
   9YIy/I2f/oc2TjeKthL3FBayFaudgKz315u9ZpoNYXxdz4kF4L49WEi8t
   TtbcGPr/VJLPHJAlqOjyOTOUBoZZje1OCBEF5X5IysyuvRnLTw4zpFBZ7
   hHobdepokNrpPGg2PQcTtCjkut9Nk44ew6Wny+tbnvBLwlHxJuzFHWUM+
   bSB6dzoDjyxvn1sYGjAcg8eOH+zM+/OEbacKOEUQpcIaROfksqAcqF8PG
   w==;
X-CSE-ConnectionGUID: elcFWierTO+NFceIvKsleQ==
X-CSE-MsgGUID: tcG7t7JSROS08BsYsnHEdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54430596"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54430596"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:05:01 -0800
X-CSE-ConnectionGUID: yuDebDasSe24lvFwhqY0Xw==
X-CSE-MsgGUID: iAGX+FPnRU6fcVSM0s+cOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105296427"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 02:04:56 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXHJU-00000000PnC-1eVV;
	Mon, 13 Jan 2025 12:04:52 +0200
Date: Mon, 13 Jan 2025 12:04:52 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: David Laight <david.laight.linux@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <Z4TlRNdKtiZM_foH@smile.fi.intel.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
 <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
 <20250110193930.26b08c2f@pumpkin>
 <87o70dsmj1.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o70dsmj1.fsf@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Jan 11, 2025 at 10:54:58AM +0100, Miquel Raynal wrote:
> On 10/01/2025 at 19:39:30 GMT, David Laight <david.laight.linux@gmail.com> wrote:
> > On Fri, 10 Jan 2025 19:42:05 +0100
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> >> When dumping long buffers (especially for debug purposes) it may be very
> >> convenient to sometimes avoid spitting all the lines of the buffer if
> >> the lines are identical. Typically on embedded devices, the console
> >> would be wired to a UART running at 115200 bauds, which makes the dumps
> >> very (very) slow. In this case, having a flag to avoid printing
> >> duplicated lines is handy.
> > ... 
> >>  enum {
> >>  	DUMP_FLAG_ASCII,
> >> +	DUMP_FLAG_SKIP_IDENTICAL_LINES,
> >>  };
> > ...
> >> +		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {
> >
> >
> > That doesn't look right to me.
> > You want:
> > enum {
> > 	DUMP_FLAG_HEX_ONLY = false,
> > 	DUMP_FLAG_ASCII = true,
> > 	DUMP_FLAG_SKIP_IDENTICAL_LINES = BIT(1),
> > };
> >
> > and maybe you can get away with not changing all the other files.
> 
> I'm a bit sad all the time spent on these changes will go to trash :),

Oh, you can imagine my frustration when I contribute and it goes to trash.
I have an experience with that kind of events :-)

> they kind of looked "nicer", but for sure this approach would be
> transparent. I can definitely try that.

-- 
With Best Regards,
Andy Shevchenko


