Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF071D131D
	for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725000122; cv=none; b=kCrzeb9AwUQ7FH8HutjKdZUupLaCMciI7xhDmP8bhaPB0wQXIJ8GI+IIZDiIvLbFQzM7EiD8FPeie2lPSuceWIQR+mqT5DivDLY70AY+8Hq8c0c+XyEofYSedmy91k29D3odd6SmPRgUFIOd5QzosUneIpOD7QNg/XawsbfIPE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725000122; c=relaxed/simple;
	bh=SPX2TYWXECL8SZx6jLAaGZ8DQ70DBpQ/cR7EuKTZ+xA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2hKX8zx74rxAcQo9eJUniDzXiEfZjzD8vWExHUldNUPs8nbg1766xtQ/E05mKqrHttrgjQw+k+MzWRk0493X0VMnfjOdMUVOGonpY+fiOte2i4DyRHAm3659SSVcPy/ZOjBE5V2W0Mmz3+fCaR5qJ26/DbIn7WV9J4zYuwuyi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=eUV7HnOC; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="eUV7HnOC"
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DF9CA3F885
	for <linux-doc@vger.kernel.org>; Fri, 30 Aug 2024 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725000117;
	bh=stViVxHrBBEsBOu5+lfKdQqL1kmTozBEiuazG7uCPrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=eUV7HnOCrZ6P7rWnxp+vbvI+vKQxH5izWalKq+Xlw5vId/gX8YrR5ZoQgvDBhq3Sb
	 kf4sK2Ap2QFqGs1VgNef/w9GEtjYoHLYTMsYVH/sEPlcOvOXY6LGej72jvTsIjyB9Z
	 rczqLP9eaoWY0ryuwLWtcgzYw0SyKT0ji8D0FB170XLMGzncEp+69BJgxK/rGwClEW
	 YTiuO/phYwSKKYD40TXVD7jPHW5YcqWV1isBdiJAyZxU+RHUD6yFsolcXpn2QwFqkn
	 QY76P/lpXsOCXgWNysQD2MfF+lqJKP4y3JX61CEDzBnaaG/S/kXTHKmX/6cU9FgFnl
	 eUHovGiWUYtBw==
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7143b3025caso1693566b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2024 23:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725000116; x=1725604916;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=stViVxHrBBEsBOu5+lfKdQqL1kmTozBEiuazG7uCPrc=;
        b=UDOr6AOUz8IkMOrDyN8xaiyk7eEZ6qhbqyjhxxFa/q9HAyYXzzdvrf9DhVlPuFwHaq
         H3GKh1XADNKM1bGZniwplNxLOvzJ1qRuhoZqulZZ5Q3tVeiNv11+A+J1quJk+nWow/pB
         PeRIZJen0VgBP1CKhlKMMBJfpt24StpvKw8pi/JuFgNP/xrRRm6WxSFqVc8qJVJmUkDI
         NFvk6WUpD+xbB0lvrcFkejuor+HsBTZuPcet2ZeTV5g6HzDFjCwSvWaLE1brDzxoJQbI
         RPUksvmxC/HEcwxQf6lijHgLnSYGEFHzolucY1a9vPbeyS5x7/3b04iXT5wTeXH1oRg0
         Z8nw==
X-Forwarded-Encrypted: i=1; AJvYcCWGXM+gSdUmPN+JdyWbOf5wGvR0Vd1vMYj0D2nU9Yv5CiVQT+LsQIbGocCMlLR1thhz4q6yfXV66Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfW/6j1G/p3IA4P6+FFdn2/+uBs9itQB9VexifvstRd23qpdIu
	LkO6zUGL1QiAd+z+hd4QrmTolUDSvRMBDRsXA4bATz4SyNii65XZY5DM6lON/M+kzUVkLaMaI+j
	mlXHDI0HQEnln9AfmzO9ABlOvZBEQjd87W2+MaCoymjIP6AdLwFH0KDVLY3ERX5mflXbKc1xf5g
	==
