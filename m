Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E6B3EDE5E
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 19:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613593; cv=none; b=JsLoqGmogHHxL2E7/OfNZSsIxN3KEvdtb/tZ0qataHD8CfIfOaz1K+8d476AFSt8kptHcW2xtkYQ//klzs41R3vOIihjsB+zq1RTITN3AFzdCvtuGz93E3142NmO3A9TKWVFZUbmj5dwXEn0/6FM+K0Hahld+ijUidGfjHGVuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613593; c=relaxed/simple;
	bh=0pqjmErb0bBz+jPGkfkbyo5U07cAJWSPPiwi5VhxD2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GMraKXQV/r9NEbHR0HPVkKlxqekEXxlCD4i63fFJnxlVOGWpFBPLKWcbm/NN2SIfWVsFGGk+kHBoD0DVdnVtpfbdnRT8n0QbFGGeckcwGBT3csBOYu6R3Tq5n3uPVJRlfy9SSWQtcoEmjyefKu81U4JNgMxqD3a+1mx3mZ4PYQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHPIuXYY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHPIuXYY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BF72C2BCF6
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 19:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778613593;
	bh=0pqjmErb0bBz+jPGkfkbyo5U07cAJWSPPiwi5VhxD2U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jHPIuXYYyceAa6gYQIBkkmz8snh4ZnnKTtFsorN3BWL1QomaPACptmV1C4zno1enO
	 TzP7DwKNIl1Um+hbLeT4grRBxs3Gt7Zy0c6793LTzF2SnDBIyahO24RBgJBUJkukp/
	 eoMAA1ecPMqQdZwDwd8wE7pl3/H5BpMWFNf4wqxE9IVetorlEKrf6EqC77GgPcI1nj
	 gdpYTMqYwW/fJiExpYKEKfBDrPFFGeiZsjmG/dl3ehCwdrLuI37AdRQVK+p5YcuOfD
	 WrPNisuwP3GesdDkb4/8Wzu7D6/lgtn99dfGbyi5JkRgnMO+CSjtvf9xyUnDnWL9/q
	 Xj8g5eSa696Ww==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso11074628a12.1
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 12:19:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/04meCahQuNaKaQpOLmZke5NRpTKTX9agVqka/F/Iwa2iwzijis42qLC2ftEVpHx874Xvdz8VvRFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UoDifbrfjfAw5pS8phvbpgxLfh5HxZz/6pJbXFfZ5/pzzYUr
	AXriLoXY7Yok8xHjz8OPxt4EaBlkMdlBuXLckIA1rMrffzP/zHgXCdYJkuH3avEjBW7G/RwM5WM
	aCuSRSqczn/jHtKnZmLcy7GfOz1100z4=
X-Received: by 2002:a17:907:72d3:b0:bc1:c4d:cc70 with SMTP id
 a640c23a62f3a-bd3ab9a61f0mr21477366b.2.1778613592080; Tue, 12 May 2026
 12:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <agJT6D5zaUD6FpwQ@google.com> <c0effa9f-1262-4bed-a99e-ae5441ac47ea@kernel.org>
In-Reply-To: <c0effa9f-1262-4bed-a99e-ae5441ac47ea@kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Tue, 12 May 2026 12:19:40 -0700
X-Gmail-Original-Message-ID: <CAO9r8zP4EgQCSNgZbDaNWkROO6P6HJ3N6QgnAFTB0Ufe0zbanA@mail.gmail.com>
X-Gm-Features: AVHnY4IltmX3gwRLKldRQslOdG2_1-5pc6gcF8afVV6rLxOQDDzBSAPNbt_fxCA
Message-ID: <CAO9r8zP4EgQCSNgZbDaNWkROO6P6HJ3N6QgnAFTB0Ufe0zbanA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] mm: support zswap-backed anonymous large folio swapin
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Baoquan He <bhe@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> >> Feedback would be especially helpful on:
> >>
> >> 1. whether it makes sense to support all-zswap large folio swapin first,
> >>    while keeping mixed zswap/disk ranges on the order-0 fallback path
> >
> > I think so, yes, but based on my read of the code this RFC only affects
> > synchornous swapin, which is more-or-less zram+zswap. This is an
> > uncommon setup outside of testing.
>
> BLK_FEAT_SYNCHRONOUS is also set for pmem and brd devices I think, but that's
> also pretty uncommon I assume. Well, maybe if your hypervisor provides you with
> an emulated NVDIMM to use as swap backend ... maybe.

Yeah, I said "more-or-less" to capture pmem/brd/etc :P

> I thought there were other ways to get BLK_FEAT_SYNCHRONOUS set, but I don't see
> other usage.
>
> So seeing it for zswap is pretty rare I assume.

Yeah that's my understanding as well.
