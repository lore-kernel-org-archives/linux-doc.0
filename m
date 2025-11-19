Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593E224AE8;
	Wed, 19 Nov 2025 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763560592; cv=none; b=g8MhBQ8Ztn0iWVUCh8fNjgbHeMu1aFVoSuEbfgTAMiR4br942uzvz1mQ5lA9kBMedYs7D8fG0RkCEjw5FkE+Xv2yIjmyEZXBYyEkYPzR1uN2NOmNvaXRfbTyZswS8gdQrkdh/h6R/ChV+cu8XUZ4qPOQOPegGg7Pjs+DmuiOGj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763560592; c=relaxed/simple;
	bh=yG078OlPEqljfRjiWh7dINc2Qo7pf4q5lzwshAZEDGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bUzF2oqEB7eN0Q26Ns3WsjlsS32YU2249hGu7IreWR8vEmjiO31t+t4tDd9VKVe4ZgKI2GTKBA3OBFfaeuKajb7EwtVyVkpPTmc4CcSvDtextOTJRxHDKaz+HqaFkRwVRPbmUNfXZ0Nks9MpMLsaOArzex7KOgjr402GQC1XHyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOudOrql; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOudOrql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763560591; x=1795096591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yG078OlPEqljfRjiWh7dINc2Qo7pf4q5lzwshAZEDGg=;
  b=kOudOrqlj6Q84rbxIukZgy2eefqlUL+46mRRgDcImPOdkn7Wat+HAn7G
   mKzc2ops4TDr+54xMDsShGg6rYpHRuurPTitxOgASysmZZ9XRuok7h9ny
   9Y8eyD3TzHgVwTV2b3iiZzQ1me1bWktQa38BjMYSThVB9uKDcohoXu0ll
   7cy+zAKTkzMH22e0FNm+MLr+c/KnZ/8wUZwQPcZGaOkOhHmBqMQCjq06v
   7vHKhYZoraDRmnknO6m9P8TrzP4Eg5iS4wvyt49z1f6QXgj9G8/OAGugS
   GGWpP8T5i6i4bLPiIzKXk8Py118WgGIaTycKSFsE25lo61u2XARtcjYIP
   w==;
X-CSE-ConnectionGUID: ebFBNHzNTnmG4zX6w8LEXA==
X-CSE-MsgGUID: nBpdBzEFQI6GGuqJWBt2qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76955621"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="76955621"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:56:31 -0800
X-CSE-ConnectionGUID: kD7NIgyiRly5ciIUmjgGuw==
X-CSE-MsgGUID: tq/KP4sVRh2g/vg5QMooAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191503974"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 05:56:29 -0800
Date: Wed, 19 Nov 2025 15:56:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v2 0/2] devres: clean up and move percpu allocator
Message-ID: <aR3MiiicJ6dSDzU5@smile.fi.intel.com>
References: <20251111145046.997309-1-andriy.shevchenko@linux.intel.com>
 <DECO7PZ38DCO.48OA35WLU5QO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DECO7PZ38DCO.48OA35WLU5QO@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 20, 2025 at 01:29:59AM +1300, Danilo Krummrich wrote:
> On Wed Nov 12, 2025 at 3:49 AM NZDT, Andy Shevchenko wrote:
> 
> Applied to driver-core-testing, thanks!
> 
> > Andy Shevchenko (2):
> >   devres: Remove unused devm_free_percpu()
> >   devres: Move devm_alloc_percpu() and related to devres.h
> 
>     [ Fix minor typo in commit message. - Danilo ]

Thank you!

-- 
With Best Regards,
Andy Shevchenko


