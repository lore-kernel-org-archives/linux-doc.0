Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0D131E11C
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415647; cv=none; b=OqzfMtQNCc5A1ni5QxXjU83abNfDU/Aoch5c5HEPTaQdFADDhm+tjnILmTpWVeFBMrOL4bkEMk54UWrdeA77mxyk+MlhKBwha88Dj/6HvNfbrUNrYs/5gYBbAICsmKm1Vehp3jivS90Yx8zhzketgajkcuOdOLFhAHfUUOSdwjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415647; c=relaxed/simple;
	bh=N/MOQcx02A3ktuCi3Nvppz3elCqxJocAGJwu/TT1pc8=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=uSzsukIhKgyb6qqrCfhbR48SdphaYauJr7byUmrf+/8hNGrKPc16enzWfH8zb8rf59vJif5Ho9cv0k6XrlQ1+8hv4GpknxXQBTh4FMFn+TI18Ms0zrQt9K1y1VWtQzGnxUTfK3z0Sbzd9xjTv5HODDLG0CtDv9amWw3DyqqwB6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lv/By5z7; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lv/By5z7"
Content-Type: text/plain; charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766415643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYNJ1FFphn1hDAp4esv/mZeqnPPMjHrPEnd9wXzNPj8=;
	b=lv/By5z7LAZ/ISpNYmcTJUIVpvU/9WOi8gm4yqOFv7IYK3WfprOjE6oQ4irrQsWN/T+rFF
	ntvfvoRlmOh6ej5FNvLjCCRFWrHW+u0+SJnjhjunYAoey2X8qbZ0A6rHItUOd7EDDCXE7c
	dF/26og/bzo0V6su3Qipk5/FuG+61Ug=
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
Date: Mon, 22 Dec 2025 22:59:54 +0800
Message-Id: <B6BBCEAD-82A9-4FDD-BF19-0D54BB6D6A8C@linux.dev>
References: <mqvgofzudkucibhyr7gsjgtb47rjibqkqce3wdd62p6kqzosxb@tv4fkzewgkt2>
Cc: David Hildenbrand <david@kernel.org>, Wilcox <willy@infradead.org>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>
In-Reply-To: <mqvgofzudkucibhyr7gsjgtb47rjibqkqce3wdd62p6kqzosxb@tv4fkzewgkt2>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT



> On Dec 22, 2025, at 22:52, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> =EF=BB=BFOn Mon, Dec 22, 2025 at 03:18:29PM +0100, David Hildenbrand (Red H=
at) wrote:
>>> On 12/22/25 15:02, Kiryl Shutsemau wrote:
>>> On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
>>>>=20
>>>>=20
>>>> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
>>>>> The upcoming changes in compound_head() require memmap to be naturally=

>>>>> aligned to the maximum folio size.
>>>>>=20
>>>>> Add a warning if it is not.
>>>>>=20
>>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the=

>>>>> kernel is still likely to be functional if this strict check fails.
>>>>=20
>>>> Different architectures default to 2 MB alignment (mainly to
>>>> enable huge mappings), which only accommodates folios up to
>>>> 128 MB. Yet 1 GB huge pages are still fairly common, so
>>>> validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
>>>> miss the most frequent case.
>>>=20
>>> I don't follow. 16 GB check is more strict that anything smaller.
>>> How can it miss the most frequent case?
>>>=20
>>>> I=E2=80=99m concerned that this might plant a hidden time bomb: it
>>>> could detonate at any moment in later code, silently triggering
>>>> memory corruption or similar failures. Therefore, I don=E2=80=99t
>>>> think a WARNING is a good choice.
>>>=20
>>> We can upgrade it BUG_ON(), but I want to understand your logic here
>>> first.
>>=20
>> Definitely no BUG_ON(). I would assume this is something we would find ea=
rly
>> during testing, so even a VM_WARN_ON_ONCE() should be good enough?
>>=20
>> This smells like a possible problem, though, as soon as some architecture=

>> wants to increase the folio size. What would be the expected step to ensu=
re
>> the alignment is done properly?
>=20
> It depends on memory model and whether the arch has KASLR for memmap.

Yes. Theoretically, the most correct approach is
to ensure that the randomly chosen offset at the
KASLR relocation site meets alignment
requirements, and it likely needs to be adapted
for each architecture=E2=80=94sounds rather tedious.

>=20
>> But OTOH, as I raised Willy's work will make all of that here obsolete
>> either way, so maybe not worth worrying about that case too much,
>=20
> Willy, what is timeline here?
>=20
> --
>  Kiryl Shutsemau / Kirill A. Shutemov
