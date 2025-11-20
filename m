Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1771369983;
	Thu, 20 Nov 2025 17:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763658282; cv=none; b=WMPE7p31+/ouDZLHdi7vcz+UCTzx1cg2VACKiNhsX8CuUg6ciVdtu3B2Wg1KstVvDkGanZQsowY8MH1cCcB6ScckXyNXQWnc5VyULyYu5ZC4TKgrGhdQONpo2PXL9qLonO+JJRn+0H4ZlvNvXpgWFpWNX3jTh+rIpi4xcwkLr3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763658282; c=relaxed/simple;
	bh=+LGqzApB0GKl2SUNDu44TvAonaKxdw+2pE/+9E9tsTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtxxtsMJEX88R7pBQMpPKk8SU+9MQsD2r4Q+5DlrPdNxTVE4iH/Gkg6aM8LtxOCx9CwyiplWOXSfh99ZAyBms8iy2RVVNErmgY3+dYRvfF/7tyv39aOmKC6d8KDF7vjNLO49vL/GrdJHUQsDzcFuh5CQKfy2YqBhKmPJBdqrNH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70899339;
	Thu, 20 Nov 2025 09:04:31 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6737B3F66E;
	Thu, 20 Nov 2025 09:04:37 -0800 (PST)
Date: Thu, 20 Nov 2025 17:04:35 +0000
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
Message-ID: <aR9KIxMIDrf0V95D@e133380.arm.com>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <136d9c83-e816-4188-ae0d-322478a57a68@intel.com>
 <aRyVHqeHaRtrKqvG@e133380.arm.com>
 <caa771e1-e86b-43b0-bc4e-09057f598fab@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa771e1-e86b-43b0-bc4e-09057f598fab@intel.com>

Hi Reinette,

On Wed, Nov 19, 2025 at 07:05:10PM -0800, Reinette Chatre wrote:
> Hi Dave,
> 
> On 11/18/25 7:47 AM, Dave Martin wrote:
> > Hi Reinette,
> > 
> > On Fri, Nov 14, 2025 at 02:17:53PM -0800, Reinette Chatre wrote:
> >> Hi Dave,
> >>
> >> On 10/31/25 8:41 AM, Dave Martin wrote:
> >>> The control value parser for the MB resource currently coerces the
> >>> memory bandwidth percentage value from userspace to be an exact
> >>> multiple of the rdt_resource::resctrl_membw::bw_gran parameter.
> >>>
> >>> On MPAM systems, this results in somewhat worse-than-worst-case
> >>> rounding, since the bandwidth granularity advertised to resctrl by the
> >>> MPAM driver is in general only an approximation to the actual hardware
> >>> granularity on these systems, and the hardware bandwidth allocation
> >>> control value is not natively a percentage -- necessitating a further
> >>> conversion in the resctrl_arch_update_domains() path, regardless of the
> >>> conversion done at parse time.
> >>>
> >>> Allow the arch to provide its own parse-time conversion that is
> >>> appropriate for the hardware, and move the existing conversion to x86.
> >>> This will avoid accumulated error from rounding the value twice on MPAM
> >>> systems.
> >>>
> >>> Clarify the documentation, but avoid overly exact promises.
> >>>
> >>> Clamping to bw_min and bw_max still feels generic: leave it in the core
> >>> code, for now.
> >>
> >> I think they are only theoretically generic since arch sets them and resctrl
> >> uses to enforce user input. Arch can thus theoretically set them to whatever
> >> the u32 used to represent it allows. Of course, doing something like this makes
> >> the interface even harder for users to use.
> > 
> > Hence, "feels".
> > 
> > This could perhaps be refined, but I didn't see an obvious reason to
> > change the way this works, right now.
> > 
> > Or, is there a problem here that I'm missing?
> 
> No. We are in agreement.

OK, thanks for clarifying.

[...]

