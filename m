Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07183C1982;
	Thu, 15 Jan 2026 17:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498027; cv=none; b=bvsp1VzpHDsNkEfOqs72E6iEeiFpjfa4zJq9rgjIv+yRyhLYHlAuv3u7Qd0fz6UQtW2eglAX26n7SdT3eWWXKNUJtU40GxXraS1hPoTrGoSYMYJCPFWiAdccPTJqB9A8gpFQNn06rz6Ke2H6dtgQt4oLr3R1ei/NGn1lFHT1lvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498027; c=relaxed/simple;
	bh=efvNFfmmF55G1OFW1ALmJUn6yfpTkuk/CjfnMcYZ/94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5pAI1u8efJw+EwPIY/1vXmq6J6k281FwdqlikFa0FBAOw875CNyu6I1xgmmi7uLM+JpZqPcPyt6WMRZSy+uR8ZKeOOpToVJjKOO0D2VJlBt6ZAYY4dVsQt7lOUxyAUi4NwftMIgQBw6H2Zy5gOHOPMID/OIfuESPjLIR3L0jBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acae8XOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acae8XOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B88C4AF09;
	Thu, 15 Jan 2026 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768498027;
	bh=efvNFfmmF55G1OFW1ALmJUn6yfpTkuk/CjfnMcYZ/94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acae8XOA+V0EFGSWN3XUYMscNvAOo5loDdvJECOaKFaNAMNRTDs7SL3tUjLPb5zWx
	 e0TVqOM7bVQPslulGtaSad40Em1YRIrN5U3E8vJlrP7w1aD8vRQ5QimJH3b9c+HKgu
	 h+US2ILkv1WBC4A9OgmB9VMAqhrW5cXgqDPTzwIKCkJWRFtbh1llfpK83zXuC9R9VS
	 hZk0X6JZxtPF4nGDIYCNboepa6LzYAoIh1kLmOYivLoDxxP+g3Tr6zi+uGJJz0BOST
	 5S9G9nZ8zoc7J8G+QuH5rKjpppF7gBy86wnVt4EkB8UkWEZ5ZdYjPGy9JHaRsv6SQI
	 cBJNtlsGsTYtA==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 88920F4006B;
	Thu, 15 Jan 2026 12:27:06 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 15 Jan 2026 12:27:06 -0500
X-ME-Sender: <xms:aiNpaT67TyoasDbt1LAROzmdavez0EtG9XZ4hLt70D1cKeF4kR28qQ>
    <xme:aiNpaUSMkyWdh7DErH-Zld6tQc8ZERPmUFwtPHiJo7TC-uFmQ-mUMGc0RrqKH1W7K
    hUsTZzCYDaA0JQfC1wRgZ-WLF3u73AcuTx1PlHFF4l5jVctTvliMOs>
X-ME-Received: <xmr:aiNpaT3XOAMXAUpRbHD_dzICsRzXQL064V-i-NcakVjqhVQa3dW9BzPkom0NLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeiieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinh
    hugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhn
    gheslhhinhhugidruggvvhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:aiNpab66OzbiPAXpkXGHGfosXzW-t3DjGgOmKWPezmlE8xkE66bv6Q>
    <xmx:aiNpaSsiBrJrQ_mf7q9WA0ALDkKSbdHKuxzeWLSaCSLI3Nx2vvkdQw>
    <xmx:aiNpaUNYWLfnJJLjSaZfGmAGcEdoXy2A1Ve0aJ9clipvfyy4PoAiAg>
    <xmx:aiNpadWQz6_MT3yRWc7sv9_TKNcCU1R0c277-2wZxFDQfefaYrnXjw>
    <xmx:aiNpaV1jQGUDbMggZzPUu3pCUoZ-tdr2sJjWOjqWt79gBJT8zU_6To9b>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 12:27:03 -0500 (EST)
Date: Thu, 15 Jan 2026 17:26:58 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv3 02/15] mm: Move MAX_FOLIO_ORDER definition to mmzone.h
Message-ID: <aWkivSMMKX3AGdMw@thinkstation>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-3-kas@kernel.org>
 <be57dfa5-e6fa-4ce6-93c1-239436ff6e89@kernel.org>
 <bf788cfe-ac2e-4ffc-9349-64d9c36bf072@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf788cfe-ac2e-4ffc-9349-64d9c36bf072@kernel.org>

On Thu, Jan 15, 2026 at 05:48:20PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/15/26 17:35, David Hildenbrand (Red Hat) wrote:
> > On 1/15/26 15:45, Kiryl Shutsemau wrote:
> > > Move MAX_FOLIO_ORDER definition from mm.h to mmzone.h.
> > 
> > Why should that belong to mmzone.h ? Semantically doesn't make sense, no?
> 
> To clarify, I would have moved it to something more folio-type specific, not
> something buddy/zone specific.
> 
> I guess page-flags.h + mm.h are our dumping ground for folio handling. I
> would have moved it to the former.

I moved it next to MAX_PAGE_ORDER definition which seemed to be logical.
Moving MAX_PAGE_ORDER around is much more risky (will likely generate a
lot of build bugs) and outside of the scope of the patchset.

I think wherever they will be moved, it should be moved together.

> Likely we want some folio.h in some distant future.

Sounds like a plan! :P

> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>

Thanks!

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
