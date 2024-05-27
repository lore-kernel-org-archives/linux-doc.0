Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA216C6A3
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 14:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820465; cv=none; b=AIFN99KZQF2a4L3GZ7aUkdnt8bg1ooh61PchcqXzPFxmRvAs+T/46xgK+9NV4n4Xmk/dfvyfy+jV2C1DtCAAQT0UWb30DjQAGT8nToHHY/P5nhSYlnn/YzSkcAMTQVH8r2+jgzqlfW7i298Odt+ia/OyxwYoPytvN9bjFHteOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820465; c=relaxed/simple;
	bh=HaAgE/aZ3JdMthdhWf9VMNdA6SlrHtpI51bJIvG36Bs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mIBcCj9RqRynjufZi/HWIHL5QJYPcmxNt3F10hiobRvEuF/m2WMCw0Z91akC5EBIdJ0407iCggoBfNBRGUSOqQXn0rsa1cSMX9gGvuh0pzDTQ3ET/R/WwpJcE2DcxAdeieHqyvMmNU+PKS37Km4MOTDYuWAM8pzCFuFxQ0jr5Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 33d59d03-1c36-11ef-80bb-005056bdfda7;
	Mon, 27 May 2024 17:34:20 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 May 2024 17:34:19 +0300
To: "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	"jstultz@google.com" <jstultz@google.com>,
	"giometti@enneenne.com" <giometti@enneenne.com>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
	"Dong, Eddie" <eddie.dong@intel.com>,
	"Hall, Christopher S" <christopher.s.hall@intel.com>,
	"Brandeburg, Jesse" <jesse.brandeburg@intel.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>,
	"peter.hilber@opensynergy.com" <peter.hilber@opensynergy.com>,
	"N, Pandith" <pandith.n@intel.com>,
	"Mohan, Subramanian" <subramanian.mohan@intel.com>,
	"T R, Thejesh Reddy" <thejesh.reddy.t.r@intel.com>
Subject: Re: [PATCH v8 10/12] pps: generators: Add PPS Generator TIO Driver
Message-ID: <ZlSZ63ST-Pj9CwCh@surfacebook.localdomain>
References: <20240513103813.5666-1-lakshmi.sowjanya.d@intel.com>
 <20240513103813.5666-11-lakshmi.sowjanya.d@intel.com>
 <ZkH3GP2b9WTz9W3W@smile.fi.intel.com>
 <CY8PR11MB7364D1C85099E4337408EBAFC4F02@CY8PR11MB7364.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7364D1C85099E4337408EBAFC4F02@CY8PR11MB7364.namprd11.prod.outlook.com>

Mon, May 27, 2024 at 11:48:54AM +0000, D, Lakshmi Sowjanya kirjoitti:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, May 13, 2024 4:49 PM
> > On Mon, May 13, 2024 at 04:08:11PM +0530, lakshmi.sowjanya.d@intel.com
> > wrote:

...

> > > +static ssize_t enable_store(struct device *dev, struct device_attribute
> > *attr, const char *buf,
> > > +			    size_t count)
> > > +{
> > > +	struct pps_tio *tio = dev_get_drvdata(dev);
> > > +	bool enable;
> > > +	int err;
> > 
> > (1)
> > 
> > > +	err = kstrtobool(buf, &enable);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	guard(spinlock_irqsave)(&tio->lock);
> > > +	if (enable && !tio->enabled) {
> > 
> > > +		if (!timekeeping_clocksource_has_base(CSID_X86_ART)) {
> > > +			dev_err(tio->dev, "PPS cannot be started as clock is
> > not related
> > > +to ART");
> > 
> > Why not simply dev_err(dev, ...)?
> > 
> > > +			return -EPERM;
> > > +		}
> > 
> > I'm wondering if we can move this check to (1) above.
> > Because currently it's a good question if we are able to stop PPS which was
> > run by somebody else without this check done.
> 
> Do you mean can someone stop the signal without this check? 
> Yes, this check is not required to stop.  So, I feel it need not be moved to (1).
> 
> Please, correct me if my understanding is wrong.

So, there is a possibility to have a PPS being run (by somebody else) even if
there is no ART provided?

If "yes", your check is wrong to begin with. If "no", my suggestion is correct,
i.e. there is no need to stop something that can't be started at all.

> > I.o.w. this sounds too weird to me and reading the code doesn't give any hint
> > if it's even possible. And if it is, are we supposed to touch that since it was
> > definitely *not* us who ran it.
> 
> Yes, we are not restricting on who can stop/start the signal. 

See above. It's not about this kind of restriction.

> > > +		pps_tio_direction_output(tio);
> > > +		hrtimer_start(&tio->timer, first_event(tio),
> > HRTIMER_MODE_ABS);
> > > +		tio->enabled = true;
> > > +	} else if (!enable && tio->enabled) {
> > > +		hrtimer_cancel(&tio->timer);
> > > +		pps_tio_disable(tio);
> > > +		tio->enabled = false;
> > > +	}
> > > +	return count;
> > > +}

-- 
With Best Regards,
Andy Shevchenko