> >>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> >>> index b7f35b07876a..fbbcf5421346 100644
> >>> --- a/Documentation/filesystems/resctrl.rst
> >>> +++ b/Documentation/filesystems/resctrl.rst
> >>> @@ -144,12 +144,11 @@ with respect to allocation:
> >>>  		user can request.
> >>>  
> >>>  "bandwidth_gran":
> >>> -		The granularity in which the memory bandwidth
> >>> -		percentage is allocated. The allocated
> >>> -		b/w percentage is rounded off to the next
> >>> -		control step available on the hardware. The
> >>> -		available bandwidth control steps are:
> >>> -		min_bandwidth + N * bandwidth_gran.
> >>> +		The approximate granularity in which the memory bandwidth
> >>> +		percentage is allocated. The allocated bandwidth percentage
> >>> +		is rounded up to the next control step available on the
> >>> +		hardware. The available hardware steps are no larger than
> >>> +		this value.
> >>>  
> >>>  "delay_linear":
> >>>  		Indicates if the delay scale is linear or
> >>> @@ -737,8 +736,10 @@ The minimum bandwidth percentage value for each cpu model is predefined
> >>>  and can be looked up through "info/MB/min_bandwidth". The bandwidth
> >>>  granularity that is allocated is also dependent on the cpu model and can
> >>>  be looked up at "info/MB/bandwidth_gran". The available bandwidth
> >>> -control steps are: min_bw + N * bw_gran. Intermediate values are rounded
> >>> -to the next control step available on the hardware.
> >>> +control steps are, approximately, min_bw + N * bw_gran.  The steps may
> >>> +appear irregular due to rounding to an exact percentage: bw_gran is the
> >>> +maximum interval between the percentage values corresponding to any two
> >>> +adjacent steps in the hardware.
> >>
> >> What can bw_gran be expected to be on Arm systems? Could existing usage be supported with
> >> MPAM setting bw_gran to 1?
> > 
> > Architecturally, ceil(100.0 / (1 << b)), where 1 <= b <= 16.
> > 
> > So, the possible values are
> > 
> > 	1, 2, 4, 7, 13, 25, 50
> > 
> > (with 25 and 50 being the only ones that are exact).
> > 
> > In practice, something like 6 <= b <= 8 is probably more typical; this
> > would give advertised bandwidth_gran values of 2 or 1.
> > 
> > 
> > Re your question about existing usage, were you suggesting
> > unconditionally setting bw_gran to 1?
> 
> Yes, I *was* suggesting that. I considered bw_gran of 1 to be a "safe" value that
> provides architecture with most flexibility. Now that you have provided more
> insight on how MPAM uses this value I agree that bw_gran of 1 is not appropriate
> for MPAM.

Right.

> > Since the values are converted to/from hardware representation in
> > resctrl_arch_update_domains() / resctrl_arch_get_config(), we
> > don't have a problem, provided that the value doesn't get rounded in
> > advance by bw_validate().
> > 
> > But if bw_gran is always 1, it will mislead userspace about the
> > precision.  This feels stranger for userspace than fine differences in
> > precisely which percentage values get read out of schemata.
> > 
> >> What will these control steps actually look like when the user views the schemata file
> >> on an Arm system?
> > 
> > It depends on the number of bits in the hardware value (the parameter b
> > above).  Picking the smallest, non-trivial value 3:
> > 
> > 	schemata	hardware (MBW_MAX)
> > 
> > 	 13		0
> > 	 25		1
> > 	 38		2
> > 	 50		3
> > 	 63		4
> > 	 75		5
> > 	 88		6
> > 	100		7
> > 
> > As currently implemented, I believe that writing the values from the
> > "schemata" column above will result in the corresponding values from
> > the "hardware" column being written to the hardware.  Achitecturally,
> > there is no guaranteed representation for 0%; we would advertise min=13,
> > max=100 in info/.)
> > 
> > A round-to-nearest policy is followed for intermediate values on write.
> > 
> > 	(hardware value = round(schemata value * 8.0 / 100.0) - 1).)
> > 
> > Reading the value back translates the value from the "hardware" column
> > back to the unique value in the "schemata" column.
> > 
> > 	(schemata value = round((hardware value + 1) * 100.0 / (1 << b)).)
> > 
> > 
> > In this case, bandwidth_gran would be advertised as 13, which is the
> > largest step that can be seen in the read-back values.
> 
> Thank you very much for these details. I appreciate having a better understanding
> on how the hardware enforces these control steps instead of some software emulation.
> With these steps enforced in this way on the architecture side it creates 
> confidence that the user space expectations from interface can be met directly
> by architecture.
> 
> > I would rather avoid promising precisely which values can be read out;
> > merely that they are consistent with the approximate precision defined
> > by the bandwidth_gran parameter.
> 
> ack. I believe the accompanied changes to resctrl.rst supports this.

OK, good.  Getting the rounding behaviour right so that the MPAM
conversion is stable turned out to be a subtle business, so it's
reassuring that if we find it isn't implemented quite right and need to
fine-tune it later, we don't consider that an interface break (within
reason).

