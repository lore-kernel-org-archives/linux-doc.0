Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F881E511;
	Sat, 30 May 2026 07:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780125176; cv=none; b=QQXoDraFwaZXr2scZ0NuZihV9lK27jG4NCSG086IJpvNtZCy3yHFKu+0j8jhL95Aa1Ocx0ki+Jak9uDrWgtXW29KJDiNGgOdbEU8TRVc0sIy4a7oulvp3LD/UiEkSawOgwVIqr9YEUPazlZ4I/puENZ1lVDPDHccvz+ngR9xgcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780125176; c=relaxed/simple;
	bh=SERNN2GCxyjfcqCL9J8VPzF/r6mvZy/lSmf7ixI0kpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGtokNKciAeaN07oRECMaVfzWyw4fahMrpLT1p3N9zMp/dZ6JJJU5ESSdNLGuTkq/gYnpkFCJiCr3C9gMAeoiUsi+X+g5J6IGH4YpTVO75wyfHpbnHlhUbclbh1sgt1X9UUfsyCQrgbH/XvoC/tgcFQWG12SbC1N2nebshiwJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCqA/OdM; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCqA/OdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780125174; x=1811661174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SERNN2GCxyjfcqCL9J8VPzF/r6mvZy/lSmf7ixI0kpU=;
  b=TCqA/OdM/mYqxWiNIvVH+MZ+LC5Au2tPD0pl6PKjFunD9ZMF8OhpVLQK
   C4pTff5TjoIk27jq6O7dOz6xJ/H8+UFEa3jNoVikWdhm80KHuKrNPUmtY
   lyApoqEgGXhOyJrx+pBSKjfgBcnXflaSCrYKWoShRvyyphK5KC6qAPYtu
   MVM1mEhIaqgYIp0ZNlQ++/N/2Dc/i+jFBfldrEwPpNPIF9pHfsozKHcgW
   1RM2++WPps5jIL9oWJvB7Cbgzvo2sR8HuK8G94XaPrMz2bz+HtDbiYBGa
   RS2pl46G9QtrJkGo+lnZxNkKaC5qzBHNHXQihdrXjO3vbzPof4wEcMlOQ
   g==;
X-CSE-ConnectionGUID: 72khBkH2QHq5FMkVLxK2NA==
X-CSE-MsgGUID: Q8f6YYkMTpWppW1SrmdTwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="92439256"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="92439256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:12:53 -0700
X-CSE-ConnectionGUID: tHr/vr9ERVWUz6ePOk37mQ==
X-CSE-MsgGUID: cmuU7zmDRZeZ5kCnC1Fodg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 00:12:51 -0700
Date: Sat, 30 May 2026 09:12:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Zhan Wei <zhanwei919@gmail.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com, corbet@lwn.net, skhan@linuxfoundation.org,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/xe/hwmon: document DG2 fan speed reporting quirk
Message-ID: <ahqN8Esjz9SmGofH@black.igk.intel.com>
References: <ahm680G_8mf_cjG9@black.igk.intel.com>
 <20260529172449.41504-1-zhanwei919@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529172449.41504-1-zhanwei919@gmail.com>

On Sat, May 30, 2026 at 01:24:49AM +0800, Zhan Wei wrote:
> On DG2 the driver always shows two fan channels, because the
> FSC_READ_NUM_FANS command does not work on some cards. OEMs decide how
> the fans map to tach channels, so two fans can share one tach line.
> When that happens, the second channel reads 0 RPM even though the fan
> is spinning.
> 
> Note this on the fan2_input ABI entry so the steady 0 RPM is not
> mistaken for a driver bug.

Fixes: 28f79ac609de ("drm/xe/hwmon: expose fan speed")

> Signed-off-by: Zhan Wei <zhanwei919@gmail.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
