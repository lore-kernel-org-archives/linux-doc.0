Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891AE39C00A;
	Tue, 28 Jul 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785258310; cv=none; b=OBkjjEBbI45XeBRs4ArHvriW/GKLVuI3LztZlantHVAAydCWjvC14khXQzU+zF2fRQuB0vaNnR0RrcuYkRWE0LwDajp2VTkR6vne53SJzXDd0FqhHo/qC52Nmredea1AEcmx6DaaodzLtKJvTwYUI0enhfdm1XWoTPC9kHNw8Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785258310; c=relaxed/simple;
	bh=YUG4rcz+6fAwr2fgsJoI5ef81F64ubJ+RI80/RZYGL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LhvKk22KTlxlkojIwUj6zqoGYx93l5Eun4JnLHFzJ0ndFeSyoZwU2/vbPOKd4K1wYjMRP3YQjPuOJc3qt/BXpJD2numo1iE8ZLTkcBn/8p/aEZQce+He55As1u/b/ZBtGpvRcd/thw43NP3BOPxC+plOqtq+3okKE3o8/ntURtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RtW2zW6t; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RtW2zW6t"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 95C4A40E02C5;
	Tue, 28 Jul 2026 17:04:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id PuJ-_oFyiaoe; Tue, 28 Jul 2026 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1785258284; bh=lcAEz3nhaQjV0BW93oosZaoik5yDUeu2en03FQEWeZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RtW2zW6t6FTAmYdvmQnmCUIZndMi7vROEOjQMHuHxvoSWMTJBScag6oUhGX25ijMs
	 eDgZBxIUi69lkBRZGMcMoaeY5vwF+loVgr/eMxl0mTr/8S+hLjIsLZW2x4d/t5lPJ1
	 ZYgk9kp3tH43Vj4ZBu7mybBdqMzy2mMb2mjC5jTL9xTMUVIhK+TohJcqA3KV8LhbzI
	 xqcJlk7eLUwMUrAz11MwLvU1qLmMZAaiLFAxIVAEXnLK/tfZ3SBpQzDu8ylavVJ1qi
	 6irJgN/QrwZrN4W7/2IWo8KrvZ+iOL/fQP25BsfJTFsku93dj+OZczwSwD0kthwnnr
	 vN7tIfjA5516IM3GZ+y03lFcJsCeODAnm/cRaBSJ+mpWdlzrZXEsq/z7PmDCvIBQEF
	 58YK4ILC17foJ2R+DOoDaj9g6WVo7BhXhK8xSboeQ1S5d0pfGXJ+WRj41Ho2/4iooI
	 /NcoS5jPVaDQTgnGpjFvMOxnGxOy9tOJ5M3XMqS+FT98BT2ylB/SyL7qh+c0AqIPOX
	 VGjPUgA6QK2sueu1tDYXYIpJ62PKuaP/PVWmEkgg6FTcBAt0BmcifO3oTpk8g3EFWx
	 /O7pxPYNqsevGKfjKYlCICj+dEHwP21jRzHWUP4E9sScDnidmHSIMZX0Be16UxMByg
	 +qOks3mRj80bDDVjWZQUyJbM=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E4E2B40E00C3;
	Tue, 28 Jul 2026 17:04:26 +0000 (UTC)
Date: Tue, 28 Jul 2026 10:04:23 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>,
	"Moger, Babu" <bmoger@amd.com>
Cc: Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, x86@kernel.org,
	Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
	skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	eranian@google.com, peternewman@google.com
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
Message-ID: <20260728170423.GAamjhF3W74TW4q9DG@fat_crate.local>
References: <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
 <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
 <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
 <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
 <d393895a-9763-401d-a04c-90bf15f7e9f5@amd.com>
 <386b441c-286a-41e5-b878-50a6debb7571@amd.com>
 <77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com>

Hi,

I'll go through the thread and try to summarize everything. So pls expect
questions.

Then we'll see how to solve this.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
