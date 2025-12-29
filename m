Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3C2E7657;
	Mon, 29 Dec 2025 21:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767042902; cv=none; b=htROyRBHr7KchrRfKBKOsk5rYCMz5p0n0u+HOzvP2Ku1D49z+kA6HIWIc8W+a4LdG6GrVB1K0Lac4Hbyx4HOjLKJThe5b3tmZH37ja+Wp1sT+pK6Mc8NTJehuNleBHOYHbygTZAbtySpdH6EAjdEPPvBdE8/FgOWb+19+TvDS0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767042902; c=relaxed/simple;
	bh=+0hKzidYvfWG+s9TtusbziTKi6XLXUnZ4Y1pxbN7Jvc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uC3FHX9aD3lm+BNY+L8J2YGhEAkzXiE8TzniMY6tiSVVGsyAgzNQnu4k7DISVpghQQCQ2CtvYzS5fBfdH9+4ss5DffNd1FJMyjl0D8vFplTfPvYOUK1fRUWftNMGMoAnvGUQefZIMal9H2E3YHl6/PCX/U3ZibZkd6uOroxubzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKY9UZls; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKY9UZls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E38C4CEF7;
	Mon, 29 Dec 2025 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767042902;
	bh=+0hKzidYvfWG+s9TtusbziTKi6XLXUnZ4Y1pxbN7Jvc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jKY9UZlsTOJCp8mrSaW/YOoqI/r+yyNyFf2huGx4VFftVsJRCMpS4UchEWmSNJU2+
	 mmW/SR65hRZs3p/IS7waf1NjQ9aTDSyuxztBD1pNzRqCoQF95mGqFK75bOE8qiOsTh
	 r/34jl6+cJGesKLtTSrG0wiDLX0xjY3kxFF0yDM8QokptRaq8I7jRQ4niRqABeII49
	 A8Rz7bg+1ZrAHDw6vrD56WZ/IhNI7SrXFPMEOUt9GgTg5RArbxf9AqMyAQ0D8X7rC8
	 ZOtaBzMp1jsL14bwuklPgimM0VCDonLAQ3ZKPaY9/XbQn4TXWFX/cGXEO9V0n2jsnv
	 Kjh2IexLkouyA==
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
Subject: Re: [RFC PATCH 08/10] mm: hugetlb: disable CMA if liveupdate is
 enabled
In-Reply-To: <CA+CK2bBeJwACBiKsuXLcbzC4m0zLhu0yNg2HDGR=AQGeEVCJjg@mail.gmail.com>
	(Pasha Tatashin's message of "Tue, 23 Dec 2025 13:16:57 -0500")
References: <20251206230222.853493-1-pratyush@kernel.org>
	<20251206230222.853493-9-pratyush@kernel.org>
	<CA+CK2bBeJwACBiKsuXLcbzC4m0zLhu0yNg2HDGR=AQGeEVCJjg@mail.gmail.com>
Date: Mon, 29 Dec 2025 22:14:50 +0100
Message-ID: <86v7hp7zxx.fsf@kernel.org>
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
>> Hugetlb live update support does not yet work with CMA. Print a warning
>> and disable CMA if the config for live updating hugetlb is enabled, and
>> liveupdate is enabled at runtime.
>
> Could you please elaborate this commit to explain why it is not
> supported, and what it would take to support CMA.

The main reason is that when HugeTLB CMA is enabled, the huge pages come
from CMA. If we have preserved pages, we would need to "insert" those
pages into the CMA when they are restored.

CMA does support multiple ranges, so I suppose it can be done, but it
needs some plumbing to work properly.

Will add this in the next revision.

--=20
Regards,
Pratyush Yadav
