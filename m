Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E115F3FA
	for <linux-doc@vger.kernel.org>; Mon, 27 May 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716820725; cv=none; b=gQVtc1Tq1rPU+PYsfCUGJu4g8yxSPPfF8Nc0Pg6Ql0Zy2Y35SGuHL5ijpdyhkATUSonC8+16NAmzKu1pZCnqCAOBjFq7Z+L0VTe7mMVKzlyE5vKY8zNvzy00aQIt1vv21RyyRod+x8X/PFxK9qudubmzCJpfw7ZXEXiGlYGkxbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716820725; c=relaxed/simple;
	bh=1ploEBYJ7WBfvP4vhIV1KUlO8thNKiAS5Q5PBPZZbAo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAVmJWcRUavrD4C9x5TktTwtU+5wVElMm8o+SLhT216ZUIW6NTKLCUdGNqeK/30q/rsrm8Gac1NElcRdNvd7DXkO6dRJRFuRMADl/gnz+7IMyJ78PdfPOCUOW2ARingHESo+RI6wOlAPmFh9vEueV5wLNMTZeKJVqvc5PC/b48Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id a799409f-1c36-11ef-80bb-005056bdfda7;
	Mon, 27 May 2024 17:37:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 May 2024 17:37:33 +0300
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
Subject: Re: [PATCH v8 12/12] ABI: pps: Add ABI documentation for Intel TIO
Message-ID: <ZlSarRwF1vEbfzlP@surfacebook.localdomain>
References: <20240513103813.5666-1-lakshmi.sowjanya.d@intel.com>
 <20240513103813.5666-13-lakshmi.sowjanya.d@intel.com>
 <ZkH37Sc9LU4zmcGB@smile.fi.intel.com>
 <CY8PR11MB7364A367739AA57107DBBE6AC4F02@CY8PR11MB7364.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CY8PR11MB7364A367739AA57107DBBE6AC4F02@CY8PR11MB7364.namprd11.prod.outlook.com>

Mon, May 27, 2024 at 11:53:07AM +0000, D, Lakshmi Sowjanya kirjoitti:
> > -----Original Message-----
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, May 13, 2024 4:52 PM
> > On Mon, May 13, 2024 at 04:08:13PM +0530, lakshmi.sowjanya.d@intel.com
> > wrote:

...

> > > +Date:		June 2024
> > 
> > Is this checked by phb?
> > 
> > "the v6.11 kernel predictions: merge window closes on Sunday, 2024-08-04
> > and  release on Sunday, 2024-09-29"
> 
> I have taken from phb but my understanding is that any probable month before
> merge window should be added.

I didn't get this. You meant the merge window for the next cycle after your
changes are expected to land?

> I want to know if it should be the month when the merge window closes? (i.e
> in this case August)?

My common sense tells me that there will be no real users (except developers)
for any kernel that's marked as vX.Y-rcZ. Assuming that we announce the ABI in
the release, we should use date of the estimated relase. In this case I would
use September 2024.

> > > +KernelVersion:	6.11

-- 
With Best Regards,
Andy Shevchenko


