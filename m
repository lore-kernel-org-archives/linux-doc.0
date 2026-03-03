Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42955480DC1;
	Tue,  3 Mar 2026 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553108; cv=none; b=TRgsxs7Y9e8UCQa5n1wVlKXv3biYKUaYx0skT72x+v5I0k9VWf/DvpKL+CFbR/9diXvrkU4xzF/Y7Oru8Y5UvplkaZz6H2GBoIZqXus7vWowXz5MCpi3WUQG9bFbBJSno8ZkeR2hPur2MYGQ5yFex0kaxQOxWL3vnZ9TAWkHrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553108; c=relaxed/simple;
	bh=N0TCW9EUZDd/O36cDhblNl2+C/JZH5YPWHqW1jPbJ6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2nAD1ds5ET24kyofmSZJCxvgKthaPJ7nHYR9J25AMokhtCM88PIzdI72k6qqyoQ9UUu7UHs/UXpgmQ4u7prPgaIa53uudkGiW113zhJkYM9bb+PTlaLaPCZ2976AkeSWvs+MaPQ6wwJIn4gECCOTaN2PMNj5Tk3rCe/rKIokUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjfHNUTg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjfHNUTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772553105; x=1804089105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=N0TCW9EUZDd/O36cDhblNl2+C/JZH5YPWHqW1jPbJ6A=;
  b=MjfHNUTgeomwOdwgF1/qCBrnlIwaxRAXi1mREKWxKsgFb4Ep7Z14SJYO
   r/Lfu8oftG6Sizsf2t5kCDMxnhc3+1AbLm2h6t/C46/y9XH8Ww9dWkFBE
   rEd3FDaeY7pgUZwE3vIBOvX6Zv4oN9TtRPUIKco0pWVwRFzwFdSUdFO45
   bKuxvI8ohjEwnCQFuhDrTlXZTVxTokAVJN8+qLyEj2YfJSmk1YQ0nI58I
   ncFNihmHcahr2KiCsUg9gA0/oexrMgokP7TAVdSwXaY0cxRwFZXfidYnD
   ZHvSuY9pH/pBYEBBO9eM+8ZBe+OpWjW5VDrfoVf9GczmGr50++BsUpjwu
   w==;
X-CSE-ConnectionGUID: oTXDRc9DSDyHUjY6pAiTww==
X-CSE-MsgGUID: yNJwGOjzQQSrbGUdwZ+EIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73557368"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73557368"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:51:45 -0800
X-CSE-ConnectionGUID: 1Eyvht6NQoGy8k0NScNVxA==
X-CSE-MsgGUID: 2jM7L9zBShWwvJuWnT+Buw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="222187759"
Received: from rchatre-mobl4.amr.corp.intel.com (HELO [10.125.108.135]) ([10.125.108.135])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 07:51:44 -0800
Message-ID: <1383b357-2a10-4b36-afb9-42e2724faa31@intel.com>
Date: Tue, 3 Mar 2026 07:51:49 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] x86/vsyscall: Add vsyscall emulation for #GP
To: Sohil Mehta <sohil.mehta@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Kiryl Shutsemau <kas@kernel.org>, Brendan Jackman <jackmanb@google.com>,
 Sean Christopherson <seanjc@google.com>, Nam Cao <namcao@linutronix.de>,
 Cedric Xing <cedric.xing@intel.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tony Luck <tony.luck@intel.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maciej Wieczor-Retman <m.wieczorretman@pm.me>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260219233600.154313-1-sohil.mehta@intel.com>
 <20260219233600.154313-4-sohil.mehta@intel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260219233600.154313-4-sohil.mehta@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/19/26 15:35, Sohil Mehta wrote:
> With LASS, these accesses are intercepted before the paging structures
> are traversed triggering a #GP instead of a #PF. The #GP doesn't provide
> much information in terms of the error code.

It's the error code and the address from CR2, right?

> However, as clarified in the SDM, the LASS violation only triggers after
> an instruction fetch happens from the vsyscall address. So, the faulting
> RIP, which is preserved in the user registers, can be used to determine
> if the #GP was triggered due to a vsyscall access in XONLY mode.
> 
> Reuse the common emulation code during a #GP and emulate the vsyscall
> access in XONLY mode without going through complex instruction decoding.
> Note, this doesn't work for EMULATE mode which maps the vsyscall page as
> readable.
> 
> Add an extra check in the common emulation code to ensure that the fault
> really happened in 64-bit user mode. This is primarily a sanity check
> with the #GP handler reusing the emulation code.

This part of the changelog loses me.

I _think_ this is trying to make the point that "emulate" mode is hard
with LASS. It's hard because it needs to be able to tell the difference
between a read of the vsyscall page and an instruction fetch from the
vsyscall page.

But, the "xonly" mode is far easier because reads are simply disallowed.
Any time userspace has an RIP pointing to the vsyscall page (with LASS
enabled), it's assumed to be a vsyscall. Any normal memory reads of the
vsyscall page get normal #GP handling.

Is that right?

BTW, reading it back now, I think the subject is really unfortunate. It
would be quite easy to read it and infer that this "adds
vsyscall=emulate for #GP".

It should probably be:

	x86/vsyscall: Restore vsyscall=xonly mode under LASS

Maybe this structure would help, based around explaining the three
vsyscall= modes:

	The vsyscall page is in the high/kernel part of the address
	space. LASS prevents access to this page from userspace. The
	kernel currently forces vsyscall=none mode with LASS.

	Support vsyscall=xonly mode with LASS. <include more content
	here>

	Keep vsyscall=emulate mutually exclusive with LASS. It is hard
	to support because the #GP handler (unlike #PF) doesn't have
	PFEC or CR2 to give information about the fault.




