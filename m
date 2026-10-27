Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106867;
	b=43iI1MdypU1UPBw6/c08HGaQUzxd/dDl63HtiseXCrMxwB5vBgi2fCklPt+DAx0pHC6c
	 SdyHY2PLo+a2+vb2pwlEDQm4MyXkK8tf9ydW2uiosTRebYztw1rdmK01hR2zjK3uihtYa
	 F/76uMcsyvf9w1vNJXnxr7yxJDsI8LxxIb5uzYuTuya3Ol7J9kCXwHB0PEYRET3AYWm9d
	 FHqPEsqndB9UrxOpJ3fv45cVzDH35i7096YQ+rRXB2Lo3IkgforgKTt9oUHy33bLRED/4
	 AdjnCO6X987673uc0P2/mZ0uejTAPGZXTtU6hPMg1jy49++pihamMFCneCII7Xw544w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106867;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=TcOL6ipNcctSomEyqgwFYm+J+StqaPe/l3cry1c9MJ0=;
	b=A4kJOQOPbhICT5ft2Ls6M3ny6pxCfj2hENaIc7V8304PSOI4YDFGGNxhIyhTKxt3kRTx
	 YqXM29RaK1XdFsq4eAzemdAHmJL0qBJHB0ZgEr3YSECv/bhLjDq3gFZUNs3p92AUeMm9P
	 txvcGQpgHCAJoCUqZFtJhCh4qYusUZRt4mDgq10+1LZgBTgDF9YXJ5jn17tZcnfYvJcxt
	 h6/XNoCd5lGmRJGVBMUdkYqvEwu9b+TNuNXVGpROcgmSH+MGQRFt4HlLhqIUYrbvuhlU2
	 lZnvLmkV3TYVhwlz95TJhPqiFNMQzGBkc1xBFhCQtW9mbXEA0andC0Nd+AHZd/1SeCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.132
Received: from mta1.migadu.com (out-132.mta1.migadu.com [95.215.58.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E80A606A31D
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E80A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m3gTecYYwq2jZUjUle1w7O+ULuPN4Q/r80sxuGVnYTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793106864; v=1; x=1793711664;
 b=ajjRSYjHFYuNa/S1FAovfJgvU9eBuzz0cefMPjG3K5sLx+1eCR6qnER3QIEnWCDqS1CKx99k
 reeKOqTgSWJDgBMTs9yAQu1VwaENazBo9/Te9qKh6T8ezL3THGkbiwnTOa8owwaqTKpduTvZ3kO
 xmKoEt6jNwmhfg0YcmtOCC/Y=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 1793c71c60f3bc72;
	Tue, 27 Oct 2026 13:14:23 +0000
X-Mizu-Trace-ID: 1793c71c60f3bc72
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <auCZFckDfBMrlfxV@thinkstation>
Date: Tue, 27 Oct 2026 21:13:58 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
>=20
> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) =
wrote:
>>> Writing this, I just realized that we have another option -- map the
>>> shared tail page writable. A failing LOCK CMPXCHG writes back the =
value
>>> it read, and the get never changes a zero refcount, so the race =
becomes
>>> harmless. The cost is the protection: the page is shared by every
>>> hugetlb folio of that order in the zone, so a stray write to any =
tail
>>> silently corrupts all of them instead of oopsing.
>>=20
>> Right. Without HVO we would just corrupt pages in the single folio =
(which is
>> also not nice).
>>=20
>> I'm also questioning whether we need this RO protection all the time =
active.
>=20
> What do you have in mind? RO only under a debug option, or switching =
the
> tail page to RO some time after the remap?

I don't think enabling RO only on debug kernels is a good choice.

Within ByteDance, we once successfully caught memory failures using RO =
(because
we backported HVO, but some missing commits in memory failure caused =
write
operations on tail pages to persist). These operations triggered invalid =
writes
to shared tail pages.

Under the old HVO schema, this invalid write only corrupted one folio, =
but under
the new schema, it corrupts all HVOed folios. Therefore, I personally =
believe
that for the new schema, the value of RO is even greater.

Thanks,
Muchun

>=20
> If it is the delay, a grace period alone does not close the race. We
> would need rcu_read_lock() back around the get, and then it is the old
> scheme with the wait taken off the allocation path.
>=20
> --=20
>  Kiryl Shutsemau / Kirill A. Shutemov

