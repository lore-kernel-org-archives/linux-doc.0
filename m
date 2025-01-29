Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA67D6A33F;
	Wed, 29 Jan 2025 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738133635; cv=none; b=eKucUaStDgxJpC9+61gqlFegjjNDe006CUVW1ynfsR0BUkpf2aMzg/aWWhgECVp0f1SB3AwkOee5vHGfAyHBYkNCFN7OsOzwhV6n5cIN+c0HrnDi5egSjPzqijyXarZvWmoD1tJXwGgCIA0jIa+g5LtriyvEli1rtZvox4JrwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738133635; c=relaxed/simple;
	bh=z1DgGFCqWVLuMOzc1iynCnj1wkM3ZKu4vfOtK0qtQ48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCkDtnsQnk3q1om6vALJb6Bzm2ofeSutvq97bveVFDa66/lHbij/BpE7zwK4zp1TBFC5bkDoVAcjwhikE425m3vMqYxa0mu+tVFVE15r1WDDW4Mi5J8vJ3ZvhKL3MDKwRLH7wcBx4YzixFizg+47db5ib6WSBt3QxXNFI0NSAuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ECmu6hXH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ECmu6hXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738133634; x=1769669634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z1DgGFCqWVLuMOzc1iynCnj1wkM3ZKu4vfOtK0qtQ48=;
  b=ECmu6hXHCSwuTQRSJn4mYGvXPEjNh2bsNjDoXG2R0x32keewQyUhog7S
   tDf/dmUmLibmR4gyWmnoJf6h+XY1LMXg5XLePdmyJaFu2HUnexCdwcgpu
   ir1DErGOAMMmQH+fPXTEVKo9UopjdfECs5+FqZLZcUE0f7pQbHYw+e0ZO
   XJeNALvQhwcPdfEdVSlAL3UbHUBgMKiWLUWriAx/WDgKHHzw/sRl0NV+n
   Afzt9aKG3yKrNvJ93TydhXmq/4Jeq4vgDrx8pFRAvOWkrvjWG7dyiAc8i
   sS21bZONnVlxJUrI9rYSSmJqueaZ8TqDm9iQwVqCFykfgI4sDEnPjKAII
   w==;
X-CSE-ConnectionGUID: a/ClnTK7SpiGgzUz0ze+Dg==
X-CSE-MsgGUID: T2urQU61SsqBrmpC8uuUQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37879870"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="37879870"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 22:53:52 -0800
X-CSE-ConnectionGUID: 8Vvbu4h4RqqAtovqRVVVjg==
X-CSE-MsgGUID: mRqjmyJDRNiEvRT8A2jjAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132229212"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 22:53:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1td1xJ-00000006Ic2-1a2p;
	Wed, 29 Jan 2025 08:53:45 +0200
Date: Wed, 29 Jan 2025 08:53:44 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: subramanian.mohan@intel.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, greg@kroah.com, corbet@lwn.net,
	christopher.s.hall@intel.com, tglx@linutronix.de,
	eddie.dong@intel.com, pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com, david.zage@intel.com,
	srinivasan.chinnadurai@intel.com, rdunlap@infradead.org,
	bagasdotme@gmail.com, giometti@enneenne.com
Subject: Re: [PATCH v2 1/1] pps: retrieve generator specific data from
 framework
Message-ID: <Z5nQeAFx3UlI9hxE@smile.fi.intel.com>
References: <20250128141743.52031-1-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128141743.52031-1-subramanian.mohan@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Jan 28, 2025 at 07:47:43PM +0530, subramanian.mohan@intel.com wrote:
> From: Subramanian Mohan <subramanian.mohan@intel.com>
> 
> While adapting pps generator driver(tio generator as an example)to the new
> generator framework, As part of driver registration the pps_gen_device
> pointer is returned from framework. Due to which there is difficulty in
> getting generator driver data back in enable function. we won’t be able
> to use container_of macro as it results in static assert. we might end up

container_of()

Can you be more specific, what exactly happens?

> in using static pointer. To avoid the same and get back the generator
> driver data back we are proposing generic approach to add drv_prv_data
> pointer inside the struct pps_gen_source_info.

> Example TIO structure wrapped with pps_gen_device and usage.
> 
> struct pps_tio {
> 	/* Framework Related * /
> 	struct pps_gen_source_info pps_tio_source_info
> 	struct pps_gen_device *pps_gen;

> };

> static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable) {
> 
>     /* Getting TIO data back */
>     /* Note: drv_prv_data will be initialized in our init routine */
>     struct pps_tio *tio = pps_gen->info.drv_prv_data;

So, what's wrong with the container_of() against pps_gen->info?
We have tons of code in the kernel that does it.

>     /* Access tio members here to set some of the parameters */
> 
>     return 0;
> }

Okay, looking into the implementation I see what's the issue (but it doesn't
mean that commit message is good here, you still need to explain better why
you can't get the correct address).

The problem is that info is got fully copied. Perhaps we should rely on
the fact that it always be provided? I dunno any data structure that defines
callbacks and other "info" material should be considered as temporary storage
(on stack), it makes not much sense.

...

> V1 -> V2:
>     * Updated reviewers.

Please, use...

> Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
> ---

...this place for the comments and changelogs.

...

> +	void *drv_prv_data;

If really needed we should probably use a better name, like "private".

-- 
With Best Regards,
Andy Shevchenko


