Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769621FDA65;
	Mon, 13 Jan 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736772014; cv=none; b=Z98citisEHuk6u3NQvbE3ZqPGCqg3MmkIvf9h2DgA4+/ZaJ5NcQz4aKsRS6fjA2JdYZXeraTm+nGTY9Yxnl8oqYOMJoZa4YVVUBPLUiEPIoiXNtEmsY9za0LmKPLVs+Mbu1gRWs46YW5lgxnEXcPRzgzu9BzPBEA9IVImT323G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736772014; c=relaxed/simple;
	bh=9LUqvmtzuy8+TM/1a3KQelG3+2raieGcZcusbft/xP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKVgeOetMByVgqen40wZ8Li9yzwb9d/5GvXfAJ1WV6Ciit7iue1JntKeXB+GqreHfLF44SiMpOBZ/p0ehxCXJOLUaUULXnyV3AqBkkpurUzJnHO2y4N9urukLk/Pa3HN742O5AiEqj5n/N3NvtNrVb2izqCFeMcjXVNMck68nMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iVAWAz/W; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iVAWAz/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736772012; x=1768308012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9LUqvmtzuy8+TM/1a3KQelG3+2raieGcZcusbft/xP4=;
  b=iVAWAz/WQfaPtpt7XzyitkHqaGqsKeffI+D/FtPf4AATuN/fFEFdDoxx
   xgMN/wM3PG5hlPs8XJIWgjzPNVn+vg6rVunftOjmHD5h/RTEKbNP4RCsi
   ywbTn5cK+HOg+a8PVuxix1bAgAjhl+LR9oUzI4lzao9e53qR2N2D8sJ3/
   IRwGc5YWdwmYxUq2PIG8pV7QUnxUoBZ4Yyk0j4gX1ZXMbzT2dQDAsBzA+
   al8huXSGQAbdHFM8LIvhz+c4vsRYfNCUTx3n6CvJ+lmqB5ytiXbhHRoau
   t5couuLt0SNQCAu0/FMknSFUo01A+yPOjaink7jaE0kolIR9w/18Eg32L
   A==;
X-CSE-ConnectionGUID: qh+MoTtXTFycUyrvFqFmmg==
X-CSE-MsgGUID: oJtwdeDYQz6k3/wnI9nryg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40971899"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40971899"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:40:10 -0800
X-CSE-ConnectionGUID: Vu01LmGQSeWuJBCRc2ht7g==
X-CSE-MsgGUID: uThTDoYmR7m3EZNdUmAbhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="135281430"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:40:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXJjg-00000000SZw-1LYO;
	Mon, 13 Jan 2025 14:40:04 +0200
Date: Mon, 13 Jan 2025 14:40:04 +0200
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
Subject: Re: [PATCH v2 0/2] hexdump: Allow skipping identical lines
Message-ID: <Z4UJpNnperJkbQFn@smile.fi.intel.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 10, 2025 at 07:42:03PM +0100, Miquel Raynal wrote:
> While working on NAND issues, I used print_hex_dump() a lot to compare
> data. But I am mostly working on embedded systems where the kernel
> messages go through a serial console. Sometimes network support is an
> option, sometimes not. Anyway, I often print buffers both in kernel
> space and user space to compare them, and they may be full of 0's or
> 1's, which means lines are repeated a lot in the output and this is slow
> *and* hard to compare.
> 
> I initially hacked into lib/hexdump.c for my own purpose and just
> discarded all the other users, but it felt like this might be a useful
> feature for others and decided to make it a public patch.
> 
> * First patch changes the "ascii" parameter into a "flags" variable now
>   accepting the value: DUMP_FLAG_ASCII.
> * Second patch adds a new flag to skip the identical lines, because this
>   must be an opt-in parameter, I guess.
> 
> The patch series has successfully gone through a round of
> kernel-test-robot.
> 
> The Cc-list, as provided by get_maintainers.pl, was returning 330
> e-mail addresses which felt to much, so I ran the script only on the
> second patch (the printk/includes/debug/Doc changes). It gave this
> Cc-list which sounds more reasonable. Hopefully this is a smart move,
> otherwise let me know what you think would be best.

...

> 000007e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
> And with the new flag added the code looks like this:
> 
>  print_hex_dump_debug("", DUMP_PREFIX_OFFSET, 32, 1, spinand->databuf, mtd->writesize,
> -                     0);
> +                     DUMP_FLAG_SKIP_IDENTICAL_LINES);
> 
> And the output is easier to parse and also faster to show on a serial
> console:
> 
> 00000000: 55 42 49 23 01 00 00 00 00 00 00 00 00 00 00 01 00 00 08 00 00 00 10 00 2b 10 f1 92 00 00 00 00
> 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 db 93 e9 fc
> 00000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> *

I see disadvantage in the output here, i.e. there is no visibility of how many
identical lines (bytes) were actually dumped. And IIRC the hexdump(1) behaviour
it prints last line no matter what.

-- 
With Best Regards,
Andy Shevchenko


