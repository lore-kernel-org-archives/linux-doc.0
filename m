Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C65219006B;
	Tue,  9 Dec 2025 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765268335; cv=none; b=Jib6McjntIqnceW1Zs66Cyl3NKqtajqbehB9DiRKzj+2MIU5eOL7k9/p1LWGZA60G5AG4vAGME7fIhHAbBVYWBrX09VpIlsd3QW1scjyhobj+DXdMpAx9/7TzoW3996LMpPcj6rrMDl1ZJqm5DXLApc4JrnAtjYciooOthT1n5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765268335; c=relaxed/simple;
	bh=aL/hwR8PIWPLlV6uFQBsf2fAQbPmjSBfIHKkmx7HAzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WwLPLVmge6BDWMK9gW2x2AUaHdFocNvlN1YFwgZIUKSny5LkHVLBVWzFh/9u88vu2saQds7IOL2Em0XvZLZGEAk5Mnrdwnd6p1mx7dku4RPDX5tVh2KNgyu3erO6OjUV7s5iNWhURrTY5Ypb3Q0fkt/l+HmsXK2nxFP8Vp3vm9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+aaFS9D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+aaFS9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66519C4CEF5;
	Tue,  9 Dec 2025 08:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765268335;
	bh=aL/hwR8PIWPLlV6uFQBsf2fAQbPmjSBfIHKkmx7HAzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J+aaFS9DJjhtBzUXMwjiV1dTctAzbSTgd+qhpLMl5+L/KZvE8jsx3AyT07Pl72FmX
	 DBXpTNDIbkr0ESOZCipm+oEipaq4Us8aDhRUR89KNBqA+0HaL+Rx/ENO3lxV6x8fuW
	 zptCYOGL5rXnmjGw26F1L16Wwp931gY+IQ6hg2bslYXpzSAJ9LgoTsnFgsw9jq78ry
	 1BCC+EnCrO8RFAZGdvmCba4sJVIpSvxSVnHIHT/MVh7fJqJYfQHh7ASXPxCpKc5FTR
	 5B5vOjVS8NOEHgGq2/S31MnHy6yDdyNJoBZTN7PXj7Rf8Rl7DtrXCXmUHKkDB38QiT
	 z81VvUd0S+h+A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,  Andrew
 Morton <akpm@linux-foundation.org>,  David Hildenbrand <david@kernel.org>,
  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  "Liam R. Howlett"
 <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,  Suren
 Baghdasaryan <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,
  Jonathan Corbet <corbet@lwn.net>,  Thomas Gleixner <tglx@linutronix.de>,
  Ingo Molnar <mingo@redhat.com>,  Borislav Petkov <bp@alien8.de>,  Dave
 Hansen <dave.hansen@linux.intel.com>,  x86@kernel.org,  "H. Peter Anvin"
 <hpa@zytor.com>,  Muchun Song <muchun.song@linux.dev>,  Oscar Salvador
 <osalvador@suse.de>,  Alexander Graf <graf@amazon.com>,  David Matlack
 <dmatlack@google.com>,  David Rientjes <rientjes@google.com>,  Jason
 Gunthorpe <jgg@nvidia.com>,  Samiullah Khawaja <skhawaja@google.com>,
  Vipin Sharma <vipinsh@google.com>,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  kexec@lists.infradead.org
Subject: Re: [RFC PATCH 00/10] liveupdate: hugetlb support
In-Reply-To: <48d0b46e-2b82-44b6-a717-94bc258a508d@linux.dev> (Zhu Yanjun's
	message of "Mon, 8 Dec 2025 20:43:22 -0800")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<48d0b46e-2b82-44b6-a717-94bc258a508d@linux.dev>
Date: Tue, 09 Dec 2025 09:18:45 +0100
Message-ID: <86h5u0ax0a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 08 2025, Zhu Yanjun wrote:

> =E5=9C=A8 2025/12/6 15:02, Pratyush Yadav =E5=86=99=E9=81=93:
>> This series adds support for live updating hugetlb-backed memfd,
>> including support for 1G huge pages. This allows live updating VMs which
>> use hugepages to back VM memory.
>>
>> Please take a look at this patch series [0] to know more about the Live
>> Update Orchestrator (LUO). It also includes patches for live updating a
>> shmem-backed memfd. This series is a follow up to that, adding huge page
>> support as well.
>>
>> You can also read this LWN article [1] to learn more about KHO and Live
>> Update Orchestrator, though do note that this article is a bit
>> out-of-date. LUO has since evolved. For example, subsystems have been
>> replaced with FLB, and the state machine has been simplified.
>>
>> This series is based on top of mm-non-unstable, which includes the LUO
>> FLB patches [2].
>>
>> This series uses LUO FLB to track how many pages are preserved for each
>> hstate, to ensure the live updated kernel does not over-allocate
>> hugepages.
>
>
> Is this patch serise based on the patches in the link
> https://lkml.org/lkml/2025/11/26/1665?

No. That is an independent series. This series is based on
mm-nonmm-unstable, which has the base LUO patches and the LUO FLB
patches, but not the VFIO or IOMMU patches.

[...]

--=20
Regards,
Pratyush Yadav
