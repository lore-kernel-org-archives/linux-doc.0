Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A2E2EA177
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 14:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765291481; cv=none; b=fk+JwqmBtnipSt6FEcVus+Wxcqv/ywah5y+OQZpLbjdWhYn/0zl3oJ2grRWHClfza28ye31cNaGnYWvU5CpXmHjbCbrE/wM5pqE1xcJizXRFHiXcRF4PP2RJNjubzxAhezNdVP7Y7O2X2W4NX6jd1cMeYjBbtAfznvwZExoLjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765291481; c=relaxed/simple;
	bh=VTkEB67vNJl4jBEZ977996DZLecFTS+eqS0a9xgLCD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ea7kPyIAOP8OuH63D86tPOyb742qEHneu2OAASoqfOMIgdpIMINOLerv290A2Gkzibu3vNaX+9Z4gdP1LPFqhcbkmKgJCHyJsEbDyaK7oaE1AgFsEKBTydkHTvjEwvxoyEf8DO/TP3OQivcVN1y6oEdqo1vw/ruhT4S/45GoPx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9c7IGBo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9c7IGBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D65C19423;
	Tue,  9 Dec 2025 14:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765291480;
	bh=VTkEB67vNJl4jBEZ977996DZLecFTS+eqS0a9xgLCD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9c7IGBoyktX+xbTR6CzkKO2z0V0yG3/FN6rjF1acrb3W9Z2b5RSHW1aiGIPuG9h0
	 HIYOMy7HT2zD+rPBP1JAplxpvUC7XKAwiLRuxMnR12qW9L00XSNGTBPiMvIxWopAuh
	 TEn946NMSJ9J1ZYOFIXxgoZd+dInq7CjgjYqmIcgJk2IySv83in2rMKhPD1RN2j9h1
	 w8pS0PdET1KDJUI1LhK1PyoGwKTDKzAhTH/8ZhHVuNnh7qRxiyO+BuYTso9CAee8L8
	 sasCl+fa/vWL32abvKF+AV9C2qVOnFVxmzkN1MXshyxGkSYd95WQzePzpVZY4QTX6A
	 AzHiJKHR0aqyg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 76E1CF40076;
	Tue,  9 Dec 2025 09:44:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 09 Dec 2025 09:44:39 -0500
X-ME-Sender: <xms:1zU4abX-QIkzYNQcD4U4EdQbb129TwqQlLkd7ckjVMoilhLCLZkrQQ>
    <xme:1zU4aaZ2fz64E__-RTs5JkkQe-Y0DE1BYbnuveUT97cyK9OYTQR-P63NgaCNrrUIq
    uSiefi1STNHgH2D0puvc5bQt2Xzwd0r_9LSwF_3GoCI3j6Uvir43Wg>
X-ME-Received: <xmr:1zU4aQU_dFNJCnokgtBwn5fwYHowBS45bQADtcm1L4G9XRGFE3dJGX4GmQsuNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvg
    dprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggs
    khgrsehsuhhsvgdrtgiipdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesoh
    hrrggtlhgvrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopeiiihihsehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:1zU4aZIeu39viFsSVcaTW8Nt7q9c1y61GMBcMsZMyrxJ7RCq0QcZkQ>
    <xmx:1zU4aZ2za2rklFWt_Qi60_t3GwIakolsNeoyCGCiVRayJrhTP93VQQ>
    <xmx:1zU4aR_w5DBtp-WEbjShmjK3t7X89fnLgpoGy-JfQd1TGUZTGQl-Dg>
    <xmx:1zU4aehTisoj-UFcfX-dY3ES3hrojIZbHBmymfJPbVT2CbGD2yfVLQ>
    <xmx:1zU4aVVykaFaGBYbhB-Ox_4Np8-1g6hseOf39OEiUIvvMaKdEt9zbegx>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Dec 2025 09:44:38 -0500 (EST)
Date: Tue, 9 Dec 2025 14:44:37 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <m63ub6lxljw7m2mmc3ovbsyfurl7hp4cvx27tmwelcxxrra5m3@eva5tqcdjxtn>
References: <20251205194351.1646318-1-kas@kernel.org>
 <4F9E5F2F-4B4D-4CE2-929D-1D12B1DB44F8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F9E5F2F-4B4D-4CE2-929D-1D12B1DB44F8@linux.dev>

On Tue, Dec 09, 2025 at 02:22:28PM +0800, Muchun Song wrote:
> The prerequisite is that the starting address of vmemmap must be aligned to
> 16MB boundaries (for 1GB huge pages). Right? We should add some checks
> somewhere to guarantee this (not compile time but at runtime like for KASLR).

I have hard time finding the right spot to put the check.

I considered something like the patch below, but it is probably too late
if we boot preallocating huge pages.

I will dig more later, but if you have any suggestions, I would
appreciate.

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 04a211a146a0..971558184587 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -886,6 +886,14 @@ static int __init hugetlb_vmemmap_init(void)
 	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
 
 	for_each_hstate(h) {
+		unsigned long size = huge_page_size(h) / sizeof(struct page);
+
+		/* vmemmap is expected to be naturally aligned to page size */
+		if (WARN_ON_ONCE(!IS_ALIGNED((unsigned long)vmemmap, size))) {
+			vmemmap_optimize_enabled = false;
+			continue;
+		}
+
 		if (hugetlb_vmemmap_optimizable(h)) {
 			register_sysctl_init("vm", hugetlb_vmemmap_sysctls);
 			break;
-- 
  Kiryl Shutsemau / Kirill A. Shutemov
