Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F0364E92;
	Thu, 11 Jun 2026 07:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162289; cv=none; b=CdB0xJ0R+F3LgW0OEmpXm2AdDdjmaqFUOR6l5cqCmIJ+3HGAlet7ALfUrk0zlvLQwkRHA32eHT+LeKhVtJlC+o0apCzhtB/kqyhbxvhWWk5xhT4SZURD+tFTlLaZ9BSDKgTgs6CqVONppNpBymulvoH2v4H0pmnFx1mnlJn7eEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162289; c=relaxed/simple;
	bh=fiVJwTu9CK0mToLiHPUfmG+jQ0/gNkGEoV4Z9N/y9xY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKaiX3SYfJG7eFmEWZmVjzcQM4Oe0RS2sZLeblYE7pS2kbUJ/n+azi2QqkP7DWVUfgGZK7x9tcWlIMUnD8Ss/SN/H3OT7xuzuyJvlAj8t2q/rZdrHLiW4ZlkeRtWuwctAv01rfcpdXoVtl3fXgPuYu/QhruVEh1BXxgGM17fqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KZ5Vpfrz; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KZ5Vpfrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781162286; x=1812698286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fiVJwTu9CK0mToLiHPUfmG+jQ0/gNkGEoV4Z9N/y9xY=;
  b=KZ5VpfrzxVAdHwtgWnuYXt9LbafT+ly7oMVuUjBHEA63vslaUKi/rOoy
   TTsChVglUnH0jSlggTTTIFLr4EmuCsSWWa3XeK1O6ihCIgM9hMnSTei64
   QRPB9GLjf08HJGy9kokTHI8an5g348m7RSPLovk5tRz4/ICMqU8AfA0T1
   5x6WlaMNRP9em0tkSxVH7a/MEwh+VWHJtTqnTbwMbSz4FmPOA3deTKdO0
   N+2JcP4u32DSOR9GZiop3FS1IrpyFuh4vPtEw/3GYCzIpYehS4vLux1og
   I++6Ixj1kG/X3zKlOHKNRz+VqpXQnj0V/zrELQZWp+rhA1hJ2ZtlplWmB
   Q==;
X-CSE-ConnectionGUID: crtZJBr/Sd+yNavd1r5YkQ==
X-CSE-MsgGUID: lZldwgD4SiWtbmCbq5bw6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92645307"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="92645307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:17:55 -0700
X-CSE-ConnectionGUID: j3EipKBDSdOgy4NEcbSzHg==
X-CSE-MsgGUID: YE83BYEYQ8iyqxgnDcNDiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="284485829"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 00:17:51 -0700
Date: Thu, 11 Jun 2026 10:17:48 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Usama Arif <usama.arif@linux.dev>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andy Whitcroft <apw@canonical.com>
Subject: Re: [RFC V2 1/3] lib/vsprintf: Add support for pgtable entries
Message-ID: <aiphHAkLnG_L2kY2@ashevche-desk.local>
References: <20260610111339.2465922-1-usama.arif@linux.dev>
 <919d334b-16a3-4412-82f4-b4cd6a35be0d@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <919d334b-16a3-4412-82f4-b4cd6a35be0d@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 10:45:01AM +0530, Anshuman Khandual wrote:
> On 10/06/26 4:43 PM, Usama Arif wrote:
> > On Wed, 10 Jun 2026 05:35:43 +0100 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

...

> >> +		static_assert(sizeof(pte_t) == 4 ||
> >> +			      sizeof(pte_t) == 8,
> >> +			      "pte_t size must be 4 or 8 bytes");

Besides occupying too many lines, why are these static asserts hidden here and
not declared in the global space? More wide Q is why they are needed at all?

-- 
With Best Regards,
Andy Shevchenko


