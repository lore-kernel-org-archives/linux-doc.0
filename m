Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE01D9688;
	Tue, 24 Dec 2024 15:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735054916; cv=none; b=nGstPRiFz3WEQN37Qn6M0PDbwj8XIwNe27woM2lb5jEWNz6SvJxouFcgaq+fAN42rA1qm6RKH8aCCzglF3dJ8LbJSz2Uv8MCTCxd6C3GrEwMZPYY06cx5XY65xbjtviRgLUL/ybPmxbAZxEqR8M25etM02CwKTWU580wxuo5jyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735054916; c=relaxed/simple;
	bh=6t6Vj1cZDkt4BQl3VxuH5m4f6kMVr4u6M8h74hKV1N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEr3Dwb/a6JDALQfko2IeK0PyzHQaR3oqXr9gdWcoSc7E29BSJOdVhcWI3FdCHiKAAQSL9JgMcGjlvUq08WZv07oo4xbYuzHh/ug3Fr56BHWhmol0Ee9+1y9gN4u3CCwZzIc/eroPg5XdItIe8j/266UaoQ8fo7vCiZDO4YN5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/rXj8s0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/rXj8s0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735054915; x=1766590915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6t6Vj1cZDkt4BQl3VxuH5m4f6kMVr4u6M8h74hKV1N4=;
  b=T/rXj8s07FeIyE3g/pwtdalle5rq46sLDMJKwyEpW9wN5VPCOxHxV7dF
   KG6+DEbyjCaBbCNxoQFX7LfFdX1KU2ayAg9TLTq9QQLSi7iNJS8fSU0eS
   3ZQ2fH/HRbKvS75zAPqx+mUSxdhIjacz9QWfFQA0PnqsYW0sFPUEHo7QH
   pbqYyxOK6uOEwWNkuF3kpzJ2tmzjCN9WxVbqeWZA4rySdvyW4qGiSv43j
   9nGAj/HdL4JTgmQM6SBXIOI3t2Bi4RbzIu4q/iM4Varz/aQtn8UA8SlFS
   DP5exKtz1emRDhS9b/Kz+PYPJBTl02HFTW2VZ/3blH8LBZsaKWn9XpbrK
   w==;
X-CSE-ConnectionGUID: CFwZvUx5RkK3ecuhhKy8oA==
X-CSE-MsgGUID: eFZE508+SgeDrQ34L3vjmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35236993"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35236993"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:41:54 -0800
X-CSE-ConnectionGUID: dWpopniOTTulLLAakPgXRw==
X-CSE-MsgGUID: gVBNwR8HSkCxJH+T/ChKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="104362475"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:41:51 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tQ72a-0000000Bl3k-0B4z;
	Tue, 24 Dec 2024 17:41:48 +0200
Date: Tue, 24 Dec 2024 17:41:47 +0200
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
Subject: Re: [PATCH 1/2] hexdump: Convert the ascii boolean into a flag
 variable
Message-ID: <Z2rWO44BjR52Dorx@smile.fi.intel.com>
References: <20240826162416.74501-1-miquel.raynal@bootlin.com>
 <20240826162416.74501-2-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826162416.74501-2-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 06:24:15PM +0200, Miquel Raynal wrote:
> The print_hex_dump() prototype is already quite long and there are
> already several hundred in-tree users. One argument is a boolean for
> enabling the ascii output. This is one way to format the buffer. We
> could think of other ways, which in this case might need other booleans
> to be enabled. In order to avoid messing several times with the
> prototype (and all the callers), let's switch to a 'flags'
> variable which can be easily extended.
> 
> There is no behavioral change intended.

...

>  extern void print_hex_dump(const char *level, const char *prefix_str,
>  			   int prefix_type, int rowsize, int groupsize,
> -			   const void *buf, size_t len, _Bool ascii);
> +			   const void *buf, size_t len,
> +			   unsigned int flags);

Why two lines? It fits perfectly even 80 limit.

...

>  static inline void print_hex_dump(const char *level, const char *prefix_str,
>  				  int prefix_type, int rowsize, int groupsize,
> -				  const void *buf, size_t len, _Bool ascii)
> +				  const void *buf, size_t len,
> +				  unsigned int flags)

Ditto. (And check entire conversion for theses unneeded new lines)

...

>  	print_hex_dump(KERN_ERR, "  ", DUMP_PREFIX_ADDRESS, 16,
> -			1, mpc, mpc->length, 1);
> +			1, mpc, mpc->length, DUMP_FLAG_ASCII);

While at it, I would reformat the code to be wrapped in more logical way, like

	print_hex_dump(KERN_ERR, "  ", DUMP_PREFIX_ADDRESS, 16, 1,
		       mpc, mpc->length, DUMP_FLAG_ASCII);

Also it fixes the broken indentation of the second line.
Same remark to the entire patch where it applies.

...

>  	pr_debug("Virtual Machine Save Area (VMSA):\n");
> -	print_hex_dump_debug("", DUMP_PREFIX_NONE, 16, 1, save, sizeof(*save), false);
> +	print_hex_dump_debug("", DUMP_PREFIX_NONE, 16, 1, save, sizeof(*save),
> +			     0);

Same, why two lines out of a sudden? If code already uses one line and it's
longer than 80, no need to wrap. The cases when it goes over 100 with new flag
name put there would make sense to wrap.

...

>  	if (copy_from_user(buf, (void __user *)(regs->pc & -16), sizeof(buf)) == 0) {
>  		print_hex_dump(KERN_INFO, " ", DUMP_PREFIX_NONE,
> -			       32, 1, buf, sizeof(buf), false);
> +			       32, 1, buf, sizeof(buf), 0);

I would assume you can even use one line now for this, but at bare minumum
"32, 1," part can be moved to the previous line. I dunno how to do this in
coccinelle in automatic way. In _this_ case it can be left as is, as there
is no logical issues (in comparison to one I pointed out above).


-- 
With Best Regards,
Andy Shevchenko


