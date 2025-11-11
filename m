Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0A41FF7C8;
	Tue, 18 Nov 2025 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490590; cv=none; b=KS7VA8yAazkYt+cvaiLC/TTIWrSutw6wpEB5UC5o+HbmQYbWWmzV9Ie1ySNBNDO/vW1iBjup0FznYsxyCrkHve51B5MWtV4RfcuB2gJz38aEOr2HKaw1Fmo/aEQaDGrA1HxLaIJssj9+HYpqIYrIou7rE7QGtkHj/nD6UuSje0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490590; c=relaxed/simple;
	bh=/DFriTd+33HWzyodZ64k3KQ02C2jrg131hWJPX8kZNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le3J0Z2Cpif93YXmB7aNDFz0CYG/543dZPYoGjeudLBq16r6mrpk3nL2TMWWDoc21ep9/uUbeQHSN1Xie3q0H4HvSIj2MZlqL78/oZNS2MxgxK9x57LVUh+EdV1WMTc1DQit14oZE4tzDYRFbVq7rdOO92hzlZbhE3z3rgBnfao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKdgTfQT; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKdgTfQT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763490589; x=1795026589;
  h=resent-from:resent-date:resent-message-id:resent-to:date:
   from:to:cc:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=/DFriTd+33HWzyodZ64k3KQ02C2jrg131hWJPX8kZNo=;
  b=IKdgTfQT9aJBbGdHCexT/xmAF5eyq+/WPa8vZ8WmxjGad4+iYB2BRUgD
   d9XvKELQ0NbnDgvD42EsziW99Q6L34lmt/ruFQoaUqNIA9CSg0YRJ4Mlq
   o6ZadmyGnm1k2/ukZOnxChQVH+srdicE0479paD0yi8XsHFQ7U7OG6/MT
   JTGjzLghonxtAGkH8k5ISXMIi8+z0hDylUgUmrj0QRlhBmcU1KURjnv0y
   5r6NF2sC0bmn9TLOUJlpaHk7Qf6hupl3QL9O2L4RxvZHaeAN3zVrdpTxT
   WtNckBFgxj40gE2S6Sno0NSliqQ6wGUqHeRzhxd3i/ao4QjAMbCsUMjxG
   w==;
X-CSE-ConnectionGUID: m018+XwoTZe7Nk1APIP7pA==
X-CSE-MsgGUID: 9pa8dliSS+CVLs8lYqqCQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="83149083"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="83149083"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:29:47 -0800
X-CSE-ConnectionGUID: nYQSywy+QY6Mgt162cX89w==
X-CSE-MsgGUID: yGwfCyZbQpWm63j+NWzi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="221484383"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 10:29:45 -0800
Resent-From: Andy Shevchenko <andriy.shevchenko@intel.com>
Resent-Date: Tue, 18 Nov 2025 20:29:43 +0200
Resent-Message-ID: <aRy7F__KBT2OHvvY@ashevche-desk.local>
Resent-To: phasta@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	rafael@kernel.org, dakr@kernel.org
Date: Tue, 11 Nov 2025 19:00:50 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: phasta@kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 0/2] devres: clean up and move percpu allocator
Message-ID: <aRNrwsEVu57D2Y7_@smile.fi.intel.com>
References: <20251111145046.997309-1-andriy.shevchenko@linux.intel.com>
 <ad28f8e0788399251c13619d05da5953dad3fa85.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ad28f8e0788399251c13619d05da5953dad3fa85.camel@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 11, 2025 at 04:00:28PM +0100, Philipp Stanner wrote:
> On Tue, 2025-11-11 at 15:49 +0100, Andy Shevchenko wrote:
> > Clean up and move managed percpu allocator to devres.h.
> > 
> > Changelog v2:
> > - fixed build error by adding a missed inclusion
> 
> OK, didn't see v2. Documentation/ still missing, though.

No, you are wrong.

> But we only send new versions after waiting for >24h, don't we? :]

No need for a new version.

> >  .../driver-api/driver-model/devres.rst        |  1 -

Again, please read this list carefully.

> >  drivers/base/devres.c                         | 25 -------------------
> >  include/linux/device.h                        | 19 --------------
> >  include/linux/device/devres.h                 | 17 +++++++++++++
> >  4 files changed, 17 insertions(+), 45 deletions(-)


-- 
With Best Regards,
Andy Shevchenko


