Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A802353888;
	Tue, 18 Nov 2025 15:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480880; cv=none; b=l8gvzyD4hUmm2MXngofX+g96lj/OeVVky4mEhNGZku8ZyKHlaMff8Ow3pQbxOjd1gi8Iq4ds524OMtseku7dxekHufT0TCGwPrA9V4xrFwsonw3oCHbU2jPgG2uiyQNOLCnEoQyP0vYoDE+OQRlAExAbGdQ2l0N99YH6oPS+Xqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480880; c=relaxed/simple;
	bh=cda+I7fz7lwIQP7+AghFT2kub08E5CyJy5NRL/w5rSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkYcsOdvIxwz9SoMM2NDeXxFHHlaAfDKNc/oUrac5o1RVyCu+T5Ra1Zt5d4Pi3eVz5PA+N1CA+2F4PYQra05QXsiRY3QJ/HYpftTR24cpyOncsU/2rUfsQ6lKBs//f2K5QxaI8iekb1xixFgEj1Xt/cAQVheuzc2YsSSJM+V8Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF5DFEC;
	Tue, 18 Nov 2025 07:47:49 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2707C3F66E;
	Tue, 18 Nov 2025 07:47:55 -0800 (PST)
Date: Tue, 18 Nov 2025 15:47:42 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] x86,fs/resctrl: Factor MBA parse-time conversion to
 be per-arch
Message-ID: <aRyVHqeHaRtrKqvG@e133380.arm.com>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <136d9c83-e816-4188-ae0d-322478a57a68@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <136d9c83-e816-4188-ae0d-322478a57a68@intel.com>

Hi Reinette,

On Fri, Nov 14, 2025 at 02:17:53PM -0800, Reinette Chatre wrote:
> Hi Dave,
> 
> On 10/31/25 8:41 AM, Dave Martin wrote:
> > The control value parser for the MB resource currently coerces the
> > memory bandwidth percentage value from userspace to be an exact
> > multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> > 
> > On MPAM systems, this results in somewhat worse-than-worst-case
> > rounding, since the bandwidth granularity advertised to resctrl by the
> > MPAM driver is in general only an approximation to the actual hardware
> > granularity on these systems, and the hardware bandwidth allocation
> > control value is not natively a percentage -- necessitating a further
> > conversion in the resctrl_arch_update_domains() path, regardless of the
> > conversion done at parse time.
> > 
> > Allow the arch to provide its own parse-time conversion that is
> > appropriate for the hardware, and move the existing conversion to x86.
> > This will avoid accumulated error from rounding the value twice on MPAM
> > systems.
> > 
> > Clarify the documentation, but avoid overly exact promises.
> > 
> > Clamping to bw_min and bw_max still feels generic: leave it in the core
> > code, for now.
> 
> I think they are only theoretically generic since arch sets them and resctrl
> uses to enforce user input. Arch can thus theoretically set them to whatever
> the u32 used to represent it allows. Of course, doing something like this makes
> the interface even harder for users to use.

Hence, "feels".

This could perhaps be refined, but I didn't see an obvious reason to
change the way this works, right now.

Or, is there a problem here that I'm missing?

> 
> > 
> > No functional change.
> > 
> > Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> > 
> > ---
> 
> ...
> 
> > diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> > index b7f35b07876a..fbbcf5421346 100644
> > --- a/Documentation/filesystems/resctrl.rst
> > +++ b/Documentation/filesystems/resctrl.rst
> > @@ -144,12 +144,11 @@ with respect to allocation:
> >  		user can request.
> >  
> >  "bandwidth_gran":
> > -		The granularity in which the memory bandwidth
> > -		percentage is allocated. The allocated
> > -		b/w percentage is rounded off to the next
> > -		control step available on the hardware. The
> > -		available bandwidth control steps are:
> > -		min_bandwidth + N * bandwidth_gran.
> > +		The approximate granularity in which the memory bandwidth
> > +		percentage is allocated. The allocated bandwidth percentage
> > +		is rounded up to the next control step available on the
> > +		hardware. The available hardware steps are no larger than
> > +		this value.
> >  
> >  "delay_linear":
> >  		Indicates if the delay scale is linear or
> > @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
> >  and can be looked up through "info/MB/min_bandwidth". The bandwidth
> >  granularity that is allocated is also dependent on the cpu model and can
> >  be looked up at "info/MB/bandwidth_gran". The available bandwidth
> > -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
> > -to the next control step available on the hardware.
> > +control steps are, approximately, min_bw + N * bw_gran.  The steps may
> > +appear irregular due to rounding to an exact percentage: bw_gran is the
> > +maximum interval between the percentage values corresponding to any two
> > +adjacent steps in the hardware.
> 
> What can bw_gran be expected to be on Arm systems? Could existing usage be supported with
> MPAM setting bw_gran to 1?

