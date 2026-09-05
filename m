Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 114383CB550
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598836; cv=none; b=guFYlQZs6QNxb7DLJdLPtcIyAyOGZV+sH6ImvdDj9X+lUZOwwA7UgF8D4SDpqkuL8IQsbPmICessEFoDNN897hPWnTf9diKujuK/oA7hdwpPhs3Gbn1sn7yecec64OJI/q5xROMw1oM1/UY7hSUv/6A18qhHLa2b6pQ9Y3JRjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598836; c=relaxed/simple;
	bh=OiKgIsORJwdwK7mxOyBT4OEx/ZyTZXJf9s4fMrv5tMg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nJxt+RZonmZ7mjcX2ArqvpGuwwF7kwJFDUEmV8VLyTHdXVX3z3+uva8OAopBHt1GcGT4/cDQdLO+3A9J5seRfHHhPk2BRfXNZTnTzJ8iZY9zvfc9UXrYOpQJR9uOtrpYIFOtWaohj1RMri9ackftO9tZVpnMF58Vqy8VTZFvGg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=W2wZ71bi; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="W2wZ71bi"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=OiKgIsORJwdwK7mxOyBT4OEx/ZyTZXJf9s4fMrv5tMg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788598832; v=1; x=1789203632;
 b=W2wZ71biy20xIT9afGt6cXn/qk/iTeTzoKcwOtJXQ2yZZapjrVrRTZ6s1/GNH/tbyaCj168q
 FQw3pYoi/6fyCAFYGji++1sMA1uZT7Nbx/ILrGdfg6+6Gi0SFW3ccLidEUDiiJXUvgY3KSjIAVI
 8f+R6Ek9zmW/tOZK7EzuSyVU=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 27e0770342031b0e;
	Sat, 05 Sep 2026 09:00:27 +0000
X-Mizu-Trace-ID: 27e0770342031b0e
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 05/11] mm/sparse-vmemmap: set section order for device DAX
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <1143901c-5036-4b79-8135-21ce57075136@linux.dev>
Date: Sat, 5 Sep 2026 17:00:08 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-doc@vger.kernel.org,
 Lorenzo Stoakes <ljs@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6AEC3FC2-2365-4EB5-A022-8AB0EC111073@linux.dev>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
 <20260831075342.57563-6-songmuchun@bytedance.com>
 <1143901c-5036-4b79-8135-21ce57075136@linux.dev>
To: Qi Zheng <qi.zheng@linux.dev>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 5, 2026, at 16:20, Qi Zheng <qi.zheng@linux.dev> wrote:
>=20
> Hi Muchun,

Hi,

>=20
> On 8/31/26 3:53 PM, Muchun Song wrote:
>> Device DAX can use vmemmap optimization only when a full section is
>> populated with a compound-page geometry. Record that geometry in the
>> section order before populating the section, so later vmemmap =
accounting
>> and population decisions can use the section state directly.
>> Clear the section order when the section becomes empty again. Also =
reject
>> partial additions to a section that already has optimized vmemmap =
mappings,
>> because a section cannot safely mix optimized and ordinary vmemmap =
layouts.
>=20
> Perhaps we should explain why they cannot be safely mixed.

Yes, because compound_nr_pages() determines the number of struct pages =
to
initialize with section as the smallest granularity, they cannot be =
mixed.

>=20
>> Partial additions continue to use ordinary vmemmap population, so =
they do
>> not save vmemmap memory. Such additions are uncommon, and the lost =
saving
>> is negligible.
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> ---
>>  mm/mm_init.c        | 13 ++++---------
>>  mm/sparse-vmemmap.c | 16 ++++++++++++----
>>  2 files changed, 16 insertions(+), 13 deletions(-)
>=20
> Also, the issue sashiko reported looks like it was pre-existing, not
> introduced by this patch. So:
>=20
> Acked-by: Qi Zheng <qi.zheng@linux.dev>

Thanks.

>=20
> Thanks,
> Qi
>=20

