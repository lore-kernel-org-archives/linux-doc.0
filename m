Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB03A2D0283
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415368; cv=none; b=iB43iwUt8/haOjbs+xnsWKTAAKh9IkH7fS+CqYYedwkhI+P72MuQpgveNULLcWZX1EirPXYeOr29A07HdULgDTU3LdzYBs6sQ4byFnMhLM6pn4esOcLuTXTcfqUw43IcUEb57a6Mr4JnOxOpDLuk5Ym72oqN8IB5WTlZbKgMOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415368; c=relaxed/simple;
	bh=ug6CF6jCTPeVAFS2QI1pQi+kiqg4TBi7NpuKWEmGN1A=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=RQXVfVHlN0skGLbVnLLdGeKgjY9WhbUGDwdIp1QXwbD7L03Ig4SIOXzJxSQsP/sD6hbC/Er49crkEPqd11K0XxOTq0CG5hpSc8c5DiM/aJRwvSxl7DHCK/pb5JjEMhhLCjHmy58GcEvaMYsAV3MtHO4nbisZ4ZdczFSx8rPMEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mR0ZYIay; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mR0ZYIay"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766415363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ug6CF6jCTPeVAFS2QI1pQi+kiqg4TBi7NpuKWEmGN1A=;
	b=mR0ZYIay0khLE3eWzfTfMrMUBSfzPivyFLCYkJg7umNNHmi1J+CWjiGZd5hgbuhCY4VByv
	bwPiRmnU/E9MGfwey8vGWPmFmFp+7HIigwWdGxEs7jK1Ehu7BWDxBLRxU3ii55jZXrk4TD
	3rMA+8byHGekh6B28hIX+XG4QKisfRY=
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Date: Mon, 22 Dec 2025 22:55:16 +0800
Message-Id: <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
Cc: Kiryl Shutsemau <kas@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
In-Reply-To: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
To: David Hildenbrand <david@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 22:18, David Hildenbrand (Red Hat) <david@kernel.org> w=
rote:
>=20
> =EF=BB=BFOn 12/22/25 15:02, Kiryl Shutsemau wrote:
>>> On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>>=20
>>>=20
>>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>>> The upcoming changes in compound_head() require memmap to be naturally
>>>> aligned to the maximum folio size.
>>>>=20
>>>> Add a warning if it is not.
>>>>=20
>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
>>>> kernel is still likely to be functional if this strict check fails.
>>>=20
>>> Different architectures default to 2 MB alignment (mainly to
>>> enable huge mappings), which only accommodates folios up to
>>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>>> miss the most frequent case.
>> I don't follow. 16 GB check is more strict that anything smaller.
>> How can it miss the most frequent case?
>>> I=E2=80=99m concerned that this might plant a hidden time bomb: it
>>> could detonate at any moment in later code, silently triggering
>>> memory corruption or similar failures. Therefore, I don=E2=80=99t
>>> think a WARNING is a good choice.
>> We can upgrade it BUG_ON(), but I want to understand your logic here
>> first.
>=20
> Definitely no BUG_ON(). I would assume this is something we would find ear=
ly during testing, so even a VM_WARN_ON_ONCE() should be good enough?
>=20
> This smells like a possible problem, though, as soon as some architecture w=
ants to increase the folio size. What would be the expected step to ensure t=
he alignment is done properly?
>=20
> But OTOH, as I raised Willy's work will make all of that here obsolete eit=
her way, so maybe not worth worrying about that case too much,

Hi David,

I hope you're doing well. I must admit I have limited knowledge of Willy's w=
ork, and I was wondering if you might be kind enough to share any publicly a=
vailable links where I could learn more about the future direction of this p=
roject. I would be truly grateful for your guidance.
Thank you very much in advance.

Best regards,

>=20
> --
> Cheers
>=20
> David
