Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02B35898
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783296657; cv=none; b=QZ9sYqD/Ohjt4I4bkbXAagLWxxGj2ZRw277lH+59twd+b/b49uJFXIRZS2V+HJoKR/MxHzJQ4h2AO0taSFOSezmY5MuaGV3AhM+ImE9rQhuU16egbCwOZrf//vzv1CmU5VlnFfD11qGpRSzwkz3NXAFIpEVmKVMbHxTCQQKB2KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783296657; c=relaxed/simple;
	bh=4V+arDXHJoKT4cSZHGsfCduvMimsSgK+TomjMd8m1oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pp9hLwJaUbRiRukhMYULiYsN8pRVUPfX1QCaAysByt7kv3qo/+NXZaDvotKz5PSKQ9yls3xxFcJqC+gwxRTlA7AFR1BiFCw+xLW2Ro0uaCckCUiUPcOmfSygpvpoWJ9TnmT8RG66HUALgv41dC1olh8RLy6UAWtM1JQBIGMH4Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mhHzDU0n; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mhHzDU0n"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c149c5722so13129121cf.0
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783296655; x=1783901455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ta539TzwGsNCKpGw097iIC4tNmoYd6gNCaqW+hJFBeI=;
        b=mhHzDU0ntbfdQvq2KQPWU3+H/+eQlE/W05kc5UtK9X/vhDSSnd7mOP8tQtfi4dzkHS
         rrDUIiKGRg7LTEpo3UPm0UxvrUwGvii89QM7I+6Jgn8UscODtWU43+JZLLzJ+lBQ4pmX
         /hEi/CVJkoSkdbsEveiyOLA/S3vqi2vesAOL6vn/3DxUalwjb2hV8FDblITeY15kHY+n
         odM4I6mp8sr2DcxqsBqWKlBMwxSFFFLVckHfwvvRIMBM+t64VhHcN9IXEhAaRmPGMc++
         bfCqyTreChqFCGeZ9gJ+x7YrEVzI+oLc2OvzB8/2UUdhGU95R/0E1F3UtqBKpzVKZzBl
         Uszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783296655; x=1783901455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ta539TzwGsNCKpGw097iIC4tNmoYd6gNCaqW+hJFBeI=;
        b=H6vMka3oqqrHBWNA/lJdWebw4F4bA4JTFtv4w6blHWNdxZcGyeVW1WawtELh3B9dPb
         Jr9nd+LRPmUfGtPFKMSR13t9PsG9pvVu7dDcDMZMKVkBR0EhEL3rYVs+tIOkaDv7pr9P
         B4QNfs0aDU55v5fJZIl1cn0O9igErDYmQNG4f9+QeuvUJ9PCdmhuMMyRWCi36tmRa4UA
         Z2GCpbo231MxiG4JwclLNY51SgVwq6z/mrmnUKwWdUB4cPrHCYlOfUKy14hgkMWCZLxo
         LzWf4Llfh/Kc0/9KZldF7anQpn1CO2jEzfYMbvuVZevt2fqbB7RapmqGRd2P2pyfovTS
         jjvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6iZ892NgwFq9UWBXNo2+ODWlmm+qxbM8FD34ZtdpciI8M2Mucp3lNuS+M/lFKViU5lVT7rikApGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFh/g7613QocONnL9yZBOSFYss+teOq1abwv7H2lIq7vwQhTz
	a9iCHolOsowWKije1WAeTEjZjqlgSLCbe+MfufrJY4wgejqTwdOptTtkOSFOT/BgwU8=
X-Gm-Gg: AfdE7cnng2Cz2M25KcOXTLTV8ApXw7Shf/WPaAN2ZpbCQYzAddj8Cv8Pa+B+heIwQOb
	sVb2XGmGk4hKOD7eLsv973y/4We/wgpd4oK/3uW5OxCv2eANWptyCbCgXJNzG4VozTU2EnWa0FJ
	VJfqZle4TNAiLJUQjfeuAG/bNUkkdUZkUZasfoD9FhDdjgRBfzgXj1tegkPSouujU9k7JJrqi19
	noL4YOpcNxJqhEj/HIusIvqHBacv9u6GVRwB6UjgYiQpJLklKuOHcabni7uhZ7mhAPtNP98//wB
	jQ8He39wmNZ7t/LbZoXBbhKd9qzouBzhj8yGx3cSA9/ZsXcq7fKTMFT+lLcXhPXaJ44jtYfmdtF
	GHQnh3Hy6VewlNTPEF10i5t1Q3K/rj94/K0YsKx3yTO1HauSTjqmXLT8lH4gEARQVCIIHZvtqgk
	+Uoo0=
X-Received: by 2002:a05:622a:cf:b0:516:ed2c:9c75 with SMTP id d75a77b69052e-51c3c05a9f4mr163177171cf.16.1783296655368;
        Sun, 05 Jul 2026 17:10:55 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b55495sm79082691cf.11.2026.07.05.17.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 17:10:54 -0700 (PDT)
Date: Sun, 5 Jul 2026 20:10:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, peterz@infradead.org, luto@kernel.org,
	akpm@linux-foundation.org, feng.tang@linux.alibaba.com,
	pmladek@suse.com, lance.yang@linux.dev,
	marc.herbert@linux.intel.com, kees@kernel.org, leitao@debian.org,
	joel.granados@kernel.org, lirongqing@baidu.com, nathan@kernel.org,
	xur@google.com, lukas.bulwahn@redhat.com, ryan.roberts@arm.com
Subject: Re: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in
 Kconfig
Message-ID: <akryiq6l04RVQiY1@fedora>
References: <20260704015859.536580-1-gourry@gourry.net>
 <20260704015859.536580-2-gourry@gourry.net>
 <87o6gljhzc.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6gljhzc.ffs@fw13>

On Sun, Jul 05, 2026 at 10:31:51PM +0200, Thomas Gleixner wrote:
> On Fri, Jul 03 2026 at 21:58, Gregory Price wrote:
> > +	default y
> > +	help
> > +	  Syscall User Dispatch lets a thread have its own system calls outside
> > +          an allowed IP address range to be intercepted and redirected to a
> > +          userspace signal handler.
> 
> Space/TAB mismatch.
>

bleh switched dev environments and forgot checkpatch doesn't catch this

> Also the mechanism allows to filter either outside an allowed range or
> inside an allowed range depending on the mode which is handed to the PRCTL.
> 

hadn't noticed that feature actually got merged.

ack, will just go with the general language

> > +static inline bool syscall_user_dispatch(struct pt_regs *regs)
> 
> __always_inline for the very same reason. Sorry compilers _are_ silly.
> 

ack.