X-Received: by 2002:a05:6a21:1304:b0:1cc:ecfc:4e19 with SMTP id adf61e73a8af0-1ccecfc5080mr2120878637.21.1725000116139;
        Thu, 29 Aug 2024 23:41:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaXyUn2dop9Ka0x8wrhn0wVdTWTZjUwZ/SlkcBN7yWlQ1nrIciaeWRmtziG4HoZZ26ik1ehQ==
X-Received: by 2002:a05:6a21:1304:b0:1cc:ecfc:4e19 with SMTP id adf61e73a8af0-1ccecfc5080mr2120843637.21.1725000115369;
        Thu, 29 Aug 2024 23:41:55 -0700 (PDT)
Received: from kylee-ThinkPad-E16-Gen-1 ([122.147.171.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2051556a712sm20796435ad.307.2024.08.29.23.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 23:41:55 -0700 (PDT)
Date: Fri, 30 Aug 2024 14:41:49 +0800
From: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
To: lijiang <lijiang@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Will Deacon <will@kernel.org>,
	HAGIO =?utf-8?B?S0FaVUhJVE8o6JCp5bC+IOS4gOS7gSk=?= <k-hagio-ab@nec.com>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	ardb@kernel.org
Subject: Re: [PATCH] arm64/vmcore: Add pgtable_l5_enabled information in
 vmcoreinfo
Message-ID: <ZtFprQX-UzyqnKTH@kylee-ThinkPad-E16-Gen-1>
References: <20240826065219.305963-1-kuan-ying.lee@canonical.com>
 <20240827122459.GA4679@willie-the-truck>
 <Zs5Xo5eVUvGMbtSv@MiWiFi-R3L-srv>
 <CANU+ZydbFPiSnCRr3qQ52GjUQQmU3ZO62c6hRkoLM147+u5u8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANU+ZydbFPiSnCRr3qQ52GjUQQmU3ZO62c6hRkoLM147+u5u8w@mail.gmail.com>

On Wed, Aug 28, 2024 at 05:37:07PM +0800, lijiang wrote:
> On Wed, Aug 28, 2024 at 6:48 AM Baoquan He <bhe@redhat.com> wrote:
> 
> > On 08/27/24 at 01:24pm, Will Deacon wrote:
> > > On Mon, Aug 26, 2024 at 02:52:02PM +0800, Kuan-Ying Lee wrote:
> > > > Since arm64 supports 5-level page tables, we need to add this
> > > > information to vmcoreinfo to make debug tools know if 5-level
> > > > page table is enabled or not.
> > > >
> > > > Missing this information will break the debug tool like crash [1].

Sorry, the above line was mistakenly expressed.

Currently, the crash tool doesn't support 4K page with 5-level
page tables (LPA2), so I initially planned to add this
information to implement support for 4K page with 5-level page
table in the crash tool.

> > > >
> > > > [1] https://github.com/crash-utility/crash
> > > >
> > > > Signed-off-by: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
> > > > ---
> > > >  Documentation/admin-guide/kdump/vmcoreinfo.rst | 6 ++++++
> > > >  arch/arm64/kernel/vmcore_info.c                | 3 +++
> > > >  2 files changed, 9 insertions(+)
> > >
> > > In which case, wouldn't you also want to know about pgtable_l4_enabled()?
> >
> > That is a good question. I guess it's deduced in code, mostly needed for
> > different PAGE_OFFSET, how to transfer virtual addr to physical addr,
> > etc.
> >
> >
> Thanks for the information, Baoquan.
> 
> If I understand correctly, for arm64, currently, the crash tool determines
> the levels of the page table based on page size and va_bits, and then
> decides how to translate the address, such as calculating it in conjunction
> with other values, e.g: kernel pgd, offset, etc.

Thanks for the information. I will then try to use VA_BITS to determine
if it is a 5-level page table.
Let me investigate further.

Thanks,
Kuan-Ying Lee

> 
> For more details, please refer to this one:
> https://github.com/crash-utility/crash/blob/master/arm64.c
> 
> 
> Thanks
> Lianbo
> 
> 
> > Add Crash utility experts here.
> >
> >
