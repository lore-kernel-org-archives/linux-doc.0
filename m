Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC782335561
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 16:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762274666; cv=none; b=KGYVbfPrqqvZeAeI1M5+MxdqTDFCHQhLL04kOpPjarKRB5kDS5zP3QLT+zKVtWHJFwyc3XTVH09QwzniBqYTONiED691TaRZO9Y59ZGO6jfpN1KtKMOgNJ4hOCbCRklKkQqCRKyssE3dpkFgVTckBGTBlk9sJ9EM6ItqMzZFrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762274666; c=relaxed/simple;
	bh=8r31t90s4Bmk5BLqTWOCYw8DLfUxv4UF4RkTe7yzz30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=plm0+nIl7fMCnzN5Voz6/m+H3v+BljKTrQiIYL09U1l1/mzQB/6Wnwxy1L5peL6zoVAdUUqQxCoh6IoChiRVgul2kMZKQejq3CH3ZomY/yGFNNJYyieGp0xC5q1nhDa2BLfVT+ne3jC8ZBV2bk6cdXh5Lro4YvQwJmJqrqEQ8DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtiGglbd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtiGglbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762274663; x=1793810663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8r31t90s4Bmk5BLqTWOCYw8DLfUxv4UF4RkTe7yzz30=;
  b=EtiGglbdccZ0w6l3/7XBcNxQ6JW7dyLUuKuNGmSvkydDRDq5sO5xyog+
   YzVATaMshgXunXoH1au1B7j/gEK1F2kQCPZUzIw/CJfFHg31v2MYnRjo5
   I1JdRFm9LyakY3ck2bL/l6OxG03vQc3vvRm+C6IhC7CgorN52R2/hU5xZ
   hLoaCkmOODC1l35QtmRk7Cqb6fskB9kjKp8pxUbTHeKormh1inJfJHDSc
   9V2BIlCgesblfX1+dXGd7+qoXr90RiITYJASgYjrOp82hPMU7i6ukVaQE
   QVZFj6mLSri16bqwh57d/A6f0rwKzZG1EyNbEXzsU9oMd9Zy7aTMCxat3
   w==;
X-CSE-ConnectionGUID: xC4GrN91TYyft0NlK69E3g==
X-CSE-MsgGUID: gk7Fm9sTR+SO6IvP+DWPQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68029661"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="68029661"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 08:44:23 -0800
X-CSE-ConnectionGUID: 5ArVBBWYS6enIocEM2daNg==
X-CSE-MsgGUID: bddWacu9Rw+JCVQqWNJxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="191557607"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 04 Nov 2025 08:44:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2912895; Tue, 04 Nov 2025 17:44:20 +0100 (CET)
Date: Tue, 4 Nov 2025 17:44:20 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Vegard Nossum <vegard.nossum@oracle.com>, linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH v2 0/3] docs: new scripts to generate HTML redirects
Message-ID: <aQotZPIfyYBVic4H@black.igk.intel.com>
References: <20250905144608.577449-1-vegard.nossum@oracle.com>
 <87h5xbv2ey.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5xbv2ey.fsf@trenco.lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 09, 2025 at 01:41:57PM -0600, Jonathan Corbet wrote:
> Vegard Nossum <vegard.nossum@oracle.com> writes:
> 
> > Hi,
> >
> > When we rename an .rst file, that also changes the URL for the document
> > at https://docs.kernel.org/ and results in a 404, which can be anonying
> > for people who bookmark URLs and/or follow links from search engines
> > and old changelogs and emails.
> >
> > In order to be able to fearlessly rename individual documentation files
> > and reorganize Documentation/, add two scripts:
> >
> > - tools/docs/gen-renames.py : use git to figure out which .rst files
> >   have been renamed
> >
> > - tools/docs/gen-redirects.py : actually generate .html stubs for the
> >   locations, redirecting to the new locations
> >
> > The reason for splitting this into two is that trawling git history is
> > slightly slow (on the order of 20-30 seconds on my laptop) whereas just
> > generating the HTML files is very fast. This also allows us to cache
> > the historical renames in Documentation/.renames.txt or add manual
> > fixups as needed.
> >
> > Changes since v1:
> >
> > - cover letter
> > - move files from scripts/ -> tools/docs/
> > - add SPDX lines
> > - program doc strings + improved --help
> >
> >
> > Vegard
> >
> > ---
> >
> > Vegard Nossum (3):
> >   docs: add tools/docs/gen-renames.py
> >   docs: add Documentation/.renames.txt
> >   docs: add tools/docs/gen-redirects.py
> >
> >  Documentation/.renames.txt  | 1191 +++++++++++++++++++++++++++++++++++
> >  Documentation/Makefile      |    4 +
> >  Makefile                    |    5 +-
> >  tools/docs/gen-redirects.py |   54 ++
> >  tools/docs/gen-renames.py   |  130 ++++
> >  5 files changed, 1382 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/.renames.txt
> >  create mode 100755 tools/docs/gen-redirects.py
> >  create mode 100755 tools/docs/gen-renames.py
> 
> Hearing no complaints and finding no problems, I've applied this,
> thanks.

There is one.

Documentation/.renames.txt: warning: ignored by one of the .gitignore files
100% reproducibility on each build.

-- 
With Best Regards,
Andy Shevchenko


