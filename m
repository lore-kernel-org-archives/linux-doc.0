Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEC028853A;
	Thu, 20 Nov 2025 17:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660555; cv=none; b=VzehUkX2jVrIuPHf0NrQm7NBvMP/xyCS9sicoaVWlHJvkU/O//y4WkY/csqZTUSFxDsBzVlsa12lIwTgFr3z3KQtsQoov9VgBST+UJzmji0d89tixbBK4M3Br71uqoa3Oi95tPdSnjyAJwEdgJ1uOvAKCpRRy1tnXNurvdTiM1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660555; c=relaxed/simple;
	bh=JBFA9KKfJqucmqtF09S9tOC7ecNDsswWzh8N1KKbmbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcl0qg9zDKeF+haZzfvNUDMQaSxMJGedTiBsxWPwOFvGwG4uzuU9rLygdAqLG/M5zNH2QKq0pxBLaZl7U9kkUra3pEXT0D2gL5g9KGbDaeAFFvjK6MassMR0+sdIpPgth48gflNtMweVG6zBZD0qb5AW5GrMh4k45qPQBCR+CJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7AB8339;
	Thu, 20 Nov 2025 09:42:24 -0800 (PST)
Received: from e133380.arm.com (e133380.arm.com [10.1.197.66])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BED843F66E;
	Thu, 20 Nov 2025 09:42:30 -0800 (PST)
Date: Thu, 20 Nov 2025 17:42:28 +0000
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
Message-ID: <aR9TBNAJqQNpGjMh@e133380.arm.com>
References: <20251031154225.14799-1-Dave.Martin@arm.com>
 <45b96e99-ac5e-4546-b58b-f4d062d2f823@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45b96e99-ac5e-4546-b58b-f4d062d2f823@intel.com>

On Thu, Nov 20, 2025 at 08:46:24AM -0800, Reinette Chatre wrote:
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
> > 
> > No functional change.
> 
> Please use max line length available. Changelogs have to conform before merge
> and having patch ready saves this work.

Fixed.  Sorry, old habits die hard.

I won't bother with the tearoff text, though, it that's OK -- that
won't go into git.

[...]

> > diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> > index b7f35b07876a..fbbcf5421346 100644
> > --- a/Documentation/filesystems/resctrl.rst
> > +++ b/Documentation/filesystems/resctrl.rst

[...]

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
> >  
> >  The bandwidth throttling is a core specific mechanism on some of Intel
> >  SKUs. Using a high bandwidth and a low bandwidth setting on two threads
> 
> The documentation changes look good to me. Thank you.

OK, sounds good.

[...]

> > diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> > index 0d0ef54fc4de..26e3f7c88c86 100644
> > --- a/fs/resctrl/ctrlmondata.c
> > +++ b/fs/resctrl/ctrlmondata.c
> > @@ -35,8 +35,8 @@ typedef int (ctrlval_parser_t)(struct rdt_parse_data *data,
> >  /*
> >   * Check whether MBA bandwidth percentage value is correct. The value is
> >   * checked against the minimum and max bandwidth values specified by the
> > - * hardware. The allocated bandwidth percentage is rounded to the next
> > - * control step available on the hardware.
> > + * hardware. The allocated bandwidth percentage is converted as
> > + * appropriate for consumption by the specific hardware driver.
> 
> The text looks good but adjusting the right margin mid-paragraph seems unnecessary?
> 

I was trying to follow the prevailing line length; but I guess the
lines existing lines were already shortened by flowing the text, so I
misjudged it.

Fixed locally.

Is there a view on how to flow new text? (not so applicable here)

Keeping the lines a bit short (say, 72 chars) means that minor edits
and typo fixes can be applied without extraneous diff noise most of the
time.  I find reviewing an entire re-flowed paragraph annoying when
there is really just a one-word change buried in the middle of it
somewhere.

Equally, I try to avoid reflowing text for minor edits unless
absolutely necessary; poking a few chars over 80 seems tolerable in
that situation, but I prefer it not to go too far...

> >   */
> >  static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
> >  {
> > @@ -69,7 +69,7 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r)
> >  		return false;
> >  	}
> >  
> > -	*data = roundup(bw, (unsigned long)r->membw.bw_gran);
> > +	*data = resctrl_arch_preconvert_bw(bw, r);
> >  	return true;
> >  }
> >  
> > diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> > index a7d92718b653..1fb6e2118b61 100644
> > --- a/include/linux/resctrl.h
> > +++ b/include/linux/resctrl.h
> > @@ -485,6 +485,20 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
> >   */
> >  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
> >  
> > +/*
> > + * Convert a bandwidth control value to the appropriate form for
> > + * consumption by the hardware driver for resource r.
> 
> When being as descriptive, please switch to proper kernel-doc instead. There are
> a couple of examples for reference in this header file.

This comment was pretty trivial to begin with, but grew.

> > + *
> > + * For example, it simplifies the x86 RDT implementation to round the
> > + * value to a suitable step here and then treat the resulting value as
> > + * opaque when programming the hardware MSRs later on.
> 
> This "For example" can be dropped.

Done.

> > + *
> > + * Architectures for which this pre-conversion hook is not useful
> > + * should supply an implementation of this function that just returns
> > + * val unmodified.
> > + */

I've fleshed this out a little, as follows:

--8<--

/**
 * resctrl_arch_preconvert_bw() - Convert a bandwidth control value to the
 *				  appropriate form for consumption by the
 *				  hardware driver for resource r.
 * @val:	Control value written to the schemata file by userspace.
 * @r:		Resource whose schema was written.
 *
 * Return:	The converted value.
 *
 * It simplifies the x86 RDT implementation to round the value to a suitable
 * step at parse time and then treat the resulting value as opaque when
 * programming the hardware MSRs later on.  In this situation, this hook is the
 * correct place to perform the conversion.
 *
 * Architectures for which this pre-conversion hook is not useful should supply
 * an implementation of this function that just returns @val unmodified.
 */
u32 resctrl_arch_preconvert_bw(u32 val, const struct rdt_resource *r);

-->8--

Does that look like enough?

Cheers
---Dave
