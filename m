Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E631D24677A;
	Mon,  8 Dec 2025 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190928; cv=none; b=FF7k0mfJj8Ohreo9OxNyItZXVxyqrzkHeRKXS6pCEvB2B7V/PSFf3lsTcxPO6PW5tyJkmkD+AIkcOt1U0H5SUCuiEAVunjvy7YRskt5JdvkoL2R/dy360uul1WDpjS3+rEjrgUS1+GaUgN2lv+sOlbYQekNal8GB27PQ0Tvjtp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190928; c=relaxed/simple;
	bh=rcNksnfe6yY86JGogzwOwacOXhLYj1M/JZHVPYbr7X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uNDYajFxZQ59t9dbu6L+cZSYDGqiOkq+6ov8TBeA+o7Pmk5eosnjgu8ZwqwxMLyF81PkqrY8rYv+SrCLIhUwJzGVWwvB8CoufeMUeYbT97DDvb5eakQ7OwZFkxKEMxw6aOXbazOYZ+sqbQ8g1/onLfD22tlS74uImt5O2VeugZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=trlcaSQW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="trlcaSQW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83F9C19421;
	Mon,  8 Dec 2025 10:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765190926;
	bh=rcNksnfe6yY86JGogzwOwacOXhLYj1M/JZHVPYbr7X0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trlcaSQWYBzrnbny2MMx8VNEQCqlwLvbkDMkgUROpD5e1JCj5v2+wVDjPtR2HbbLt
	 lRqFE33DfsJPCH9gFtA1gtiSxNUVCRnX3DBenJvw+Td4XgvlhWswGuFmG+X70Q2P9Y
	 wxyPBY5/LRWzBjfV2gM1lDKNHTzrAz6BeScF+hwrQDDD6PCv1dSNlnjmiskTmzLcFf
	 Pg7y2WXsD5gifCUr8yYD60DcdcVDKerpdYau59Qiz8q2K7rTg8Fje9QlIiDp4e1X5c
	 nI5i2bvS9XnGxOSAfUBxQK1jqfnEMSCDilNp1FsV46qIlo+pmmkjBoXx7ge5YaFLdh
	 wIUvcigTabV7Q==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 280C9F40068;
	Mon,  8 Dec 2025 05:48:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 08 Dec 2025 05:48:45 -0500
X-ME-Sender: <xms:Da02aRk-30AokWEJl_zHP3tZAQk3SRaGGby9UXLSEB8v0QT2zvT3DQ>
    <xme:Da02aTpMBMIWgYd9R9X0q1CcTw6FtZKH6Y4NFJzBYFAl3FgZkeFR6_1RGKQh7yqrM
    yEB8FB8RjVlfA66u4QXgijvruMDzj9FTz8lmsbDBRenErlfIhJ4pA>
X-ME-Received: <xmr:Da02aQknVucOW0l-XHMMnb6z8azwz90k7NCqDsVJlLt41gEVmEG5vF_7guVoqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghkph
    hmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhu
    nhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphht
    thhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuh
    hsvgdrtgiipdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgv
    rdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:Da02aUaADskLn7TlDBumoCTkxl3JM5pYFFPJVrxO7vYyqH6gz7B_rw>
    <xmx:Da02aUEFpLbHRWQ3eTNEXt_48wOOFRkSzAvYKUcdsjhJQHLLPqUTHQ>
    <xmx:Da02afMKabkartllZSf0AHe7sfCc6EQb9ExU-PW5JnxoMKYSArnoKA>
    <xmx:Da02aSw4VC5kJGsxMes9Na5AP-7k4fmMZsRmuD0liTXI2B8VeGnz4A>
    <xmx:Da02aUm7TOir-Cy1Avs20u74eEtlGINRXFYhpFEykZYxH2B_H9vyvhio>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 05:48:44 -0500 (EST)
Date: Mon, 8 Dec 2025 10:48:43 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 07/11] mm: Drop fake head checks and fix a race condition
Message-ID: <2l523g5soivzdi5yinyxdmkdd3k46q4buh5zprdeynplgeay2m@ivmuipyx33hy>
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-8-kas@kernel.org>
 <17002374-e135-46a5-9e4c-c317ac9823ae@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17002374-e135-46a5-9e4c-c317ac9823ae@gmail.com>

On Sat, Dec 06, 2025 at 05:27:29PM +0000, Usama Arif wrote:
> 
> 
> On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> > Fake heads are no longer in use, so checks for them should be removed.
> > 
> > It simplifies compound_head() and page_ref_add_unless() substantially.
> > 
> 
> Would be good to mention in the commit message what the race condition is as
> its there in the subject. Probably can copy some text from the cover letter.

I forgot to update subject for the patch.

Yes, there's a race window in page_fixed_fake_head() between checking
PG_head and checking compound_info/head in the first tail page.

But the race seems to be harmless.

Unlike the race in 1d798ca3f164 ("mm: make compound_head() robust") the
caller always gets valid pointer to a struct page. It might not belong
to the same compound page anymore if the caller doesn't hold reference
for the page. But it shouldn't be a news for speculative page lookup
path. Caller would need to re-check the page after obtaining reference
anyway.

I will drop "and fix a race condition".

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
