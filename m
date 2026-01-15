Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B336A01A;
	Thu, 15 Jan 2026 10:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768473199; cv=none; b=Lx+H+MZJpRylyCL7as4duc5vxQq4KnNwbI2YhlRZTtNR/PbovH+YKRKnQURbimkZn2v8CkizXpOhRC3Epjeo2sPuLmgolYw86GgHkE/lzsp3iirw1qL4nQRupdkgv+/twvOjXslHrx09HcdptpAgbvlljjW2k72+EfM6jVkmgW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768473199; c=relaxed/simple;
	bh=ksnJjEgwVXBwDNto/WVVqqkoAkgEgo/ZREvLkZYfRC0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RkftV5LXcU/8KOzlRkFNaHPePuuZuxD6O27hayUtxGj6PC86KqXXh0ee4WxGA1cERZcIqxlRs3zMNCMRfthGNnK7GqlPKB7UrRM8UyXdJxykskIc2ks9Eta6FZI1t94LX8MGkZIFbLSfrmpGfxfG1pL3z4eaU85tyc6yDAxEhm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/d9iunr; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/d9iunr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768473198; x=1800009198;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=ksnJjEgwVXBwDNto/WVVqqkoAkgEgo/ZREvLkZYfRC0=;
  b=B/d9iunrLP+BzlEQsBevUiKMdPl/X7eByIiBH5P6fIwS+hQRO0tclcdN
   HK+ghBxMSY4XiUBbJPnG9oMZGlY9RR2vi8UHLD8u1fO20yubqGGRB3b0w
   Gc8e8ovEhdhhqc++MCpLWCyhCucq4J7x7a/PM7BaqVEJDCw+kGpJSRBiv
   zjhS2ytLO1KexhudeLaULJ263W2f0ElSlmS8coOXAMP3m+Wm/qhkABrnK
   blcK2asFTjXr4fB/gsjIfL6kWfqfkWY/JjTZ8MtXhR3pI6GidL26iG5Op
   MLple4w8ZWZlF7Nu5B815t573iGjZTc4qN+roC4WBXsvyPGgGz+77zDUH
   A==;
X-CSE-ConnectionGUID: OKZsmrLxRjaPNwXkdlaGAQ==
X-CSE-MsgGUID: +rL0y174SaaR9+F6prbVgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80420879"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="80420879"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:33:17 -0800
X-CSE-ConnectionGUID: xM9C0tWBTBWBWatwfbyAMQ==
X-CSE-MsgGUID: PIUuevHPT8uCXxb/l3C+nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="204979862"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.150])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 02:33:13 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah
 Khan <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
In-Reply-To: <20260114212558.1aeb1b17@foz.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260114164146.532916-1-corbet@lwn.net>
 <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
 <87zf6gt2ts.fsf@trenco.lwn.net> <20260114212558.1aeb1b17@foz.lan>
Date: Thu, 15 Jan 2026 12:33:10 +0200
Message-ID: <3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 14 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> Em Wed, 14 Jan 2026 12:24:31 -0700
> Jonathan Corbet <corbet@lwn.net> escreveu:
>
>> Randy Dunlap <rdunlap@infradead.org> writes:
>> 
>> > I do many of these on a regular basis:
>> >
>> > $ ./scripts/kernel-doc -none -Wall <path_to_source_file>
>> >
>> > Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?  
>> 
>> Yes.  The tool moves, but its functionality remains unchanged.
>
> That's actually a good point: should we preserve a link on scripts
> pointing to ../tools/doc/kernel-doc? I suspect that a change like
> that could break some machinery on several CI tools and scripts
> out there. If so, it could be useful to keep a link - at least for
> a couple of kernel releases.

I think the tool source should be called kernel_doc.py or something, and
scripts/kernel-doc should be a script running the former.

In regular python projects the script would be generated based on
pyproject.toml or something, but regardless the source file name would
adhere to PEP requirements.

Additionally, the kernel-doc source could be a package under
tools/lib/python, with __main__.py so you could run it using the package
name 'python3 -m foo' style.

BR,
Jani.

-- 
Jani Nikula, Intel