> >> With resctrl "coercing" the user provided value before providing it to the architecture
> >> it controls these control steps to match what the documentation states above. If resctrl
> >> instead provides the value directly to the architecture I see nothing preventing the
> >> architecture from ignoring resctrl's "contract" with user space documented above and
> >> using arbitrary control steps since it also controls resctrl_arch_get_config() that is
> >> displayed directly to user space. What guarantee is there that resctrl_arch_get_config()
> >> will display a value that is "approximately" min_bw + N * bw_gran? This seems like opening
> > 
> > No guarantee, but there will only be one resctrl_arch_preconvert_bw()
> > per arch.  We'd expect the functions to be simple, so this doesn't feel
> > like an excessive maintenance burden?
> 
> Agree.
> 
> > 
> > (All the resctrl_arch_foo() hooks have to do the right thing after all,
> > otherwise nothing will work.)
> > 
> > 
> > With this patch, resctrl_arch_preconvert_bw() and
> > resctrl_arch_{update_domains,get_config}() between them must provide
> > the correct behaviour.
> 
> Right. This blurs the lines of responsibility. I interpret this as:
> "resctrl fs makes promises to user space that resctrl fs *and* the architecture are
>  responsible to keep"

Ack.  It's a joint responsbility.

Thinking about it, I don't think that the value returned by
resctrl_arch_preconvert_bw() is used in any way except for storing it
into rdt_ctrl_domain::staged_configs[] for later consumption by
resctrl_arch_update_domains().

If so, the meaning of this value is really arch-determined.

It is convenient for the x86 implementation to convert this to hardware
form at parse time, whereas, because of the way the MPAM code is
structured, it suits the MPAM driver better to convert it later on.

In the x86 case, it means that the arch code doesn't have to
distinguish much between input values for different kinds of control:
it's just a matter of writing precomputed values to MSRs.  This keeps
parts of the backend simple.

In the MPAM case, it's more about encapsulating grungy arch-specific
details in the driver.  The common resctrl structures don't contain all
the information needed.  We might have to pull a lot of junk out of the
private headers in order to the conversion in the context of an inline
function called by the schemata parser.

I think that it's likely that either all the conversion work is done in
resctrl_arch_preconvert_bw() (e.g., x86), or all the work is done in
the resctrl_arch_update_domains() backend (e.g., MPAM).  There's
probably no good reason ever to split the work into two parts.

Does that make sense?

> > 
> > But even today, resctrl_arch_update_domains() and
> > resctrl_arch_get_config() have to do the right thing in order for
> > bandwidth control values to be handled correctly, as seen through the
> > schemata interface.
> 
> ack.
> 
> > 
> > (x86's job is easy, because the generic interface between the resctrl
> > core and the arch interface happens to be expressed in terms of raw x86
> > MSR values due to the history.  But other arches don't get the benefit
> > of that.)
> 
> That is just the benefit of being the first architecture to be supported.
> If determined to cause headaches elsewhere it can surely change.
> > The reason for this patch is the generic code can't do the right thing
> > for MPAM, unless there is a hook into the arch code, arch-/hardware-
> > specific knowledge is added in the core code, or unless a misleading
> > bw_gran value is advertised.
> Understood.
> 
> > 
> > I tried to take the pragmatic approach, but I'm open to suggestions if
> > you'd prefer this to be factored in another way.
> 
> I am ok with this approach and will respond to the patch details separately.

OK, thanks -- I see you already replied, so I'll respond there.

> > 
> >> the door even wider for resctrl to become architecture specific ... with this change the
> >> schemata file becomes a direct channel between user space and the arch that risks users
> >> needing to tread carefully when switching between different architectures.
> > 
> > There doesn't feel like a magic solution here.
> > 
> > Exact bandwidth and flow control behaviour is extremely dependent on
> > hardware topology and the design of interconnects and on dynamic system
> > load.  An interface that is generic and rigorously defined, yet also
> > simple enough to be reasonably usable by portable software would
> > probably not be implementable on any real hardware platform.
> > 
> > So, if it's useful to have a generic interface at all, hardware and
> > software are going to have to meet in the middle somewhere...
> 
> I believe that we could also use above as a quote in support of the schema
> description work.
> 
> > 
> > (The historical behaviour -- and even the interface -- of MB is not
> > generic either, right?)
> 
> Right. Even so, I prefer to use MB as motivation to do things better rather
> than an excuse to make things worse.
> 
> Reinette

Cheap shot, I know.

I guess that more is known now about what kinds of control behaviour
are likely to exist than was known about when resctrl was first
developed... though we still don't have a crystal ball.

My aim is generalise enough to cover most of what we know about today,
while not inventing pie-in-the-sky abstractions that may never be
fully used...  It's a balancing act, though.

There's a fine like between a "random nonportable junk" schema and
reasonable exposure of an architecture-specific control that makes
sense within resctrl but is unlikely to map onto other architectures.

We should certainly push back on the latter, but could it be appropriate
to expose arch-specific control types in some situations?  I don't like
to rule it out absolutely.

Cheers
---Dave
