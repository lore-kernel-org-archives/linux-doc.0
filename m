Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887810;
	b=i5IhHxZRcXC0Ei30RktWlH34/hOHzZDCqOBB3WbJqPcu4p62+BzY7LlFQ/Zjzn0fUVOG
	 fKuaBaSHcb+/AAI+e5vZlCefIVBFUz+YTh28Sc3mqPmkoY8h1BX9+IWzaO3KYgUkutROp
	 JwJcn/C4sda2BN6vLcsXjLmGZQki17dlUPopfv4sLmQ6fTP7yKuz1LCa0rP+fHAgRnr8q
	 sRw7uL7VzOeCfgc43B27qd6RUl2RZIlLNIBwoAJzYZhtApf44oRoSBJWrJ2m7tPju+qu9
	 Ol/U3k6EhMm1szAOHO0zc2qa3wT7mdT+0OBg1nL3574rqySANXak8AA8ET7D5gLPIiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887810;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=rXYKCnFMOcWT/GHOYQM/Rfu/7o9VqnHXStFCMJH6+uU=;
	b=rTr2cwKtVqZ9Gc7B0sqSK9sQT4Ys+Yt3puMxgrSQnMt2u5IHDhKkD8ou0eyQCGPNp4Uw
	 kqhcxs2BGOqNA4rsVm6P91evkzsdEQGfPWBiaj87tPpoCKYw4o8B7O2oR19/S2u1RYo9j
	 3M4ESX1G3zbwrvp40xbY0BQhnEeobJr3RBJ9PQZm4NETnVwuwM8rHGoISRCH8c5Cm1sUM
	 mpaJv0U6i3J3DqYcwe9Rth4IOWAtK6HWo+aqdHrgoe2V5IessJL88eFKjH0MZByU8vf5Q
	 83lsquyWdJlRyLE5Zib9ICmwt4UaiBdi0CD5B7eXLCM75/Sog3gIzDuMqtkQvHCdGyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhsJopj7;
	arc=none smtp.remote-ip=95.215.58.195
Received: from mta1.migadu.com (out-195.mta1.migadu.com [95.215.58.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04035606A338
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 14:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04035606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=UhsJopj7
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rXYKCnFMOcWT/GHOYQM/Rfu/7o9VqnHXStFCMJH6+uU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793887806; v=1; x=1794492606;
 b=UhsJopj7eHfVHFq050D9+MxCSJ5dHBhv8RJ2yrFPYzZTJmr+fFjQwFUL4NIeyiehkWQbe6du
 OwMc6YjYlYxGapwGW6wa+IIA9cAAL3q2QEymLQesF7UnpiBLFL31BY1Z2zzcJ+2U4mahw4VDRVk
 qasCYPCXLuwXvbxG4cxAdrNc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id dd249d3f7c375ee6;
	Thu, 05 Nov 2026 14:10:05 +0000
X-Mizu-Trace-ID: dd249d3f7c375ee6
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 0/4] mm: Enforce read-only shared vmemmap tail mappings
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <0851db25-fef3-4f96-8d37-81ad5c51d6c8@kernel.org>
Date: Thu, 5 Nov 2026 22:09:33 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Lance Yang <lance.yang@linux.dev>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6492A4DD-B00E-40EA-85D6-93183E8D3ADC@linux.dev>
References: <20261019090830.1917657-1-songmuchun@bytedance.com>
 <0851db25-fef3-4f96-8d37-81ad5c51d6c8@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)

Hi David,

> On Nov 5, 2026, at 18:33, David Hildenbrand (Arm) <david@kernel.org> =
wrote:
>=20
> On 10/19/26 11:08, Muchun Song wrote:
>> This series is split out from the earlier, larger series "mm: =
Generalize
>> HVO for HugeTLB and device DAX" [1]. While the parent series =
generalizes
>> vmemmap optimization across HugeTLB and device DAX, this subset =
addresses
>> a single, self-contained step: mapping shared vmemmap tail pages =
read-only
>> at population time.
>>=20
>> After the previous HugeTLB and device DAX conversions, both can =
install
>> optimized shared-tail mappings during vmemmap population. These =
mappings
>> should be read-only because each shared tail vmemmap page backs =
metadata
>> for many tail pages. HugeTLB applies this protection in a later,
>> subsystem-specific pass, but device DAX currently lacks it.
>>=20
>> This series moves the protection into the generic sparse-vmemmap and
>> powerpc radix population paths. This protects device DAX mappings and
>> makes the HugeTLB-specific vmemmap_wrprotect_hvo() pass redundant. =
With
>> that pass gone, the bootmem-only optimization wrapper has no distinct
>> work and is removed as well.
>>=20
>> This is intended to be the fifth smaller step toward the broader HVO
>> generalization. The remaining HVO naming and enablement consolidation =
is
>> left for follow-up series.
>=20
> I assume this patch series is no longer applicable after we remove the =
RO
> protection for HVO.
>=20
> Or am I missing something? :)

Not quite :) The runtime RO part yes, but the vmemmap population path is
a different story =E2=80=94 struct page isn't initialized there, so =
there are no
concurrent accessors and setting RO is safe.

So we can keep it and enjoy the protection RO gives us: if something =
goes
wrong, we catch it right at the first scene. So I think this series is =
still
needed.

Thanks,
Muchun

>=20
> --=20
> Cheers,
>=20
> David


