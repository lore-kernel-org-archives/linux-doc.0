Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114260;
	b=x48LfpBgERsoyGNU1WZeo0/KcT6mbk0o2VAuxpwzpPrdTWFJ2DFehT5b1SwJxwiaWy87
	 Y57DzV+pAFZ2GFbuyDDBmVYFxGsav7nelfiD8HQZJ29j72l180iWrZOhrvaq8IkGU7mUg
	 W04xDsRxhecRX9IppkT1S/bqtGjADupBX4pOlfWMnSQXmh9/Pat9t6/SkQyNFvPoFdqOI
	 Ap4+NasBjyLDIQbaOsJ3bHt/Fvliu4Z6xAomNRwHl+FsbD53C+kW8U10fdyzCRCUcynlh
	 /Tr0Y635WWhVQU5ZAYak/F9C0pjkGY+BsKy4+U7+sZOyG4cBLZ9HAmYVdaSxlnftlFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
	b=v7FmUkfSqudAA38CoIBVZagOovbLhW9N5HCcM31yj1flxJ2LXRjc9py8vrIGVLT/i/r5
	 LCZvYkZsqPj7VnyZF7HnmvU+m7vdjv6XcBFBSk3zsToUB90yWwlL7auDtHiWb5DKvK42t
	 b5PVSWCNBr8rymY58Q4D0fbiCi/6gCGcq+uM3gPONhMYAHCiENDz+OjklzXBWC9EoVhlN
	 zsdA7ifNgRSaMjJ31FWikQSbV1ehxJPUIZAjWwf8hBYPaNFEHAyfXEjcrCYsUeODrEbhi
	 aZTmRhd32kivOGClotz4chxq0EQEyMM8TntcE7JEmSYTEtOHwX0YvK1JficwqHs/A+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780AD606A31B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780AD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91c79a9a739so25036d6.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793114254; x=1793719054; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
        b=U1iZ1xcIf2hwIIOOPzvu5+3f09OLBYFlaWg95+yayNLvnC0/CP4TAjRhcqtpvXTd0t
         CA9I4Qu2DQg94szEzY0/jUH1zGh1rz42/wZ788zBQrIV/+RWinv1iWjnNl+y4kBE5ZS3
         y/Ki19lyLJO1nBHR1WIB2DnTEfcGTEEi85QIJfGTKhq4g6Z88bHiC7THxR3ARfvpxhTr
         Pic1Qs2yGJ/Q1nLcIuSGiQrAGuzp7gM2jlppig8T8Gbe/y501Lck3L0DNHUOTDycYoeh
         VNyvrin1iqtYmuH7R5QmANxalIiZaq1HW75IiG8cDacUp51JEx1Q/MmIjXoLwAe0gBTE
         eopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114254; x=1793719054;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4Ud7qq2I83GZDTdN1xiR67Ms11VsCn4buA6mqvOa9c=;
        b=aXXWgQ7+xannxflxYsEiTu4FiBuwErepxX9W+A8gqgmX2o/sQmryOtYZyGB/i0lly8
         QykWToAam5PBDE58/M9DoTNTYF9o2L3cdEGtLN8SGcHR7JOUpio36KfiJJwxWIWcRcKH
         F+bIdtcoepj0lg39gk5qAD70c9BEciQ8bFrq81VnMPhg+cdSWO0FR9Pdvio4oX+pKc5L
         Lzk6UqGTbSJYB5RMyhSb6IM8OENl1pdSoM5RjqJyeYqr60oV5CyHaWs8CLjZsW7pVcCM
         H58D+5AlqLBcaZv5e4APisGXkdP5dFxoTiE2T4vNLQTI3ArxlO5wK02raL8nqxHzZyyN
         u28w==
X-Forwarded-Encrypted: i=1; AKwUvBzyVYXYfef4uMOtLahMm/2dzTZq6rec8gGuspOZyBUdS92JNiEe35C+BygVzGSlTP9nuhF1rtvxupo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlilJAtZv+H/3vniuEnrNFNNc7XaJT/u8zD1DB5Wm8zDERLmZZ
	gGQZUOsIa90cssAFdsmRwz5fjKtXK8fFAmVW6s4KEftBKz6bz5HyOnAp6Dy2JA8RLqQ=
