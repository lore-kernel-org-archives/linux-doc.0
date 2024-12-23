Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAE1C3C1C;
	Mon, 23 Dec 2024 19:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734983916; cv=none; b=JNGRmK4mrS+ySpmubyk2ukeTbmvx5pbmQfrRQ41tnzd7iuTRn/FDd98m/ZJJDVetGumcdKtHWKnobFIVoGRrgynjHx8/IK+cpkht+QNzakHQv1ajzCUbhbA5XAydUVHmMgqMEgI1xkw1dL7HcJ7AWHA9fXuQmohZ3pfveLYYfxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734983916; c=relaxed/simple;
	bh=JFaFcA0nZKMMo3VFidoPrE63O/yVjrK2dWBgS5sUJS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCPOh1qWw3fb+gUi+K2F/FwG6FgK2fuWepZcdz/R7HN4DZUR9akEdEMF2szhQzxsEo2U5nq17/lw368yuYcUIxyPvEu2LU+MUeWkOjE8VEjpbzWqio2QzuNz4/4cpkGYZ1WaflE/KPC81UPzicci9kTpDtyX3DzB6jZlvO9DGrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E/8geh7V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E/8geh7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734983915; x=1766519915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JFaFcA0nZKMMo3VFidoPrE63O/yVjrK2dWBgS5sUJS8=;
  b=E/8geh7VVZEwxXC8ff5tAXJwpCmCwJq3EuHhvyRFjulJDjQAaSYuuwdj
   Ap1pUyxMgsLCEOSq+GE5mja2p8j8vn2WdYnctYM7VnLP7kjUiKzprDdob
   IuCRpv9GaAjXzH2fj6sD8B7Kkcu1ftz0NmpQ3XoPfrVnbnzOFEzgJs3kt
   Mo+CdN5F6CziCC9KryG12VUloJLWLqSua4XZN1zOBjY0/Izq5cQVuUORT
   Nx6TOn3HSEB+hdGCo4bELCh5FuY8py05DUO9Iim1cfHSc+hkn7Z1e6pMc
   k6KXCwOBoBRSwsjm1RbYG3vB+B8QXQfJ10fQTmZWlVsZugjZge+NaJPgw
   w==;
X-CSE-ConnectionGUID: aCgHNOIMQA2A3VsSqzYo7w==
X-CSE-MsgGUID: KI2MvWr7QyGmH79s/egWDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35593207"
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="35593207"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:58:34 -0800
X-CSE-ConnectionGUID: JeXL2EZhTR2fWNyzwU+5qg==
X-CSE-MsgGUID: sgl+nSgfScajHptNt/D+LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,258,1728975600"; 
   d="scan'208";a="130137834"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 11:58:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tPoZP-0000000BQST-43of;
	Mon, 23 Dec 2024 21:58:27 +0200
Date: Mon, 23 Dec 2024 21:58:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Saravana Kannan <saravanak@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] of: Add printf '%pOFm' for generating modalias
Message-ID: <Z2nA46H_sRrC74n8@smile.fi.intel.com>
References: <20241217183711.2525863-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217183711.2525863-1-robh@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 17, 2024 at 12:37:09PM -0600, Rob Herring (Arm) wrote:
> The callers for of_modalias() generally need the module alias as part of
> some larger string. That results in some error prone manipulation of the
> buffer prepend/append the module alias string. In fact,
> of_device_uevent_modalias() has several issues. First, it's off by one
> too few characters in utilization of the full buffer. Second, the error
> paths leave OF_MODALIAS with a truncated value when in the end nothing
> should be added to the buffer. It is also fragile because it needs
> internal details of struct kobj_uevent_env. add_uevent_var() really
> wants to write the env variable and value in one shot which would need
> either a temporary buffer for value or a format specifier.
> 
> Fix these issues by adding a new printf format specifier, "%pOFm". With
> the format specifier in place, simplify all the callers of
> of_modalias(). of_modalias() can also be simplified with vsprintf()
> being the only caller as it avoids the error conditions.

Shouldn't ACPI case also be considered? Otherwise we might see a deviation and
then completely asynced variants of modalias based on different type of fwnode.

-- 
With Best Regards,
Andy Shevchenko


