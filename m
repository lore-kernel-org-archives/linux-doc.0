Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C5222581
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750762156; cv=none; b=M5QHG2GE6MDiBwLDx56DFsil4wDYarpwMmrSX2s4FnZRhVrMJn5Ox9QWrrj7Qi+Y2uOX2lUtuf2BWZ06DqwnA/1SrVhI2xRzGsJpZV3CICnSHVQp0vMoljRRF9eWD1X3cHv2NkfHOENX5G+LUQBfIYbpkDDIcVZypiyvr6zikYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750762156; c=relaxed/simple;
	bh=JT2mnPBR+MiYd9IlnNKfJdunlSccq1qxESZTRfH3o7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aIeY7SyaTbzdcEaYK20SDf6m7maU8ulSWgMnKBNSoS0gXbjG8QJL5UG7zRsun4y9AJ8fCbJdi/FtPFSxux7Whl5cjfTPOzOAh23Zov29fiE3DGxVUl/6aTbWPUxdTg8A1iRdswCiSTh0HwFcCHXeRcSaEzpX7dFZzXQlM3OfmRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SpJ2G2K2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SpJ2G2K2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so210445f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750762152; x=1751366952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFshqkaQrvO1s4Gkyifgl/GnVtFojbtYgAGH6b+8BAM=;
        b=SpJ2G2K2+1xVlPdcGS4HLpKnGpbStb4KwDQ5ngINxPhNqA6Mxiii3ubDtD7lmqH1HV
         QFsn5JKoi44FSHr2roZ8YgEnZPy60XwMEzhSNerCdN60YYIPF0K1Tn8ssxbRe1Ij/4ZX
         0NgBUjwY5GaLFmpvKlb78VX3xhSgq2qyYZXHQ2H63yr9BAKOImKHZTIlnuJV3Cw3s9hb
         DzW8vstdT6yL1iq1J5rmvKzBtJs0ZOmgnBq4jr9dTQ9JU3xsqDg13KyQatz5Ch+Qk51x
         vnh2ExagbMnUrEobP9TXh4sysMvbVenfyQYDM7WZjXEICB5vAciSRAnDwIej243l7Ef/
         24sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750762152; x=1751366952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFshqkaQrvO1s4Gkyifgl/GnVtFojbtYgAGH6b+8BAM=;
        b=NtRkxwXJjuxQHkASAvI1UnIGGl69MkO+V33GmCn2braOD2AqDXi793yAPtu4npJnC/
         Jfg+ScckcrmpvUF3FmAtAhH7M83orONcXZM2/9ADoKX43KOi3brJ2k5Z0SFubSKZV1uI
         S1Wa2zh2HXfgjqggTpx+BaNHM/llvprmFGBrOLD6wLhps8siM2vgtGACWfsKTCaLJIR3
         Hm8Ft1j+4t7P3PIwoUOZHL7bynYGi2hON93C8EjYhNlfInwITXJabol5gmhcXqEFQVsL
         cYcn345oMeSksxtsbyytA0e32HpG3yyrZ75/i3UwaxMFR9xV3fqjRDGM4qgWekDL/6K4
         2XzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXGOjdbS5rPALIoGWdJffEBXQ1UXdWHIvQvhEbuowGP2vW8dLqj7F021m+3JOiAoBytP12XY89pG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzLe/2ixMifkhka4Jx7JnhwD+GitI24h7Hh1rX6h9+Op+muSOv
	3LA2NTm3lGk3X+xo6aWyAeSwA9EqII2wNIC4K/KdAJ5m3ejH7HIoIMesCeNwAzsc2U8=
X-Gm-Gg: ASbGncv00RZSl9uBfkA7AH9yIgzXo5toW0VpyxEJ7Dg6KIK+ok5xnMxN0oF6TLdxHn6
	ZuzyEJhW+9bdpghtPV2FnxipPEXbinkxX1lqfwLNQSDc0waRwoWIrjF+K0yGx1EKzneVXu0X01y
	iZqfQoa2JNVhNqK9nUq0+afcJSxZNGYulDgW+Tg3EPohzh1inF+vfQluxiNt4yeWAaG9PSaB4TY
	zgLT8KO8eYsVODi/hpwc2dDG/6zMuB4jp5Kdfvay4L4+8QWrFYINDwfKPWmyt7t7YEDO7JWWpic
	heU6eYEAEpt9PRw96MsVHXOBwqJ3S5zWWjJvlDfYHKeTQeQPVNsuK7WQz4PwSnb4
X-Google-Smtp-Source: AGHT+IH/6/c8OvTyyQ7J3ydHQbrXdLtsONkE3vxKT5eL5llu+wMckRhJB/e15VUI27/0UmRMDV76jg==
X-Received: by 2002:a05:6000:2b05:b0:3a5:34d9:63aa with SMTP id ffacd0b85a97d-3a6d12fa6f9mr8870617f8f.59.1750762152394;
        Tue, 24 Jun 2025 03:49:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d864a9d2sm103805525ad.149.2025.06.24.03.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:49:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:48:58 +0200
From: Petr Mladek <pmladek@suse.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFqCmgT1k8daroNZ@pathway.suse.cz>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFQYVPmStsIIFcMW@pathway.suse.cz>
 <68cdf649-a273-4d83-b862-6b675a793f18@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68cdf649-a273-4d83-b862-6b675a793f18@arm.com>

On Fri 2025-06-20 13:32:31, Anshuman Khandual wrote:
> On 19/06/25 7:31 PM, Petr Mladek wrote:
> > On Wed 2025-06-18 09:42:34, Anshuman Khandual wrote:
> >> Add a new format for printing page table entries.
> > 
> > How many users do you explect, please?
> > 
> > This patch adds only one caller. It does not justify the added complexity.
> 
> Understood.
> 
> The idea is to convert all page table entry prints through out the tree
> both in generic and platform code. Added just a single generic example
> here for this being a RFC proposal. Will go through similar instances
> and be back with more comprehensive change set.

You do not need to cover all cases at this stage. For me it is enough
to know that the printf format will have several (like >= 5) users.

> >> @@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
[...]
> Agreed. Andy also might have suggested about special_hex_number() helper
> on the other thread. Will try and use the helper instead.
> 
> > 
> >> +			spec.base = 16;
> >> +			spec.flags = SPECIAL | SMALL | ZEROPAD;
> >> +			if (sizeof(pte_t) == sizeof(u64)) {
> >> +				u64 val = pte_val(*pte);
> >> +
> >> +				return number(buf, end, val, spec);
> >> +			}
> >> +			WARN_ONCE(1, "Non standard pte_t\n");
> > 
> > This is nasty. It should be a compile-time check. And the code should
> 
> Something like BUILD_BUG_ON() against pte_t as either u64 or u32 aka all
> the sizes the print format is going to support and it should pass on all
> platforms ?

Yes, I had BUILD_BUG_ON() in mind. It would be nice if you check at
least the most known architectures. You could do it just by looking
into the code. We could rely on the bots, monitoring mailing list
and linux-next, for the less known architectures.

The more you check in advance the less surprises would come
from the bots.

Best Regards,
Petr
