Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFBF357CFA;
	Thu,  2 Jul 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984053; cv=none; b=HGYFvGypouAbv1aO2Bm5DPZIIhJ+bMESh3BM8tvYRThNdM7bfWTZCnEWVL/ODG/O/ljy3A8pHcSaGjfpsnREx0zucE0/xGG6e5OBmbNHEqUGT3PGRCI03uBPH6wREFZw2KwzeT8B06hy4mm4RqqR46vW1I0HZTBSxLSgFtkYMBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984053; c=relaxed/simple;
	bh=gjNPHhngjbQG/fwTaT1PmZuXub3d1bbMsOCUElo4gG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fc/bT+UDQQhNa37NcfmWpw2A6P+vDWdj+8lkcWWX5G1WqkoQp5PWT6Bn/y6h/2f1DEtCk0SmA2gw/B6tJTBXwvwZDBAhQhqFsHTcbYgJ1zPtu6vbwbFiA+HjxPU/2Ah6yDMxlVW9PFXszkG7L+XLl1x9ddwWSL0mTPGnvdAhZGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKXO0I5P; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKXO0I5P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782984053; x=1814520053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gjNPHhngjbQG/fwTaT1PmZuXub3d1bbMsOCUElo4gG0=;
  b=lKXO0I5P/Zb0z77t+lbEBNCXDVSYNz0WBwMW8m0xdf/GEQdafheFNB+M
   3O2yI9OKJ9QRy0N8chPSW8X9HfFMpGvA0+qr0ezohoFhAhKD+R6D689UO
   Hl29/whOtrGqheQH/upf2H2sq9Kf5BxTHOfhxUtxvuDENXjknu4mFjGUj
   OcC1wpep13o+kHWbJHbyQEcEsF5YasGV2hM+D+MAJ1QGEBVsUKIFQNJwt
   RaOynRWKJyJMgpMxpuPYi1ffhGvGYXH0MwkGTGoRcZzPw2BOqmHiqNRvn
   nEF9YFMxBKFuqXojG2RKTH6bUuO5j2FXnubI98JQ1c2u7kmIQvtwXnTf/
   g==;
X-CSE-ConnectionGUID: 5uOPKmGwQ9avpHvmMYWWlw==
X-CSE-MsgGUID: tjeH6ebGQduTsR68BtbkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87563994"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87563994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:20:52 -0700
X-CSE-ConnectionGUID: BM7/czkqS7WHsjh8y6n9pg==
X-CSE-MsgGUID: 0DBzkv31TQird/u5tzewow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="290935070"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.213])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 02:20:49 -0700
Date: Thu, 2 Jul 2026 12:20:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Lorenzo Stoakes <ljs@kernel.org>
Subject: Re: [RFC V2 3/3] mm: Replace pgtable entry prints with new format
Message-ID: <akYtbi0Is2JL2t9a@ashevche-desk.local>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
 <20260610043545.3725735-4-anshuman.khandual@arm.com>
 <fc57bb9a-4564-489e-8da4-65068b5283ae@kernel.org>
 <4a416383-62f5-1716-8e04-a2ee1f89a864@google.com>
 <dabfd73b-d872-4267-9a40-45463fe146ac@kernel.org>
 <3afa822d-3cc9-1068-9a10-94a5f2e4d29a@google.com>
 <90b5cd31-87ed-4ef7-86cc-458b9e06b02d@kernel.org>
 <5a8e82f3-ed21-48a8-af3c-36a08fd2b0ec@arm.com>
 <82902a84-7e62-496b-b1c0-62bad1be4525@kernel.org>
 <e4ec99fc-dfb1-4205-a193-f694e9f6a13b@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4ec99fc-dfb1-4205-a193-f694e9f6a13b@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 02, 2026 at 02:34:22PM +0530, Anshuman Khandual wrote:
> On 02/07/26 1:02 PM, David Hildenbrand (Arm) wrote:
> > On 7/2/26 06:29, Anshuman Khandual wrote:

...

> > Can you take over this approach and refine it (and address Andy's comments)?
> 
> Sure will do that.
> > 
> > I'm not quite happy about the
> > 
> > 	typeof(pud_val(pud)) entry = pud_val(pud);
> > 
> > stuff, but I didn't see an easy (less ugly) way to avoid it. Maybe there is one :)
> 
> Could __auto_type be an alternative ?

Just 'auto'? We should have a macro for the older/newer compiler versions.

-- 
With Best Regards,
Andy Shevchenko


