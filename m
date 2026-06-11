Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907C04A2E27;
	Thu, 11 Jun 2026 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781204351; cv=none; b=UFEO5Bq9ITGbXFENHR3vH0rF0cg/e058q/lgpQqaKDU0/ZD0PqAEToqcwvN+KATpRgKWP/Is8Y+tH+EYLgdJET9ed3pWTmgPumpgPkojJoHhzHOOTaVeAN4X1QUGlPowtngJY6o/NFN24LSuvyk7K09fPtbKLO5eSyFkE+oR7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781204351; c=relaxed/simple;
	bh=ped3/J9XwuIr0qZ0sei087J5PdhotBQSVWgj2CMhKfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTxBODgKSqveEgjOJLSVCnGvJVL8moU5Lqx80x2wI0MA9/PXgVcTc31dWXuns7tQThRdK6E5AQgHoQMnOik1O69BMSSdGxAGSx4Dlq+FpOaRZpYm5srV1gjEH08CcCX46FMYjOVhTEQby/IguU5UmmmDh1wMZniILJnbYC7sq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhAFAunh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhAFAunh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781204351; x=1812740351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ped3/J9XwuIr0qZ0sei087J5PdhotBQSVWgj2CMhKfw=;
  b=MhAFAunh/jv/z7MrLPOCOynWB6WxbIoTXuzTcJgIbfm/JOFppUh16TR+
   ixDmRyKegxKOoGKKNKCukR3YBZjRZNVonIRno237bM4mjnZyrSZt0/xv7
   hpxR3nnwuD6znH1AVjZ7BncTYfvkkMazRLOBUP0TTAg8AILsSyL4WOFQG
   crJqgFRt/aDHBVuchmPb8ww/oFuH2Z0U+H/Eh5QGA+5jEp8Go2QMZv+4M
   P2hjUastqnBeh017FLpr94cBxcPsxM8xHRgHRFkiHx8I/1i4cjtgRZLED
   RQVrBY4WwaOWAX8EeLhp8imaiTzavecZpCXbSDnYxFdOLx1l90x6Cucrb
   w==;
X-CSE-ConnectionGUID: 0C8lTI8nSoq8ZG+heuwZNQ==
X-CSE-MsgGUID: u8qLaW/bTYCX9YcF3afvwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82035071"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="82035071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:59:11 -0700
X-CSE-ConnectionGUID: ZSAxKem5QyWfGsJvA+FU3g==
X-CSE-MsgGUID: viKcMwSuTOW4jm/PUd5eaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="250515081"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 11:59:06 -0700
Date: Thu, 11 Jun 2026 21:59:04 +0300
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
Message-ID: <aisFeD-VXF7JIpG-@ashevche-desk.local>
References: <20260610111339.2465922-1-usama.arif@linux.dev>
 <919d334b-16a3-4412-82f4-b4cd6a35be0d@arm.com>
 <aiphHAkLnG_L2kY2@ashevche-desk.local>
 <d41a24c1-592e-495f-8adf-dd538b769904@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d41a24c1-592e-495f-8adf-dd538b769904@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jun 11, 2026 at 03:20:13PM +0530, Anshuman Khandual wrote:
> On 11/06/26 12:47 PM, Andy Shevchenko wrote:
> > On Thu, Jun 11, 2026 at 10:45:01AM +0530, Anshuman Khandual wrote:
> >> On 10/06/26 4:43 PM, Usama Arif wrote:
> >>> On Wed, 10 Jun 2026 05:35:43 +0100 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

...

> >>>> +		static_assert(sizeof(pte_t) == 4 ||
> >>>> +			      sizeof(pte_t) == 8,
> >>>> +			      "pte_t size must be 4 or 8 bytes");
> > 
> > Besides occupying too many lines, why are these static asserts hidden here and
> > not declared in the global space? More wide Q is why they are needed at all?
> 
> Sure, will move these static_assert just above pxd_pointer()
> These asserts ensure
> 
> - Platforms have either 32 bit or 64 bit pgtable descriptors
> - special_hex_number() can be used to print such descriptors

I understand that. My question is do we actually _need_ them? In other words
when this may be not satisfied? Any real (non-theoretical) example?

-- 
With Best Regards,
Andy Shevchenko


