Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287014A8E;
	Mon, 29 Dec 2025 21:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767043509; cv=none; b=lfhtFAWpInrUGQ1varnW+MKdKfsD+nPiKaGmSaZZ+hjKVglP0e4mj3Cr5iARLrtxCpvXqzghSRCdP4qRgHKAdmCLtD4V5nXnnzaOlH3evGdfAbEpDx9m0+xhdirdrTePn163wUU9BrwTKP/tE5H1SPrh7O6wKA6Xs7NWriXMIYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767043509; c=relaxed/simple;
	bh=q82e+byaIcXWChEnLqhJwOQExSMsHkk9DYJ3CC9why8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pehxczIPk/KDUByS1TUsG0tEMgf42TKinjzdb+7yQtYLbH2LgWat575ffgzd3h+8iVO5MyQUpp/dzYwnU+NfsaKpI5u+mH++6Mt0Npx0mVmMn21Ouk1JoCvYthNr34SuPKZG6LkJyO5qSfI5wtI95zH3xVf01p+opLrsRgB3Vbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AExtGijB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AExtGijB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BC83C4CEF7;
	Mon, 29 Dec 2025 21:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767043506;
	bh=q82e+byaIcXWChEnLqhJwOQExSMsHkk9DYJ3CC9why8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AExtGijBIRiwcf0k6km3zcRvW4TlCNI/Gv/8K1uyvwCt+MmqI7n2mAEfhSwDxr7lp
	 YPyu5Hy68fYfyYpEq0E5593W4b6WJzNJJrtUMVCWXfcV9QsDT+cZZRoqzR6lvYNJpp
	 27Hv7sUpHCTtisjT95LLkJS0hGmz3yPcKyR3rQo8HCf3WaMRtC4Bs5lLSfwAmdXNMY
	 G5X3rSUjaDJrXPVLCuXBtNTVRWKgmxjt5DwDbx+ui9912NlwvIbWH3alq3ElIju24+
	 6j7CxeS7EnFinddUveciY1tott5eJo2PRhF4wLHywKTY6gyHjrk3cke9FicS0eAc0J
	 A4guRzmC53AuA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Mike Rapoport <rppt@kernel.org>,
  Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@kernel.org>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  "Liam
 R. Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Suren Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  Jonathan Corbet <corbet@lwn.net>,  Thomas Gleixner <tglx@linutronix.de>,
  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Muchun Song <muchun.song@linux.dev>,  Oscar Salvador
 <osalvador@suse.de>,  Alexander Graf <graf@amazon.com>,  David Matlack
 <dmatlack@google.com>,  David Rientjes <rientjes@google.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Samiullah Khawaja <skhawaja@google.com>,
  Vipin Sharma <vipinsh@google.com>,  Zhu Yanjun <yanjun.zhu@linux.dev>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-doc@vger.kernel.org,  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 01/10] kho: drop restriction on maximum page order
In-Reply-To: <CA+CK2bDvaGmfkCPCMWM6gPcd4FfUyD6e5yWE+kNcma1vT3Jw3g@mail.gmail.com>
	(Pasha Tatashin's message of "Tue, 23 Dec 2025 12:59:05 -0500")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<20251206230222.853493-2-pratyush@kernel.org>
	<CA+CK2bDvaGmfkCPCMWM6gPcd4FfUyD6e5yWE+kNcma1vT3Jw3g@mail.gmail.com>
Date: Mon, 29 Dec 2025 22:24:56 +0100
Message-ID: <86ikdp7zh3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23 2025, Pasha Tatashin wrote:

> On Sat, Dec 6, 2025 at 6:03=E2=80=AFPM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>>
>> KHO currently restricts the maximum order of a restored page to the
>> maximum order supported by the buddy allocator. While this works fine
>> for much of the data passed across kexec, it is possible to have pages
>> larger than MAX_PAGE_ORDER.
>>
>> For one, it is possible to get a larger order when using
>> kho_preserve_pages() if the number of pages is large enough, since it
>> tries to combine multiple aligned 0-order preservations into one higher
>> order preservation.
>>
>> For another, upcoming support for hugepages can have gigantic hugepages
>> being preserved over KHO.
>>
>> There is no real reason for this limit. The KHO preservation machinery
>> can handle any page order. Remove this artificial restriction on max
>> page order.
>
> Before removing this restriction, please also add a patch that makes
> sure that the calculated order does not intermix memory from different
> topologies.
>
> I suspect we need something like this in kho_preserve_pages():
>
> order =3D min(count_trailing_zeros(pfn), ilog2(end_pfn - pfn));
> /* Reduce order if the block spans across NUMA nodes. */
> while (order > 0) {
>    size_pfn =3D 1UL << order;
>    if (pfn_to_nid(pfn) =3D=3D pfn_to_nid(pfn + size_pfn - 1))
>      break;
>    order--;
> }

ACK. Will do. And I think I will split it out of the HugeTLB series
since I think this can be applied independently.

--=20
Regards,
Pratyush Yadav
