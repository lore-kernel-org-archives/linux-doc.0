Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A8221ADB4;
	Mon, 13 Jan 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736771757; cv=none; b=BED9BHFEWdehPtG16bK9MeidofNY9dtH8kqg2CyxANunen06OpO0nyRnHTU5HbGUOg3VI5cBr9jYB10QNegOBAAgG20eeJIuBapSF1yfsthIKkgMjTUroZXyHR++aQrjyBuWQ+z7MTbgpQUNDPWlu2VD47lXfNJpmbmtSoiVUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736771757; c=relaxed/simple;
	bh=OT+qTBRM84wBLWwhlJIvn6iR+bgdiSz9xRDhjEVoZ5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uoUILLOVGNMW3JlDBf2j8OOpJGgLud4qyuBZz3dyENS9t1TCssAI67e/HsVBuMxeTamFOx5mlWsVnyz5fho+wCICDec0s1hBcfAfsKOlfCDR9a64o70lJfXv1dphMB+0y3UWKxWCTGoxQvmXyX/9LAOQbCs1+anB081CCZvf6xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2RVk83s; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2RVk83s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736771756; x=1768307756;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OT+qTBRM84wBLWwhlJIvn6iR+bgdiSz9xRDhjEVoZ5I=;
  b=C2RVk83sAZ7d2D+v7eAWOLZ+OziSVly/KsX+zVWDuHLbNRrzvIkQDl/E
   t8xfLzMf0djiYH4gOkp36JlGamPXU7RDzQYqdV4EAvBeA68C27+D3yRwh
   Zlz0rt1kezl+BbNZ+HX7TiA506r/vJ3r/tg5Q2lOBkMpdx4jpscG3em73
   uj/Ye8+f7ebmG/GBUtUQ0H4mSRiu7zjq6MOtZUmdJWogwFereZAPUlfmD
   gc4onOHkolDbrWyH5+ltpQlC/KeRxOqelMwMb9AxfYAG5bJC1bgoIuowC
   RfTOcDi+Q6UFD+E6h9e5sCb855YSdS7fayvDlvuZAZaOa24Qb9mooE4iZ
   A==;
X-CSE-ConnectionGUID: KaqdjK+1SRCvakRCP9bKOQ==
X-CSE-MsgGUID: kBV0fCzzSYi1m3uiE5q9CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="54576950"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54576950"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:35:48 -0800
X-CSE-ConnectionGUID: r/CM+xrbTBSpqEORCqxMIg==
X-CSE-MsgGUID: 3ZfXLBNqRhSiXX0+N+ofDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="109450257"
Received: from unknown (HELO smile.fi.intel.com) ([10.237.72.154])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 04:35:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tXJfS-00000000SV4-01C6;
	Mon, 13 Jan 2025 14:35:42 +0200
Date: Mon, 13 Jan 2025 14:35:41 +0200
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
Subject: Re: [PATCH v2 2/2] hexdump: Allow skipping identical lines
Message-ID: <Z4UInSRCSXzNN5Ug@smile.fi.intel.com>
References: <20250110-perso-hexdump-v2-0-7f9a6a799170@bootlin.com>
 <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110-perso-hexdump-v2-2-7f9a6a799170@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Jan 10, 2025 at 07:42:05PM +0100, Miquel Raynal wrote:
> When dumping long buffers (especially for debug purposes) it may be very
> convenient to sometimes avoid spitting all the lines of the buffer if
> the lines are identical. Typically on embedded devices, the console
> would be wired to a UART running at 115200 bauds, which makes the dumps
> very (very) slow. In this case, having a flag to avoid printing
> duplicated lines is handy.
> 
> Example of a made up repetitive output:
> 0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb
> 
> Same but with the flag enabled:
> 0f 53 63 47 56 55 78 7a aa b7 8c ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> *
> ff ff ff ff ff ff ff ff ff ff ff ff 01 2a 39 eb

Still thinking that it's not okay to leave the cases where hex_dump_to_buffer()
is being used for the similar. I would expect that to be modified as well.
As told in v1 thread this can be achieved using a context data, instead of
providing zillion fields, one of which may be a kind of CRC32 checksum that
makes this work without any additional allocation.

But I won't prevent you to go with this if you get a blessing from other
PRINTK/PRINTF maintainers/reviewers.

...

>  #include <linux/types.h>
> +#include <linux/string.h>

Can we keep it ordered (to some extent)? I know that types.h is misplaced here.

>  #include <linux/ctype.h>
>  #include <linux/errno.h>
>  #include <linux/kernel.h>

...

> +		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {

> +			if (i && !memcmp(ptr + i, ptr + prev_i, linelen)) {
> +				prev_i = i;

Can we rather use a hash function or so instead of memcmp()?

> +				if (same_line)
> +					continue;
> +				same_line = true;
> +				printk("%s*\n", level);
> +				continue;

> +			} else {

Redundant 'else'.

> +				prev_i = i;
> +				same_line = false;
> +			}
> +		}

Something like

	unsigned long hcur, hprev = ~0; // any unrealistic init value
	...
		if (flags & DUMP_FLAG_SKIP_IDENTICAL_LINES) {
			hcur = $HASH($LINE);
			if (hcur == hprev) {
				...
				continue;
			}
			hprev = hcur;
		}


-- 
With Best Regards,
Andy Shevchenko


