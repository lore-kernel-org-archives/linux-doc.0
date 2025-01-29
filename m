Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434A11B0406;
	Wed, 29 Jan 2025 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738145074; cv=none; b=e85JgTsWWfIDUgzRyOg6NrZcnW4hhGQ+p1D3d+H2+pAQgXiLHtJcGm2VwkCipue8W3HbGk5gztYEfxqKIUSSp0IXAuOU0nPWlZFCcNnagWfhntDVcxxt/5Gnu56Rp4apDBy5b5Ycb/mZCHSzCZgYIweQA14WsniXN8xq7+GtMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738145074; c=relaxed/simple;
	bh=ZYUiiW5SPe5G2PPcVS1l+VW3FANuiTOd1+wDLQeYHIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8m9826KRZ6u9GLMLjr8dGbAVELKAnkPnC1iqa1UQx49zZj3mEZSdihTrraB8nCPZ4CBjS9TsnPHwehaiSPU7k6un/PX7nASKtkJkHufBy+w9PqHtWkcVYuIZElqDiwze38jtFlnMAWn3brFnAwBvXvZN7PNdPxeqHFDqt1fSmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmIpbXkK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmIpbXkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738145072; x=1769681072;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZYUiiW5SPe5G2PPcVS1l+VW3FANuiTOd1+wDLQeYHIw=;
  b=KmIpbXkKeiPnuQ6rTxpvIGqlNtetLHHqT6brNfIxA8zI1E5hhQf1Hbdo
   oGhIBk8BBrzTo6PTjSL18O2sROuKuqXx2juDzc85gGGasOGZ9J1Az9gpG
   ah9sRdp3L2GUkOwhA9MnebVxuxPa/LWNW0nZ5SSBAuWvGAkZE+ae0FhUf
   BRnSto8EnVk3vRqBNiQtWJIXqqnXun7fO3KZyv3QYpx+IfmBLWKUUVsov
   R8y9nZFfPbFauHdDh6zPkWBljJt61OCOcTeJ/PqxhXiqKuPwsihJGZUKW
   8rspcBhRlu9G7dNBHHMmOSF/buQH3wSaRF6MwqvbVBuIgUsH3i8oasBJ8
   g==;
X-CSE-ConnectionGUID: JgcJmVTvSnq/xw8hthPQ/A==
X-CSE-MsgGUID: ew12Q+uqSTeQwhJYplBTkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38819678"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="38819678"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 02:04:31 -0800
X-CSE-ConnectionGUID: SWIDke8ZSFmDY2kXL6S9eA==
X-CSE-MsgGUID: cpJMU9WxQ+O6GwAAgkmIuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; 
   d="scan'208";a="108812082"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 02:04:28 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1td4vo-00000006LEj-3eoh;
	Wed, 29 Jan 2025 12:04:24 +0200
Date: Wed, 29 Jan 2025 12:04:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Mohan, Subramanian" <subramanian.mohan@intel.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"greg@kroah.com" <greg@kroah.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"Hall, Christopher S" <christopher.s.hall@intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"Dong, Eddie" <eddie.dong@intel.com>,
	"N, Pandith" <pandith.n@intel.com>,
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>,
	"Zage, David" <david.zage@intel.com>,
	"Chinnadurai, Srinivasan" <srinivasan.chinnadurai@intel.com>,
	"rdunlap@infradead.org" <rdunlap@infradead.org>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>
Subject: Re: [PATCH v2 1/1] pps: retrieve generator specific data from
 framework
Message-ID: <Z5n9KHbLhtg6F_Dt@smile.fi.intel.com>
References: <20250128141743.52031-1-subramanian.mohan@intel.com>
 <Z5nQeAFx3UlI9hxE@smile.fi.intel.com>
 <PH7PR11MB5862283EF5540BBF7BF0C853F7EE2@PH7PR11MB5862.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB5862283EF5540BBF7BF0C853F7EE2@PH7PR11MB5862.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Jan 29, 2025 at 09:30:10AM +0000, Mohan, Subramanian wrote:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Wednesday, January 29, 2025 12:24 PM
> > On Tue, Jan 28, 2025 at 07:47:43PM +0530, subramanian.mohan@intel.com
> > wrote:

...

