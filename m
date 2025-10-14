Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D9F29ACD1
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 08:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430854; cv=none; b=jx0kwjSgvXc7lQxEzz+Q628MtWCP2I0rzpYS+w0Iq09y+th32Bvj/WkUGpb+s2kHuz7I2XzbDrdii29sq6wnH9q63sRfwN62krI8RdWzBtnln5tRW5UlABWQRneDOnB7YMyHa9jktFtP6+kYPDI6FCM4v6jNrSCaiWibJhUu1lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430854; c=relaxed/simple;
	bh=0B2UMYbqUDmb5TRAEFZ3iCetD125VgS2XRk3m5uYAII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVo8GizkbThO/KB4dNUEV7NNbmnFt0kT4Zz4nS5ICoQR0E8t+DsCQYr7Rjwzwy7bfiOnU9hLrq7ydx1c0uNASFz11KVkzaswCYSRJyXTbdlxVm/7QQ3t5bEC1tiaJuk2xR+WuWkBlvdE9pHLVdRFy/f8PTvI4S2Mx6jg5aYUAFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63bdc7d939fso251287a12.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 01:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430851; x=1761035651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKUCHW/MBIZsUc3ODKKtWIaDlEQsfe7hY3IvRmB8i8o=;
        b=vB6og1ncoWvW57axSfejafJ1+md5WQFWkY5S/5Fx3np4hEGB5hC9GYpLRgcvWiyouP
         6XqV3XFlVZ5yMHWgIO3R6trAYcqVhzLRovBsMM75Ceuk8HyGUXoj7dy6aYQBnZyCY/PM
         gf5PA2wE5qXEvH4XgjbUWFBdkZJAwttmzcaA991UneVT176LOYa5mBcafYLnCw4EZjdj
         QaUOMi3/W4VrorzCV7cJ8pSlMksQ7gdnKhnbSIZ50YJtDa549EggE+ShLuikbpzB9p4m
         yOJMvAvITsAZg2/lppyKea+SOLuVCsqxYNrXqj+jEDTNA0vwYF/9hPkdnsJLhhbaYPyB
         br7A==
X-Forwarded-Encrypted: i=1; AJvYcCVBDnRcbO5odtjET0UEl4nQk+7qQw08OR0w80vL5R55CnS9K7b7o09uSkuWczdVzsUwmS/FIOfiouE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkcy0ga6ThbygOoAFcARbs3tbrirP6pvLgtlqs5hnOQk13kEf2
	Op7Co0LCgUYspYzY081saqs6aKFuz1RAwgfjjz6R0Gb3Ym2eaOy4xdXZ
X-Gm-Gg: ASbGncsgFhOaRhqCnltDD3FB7S0C8f3JZ0VLSfnb/SEAuWPl+s78O/gPWyyqmoGfkud
	29bM3zw9gfbUYR74qWyQt0bTyAM+qCFeASwX23xzs4B7+LXHxT2egWzttMbF5o2zGCUZv861x1g
	yq6SKLwZMoKeV2bTVMndYjqmzafTDhaITEPOfiA54UUqAlcrgnJQzRdLnm9aE/1GeGuyEgXD+G7
	1PPScb6kgw51Qkw0+C6Mnyn2U+2GY8n5HQ6U3ZpRxdGL0Oya1yV43b0vMMetG+fD/dvTx6n4Vl0
	2lB5M67gJdOJ0WjjhhYbEFYePCVJ3ElIPtdAdv/H3NrBStyZNuN4J0i3djY25x36GlCqotaN354
	VS7gTEymTYT0Jq76dxCFFJEOSHST2driURbQb
X-Google-Smtp-Source: AGHT+IH9yDBhkiPY34+r8L4QfGlETNuwKEKExxU3npIvUrJ6TVQTuSdRSJEPMfeufN3cm41sP9BTrQ==
X-Received: by 2002:a05:6402:50c6:b0:632:930c:ed60 with SMTP id 4fb4d7f45d1cf-639d5c57a9cmr20902180a12.30.1760430850785;
        Tue, 14 Oct 2025 01:34:10 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c322e91sm10304155a12.45.2025.10.14.01.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 01:34:10 -0700 (PDT)
Date: Tue, 14 Oct 2025 01:34:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, rppt@kernel.org, 
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, corbet@lwn.net, dave.hansen@linux.intel.com, 
	devicetree@vger.kernel.org, dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, 
	hpa@zytor.com, jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, luto@kernel.org, 
	mark.rutland@arm.com, mingo@redhat.com, pasha.tatashin@soleen.com, pbonzini@redhat.com, 
	peterz@infradead.org, robh@kernel.org, rostedt@goodmis.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, tglx@linutronix.de, thomas.lendacky@amd.com, will@kernel.org, 
	x86@kernel.org
Subject: Re: [PATCH v8 01/17] memblock: add MEMBLOCK_RSRV_KERN flag
Message-ID: <2ege2jfbevtunhxsnutbzde7cqwgu5qbj4bbuw2umw7ke7ogcn@5wtskk4exzsi>
References: <20250509074635.3187114-1-changyuanl@google.com>
 <20250509074635.3187114-2-changyuanl@google.com>
 <ef6wfr72set5wa5el3wbbu4yd5tnc4p2rhtjpb5kpmncv3xs5d@i3c5v3ciioi3>
 <mafs0wm4yluej.fsf@kernel.org>
 <mafs0h5w2lpqu.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs0h5w2lpqu.fsf@kernel.org>

Hello Pratyush,

On Mon, Oct 13, 2025 at 06:40:09PM +0200, Pratyush Yadav wrote:
> On Mon, Oct 13 2025, Pratyush Yadav wrote:
> >
> > I suppose this would be useful. I think enabling memblock debug prints
> > would also be helpful (using the "memblock=debug" commandline parameter)
> > if it doesn't impact your production environment too much.
> 
> Actually, I think "memblock=debug" is going to be the more useful thing
> since it would also show what function allocated the overlapping range
> and the flags it was allocated with.
> 
> On my qemu VM with KVM, this results in around 70 prints from memblock.
> So it adds a bit of extra prints but nothing that should be too
> disrupting I think. Plus, only at boot so the worst thing you get is
> slightly slower boot times.

Unfortunately this issue is happening on production systems, and I don't
have an easy way to reproduce it _yet_.

At the same time, "memblock=debug" has two problems:

 1) It slows the boot time as you suggested. Boot time at large
    environments is SUPER critical and time sensitive. It is a bit
    weird, but it is common for machines in production to kexec
    _thousands_ of times, and kexecing is considered downtime.

    This would be useful if I find some hosts getting this issue, and
    then I can easily enable the extra information to collect what
    I need, but, this didn't pan out because the hosts I got
    `memblock=debug` didn't collaborate.

 2) "memblock=debug" is verbose for all cases, which also not necessary
    the desired behaviour. I am more interested in only being verbose
    when there is a known problem.

That said, my suggestion is to only dump extra information when something goes
wrong, not affecting the boot time neither boot verbosity.