Architecturally, ceil(100.0 / (1 << b)), where 1 <= b <= 16.

So, the possible values are

	1, 2, 4, 7, 13, 25, 50

(with 25 and 50 being the only ones that are exact).

In practice, something like 6 <= b <= 8 is probably more typical; this
would give advertised bandwidth_gran values of 2 or 1.


Re your question about existing usage, were you suggesting
unconditionally setting bw_gran to 1?

Since the values are converted to/from hardware representation in
resctrl_arch_update_domains() / resctrl_arch_get_config(), we
don't have a problem, provided that the value doesn't get rounded in
advance by bw_validate().

But if bw_gran is always 1, it will mislead userspace about the
precision.  This feels stranger for userspace than fine differences in
precisely which percentage values get read out of schemata.

> What will these control steps actually look like when the user views the schemata file
> on an Arm system?

It depends on the number of bits in the hardware value (the parameter b
above).  Picking the smallest, non-trivial value 3:

	schemata	hardware (MBW_MAX)

	 13		0
	 25		1
	 38		2
	 50		3
	 63		4
	 75		5
	 88		6
	100		7

As currently implemented, I believe that writing the values from the
"schemata" column above will result in the corresponding values from
the "hardware" column being written to the hardware.  Achitecturally,
there is no guaranteed representation for 0%; we would advertise min=13,
max=100 in info/.)

A round-to-nearest policy is followed for intermediate values on write.

	(hardware value = round(schemata value * 8.0 / 100.0) - 1).)

Reading the value back translates the value from the "hardware" column
back to the unique value in the "schemata" column.

	(schemata value = round((hardware value + 1) * 100.0 / (1 << b)).)


In this case, bandwidth_gran would be advertised as 13, which is the
largest step that can be seen in the read-back values.


I would rather avoid promising precisely which values can be read out;
merely that they are consistent with the approximate precision defined
by the bandwidth_gran parameter.

> 
> With resctrl "coercing" the user provided value before providing it to the architecture
> it controls these control steps to match what the documentation states above. If resctrl
> instead provides the value directly to the architecture I see nothing preventing the
> architecture from ignoring resctrl's "contract" with user space documented above and
> using arbitrary control steps since it also controls resctrl_arch_get_config() that is
> displayed directly to user space. What guarantee is there that resctrl_arch_get_config()
> will display a value that is "approximately" min_bw + N * bw_gran? This seems like opening

No guarantee, but there will only be one resctrl_arch_preconvert_bw()
per arch.  We'd expect the functions to be simple, so this doesn't feel
like an excessive maintenance burden?

(All the resctrl_arch_foo() hooks have to do the right thing after all,
otherwise nothing will work.)


With this patch, resctrl_arch_preconvert_bw() and
resctrl_arch_{update_domains,get_config}() between them must provide
the correct behaviour.

But even today, resctrl_arch_update_domains() and
resctrl_arch_get_config() have to do the right thing in order for
bandwidth control values to be handled correctly, as seen through the
schemata interface.

(x86's job is easy, because the generic interface between the resctrl
core and the arch interface happens to be expressed in terms of raw x86
MSR values due to the history.  But other arches don't get the benefit
of that.)


The reason for this patch is the generic code can't do the right thing
for MPAM, unless there is a hook into the arch code, arch-/hardware-
specific knowledge is added in the core code, or unless a misleading
bw_gran value is advertised.

I tried to take the pragmatic approach, but I'm open to suggestions if
you'd prefer this to be factored in another way.

> the door even wider for resctrl to become architecture specific ... with this change the
> schemata file becomes a direct channel between user space and the arch that risks users
> needing to tread carefully when switching between different architectures.

There doesn't feel like a magic solution here.

Exact bandwidth and flow control behaviour is extremely dependent on
hardware topology and the design of interconnects and on dynamic system
load.  An interface that is generic and rigorously defined, yet also
simple enough to be reasonably usable by portable software would
probably not be implementable on any real hardware platform.

So, if it's useful to have a generic interface at all, hardware and
software are going to have to meet in the middle somewhere...

(The historical behaviour -- and even the interface -- of MB is not
generic either, right?)

Cheers
---Dave