> > > While adapting pps generator driver(tio generator as an example)to the
> > > new generator framework, As part of driver registration the
> > > pps_gen_device pointer is returned from framework. Due to which there
> > > is difficulty in getting generator driver data back in enable
> > > function. we won't be able to use container_of macro as it results in
> > > static assert. we might end up
> > 
> > container_of()
> > 
> > Can you be more specific, what exactly happens?
> Let me provide some more info:

...

> Once the framework registration is done in probe function through
> pps_gen_register_source we get back pps_gen pointer and stored in our struct
> pps_tio.

This is irrelevant.

> As part of enable function:
> We are trying to get back pps_tio (parent structure) with the help of pps_gen
> as this is pointer container_of does not work here.
> Hence proposed add a new  generic  private pointer inside the
> pps_gen_source_info structure which is exposed to driver.
> 
> static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable)
> {
>     /* Trying to get back pps_tio struct is not possible as pps_gen is a  pointer in structure */
>      container_of(pps_gen, struct pps_tio, pps_gen);
> 
> }
> 
> Compilation Error:
> In file included from ./include/linux/bitfield.h:10,
>                  from drivers/pps/generators/pps_gen_tio.c:8:
> drivers/pps/generators/pps_gen_tio.c: In function 'pps_tio_gen_enable':
> ./include/linux/build_bug.h:78:41: error: static assertion failed: "pointer type mismatch in container_of()"
>    78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>       |                                         ^~~~~~~~~~~~~~
> ./include/linux/build_bug.h:77:34: note: in expansion of macro '__static_assert'
>    77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
>       |                                  ^~~~~~~~~~~~~~~
> ./include/linux/container_of.h:20:2: note: in expansion of macro 'static_assert'
>    20 |  static_assert(__same_type(*(ptr), ((type *)0)->member) || \
>       |  ^~~~~~~~~~~~~
> drivers/pps/generators/pps_gen_tio.c:172:24: note: in expansion of macro 'container_of'
>   172 |  struct pps_tio *tio = container_of(pps_gen,struct pps_tio, pps_gen);

Of course, you shouldn't use pointers, only embedded in members can be used
for container_of(). It seems like basic misunderstanding of how container_of()
works.

> > > in using static pointer. To avoid the same and get back the generator
> > > driver data back we are proposing generic approach to add drv_prv_data
> > > pointer inside the struct pps_gen_source_info.
> > 
> > > Example TIO structure wrapped with pps_gen_device and usage.
> > >
> > > struct pps_tio {
> > > 	/* Framework Related * /
> > > 	struct pps_gen_source_info pps_tio_source_info
> > > 	struct pps_gen_device *pps_gen;
> > 
> > > };
> > 
> > > static int pps_tio_enable(struct pps_gen_device *pps_gen, bool enable)
> > > {
> > >
> > >     /* Getting TIO data back */
> > >     /* Note: drv_prv_data will be initialized in our init routine */
> > >     struct pps_tio *tio = pps_gen->info.drv_prv_data;
> > 
> > So, what's wrong with the container_of() against pps_gen->info?
> > We have tons of code in the kernel that does it.
> 
> We are trying to get our TIO/struct pps_tio structure back using pps_gen pointer..
> 
> > >     /* Access tio members here to set some of the parameters */
> > >
> > >     return 0;
> > > }
> > 
> > Okay, looking into the implementation I see what's the issue (but it doesn't
> > mean that commit message is good here, you still need to explain better why
> > you can't get the correct address).
> 
> Ok, Something like this:
> 
> "Adding new generic private pointer to the struct pps_gen_source_info which
> can help in saving the parent driver data. In the existing adaption using
> container_of with a pointer to fetch the parent driver data/address is not

Pay attention for other comments which I gave against commit message text.

> possible"
> 
> "Example as shown above can be given as reference"
> 
> > The problem is that info is got fully copied. Perhaps we should rely on the fact
> > that it always be provided? I dunno any data structure that defines callbacks
> > and other "info" material should be considered as temporary storage (on
> > stack), it makes not much sense.
> 
> We are trying to get our TIO/struct pps_tio structure back using pps_gen
> pointer..

And..? What I proposed to replace copy of info structure in the struct
pps_gen_device by a pointer and make it const. In such a case the users
must provide either this from a global constant variable or a heap
(if for some most unlike reason they do it dynamically). That will solve
your issue and also makes memory foot print better. I.o.w. we have time
to modify this in easy way while the framework has not be spread over
the kernel.

-- 
With Best Regards,
Andy Shevchenko


