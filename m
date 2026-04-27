Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E9F3D3D1A;
	Mon, 27 Apr 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301391; cv=none; b=BPxCw9VOwmqh/pcddjDYck+xZPT3igOBIAJOFrJwzVvE7XCTwnBD4FWltUUHIfIYWffMIJseppagSucbO9y2PqeltJVHdOVdBD5ELQRQ0t8TQmHU5T8/VVUeNTpBzHL8KlU30H5h64YKlFkUg3nOpxAEICljTgl+H6TVOHnUjjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301391; c=relaxed/simple;
	bh=ObQ9FPUyKRG145AQFg0ZFPj9miXHnXfU+jCf5kJCf9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usRBNZfUvOJag/fXx8oHq/cBBceBrKhhOcH/9wrTbcMZ/F++secVEm2OatR0YpkxSVXjR0zN4Xc6Qr0hdOUkH6UxeRi1WM5vIJZB+nHFpozYTwslhrIq4ks3AkfyYFteGD0p5Fb9KFmp+HBfp7cSv+PkGVOLY1kMv7a6OvtigXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=C/1RKnHQ; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="C/1RKnHQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=o2vkZ5y2qzYA8iDKm7xA23S0ULNqG/MU/Wg90CpRlXE=; b=C/1RKnHQJ6cE7e0H0oYf278wCF
	Vv46Ir52iXcfmt1pWngYUoMRBu2uwl7EeJUUbB1Avgq3gBnGU6vNG3kKEPCvLYZnUzaLbHdtz8OtH
	Ed6s1e2huhHvR7Uncot4hDG3aJ8OxNT2HgElFQ6pRlZQcUqUZyNZ44tGASC5MujhwAMERW4YxNbsr
	qaCUAvXQ2foyNmU1FAQQ6IrkbH81zY7LuSTgwh/f9ZKKvjR+Ol5FePUE8+bU7Pd7fh06yqhmIc8mH
	lwUcagqd3QcoAwYIB2XQQxR/DlSxfqSHU6HPt3CPRmRrCeh28bW9oPiVd0Yd61ZoPCcdwQ4Ep35Tj
	tmG7Ah9w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wHNHI-005YaE-0a;
	Mon, 27 Apr 2026 14:49:40 +0000
Date: Mon, 27 Apr 2026 07:49:34 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH v4 2/3] mm/memory-failure: add panic option for
 unrecoverable pages
Message-ID: <ae93PTScNGzxo7aR@gmail.com>
References: <20260415-ecc_panic-v4-0-2d0277f8f601@debian.org>
 <20260415-ecc_panic-v4-2-2d0277f8f601@debian.org>
 <6b505601-747a-0812-7544-63a8ab3cffce@huawei.com>
 <aejlg62nxcF_5g2v@gmail.com>
 <c1517ad3-91d1-2ea1-efa7-0f29415d513d@huawei.com>
 <aeta8Ifvmqi6-E8w@gmail.com>
 <5e05384e-740e-b374-2370-01f96d1dac9f@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e05384e-740e-b374-2370-01f96d1dac9f@huawei.com>
X-Debian-User: leitao

On Mon, Apr 27, 2026 at 10:44:55AM +0800, Miaohe Lin wrote:
> On 2026/4/24 20:01, Breno Leitao wrote:
> > On Thu, Apr 23, 2026 at 10:38:19AM +0800, Miaohe Lin wrote:
> >>> are you suggesting I drop MF_MSG_KERNEL_HIGH_ORDER from here, or, document this
> >>> will not hit userspace pages?
> >>
> >> No, maybe we should rule out or document above rare case if I'm not miss something.
> > 
> > Good catch. A buddy page being concurrently allocated to userspace can
> > briefly satisfy get_hwpoison_page() == 0 && !is_free_buddy_page(), and
> > that page is recoverable via the standard SIGBUS path — panicking on
> > it would be wrong.
> > 
> > The page allocator can't filter it out either.
> > 
> > check_new_pages() is gated by is_check_pages_enabled() and is a no-op
> > when CONFIG_DEBUG_VM=n.
> > 
> > For v6 I'll try to rule out the race inside panic_on_unrecoverable_mf() so
> > action_result() stays unchanged:
> > 
> > 	case MF_MSG_KERNEL_HIGH_ORDER:
> > 	p = pfn_to_online_page(pfn);
> > 	if (!p)
> > 		return true;
> > 	cpu_relax();
> > 	return page_count(p) == 0 &&
> > 		!PageLRU(p) &&
> > 		!page_mapped(p) &&
> > 		!page_folio(p)->mapping &&
> > 		!is_free_buddy_page(p);
> > 
> > 
> > A buddy page being allocated must transit rmqueue() → prep_new_page() →
> > post_alloc_hook() before the caller can use it. Each step either bumps
> > _refcount or sets state we can observe (PageLRU, ->mapping). cpu_relax()
> > lets that remote-CPU progress become visible before we resample.
> > 
> > A genuine non-buddy high-order kernel tail page stays unowned across the
> > recheck, so the panic still fires on the case this series targets.
> > 
> > The window is much narrowed now, not eliminated — I'll say so in the changelog.
> > 
> > I also added a selftest that enables the sysctl, injects MADV_HWPOISON
> > on a userspace anon page in a forked child, and asserts SIGBUS (not a
> > panic). I've been running this in a loop for hours, and I haven't seen any
> > false positive.
> 
> The userspace anon pages are already allocated. Those pages are in a stable state.
> So your selftest cannot test above window. Or am I miss something?

You're right, the test doesn't directly hit the race window. By the time
madvise(MADV_HWPOISON) runs the page is fully owned by the process and goes
through the steady-state SIGBUS path; the buddy→user transition that the
recheck guards is already over.

What the test actually proves is the negative: the recheck didn't break the
common, non-racing path — i.e. a normal recoverable userspace page still
returns SIGBUS instead of panicking. It's a smoke test against gross
regressions of the recheck logic, not a reproducer of the original race.

Reproducing the race from userspace is hard because the window is
microseconds wide inside the allocator.

If you think this test doesn't bring any value, i am happy to just drop it.
