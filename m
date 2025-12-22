Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95753221721
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 14:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415035; cv=none; b=P/oC5U6FGtUaubR4ZZNcviTmM0br2TIe6dk3reA1KEJy3EXJRIUhLfU1lgOUiYCXSslGb1+VDfekbInbnoUI/OGy/FeP/enykMEuq5qkH6FI9xEJ/elsFh/ntR7yZxGqc1cRDJIBBuF98UTLOAnzxYYV3vv9RBGDXi3ZlmXqQEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415035; c=relaxed/simple;
	bh=BwxJO7Y78+ftFqRCVSS7pjw0VJ8dZuZn+KC4Ih8Z/Ww=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Cc:Date:
	 Message-Id:References:To; b=saX0/2ovpZbmyK3Vq2r7KNCqFQhtdM9cMU1j5KrcIjJKztV32ncY+Kmzc657EbRMZwONz49XTBQ35aYwkzeR5d+vQsaa/QparI9m0SeyB2+xOdnpWGifEEnqFt8iPzz5hrvGONBRI1k9Gq15A4CVhQSw+hfG2fNbJmQdHXt+B6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=bX2pgD2+; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="bX2pgD2+"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766415020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5qzGZr4qrIFP3xmX1Te1Vb3hc6XAzSOL3+dOKj/DIgE=;
	b=bX2pgD2+ZH2mjwIE+F1nF4QjafwE0V9gHaSPSQuQqmCUcAaFPydFTPTfdho3455KOK3f7g
	XOTAqzuoydUi+uxpkHQIgWXw780Y7nHB+3AOcsVJKXJVcZ7n+Xp99Ze7i4VY6RfUORoqZ7
	phXmCUYNOqgy1jhN5otecOILZlBhWKw=
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
Date: Mon, 22 Dec 2025 22:49:31 +0800
Message-Id: <2063FA31-1173-4F30-930D-86A0E546FB8A@linux.dev>
References: <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 22:03, Kiryl Shutsemau <kas@kernel.org> wrote:
> =EF=BB=BFOn Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>=20
>>=20
>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>> The upcoming changes in compound_head() require memmap to be naturally
>>> aligned to the maximum folio size.
>>> Add a warning if it is not.
>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
>>> kernel is still likely to be functional if this strict check fails.
>>=20
>> Different architectures default to 2 MB alignment (mainly to
>> enable huge mappings), which only accommodates folios up to
>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>> miss the most frequent case.
>=20
> I don't follow. 16 GB check is more strict that anything smaller.
> How can it miss the most frequent case?

Sorry, I didn=E2=80=99t make myself clear. What I meant
is that if this warning triggers, it implies the
largest-sized folio isn=E2=80=99t properly aligned, and
the 1 GB folios are probably mis-aligned too.
Your commit message says
=E2=80=9CMAX_FOLIO_ORDER is very rarely used,=E2=80=9D but
I want to stress that 1 GB folios are actually
 common. If they=E2=80=99re also mis-aligned, we=E2=80=99re
quietly planting a land-mine. That=E2=80=99s why I=E2=80=99m
worried a mere warning isn=E2=80=99t enough=E2=80=94it
leaves a latent bug in the system.

If there=E2=80=99s a problem, we should stop right
here=E2=80=94this is the earliest place where it will surface.

As David assumed, if we expect to catch the
problem during testing, then I think VM_BUG_ON
would be more appropriate.

Thanks.

>=20
>> I=E2=80=99m concerned that this might plant a hidden time bomb: it
>> could detonate at any moment in later code, silently triggering
>> memory corruption or similar failures. Therefore, I don=E2=80=99t
>> think a WARNING is a good choice.
>=20
> We can upgrade it BUG_ON(), but I want to understand your logic here
> first.
>=20
> --
>  Kiryl Shutsemau / Kirill A. Shutemov