X-Gm-Gg: AYBFou1ez8bq7akJJdJIrL7r9y2YVsQ5qkahqmyMDl2CrJrtPoV7Y/jL4ov+6LC3xhK
	pbKrAFrY0g2l8maECTBXbhCcEYKXK6AXTUrZB8O710UeqdDxX0xrZSJnQJBUrumr5Dq8zJ3lC4W
	vxwd4XaV9qLFI5kdSWkQrtoS7eBhBZGCI6Hp78xLt9hN4ZwxqX/uRqOKPD8mq1JHbWgCZRHA5FQ
	AAB7rmp33M+PmLR8914tTLsv0U4Y6XBjBemsM2PB00SHW4mYgo5pDjzZ4HYFcu0hydMi4rACW8u
	RiKOzDIxODd9nmpBkTiO4pL5GkUCO6K+KRnYOWERB1QYOsSLTtcqshVNxgNzDMI+jLx7VNOnRVu
	d0Bxx2Wan7YJD3kQs2QKpKuOaQADsCk0fVL1fsnW8pIZ+yy/AYsoY8d5TT49gBD9atfv9jMzcnK
	RUyyzDhuORQXZiy2f7LBY8kkgz6X0zvGKR0jUIk7E63pCmN/R8IVnHS4FglcT4bnBJGFHs2tyTI
	GXyOIKUAJskJVhEkkyEFLR6w/szkfm9k8esQ+BprlMxd55BjlWQI0ZrhCGxAasYFRWwXx7RZ1hS
	ZTv0UvroSu+fnT5cDf6Z+vrzhzXGnRPl2LnMnA==
X-Received: by 2002:a05:6214:f2b:b0:91c:7246:2d4a with SMTP id 6a1803df08f44-91c72462e58mr34928326d6.35.1793114254057;
        Tue, 27 Oct 2026 08:17:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c96375sm105565826d6.33.2026.10.27.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:17:30 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLivZ-0000000ADMO-20dz;
	Tue, 27 Oct 2026 12:17:29 -0300
Date: Tue, 27 Oct 2026 12:17:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 02/20] ctlv: Add the UAPI wire format and family API
Message-ID: <20261027151729.GG1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-3-jiri@resnulli.us>
 <at-iEMxN98nie1Qr@e129823.arm.com>
 <auBaROC0XdWpILEI@FV6GYCPJ69>
 <20261027141524.GF1685504@ziepe.ca>
 <auC5sw9YMC9NO4wl@e129823.arm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auC5sw9YMC9NO4wl@e129823.arm.com>

On Tue, Oct 27, 2026 at 02:48:19PM +0000, Yeoreum Yun wrote:
> > On Tue, Oct 27, 2026 at 09:02:14AM +0100, Jiri Pirko wrote:
> > > Mon, Oct 26, 2026 at 07:55:12PM +0100, yeoreum.yun@arm.com wrote:
> > > >[    3.856919]  ctlv_schema_check_attr+0x3dc/0x538
> > > >[    3.857105]  ctlv_schema_check_indexed_nest+0x788/0x958
> > > >[    3.857301]  ctlv_schema_validate+0x88/0x180
> > > >[    3.857482]  ctlv_msg_test_as_deep_as_the_core_allows+0x11c/0x1e8
> > > >[    3.857698]  kunit_try_run_case+0x64/0x188
> > > >[    3.857878]  kunit_generic_run_threadfn_adapter+0x30/0x68
> > > >[    3.858086]  kthread+0x10c/0x140
> > > >[    3.858245]  ret_from_fork+0x10/0x20
> > > >[    3.858398] SMP: stopping secondary CPUs
> > > >[    3.858630] Kernel Offset: disabled
> > > >[    3.858720] CPU features: 0x0,00000000,00b0802e,9f190bc3,2affe72f
> > > >[    3.858872] Memory Limit: none
> > > >[    3.858976] ---[ end Kernel panic - not syncing: kernel stack overflow ]---
> > > >
> > > >[...]
> > > >
> > > >I think it might be good to configurable according to architecture
> > > >unless it's not good to reduce the CTLV_MAX_NEST_DEPTH number
> > > >otherwise, increasing stack size when CTLV is enabled seems unresonable...
> > > 
> > > Agreed, will lower it down. I think we should be okay with 8 for start.
> > 
> > I'm surprised this ran out of stack though with even as few as
> > 32 levels.. Is there accidently something large on the stack?
> >
> 
> Nope.
> 
> When I see the each functions stack allocation:
> - ctlv_schema_check_indexed_nest():
> 	sub	sp, sp, #0xf0 // 240 bytes
> 
> - ctlv_schema_check_attr():
> 	sub	sp, sp, #0xb0 // 176 bytes
> 
> Roughly (240 + 176) * CTLV_MAX_NEST_DEPTH = 13,952 (around 14KB)
> consumed.

400 bytes per nest seems pretty big to me...

Do you have debug options enabled or something that increases stack usage?

Jason
